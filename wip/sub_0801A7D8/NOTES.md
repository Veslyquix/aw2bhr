
## Wave 90 port (orchestrator)

Ported to PR #3 names with tools/port_rename.py; `gUnknown_0200CC88` became `struct SaveSlotGenerations`, so the five `(&gUnknown_0200CC88[16])[x]` uses were hand-ported to `(&gUnknown_0200CC88.slotGeneration[0])[x]`, which is byte-identical to the pre-merge candidate (verified against _cand.prepr3.bin). The plain member `gUnknown_0200CC88.slotGeneration[x]` CHANGES the bytes: 1068/1056 (+12, unchanged size delta), 23.2% against the port's 20.0% -- a small positional change, not adopted as part of the port. Worth re-trying as a lever once the +12 is solved (see W90-B's member-vs-pointer chapter in docs/agbcc-codegen.md).
# WriteSaveSlotsToFlash (sub_0801A7D8)

The named source in sub_0801A7D8.c is a semantic rewrite of the save-slot
writer. It uses the header's Unk0200CC38 and the real gUnknown_0200CC88,
gUnknown_02002000, and gUnknown_0200CD08 objects. SaveSector is a local cast
view over the 4 KiB staging buffer. The source is not byte matched and must
not be promoted.

Configured trymatch: 1056/1056 bytes, 686 differing bytes, 35.0% identical,
exit 1. The initial Ghidra draft compiled to 1200/1056 bytes with 970 differing
bytes. The parked record described a prior +12-byte / 20.0% draft, but that
source was absent at the start of this pass; the active .c and best.c were
both Ghidra transcriptions. This pass independently reconstructed the
size-exact version.

Measured source choices:
- A single retry-selection block shared by retry 0 and retry 4 removed 36
  bytes from the first rewrite. The equivalent switch compiled to the same
  size but had a worse register layout.
- u8 freeCount and retryCount plus the folded &gUnknown_0200CC88[16] base
  closed the 4-byte size residual.
- Splitting freeSlots[freeCount++] into store and increment improved the
  size-exact candidate from 710 to 686 differing bytes.
- Explicit r4/r7 register pins, a block-local narrow segment tag, and local
  sector base pointers regressed. They were not retained.

The first residual is the frame and entry allocation: ROM uses a 208-byte
frame, moves the incoming byte count to r7, keeps saveId in r4 through the
initial call, then stores it at sp+164. The candidate uses a 204-byte frame,
keeps byte count in r8, and spills saveId at sp+160 before the call. Subsequent
register, pool, and spill decisions differ across the function. The adjacent
promoted src/decomp/c_0801AC58.c is a useful same-format exemplar.

Continuation (2026-09-25): The source remains named WriteSaveSlotsToFlash and
byte-exact in size, but has 624 differing bytes (40.9% identical). The first
120-second permuter run improved the semantic draft from 35.0% to 40.9% by
adding a 0xfff bound local and assigning j = slot before the generation update.
Both effects were transplanted into readable source and independently verified.
A separate updatedFlags local and a separate j = slot statement are byte-neutral
and improve readability.

Three further 120-second permuter runs did not find another valid byte-level
improvement. One candidate scored 45.8%, but it overwrote freeCount with
segment and would corrupt retry/slot selection; other >40.9% candidates either
omitted the bit-2 mask or added an extra flag store. They were rejected for
semantic correctness. A switch reproduces the ROM's retry dispatch branch
order but the complete candidate regresses to 25.0% and 1052 bytes; its own
permuter run reached 40.3% at best. Register pins, local slot-table bindings,
and a zero-valued extra OR all moved isolated instructions but regressed the
whole function. Compiler profiles default, no-force, o1, o1-no-force,
old-agbcc, and old-agbcc-no-force were measured; none matched and configured
remains best. The remaining problem is broad allocation and pool placement,
starting with the ROM's 208-byte frame and r4-held save ID versus the current
204-byte frame and early save-ID spill.

best.c is a tool-friendly copy of the valid source with the original function
name so tools/permute.py can parse and seed it. The named source is the .c file.

Session 2026-09-25 (second pass): 40.9% -> 53.7% size-exact in the named
source (best.c holds a 54.7% permuter form that also reuses `total` as the
second flash-call argument; rejected for readability). Structural fixes, each
confirmed with a register-agnostic opcode diff rather than the byte percentage:

- Separate `u8 id = saveId` after the sub_0801B598 call. The ROM keeps the
  parameter in r4 for the first loop and spills a *different* pseudo at
  sp+0xa4 after the call; spill-slot order (segmentCount 0xa0 < id 0xa4)
  confirms id is a later-declared local. Fixes the prologue.
- Retry dispatch is `switch (retryCount) { case 4: ...; /*fall*/ case 0: ... }`
  (gcc tests 0 then 4, as the ROM does). The goto form is byte-identical.
- `SECTOR->endMarker` is written inside each arm of the 0x55 test (the tail
  `strb` is cross-jumped) and addressed as `gUnknown_02002000[lastByte]` with
  `lastByte = 0xfff` set after the fill loop: reload rematerialises the
  constant, giving the ROM's `ldr rX,=0xfff; adds base,rX` at every access.
  The fill and checksum loops use literal 0xfff (hoisted `ldr`, no entry test).
- `slot = freeSlots[--freeCount]` split into two statements (ROM reloads
  freeCount from its spill slot).
- `int preservedFlags = 0` ORed into the success flag write: the ROM really
  has `movs r7,#0` after the checksum loop. docs/agbcc-codegen.md's wave-65
  claim that this r7 is `idx << 4` is wrong for this function; r7 is reset
  to 0 before the calls (same mechanism as sub_0801ADC8).
