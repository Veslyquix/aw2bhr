#ifndef HARDWARE_H
#define HARDWARE_H

#include "global.h"

#if MODERN
#define IO_ALIGNED(n) ALIGNED(n)
#else
#define IO_ALIGNED(n) ALIGNED(4)
#endif

struct IO_ALIGNED(2) DispCnt
{
    /* bit  0 */ u16 mode : 3;
    /* bit  3 */ u16 : 1;
    /* bit  4 */ u16 bitmap_frame : 1;
    /* bit  5 */ u16 hblank_interval_free : 1;
    /* bit  6 */ u16 obj_mapping : 1;
    /* bit  7 */ u16 forced_blank : 1;
    /* bit  8 */ u16 bg0_enable : 1;
    /* bit  9 */ u16 bg1_enable : 1;
    /* bit 10 */ u16 bg2_enable : 1;
    /* bit 11 */ u16 bg3_enable : 1;
    /* bit 12 */ u16 obj_enable : 1;
    /* bit 13 */ u16 win0_enable : 1;
    /* bit 14 */ u16 win1_enable : 1;
    /* bit 15 */ u16 objwin_enable : 1;
};

struct IO_ALIGNED(2) DispStat
{
    /* bit  0 */ u16 vblank : 1;
    /* bit  1 */ u16 hblank : 1;
    /* bit  2 */ u16 vcount : 1;
    /* bit  3 */ u16 vblank_int_enable : 1;
    /* bit  4 */ u16 hblank_int_enable : 1;
    /* bit  5 */ u16 vcount_int_enable : 1;
    /* bit  6 */ u16 : 2;
    /* bit  8 */ u16 vcount_compare : 8;
};

// Container is u16, matching the 16-bit register and the 2-byte IWRAM shadow,
// so sizeof(union BgCntBuf) is 2 rather than 4.
//
// This was u32 for several waves, on the reasoning that the shadows
// (gUnknown_03002B6C and friends) are read with `ldr` in the ROM and that
// "a u16 container makes agbcc emit ldrh and the match breaks". Both halves
// of that were wrong. A controlled probe in wave 7 showed the bitfield
// container never affects the emitted instruction: u8, u16 and u32 containers
// give byte-identical code for the same field position -- ldrb inside a byte,
// ldrh across a byte boundary, and `ldr` plus a shift pair for every pure
// read, whatever the container. So the `ldr` observation discriminated
// nothing. Narrowing it back to u16 and rebuilding reproduces the ROM exactly,
// on both the split and the asm build, which is the direct disproof.
//
// Container width does still set layout and sizeof -- it just cannot be
// inferred from the access instruction. If a bitfield struct near-misses on
// the load width, changing the container will not fix it.
struct IO_ALIGNED(2) BgCnt
{
    /* bit  0 */ u16 priority : 2;
    /* bit  2 */ u16 chr_block : 2;
    /* bit  4 */ u16 : 2;
    /* bit  6 */ u16 mosaic : 1;
    /* bit  7 */ u16 color_depth : 1;
    /* bit  8 */ u16 tm_block : 5;
    /* bit 13 */ u16 wrap : 1;
    /* bit 14 */ u16 size : 2;
};

struct IO_ALIGNED(4) WinCnt
{
    u8 win0_enable_bg0 : 1;
    u8 win0_enable_bg1 : 1;
    u8 win0_enable_bg2 : 1;
    u8 win0_enable_bg3 : 1;
    u8 win0_enable_obj : 1;
    u8 win0_enable_blend : 1;
    u8 : 2;

    u8 win1_enable_bg0 : 1;
    u8 win1_enable_bg1 : 1;
    u8 win1_enable_bg2 : 1;
    u8 win1_enable_bg3 : 1;
    u8 win1_enable_obj : 1;
    u8 win1_enable_blend : 1;
    u8 : 2;

    u8 wout_enable_bg0 : 1;
    u8 wout_enable_bg1 : 1;
    u8 wout_enable_bg2 : 1;
    u8 wout_enable_bg3 : 1;
    u8 wout_enable_obj : 1;
    u8 wout_enable_blend : 1;
    u8 : 2;

