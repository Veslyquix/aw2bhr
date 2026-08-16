.SUFFIXES:

# ==================
# = PROJECT CONFIG =
# ==================

BUILD_NAME := aw2bhr

SRC_DIR = src
ASM_DIR = asm
BUILD_DIR = build

CLEAN_FILES :=
CLEAN_DIRS  :=

all: compare

# ====================
# = TOOL DEFINITIONS =
# ====================

ifeq ($(OS),Windows_NT)
  EXE := .exe
else
  EXE :=
  UNAME_S := $(shell uname -s)
endif

TOOLCHAIN ?= $(DEVKITARM)
AGBCC_HOME ?= tools/agbcc

ifneq (,$(TOOLCHAIN))
  export PATH := $(TOOLCHAIN)/bin:$(PATH)
endif

PREFIX := arm-none-eabi-

ifeq ($(UNAME_S),Darwin)
  ifneq (,$(TOOLCHAIN))
    PREFIX := $(TOOLCHAIN)/bin/$(PREFIX)
  endif
  SHASUM ?= shasum
endif

export OBJCOPY := $(PREFIX)objcopy
export OBJDUMP := $(PREFIX)objdump
export AS := $(PREFIX)as
export CPP := $(PREFIX)cpp
export LD := $(PREFIX)ld
export STRIP := $(PREFIX)strip

CC1_OLD := $(AGBCC_HOME)/bin/old_agbcc$(EXE)
CC1     := $(AGBCC_HOME)/bin/agbcc$(EXE)

SHASUM ?= sha1sum
PERL := perl
PYTHON3 ?= python3
FIX_SECTION_PADDING := tools/decomp/fix_section_padding.py

# ================
# = BUILD CONFIG =
# ================

CPPFLAGS := -I $(AGBCC_HOME)/include -iquote include -iquote . -nostdinc -undef
CFLAGS := -g -mthumb-interwork -Wimplicit -Wparentheses -Werror -fhex-asm -ffix-debug-line -fforce-addr -fprologue-bugfix -O2
ASFLAGS := -mcpu=arm7tdmi -I asm/include -I include
LDFLAGS :=

# make NONMATCHING=1: compile the readable-but-not-byte-matching C reimplementation for
# functions guarded by #ifdef NONMATCHING (see src/gpu.c), instead of their naked-asm
# wrapper that .includes the hand-transcribed, actually-matching assembly. Never matches
# the real ROM with this set -- for reading/testing the C side only.
NONMATCHING ?=
ifneq ($(NONMATCHING),)
  CPPFLAGS += -DNONMATCHING
endif

# Some translation units were originally compiled without -mthumb-interwork
$(BUILD_DIR)/src/list.o: CFLAGS := $(filter-out -mthumb-interwork,$(CFLAGS))

# sub_08000234 is ARM-mode retail code, compiled with agbcc_arm (which lacks a few of
# agbcc's GBA-decomp-specific flags). See src/gpu.c for why it's NONMATCHING.
$(BUILD_DIR)/src/gpu.o: CC1 := $(AGBCC_HOME)/bin/agbcc_arm$(EXE)
$(BUILD_DIR)/src/gpu.o: CFLAGS := $(filter-out -fhex-asm -ffix-debug-line -fprologue-bugfix,$(CFLAGS))

LDS := $(BUILD_NAME).lds
C_SRCS := $(shell find $(SRC_DIR) -name *.c)
ASM_SRCS := $(shell find $(SRC_DIR) -name *.s) $(shell find $(ASM_DIR) -name *.s)
DATA_SRCS := $(shell find data -name *.s)

C_GENERATED :=

# ===========
# = TARGETS =
# ===========

ROM := $(BUILD_NAME).gba
ELF := $(ROM:%.gba=%.elf)
MAP := $(ROM:%.gba=%.map)
SYM := $(ROM:%.gba=%.sym)

ifeq (,$(findstring $(C_GENERATED),$(C_SRCS)))
C_SRCS += $(C_GENERATED)
endif

C_OBJS := $(C_SRCS:%.c=$(BUILD_DIR)/%.o)
ASM_OBJS := $(ASM_SRCS:%.s=$(BUILD_DIR)/%.o)
DATA_OBJS := $(DATA_SRCS:%.s=$(BUILD_DIR)/%.o)