- Permuter finds: `offsets = segmentOffsets` alias (moves segment to r6 as
  in ROM) and reading the generation through `length` (shared pseudo).

Remaining residual: the ROM hoists a `gUnknown_0200CC88` base out of the
segment loop and spills it at sp+0xb4 (frame 208; ours is 204), feeding the
slotGenerations copy as `[sp,#0xb4] + 0x40`. In our build the copy loop's
own LICM moves that load first, after which the outer loop cannot move it
(agbcc loop.c: reg_in_basic_block_p fails on the stale REGNO_FIRST_UID, see
/home/vesly/fe8/.deps/agbcc/gcc/loop.c:855). Tried and refuted: CC88[slot+16]
in the increment or success store, a u32* local set before the segment loop
or at function start. The missing spill shifts every later slot and rotates
segment / segment<<4 / &segmentOffsets among r6-r8.

Session 2026-09-25 (third pass, struct views): 53.7% -> 82.2% size-exact in
the named source; best.c holds an 83.2% permuter form (extra copy chains
`new_var = segments.offset; ...; offsets = new_var;` and `new_var2 = 0` for
the checksum store), not adopted for readability.

- THE lever: gUnknown_0200CC88 as `struct SaveSlotGenerations { u32
  sectorGeneration[16]; u32 slotGeneration[16]; }` accessed as
  `.slotGeneration[i]`. The COMPONENT_REF forms `base_reg + 0x40`, which the
  segment loop hoists and spills at sp+0xb4 exactly as the ROM does. This fixed
  the frame (208) and every spill slot, 53.7% -> 81.2% after one permuter run.
  The header's `u32 gUnknown_0200CC88[]` stays right for c_0801B4C0, so on
  promotion this should be a gMap-style typed alias (header declaration plus an
  aw2bhr.lds line), not a retype of the existing symbol. The draft does the
  same through a #define/#undef around global.h (asm labels break pycparser).
- gUnknown_02002000 must stay a CAST view: declaring the symbol itself as
  struct SaveSector (asm label) costs +20 bytes. `#define gSaveSector
  (*(struct SaveSector *)gUnknown_02002000)` is byte-identical to the old
  SECTOR-> macro and reads as field access.
- Under the new layout, `gSaveSector.endMarker` works for the marker writes and
  the success read (82.2%); only the retry-path read still wants
  `gUnknown_02002000[lastByte]` (the fully natural form is 81.3%).
- gUnknown_0200CC2C as `u8 *` and gUnknown_0200CC24 as `int (*)(u8 *)` are
  byte-neutral and remove the casts.
- A local `struct SaveSegments { int length[16]; int offset[16]; }` is neutral
  (kept for readability).
- `unk10[slot] = id` before the `offsets` assignment: +0.6%.
  `i = 0xf; version = i` beats `j = 0xf` (the `j = slot` flag alias stays).

Remaining residual (all register allocation): the ROM gives r6 to segment
(also sort-loop j and total), r7 to segment<<4 and r8 to sp+0x40 (the
segments.offset base, which the ROM also uses in the data-copy loop as
`add r5, r8`). Ours rotates these: the `offsets` alias (refs 9, live 53)
outranks segment (refs 21, live 255) in global-alloc priority. Using the alias
in the copy loop as well (ROM-faithful) raises its priority and pushes segment
to r8 (+8 bytes). Assigning it at the loop top lets LICM hoist it; before the
segment loop or for(;;), strength reduction turns it into a pointer giv. All
measured, none better.

Update (same day): gUnknown_0200CC88 is now `struct SaveSlotGenerations` in
include/unknown-globals.h itself (repo-wide), so the draft no longer
redeclares it. c_0801B4C0 matches as
`sectorGeneration[i] = slotGeneration[i] = 0;` and c_0801B2FC as plain member
accesses; both ROM routes still reproduce the canonical SHA1. The claim above
that the `u32 []` declaration had to stay for c_0801B4C0 is obsolete.

Session 2026-09-26 (after the Mad-Man-Dan merge). Started from this
directory's pre-merge draft (restored from work/_pre-wip/), not the published
wip/ draft: wip/ carried an older +12-byte draft that no longer compiles
against the current headers ("subscripted value is neither array nor
pointer" at line 103).

- The pre-merge named draft still measures 82.2% size-exact, best.c 83.2%.
- NEW, ROM-faithful: the sort swap stores freeSlots[j] FIRST
  (`strb r2,[r4]` = &freeSlots[j], then `strb r3,[r5]`), so the source is
  `tmp = freeSlots[j]; freeSlots[j] = freeSlots[i]; freeSlots[i] = tmp;`.
  The draft now uses that order. It scores 81.9% (from 82.2%) because the
  surrounding allocation still differs, but it is the ROM's order: the store
  sequence now matches instruction for instruction.
- The sort loop's residual is the same rotation as the segment loop: ROM j in
  r6, freeSlots base in ip, slotGeneration base in r8; ours j in r2,
  freeSlots base in r8, slotGeneration base in ip.
- `-dg` confirms the segment-loop order: the offsets alias (refs 9 / live 53)
  outranks segment (21 / 255), so it takes r6 before segment.
- Moving `offsets = segments.offset;` anywhere else in the loop body breaks
  size (-20 to +12). Only the current spot, right before the fill loop,
  is size-exact. It is also where the ROM sets r8 = sp+0x40.
- Using `offsets` in the data-copy loop too (as the ROM's `add r5, r8`
  suggests) is +8 bytes, re-measured.
- Two more 120 s permuter runs (from best.c, and from the swap-fixed draft)
  found only the known `offsets = (copy = segments.offset)` chain: 82.9%
  with the swap fix, below best.c's 83.2%. Not adopted.