    u8 wobj_enable_bg0 : 1;
    u8 wobj_enable_bg1 : 1;
    u8 wobj_enable_bg2 : 1;
    u8 wobj_enable_bg3 : 1;
    u8 wobj_enable_obj : 1;
    u8 wobj_enable_blend : 1;
    u8 : 2;
};

struct IO_ALIGNED(2) BlendCnt
{
    u16 target1_enable_bg0 : 1;
    u16 target1_enable_bg1 : 1;
    u16 target1_enable_bg2 : 1;
    u16 target1_enable_bg3 : 1;
    u16 target1_enable_obj : 1;
    u16 target1_enable_bd : 1;
    u16 effect : 2;
    u16 target2_enable_bg0 : 1;
    u16 target2_enable_bg1 : 1;
    u16 target2_enable_bg2 : 1;
    u16 target2_enable_bg3 : 1;
    u16 target2_enable_obj : 1;
    u16 target2_enable_bd : 1;
};

// The IWRAM shadows of the display registers are read field-by-field but
// cleared wholesale with a 16-bit store (sub_080122EC and sub_08012358 do
// nothing else), so one symbol has to offer both views and the shadows are
// declared as unions rather than as the bare struct.
//
// gUnknown_03002B6C manages all three widths: `ldr` for the bitfields
// (sub_08013C00), `strh` to clear it (sub_080122EC), and `ldrb`/`strb` to set
// bit 7 (sub_0806CA98, sub_08037260).
//
// Storing through a union member is not always free -- agbcc re-materialises
// constants and can swap the operands of a read-modify-write. Where that costs
// a match the call site casts to the scalar type instead; both places that do
// say so.
union BgCntBuf
{
    struct BgCnt bits;
    u16 raw;
    u8 raw8;
};

union DispStatBuf
{
    struct DispStat bits;
    u16 raw;
};

union WinCntBuf
{
    struct WinCnt bits;
    u16 raw;
};

union BlendCntBuf
{
    struct BlendCnt bits;
    u16 raw;
};

struct DispIo
{
    /* 00 */ struct DispCnt disp_ct;
    /* 04 */ struct DispStat disp_stat;
    /* 08 */ STRUCT_PAD(0x08, 0x0C);
    /* 0C */ struct WinCnt win_ct;
    /* 10 */ u16 mosaic;
    /* 12 */ STRUCT_PAD(0x3A, 0x3C);
    /* 14 */ struct BlendCnt blend_ct;
    /* 18 */ STRUCT_PAD(0x40, 0x44);
    /* 1C */ u8 blend_coef_a;
    /* 1D */ u8 blend_coef_b;
    /* 1E */ u8 blend_y;
    /* 20 */ struct BgAffineDstData bg2affin;
    /* 30 */ struct BgAffineDstData bg3affin;
    /* 40 */ s8 color_addition;
#if 0
// TODO: Are these actually in the struct in AW2?
    /* 0C */ struct BgCnt bg0_ct;
    /* 10 */ struct BgCnt bg1_ct;
    /* 14 */ struct BgCnt bg2_ct;
    /* 18 */ struct BgCnt bg3_ct;
    /* 1C */ struct Vec2u bg_off[4];
    /* 2C */ u8 win0_right, win0_left, win1_right, win1_left;
    /* 30 */ u8 win0_bottom, win0_top, win1_bottom, win1_top;
    /* 34 */ struct WinCnt win_ct;
    /* 38 */ u16 mosaic;
    /* 3A */ STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ struct BlendCnt blend_ct;
    /* 40 */ STRUCT_PAD(0x40, 0x44);
    /* 44 */ u8 blend_coef_a;
    /* 45 */ u8 blend_coef_b;
    /* 46 */ u8 blend_y;
    /* 48 */ struct BgAffineDstData bg2affin;
    /* 58 */ struct BgAffineDstData bg3affin;
    /* 68 */ s8 color_addition;
#endif
};

extern struct DispIo gDispIo;