ALL_OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_OBJS)
ALL_DEPS := $(ALL_OBJS:%.o=%.d)

SUBDIRS := $(sort $(dir $(ALL_OBJS)))
$(shell mkdir -p $(SUBDIRS))

# ===========
# = RECIPES =
# ===========

compare: $(ROM)
	@echo "[SHA]	$<"
	@$(SHASUM) -c $(BUILD_NAME).sha1

.PHONY: compare

syms: $(SYM)

%.gba: %.elf
	@echo "[GEN]	$@"
	@$(OBJCOPY) --strip-debug -O binary $< $@

CLEAN_FILES += $(ROM)

$(ELF): $(ALL_OBJS) $(LDS)
	@echo "[ LD]	$@"
	$(file >$(BUILD_DIR)/objects.rsp,$(ALL_OBJS:$(BUILD_DIR)/%=%))
	@cd $(BUILD_DIR) && $(LD) -T ../$(LDS) -Map ../$(MAP) -L../tools/agbcc/lib @objects.rsp -lc -lgcc -o ../$@ $(LDFLAGS)

CLEAN_FILES += $(BUILD_DIR)/objects.rsp

CLEAN_FILES += $(ELF) $(MAP)

# C dependency files
$(BUILD_DIR)/%.d: %.c
	@$(CPP) $(CPPFLAGS) $< -o $@ -MM -MG -MT $@ -MT $(BUILD_DIR)/$*.o

# C object
$(BUILD_DIR)/%.o: %.c $(BUILD_DIR)/%.d
	@echo "[ CC]	$<"
	@$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CFLAGS) -o $(BUILD_DIR)/$*.s
	@printf ".text\n\t.align\t2, 0\n" >> $(BUILD_DIR)/$*.s
	@$(AS) $(ASFLAGS) $(BUILD_DIR)/$*.s -o $@
	@$(STRIP) -N .gcc2_compiled. $@

# ASM dependency file (dummy, generated with the object)
$(BUILD_DIR)/%.d: $(BUILD_DIR)/%.o
	@touch $@

# ASM objects split out of once-monolithic nonmatching blobs, one function (or tightly
# coupled group of functions) per file, so individual functions can be pulled out and
# matched without hand-editing a huge file. Assembling each standalone can make GNU as pad
# the object's end to its own alignment requirement in a way the original monolithic file
# never needed -- fix_section_padding.py trims that back using known-good sizes computed
# from consecutive functions' addresses (see tools/decomp/make_nonmatching_manifest.py).
$(BUILD_DIR)/asm/nonmatching/design/%.o: asm/nonmatching/design/%.s
	@echo "[ AS]	$<"
	@$(AS) $(ASFLAGS) $< -o $@ --MD $(BUILD_DIR)/$*.d
	@$(PYTHON3) $(FIX_SECTION_PADDING) asm/nonmatching/design.sizes.json $@

$(BUILD_DIR)/asm/nonmatching/proc/%.o: asm/nonmatching/proc/%.s
	@echo "[ AS]	$<"
	@$(AS) $(ASFLAGS) $< -o $@ --MD $(BUILD_DIR)/$*.d
	@$(PYTHON3) $(FIX_SECTION_PADDING) asm/nonmatching/proc.sizes.json $@

# ASM object
$(BUILD_DIR)/%.o: %.s
	@echo "[ AS]	$<"
	@$(AS) $(ASFLAGS) $< -o $@ --MD $(BUILD_DIR)/$*.d

ifneq (clean,$(MAKECMDGOALS))
  -include $(ALL_DEPS)
  .PRECIOUS: $(BUILD_DIR)/%.d
endif

CLEAN_DIRS += $(BUILD_DIR)

# ===============
# = Symbol file =
# ===============

$(SYM): $(ELF)
	@echo "[GEN]	$@"
	@$(OBJDUMP) -t $< | sort -u | grep -E "^0[2389]" | $(PERL) -p -e 's/^(\w{8}) (\w).{6} \S+\t(\w{8}) (\S+)$$/\1 \2 \3 \4/g' > $@

CLEAN_FILES += $(SYM)

# ==============
# = Make clean =
# ==============

CLEAN_DIRS += $(shell find . -type d -name "__pycache__")

clean:
	@rm -f $(CLEAN_FILES)
	@rm -rf $(CLEAN_DIRS)
	@echo "all cleaned..."

.PHONY: clean