// IWRAM shadows of the display registers. Every other unnamed global lives in
// unknown-globals.h; these are here because they need the types above.
extern union BgCntBuf gUnknown_03001FE8;
extern u16 gUnknown_03001FFC;
// REG_DISPSTAT's shadow. Declared u8 until wave 6, which was not merely narrow:
// sub_08012A34 clears bit 4 with `mov #0x11; rsbs`, and a scalar `&= ~0x10`
// emits a bare `mov #0xef`. The `mov #N; neg` is the bitfield tell, so the
// original reached this through struct DispStat -- bits 3 and 4 are exactly
// vblank_int_enable and hblank_int_enable. It needs the union because
// sub_08012AD4 also pushes it to 0x04000004 as a halfword.
extern union DispStatBuf gUnknown_030020B4;
extern u16 gUnknown_03002020;
extern u16 gUnknown_03002B28;
extern union BgCntBuf gUnknown_03002B6C;
// Both WinCnt shadows are written at BYTE 0, i.e. through the win0_* group:
// sub_08011300 clears win0_enable_bg0..obj on 030030A4 and sets
// win0_enable_bg0..blend on 030030DC in the same breath. Nothing yet reaches
// bytes 1-3 of either, so which hardware register each shadow feeds (WININ vs
// WINOUT) is still unproved -- only the offsets are.
extern union WinCntBuf gUnknown_030030A4;
extern union BgCntBuf gUnknown_030030B4;
extern union WinCntBuf gUnknown_030030DC;
// `effect` (2 bits at bit 6) is set to 2 -- brighten -- by the four +0x64 proc
// wrappers sub_08011588/080115B4/08011610/0801163C. That store is `ldrb;
// movs #0x3f; ands; movs #0x80; orrs; strb`, which is byte-identical to a
// scalar `(x & 0x3f) | 0x80` and so is not by itself proof of the bitfield;
// the complement mask 0x3F simply has bit 7 clear, so it does not get the
// `mov #N; neg` pair. sub_08010FA0 is the independent bitfield evidence.
extern union BlendCntBuf gUnknown_030030E0;

// Serial communication. The display registers are reached through gDispIo
// rather than directly, but the link hardware has no shadow -- sub_08062FB8
// writes it with bare casts, and every other link function will too. Adding a
// register here is a one-liner; hand-rolling the cast a second time is how two
// spellings of the same address end up in the tree.
#define REG_BASE 0x04000000

// DISPSTAT. gDispIo.disp_stat is the RAM shadow, but sub_08063980 bypasses it
// and pokes the hardware register directly to set the VCOUNT compare value in
// bits 8-15. It does not go through `struct DispStat` either: an 8-bit field at
// bit 8 of a u16 container is QImode to get_best_mode, so the bitfield spelling
// narrows the store to `strb r0, [r1, #1]` and is the wrong shape entirely.
//
// REG_DISPSTAT_LO is deliberately NOT volatile, and that is load-bearing rather
// than sloppy: with a `vu8` read the byte lands in a plain pseudo, combine's
// commutative canonicalisation reorders the following `orr`, and the function
// comes out with the OR accumulating into the wrong register. See the "orr
// operand order" note in docs/agbcc-codegen.md.
#define REG_OFFSET_DISPSTAT 0x004
#define REG_DISPSTAT    (*(vu16 *)(REG_BASE + REG_OFFSET_DISPSTAT))
#define REG_DISPSTAT_LO (*(u8 *)(REG_BASE + REG_OFFSET_DISPSTAT))

// VCOUNT. No RAM shadow: sub_08052E84 reads the register itself, masks the low
// byte and gates on the visible area.
#define REG_OFFSET_VCOUNT 0x006
#define REG_VCOUNT (*(vu16 *)(REG_BASE + REG_OFFSET_VCOUNT))

// BG scroll. Write-only registers, so unlike the display-control registers
// there is nothing to shadow and no gDispIo path -- sub_08052E84 writes them
// directly. Note agbcc CSEs the second absolute address against the first and
// emits `adds rN, #4` between the two stores rather than a second pool word.
#define REG_OFFSET_BG0HOFS 0x010
#define REG_OFFSET_BG0VOFS 0x012
#define REG_OFFSET_BG1HOFS 0x014
#define REG_OFFSET_BG1VOFS 0x016
#define REG_OFFSET_BG2HOFS 0x018
#define REG_OFFSET_BG2VOFS 0x01A
#define REG_OFFSET_BG3HOFS 0x01C
#define REG_OFFSET_BG3VOFS 0x01E

#define REG_BG0HOFS (*(vu16 *)(REG_BASE + REG_OFFSET_BG0HOFS))
#define REG_BG0VOFS (*(vu16 *)(REG_BASE + REG_OFFSET_BG0VOFS))
#define REG_BG1HOFS (*(vu16 *)(REG_BASE + REG_OFFSET_BG1HOFS))
#define REG_BG1VOFS (*(vu16 *)(REG_BASE + REG_OFFSET_BG1VOFS))
#define REG_BG2HOFS (*(vu16 *)(REG_BASE + REG_OFFSET_BG2HOFS))
#define REG_BG2VOFS (*(vu16 *)(REG_BASE + REG_OFFSET_BG2VOFS))
#define REG_BG3HOFS (*(vu16 *)(REG_BASE + REG_OFFSET_BG3HOFS))
#define REG_BG3VOFS (*(vu16 *)(REG_BASE + REG_OFFSET_BG3VOFS))

// BLDCNT. gDispIo.blend_ct is the RAM shadow; sub_080129B4 writes the register
// directly with a whole halfword rather than going through it.
// sub_0801298C writes all three in one go (0x8f, 0, 8).
#define REG_OFFSET_BLDCNT   0x050
#define REG_OFFSET_BLDALPHA 0x052
#define REG_OFFSET_BLDY     0x054
#define REG_BLDCNT   (*(vu16 *)(REG_BASE + REG_OFFSET_BLDCNT))
#define REG_BLDALPHA (*(vu16 *)(REG_BASE + REG_OFFSET_BLDALPHA))
#define REG_BLDY     (*(vu16 *)(REG_BASE + REG_OFFSET_BLDY))

// DMA. sub_080111BC disarms channel 0 by zeroing its control halfword.
#define REG_OFFSET_DMA0SAD   0x0B0
#define REG_OFFSET_DMA0DAD   0x0B4
#define REG_OFFSET_DMA0CNT_L 0x0B8
#define REG_OFFSET_DMA0CNT_H 0x0BA

#define REG_DMA0SAD   (*(vu32 *)(REG_BASE + REG_OFFSET_DMA0SAD))
#define REG_DMA0DAD   (*(vu32 *)(REG_BASE + REG_OFFSET_DMA0DAD))
#define REG_DMA0CNT_L (*(vu16 *)(REG_BASE + REG_OFFSET_DMA0CNT_L))
#define REG_DMA0CNT_H (*(vu16 *)(REG_BASE + REG_OFFSET_DMA0CNT_H))

// Channel 3, the general-purpose one. sub_080638A8 clears one 4bpp tile with
// it (fixed source, 16 halfwords) and then reads DMA3CNT back into a register
// nothing uses -- the usual post-trigger dummy read, which needs the volatile.
//
// It reaches the three words through a `vu32 *` cursor rather than by naming
// the registers individually, and that is not cosmetic: one base plus
// displacements 0/4/8 is what the ROM has, whereas three separate lvalues
// emit `add r1, r1, #4` between each store even though the addresses are
// compile-time constants. Probed both ways in one call.
#define REG_OFFSET_DMA3SAD   0x0D4
#define REG_OFFSET_DMA3DAD   0x0D8
#define REG_OFFSET_DMA3CNT   0x0DC
#define REG_OFFSET_DMA3CNT_L 0x0DC
#define REG_OFFSET_DMA3CNT_H 0x0DE

#define REG_DMA3SAD   (*(vu32 *)(REG_BASE + REG_OFFSET_DMA3SAD))
#define REG_DMA3DAD   (*(vu32 *)(REG_BASE + REG_OFFSET_DMA3DAD))
#define REG_DMA3CNT   (*(vu32 *)(REG_BASE + REG_OFFSET_DMA3CNT))
#define REG_DMA3CNT_L (*(vu16 *)(REG_BASE + REG_OFFSET_DMA3CNT_L))
#define REG_DMA3CNT_H (*(vu16 *)(REG_BASE + REG_OFFSET_DMA3CNT_H))

// Timers. sub_0802ECEC arms timer 3 with a reload of -n and 0xc3
// (enable | irq | 1024-cycle prescaler).
#define REG_OFFSET_TM0CNT_L 0x100
#define REG_OFFSET_TM0CNT_H 0x102
#define REG_OFFSET_TM1CNT_L 0x104
#define REG_OFFSET_TM1CNT_H 0x106
#define REG_OFFSET_TM2CNT_L 0x108
#define REG_OFFSET_TM2CNT_H 0x10A
#define REG_OFFSET_TM3CNT_L 0x10C
#define REG_OFFSET_TM3CNT_H 0x10E

#define REG_TM0CNT_L (*(vu16 *)(REG_BASE + REG_OFFSET_TM0CNT_L))
#define REG_TM0CNT_H (*(vu16 *)(REG_BASE + REG_OFFSET_TM0CNT_H))
#define REG_TM1CNT_L (*(vu16 *)(REG_BASE + REG_OFFSET_TM1CNT_L))
#define REG_TM1CNT_H (*(vu16 *)(REG_BASE + REG_OFFSET_TM1CNT_H))
#define REG_TM2CNT_L (*(vu16 *)(REG_BASE + REG_OFFSET_TM2CNT_L))
#define REG_TM2CNT_H (*(vu16 *)(REG_BASE + REG_OFFSET_TM2CNT_H))
#define REG_TM3CNT_L (*(vu16 *)(REG_BASE + REG_OFFSET_TM3CNT_L))
#define REG_TM3CNT_H (*(vu16 *)(REG_BASE + REG_OFFSET_TM3CNT_H))

#define TIMER_PRESCALE_1    0x0000
#define TIMER_PRESCALE_64   0x0001
#define TIMER_PRESCALE_256  0x0002
#define TIMER_PRESCALE_1024 0x0003
#define TIMER_CASCADE       0x0004
#define TIMER_IRQ           0x0040
#define TIMER_ENABLE        0x0080

#define REG_OFFSET_SIOMULTI0 0x120
#define REG_OFFSET_SIOMULTI1 0x122
#define REG_OFFSET_SIOMULTI2 0x124
#define REG_OFFSET_SIOMULTI3 0x126
#define REG_OFFSET_SIOCNT    0x128
#define REG_OFFSET_SIODATA8  0x12A
#define REG_OFFSET_RCNT      0x134

#define REG_SIOMULTI0 (*(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0))
#define REG_SIOMULTI1 (*(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI1))
#define REG_SIOMULTI2 (*(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI2))
#define REG_SIOMULTI3 (*(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI3))
#define REG_SIOCNT    (*(vu16 *)(REG_BASE + REG_OFFSET_SIOCNT))
#define REG_SIODATA8  (*(vu16 *)(REG_BASE + REG_OFFSET_SIODATA8))
#define REG_RCNT      (*(vu16 *)(REG_BASE + REG_OFFSET_RCNT))

// SIOMULTI0 and SIODATA32's low half are the same address, as are SIODATA8 and
// SIOMLT_SEND. Which name is right depends on the mode SIOCNT selects.
#define REG_SIODATA32 (*(vu32 *)(REG_BASE + REG_OFFSET_SIOMULTI0))
#define REG_SIOMLT_SEND REG_SIODATA8

#define REG_OFFSET_IE  0x200
#define REG_OFFSET_IF  0x202
#define REG_OFFSET_IME 0x208

#define REG_IE  (*(vu16 *)(REG_BASE + REG_OFFSET_IE))
#define REG_IF  (*(vu16 *)(REG_BASE + REG_OFFSET_IF))
#define REG_IME (*(vu16 *)(REG_BASE + REG_OFFSET_IME))

#define INTR_FLAG_VBLANK  0x0001
#define INTR_FLAG_HBLANK  0x0002
#define INTR_FLAG_VCOUNT  0x0004
#define INTR_FLAG_TIMER0  0x0008
#define INTR_FLAG_TIMER1  0x0010
#define INTR_FLAG_TIMER2  0x0020
#define INTR_FLAG_TIMER3  0x0040
#define INTR_FLAG_SERIAL  0x0080

struct KeySt
{
    /* 00 */ u16 unk00; // a key bitmask, read with `ldrh [r0]` and tested against
                        // key bits: sub_0803B0EC uses 0x200 (L), sub_0803B1CC
                        // 0x100 (R). This slot was inherited from FE8's
                        // KeyStatusBuffer, where 00/01/02 are repeat_delay /
                        // repeat_interval / repeat_clock; AW2 disagrees, and
                        // nothing in this tree ever named those three.
    /* 02 */ u8 filler_02[0x02];
    /* 04 */ u16 held; // keys that are currently held down
    /* 06 */ u16 repeated; // auto-repeated keys
    /* 08 */ u16 pressed; // keys that went down this frame
    /* 0A */ u16 previous; // keys that were held down last frame
    /* 0C */ u16 last;
    /* 0E */ u16 ablr_pressed; // 1 for Release (A B L R Only), 0 Otherwise
    /* 10 */ u16 pressed2;
    /* 12 */ u16 time_since_start_select; // Time since last Non-Start Non-Select Button was pressed
};

enum
{
    BG0_SYNC_BIT = (1 << 0),
    BG1_SYNC_BIT = (1 << 1),
    BG2_SYNC_BIT = (1 << 2),
    BG3_SYNC_BIT = (1 << 3),
};

enum
{
    BG_0 = 0,
    BG_1,
    BG_2,
    BG_3,

    BG_INVALID = -1,
};

extern struct KeySt * gpKeySt;

extern u16 gPal[];

#define RGB_GET_RED(color) ((color) & 0x1F)
#define RGB_GET_GREEN(color) (((color) >> 5) & 0x1F)
#define RGB_GET_BLUE(color) (((color) >> 10) & 0x1F)

#define TM_OFFSET_(x, y) ((x) + ((y) << 5))
#define TM_OFFSET(x, y) (((y) * 0x20) + (x))

#define TILE_CHR_SAFE(chr) ((chr) & 0x3FF)
#define TILE_PAL_SAFE(pal) (((pal) & 0xF) << 12)
#define TILEREF(chr, pal) ((chr) + ((pal) << 12))
#define TILE_HFLIP 0x0400
#define TILE_VFLIP 0x0800

#define RED_MASK 0x1F
#define GREEN_MASK (0x1F << 5)
#define BLUE_MASK (0x1F << 10)

#define PAL_COLOR_OFFSET(palid, colornum) (palid) * 0x10 + (colornum)
#define PAL_OFFSET(palid) PAL_COLOR_OFFSET((palid), 0)
#define BGPAL_OFFSET(bgpal) PAL_OFFSET(0x00 + (bgpal))
#define OBPAL_OFFSET(obpal) PAL_OFFSET(0x10 + (obpal))

#define PAL_BUF_COLOR(buf, palid, colornum) buf[PAL_COLOR_OFFSET((palid), (colornum))]
#define PAL_COLOR(palid, colornum) PAL_BUF_COLOR(gPal, palid, colornum)
#define PAL_BG_COLOR(palid, colornum) PAL_COLOR(palid, colornum)
#define PAL_OBJ_COLOR(palid, colornum) PAL_COLOR((palid) + 0x10, colornum)

#define PAL_BG(palid) (&PAL_BG_COLOR(palid, 0))
#define PAL_OBJ(palid) (&PAL_OBJ_COLOR(palid, 0))

#define SIN_Q12(angle) (gSinLut[(angle) & 0xFF])
#define COS_Q12(angle) (gSinLut[0x40 + ((angle) & 0xFF)])

#define ApplyPalettes(src, num, count) ApplyPaletteExt((src), 0x20 * (num), 0x20 * (count))
#define ApplyPalette(src, num) ApplyPalettes((src), (num), 1)

#define SetDispEnable(bg0, bg1, bg2, bg3, obj) \
    gDispIo.disp_ct.bg0_enable = (bg0); \
    gDispIo.disp_ct.bg1_enable = (bg1); \
    gDispIo.disp_ct.bg2_enable = (bg2); \
    gDispIo.disp_ct.bg3_enable = (bg3); \
    gDispIo.disp_ct.obj_enable = (obj)

#define SetWinEnable(win0, win1, objwin) \
    gDispIo.disp_ct.win0_enable = (win0); \
    gDispIo.disp_ct.win1_enable = (win1); \
    gDispIo.disp_ct.objwin_enable = (objwin)

#define SetWin0Box(left, top, right, bottom) \
    gDispIo.win0_left = (left); \
    gDispIo.win0_top = (top); \
    gDispIo.win0_right = (right); \
    gDispIo.win0_bottom = (bottom)

#define SetWin1Box(left, top, right, bottom) \
    gDispIo.win1_left = (left); \
    gDispIo.win1_top = (top); \
    gDispIo.win1_right = (right); \
    gDispIo.win1_bottom = (bottom)

#define SetWin0Layers(bg0, bg1, bg2, bg3, obj) \
    gDispIo.win_ct.win0_enable_bg0 = (bg0); \
    gDispIo.win_ct.win0_enable_bg1 = (bg1); \
    gDispIo.win_ct.win0_enable_bg2 = (bg2); \
    gDispIo.win_ct.win0_enable_bg3 = (bg3); \
    gDispIo.win_ct.win0_enable_obj = (obj)

#define SetWin1Layers(bg0, bg1, bg2, bg3, obj) \
    gDispIo.win_ct.win1_enable_bg0 = (bg0); \
    gDispIo.win_ct.win1_enable_bg1 = (bg1); \
    gDispIo.win_ct.win1_enable_bg2 = (bg2); \
    gDispIo.win_ct.win1_enable_bg3 = (bg3); \
    gDispIo.win_ct.win1_enable_obj = (obj)

#define SetWObjLayers(bg0, bg1, bg2, bg3, obj) \
    gDispIo.win_ct.wobj_enable_bg0 = (bg0); \
    gDispIo.win_ct.wobj_enable_bg1 = (bg1); \
    gDispIo.win_ct.wobj_enable_bg2 = (bg2); \
    gDispIo.win_ct.wobj_enable_bg3 = (bg3); \
    gDispIo.win_ct.wobj_enable_obj = (obj)

#define SetWOutLayers(bg0, bg1, bg2, bg3, obj) \
    gDispIo.win_ct.wout_enable_bg0 = (bg0); \
    gDispIo.win_ct.wout_enable_bg1 = (bg1); \
    gDispIo.win_ct.wout_enable_bg2 = (bg2); \
    gDispIo.win_ct.wout_enable_bg3 = (bg3); \
    gDispIo.win_ct.wout_enable_obj = (obj)

#define SetBlendConfig(eff, ca, cb, cy) \
    gDispIo.blend_ct.effect = (eff); \
    gDispIo.blend_coef_a = (ca); \
    gDispIo.blend_coef_b = (cb); \
    gDispIo.blend_y = (cy)

#define SetBlendAlpha(ca, cb) \
    SetBlendConfig(BLEND_EFFECT_ALPHA, (ca), (cb), 0)

#define SetBlendBrighten(cy) \
    SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 0, 0, (cy))

#define SetBlendDarken(cy) \
    SetBlendConfig(BLEND_EFFECT_DARKEN, 0, 0, (cy))

#define SetBlendNone() \
    SetBlendConfig(BLEND_EFFECT_NONE, 0x10, 0, 0)

#define SetBlendTargetA(bg0, bg1, bg2, bg3, obj) \
    gDispIo.blend_ct.target1_enable_bg0 = (bg0); \
    gDispIo.blend_ct.target1_enable_bg1 = (bg1); \
    gDispIo.blend_ct.target1_enable_bg2 = (bg2); \
    gDispIo.blend_ct.target1_enable_bg3 = (bg3); \
    gDispIo.blend_ct.target1_enable_obj = (obj)

#define SetBlendTargetB(bg0, bg1, bg2, bg3, obj) \
    gDispIo.blend_ct.target2_enable_bg0 = (bg0); \
    gDispIo.blend_ct.target2_enable_bg1 = (bg1); \
    gDispIo.blend_ct.target2_enable_bg2 = (bg2); \
    gDispIo.blend_ct.target2_enable_bg3 = (bg3); \
    gDispIo.blend_ct.target2_enable_obj = (obj)

#define SetBlendBackdropA(enable) \
    gDispIo.blend_ct.target1_enable_bd = (enable)

#define SetBlendBackdropB(enable) \
    gDispIo.blend_ct.target2_enable_bd = (enable)


extern const s16 gSinLut[0x40];
extern const s16 gCosLut[0x100];

#endif // HARDWARE_H
