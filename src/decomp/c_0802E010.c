#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802E010.
 * sub_0802E010 @ 0x0802E010, sub_0802E130 @ 0x0802E130
 */

/* MATCHED in wave 77 (W77-F). Was parked at 97.2%, size-exact, 8 of 288 bytes
 * differing, first difference at +0x20. TWO edits closed it, and neither was
 * a new idea -- both were already sitting in this work directory:
 *
 *  1. `>> (half = 1)` as block 4's shift amount -- a THIRD set of `half`,
 *     to a constant. This was found by wave 73's permuter, which SAVED IT TO
 *     best.c AT 97.92% AND NOBODY TRANSCRIBED IT. The wave-73 comment block
 *     recorded the 97.2% draft as the fixpoint and wrote "the permuter found
 *     nothing"; best.json read `{"percent": 97.92, "exact_size": true}` the
 *     whole time. It was 6 differing bytes, two better than the draft it was
 *     supposedly tracking.
 *  2. DELETING the nested do/while(0) around loop 1's body -- the exact edit
 *     the wave-73 comment said must never be made ("a measured permuter win
 *     worth 4 bytes; folding it back costs them"). That was true of the draft
 *     WITHOUT edit 1 and false of the draft WITH it: with the third set of
 *     `half` present the wrapper COSTS 6 bytes, and at depth 0 the function
 *     matches exactly. Measured on the final base, depth 0..5:
 *         depth 0 ->  0 differing bytes   (half=r6 ptr=r5 zero=r4 bound=r2)
 *         depth 1..4 -> 6                 (half=r6 ptr=r4 zero=r2 bound=r5)
 *         depth 5 -> 28
 *
 * WHAT THE 8 BYTES WERE. Six of them were one three-way register rotation and
 * two were block 4's `p[0] - n` temp landing in half's register:
 *     +0x20  lsrs rH,r1,#1       ROM r6 / draft r4   half
 *     +0x24  movs rZ,#0          ROM r4 / draft r2   loop 1's hoisted zero
 *     +0x26  ldr  rB,[pc,#0xF0]  ROM r2 / draft r6   loop 1's hoisted 0x3FF
 *     +0x2E  strh rZ,[r1,#0]     the rZ of +0x24
 *     +0x36  cmp  r3,rB          the rB of +0x26
 *     +0x3C  lsls r0,rH,#0x10    the rH of +0x20
 *     +0x9A  subs rD,r0,r7       ROM r0 / draft r4 (= half)
 *     +0x9C  asrs r0,rS,#1       ROM r0 / draft r4 (= half)
 *
 * WHY THE THIRD SET IS THE MECHANISM -- the constraint the draft was caught
 * between, and it is a general one:
 *  - The (u16) truncation at loop 2's guard (+0x3C) survives only while
 *    `half` has more than one SET, because combine falls back to the OR of
 *    reg_nonzero_bits over all sets; a single narrow set lets it fold the
 *    truncation away and the function comes out 284 bytes, 4 short.
 *  - But a DEAD second set is deleted by flow BEFORE combine ever counts it
 *    (measured: `half = p[0] - n;` after block 4's loop gives 284 bytes and
 *    `adds r0,r6,#0` at +0x3C), so the second set has to be live -- which
 *    makes cse elect `half` the representative of `p[0] - n` and puts the
 *    value in half's register, which is defect +0x9A/+0x9C. The ROM
 *    recomputes `p[0] - n` at BOTH block 4's guard and its bottom test (the
 *    loop writes memory, so it cannot be hoisted) and writes a scratch at
 *    both, so every placement of a VALUE-carrying second set pollutes one of
 *    those two chains:
 *      for-init, `p[0]-n`       -> subs writes half  (+0x9A,+0x9C)   8 bytes
 *      for-init, `(p[0]-n)>>1`  -> asrs writes half  (+0x9C,+0x9E)   8 bytes
 *      loop bottom, either      -> reorders the bottom test      17/19 bytes
 *  - A set to a CONSTANT escapes both horns: it still bumps REG_N_SETS above
 *    one, so the truncation survives, and it carries no value for cse to
 *    elect, so block 4 computes in scratch exactly as the ROM does.
 *
 * ALSO MEASURED THIS WAVE, all dry, do not re-probe:
 *  - the do/while(0) wrapper applied to loop 2's body or to block 4's inner
 *    body instead of loop 1's is catastrophic (279 and 124 differing bytes);
 *    only loop 1's body tolerates it at all.
 *  - `half = n >> 1` written inside loop 1's body for LICM to hoist, rather
 *    than in the for-init: 215-220 differing bytes, size wrong.
 *
 * The wave-73 analysis of block 4 (the for-init comma sharing cse with the
 * loop bound, which took this from 13 differing bytes to 8) stands unchanged
 * and is still in the source below.
 *
 * gUnknown_0849957C is a POINTER global, not an array. gUnknown_08090C28 is
 * not a global at all: the ROM word holds 0x03003F68, this function's own
 * -fforce-addr copy of &gUnknown_03003F68. The promotion needs
 * rodata: ["0x08090C28"] (["0x08090C2C"] for sub_0802E130); trymatch reports
 * the reloc as "different symbols that resolve to the same address", which is
 * the wave-21 artefact and not a difference.
 *
 * sub_0802E130 is this function with gUnknown_08499578 for gUnknown_0849957C
 * and sub_08013AEC for sub_08013AFC, and nothing else. It matched on pure
 * substitution of this body, with no probe of its own -- the sixth and final
 * confirmation of the callee-normalised pair reading. Before the fix, both
 * were 288 bytes differing in the same 8, at the same offsets, with the same
 * target and candidate halfwords at every one.
 */

void sub_0802E010(void)
{
  u8 n;
  int half;
  u16 *row;
  u16 i;
  u16 j;
  n = ((u8 *) gUnknown_03003F68)[0];
  if (n > 0x20)
  {
    n = 0x20;
  }
  for (i = 0, half = n >> 1; i <= 0x3FF; i++)
  {
    gUnknown_0849957C[i] = 0;
  }

  for (i = 0; i < ((u16) half); i++)
  {
    for (j = 0; j < ((((u8 *) gUnknown_03003F68)[1] >> 1) << 4); j += 0x10)
    {
      gUnknown_0849957C[(j * 2) + i] = (j + i) + 0x5000;
    }

  }

  if (((u8 *) gUnknown_03003F68)[0] > 0x1F)
  {
    for (i = 0, half = (((u8 *) gUnknown_03003F68)[0] - n); i < ((((u8 *) gUnknown_03003F68)[0] - n) >> (half = 1)); i++)
    {
      for (j = 0; j < ((((u8 *) gUnknown_03003F68)[1] >> 1) << 4); j += 0x10)
      {
        int k;
        k = j * 2;
        row = gUnknown_0849957C;
        row[(i + k) + 0x10] = (i + (j + 0x100)) + 0x5000;
      }

    }
  }
  sub_08013AFC();
}

/* MATCHED in wave 77 (W77-F). Was parked at 97.2%, size-exact, 8 of 288 bytes
 * differing, first difference at +0x20. TWO edits closed it, and neither was
 * a new idea -- both were already sitting in this work directory:
 *
 *  1. `>> (half = 1)` as block 4's shift amount -- a THIRD set of `half`,
 *     to a constant. This was found by wave 73's permuter, which SAVED IT TO
 *     best.c AT 97.92% AND NOBODY TRANSCRIBED IT. The wave-73 comment block
 *     recorded the 97.2% draft as the fixpoint and wrote "the permuter found
 *     nothing"; best.json read `{"percent": 97.92, "exact_size": true}` the
 *     whole time. It was 6 differing bytes, two better than the draft it was
 *     supposedly tracking.
 *  2. DELETING the nested do/while(0) around loop 1's body -- the exact edit
 *     the wave-73 comment said must never be made ("a measured permuter win
 *     worth 4 bytes; folding it back costs them"). That was true of the draft
 *     WITHOUT edit 1 and false of the draft WITH it: with the third set of
 *     `half` present the wrapper COSTS 6 bytes, and at depth 0 the function
 *     matches exactly. Measured on the final base, depth 0..5:
 *         depth 0 ->  0 differing bytes   (half=r6 ptr=r5 zero=r4 bound=r2)
 *         depth 1..4 -> 6                 (half=r6 ptr=r4 zero=r2 bound=r5)
 *         depth 5 -> 28
 *
 * WHAT THE 8 BYTES WERE. Six of them were one three-way register rotation and
 * two were block 4's `p[0] - n` temp landing in half's register:
 *     +0x20  lsrs rH,r1,#1       ROM r6 / draft r4   half
 *     +0x24  movs rZ,#0          ROM r4 / draft r2   loop 1's hoisted zero
 *     +0x26  ldr  rB,[pc,#0xF0]  ROM r2 / draft r6   loop 1's hoisted 0x3FF
 *     +0x2E  strh rZ,[r1,#0]     the rZ of +0x24
 *     +0x36  cmp  r3,rB          the rB of +0x26
 *     +0x3C  lsls r0,rH,#0x10    the rH of +0x20
 *     +0x9A  subs rD,r0,r7       ROM r0 / draft r4 (= half)
 *     +0x9C  asrs r0,rS,#1       ROM r0 / draft r4 (= half)
 *
 * WHY THE THIRD SET IS THE MECHANISM -- the constraint the draft was caught
 * between, and it is a general one:
 *  - The (u16) truncation at loop 2's guard (+0x3C) survives only while
 *    `half` has more than one SET, because combine falls back to the OR of
 *    reg_nonzero_bits over all sets; a single narrow set lets it fold the
 *    truncation away and the function comes out 284 bytes, 4 short.
 *  - But a DEAD second set is deleted by flow BEFORE combine ever counts it
 *    (measured: `half = p[0] - n;` after block 4's loop gives 284 bytes and
 *    `adds r0,r6,#0` at +0x3C), so the second set has to be live -- which
 *    makes cse elect `half` the representative of `p[0] - n` and puts the
 *    value in half's register, which is defect +0x9A/+0x9C. The ROM
 *    recomputes `p[0] - n` at BOTH block 4's guard and its bottom test (the
 *    loop writes memory, so it cannot be hoisted) and writes a scratch at
 *    both, so every placement of a VALUE-carrying second set pollutes one of
 *    those two chains:
 *      for-init, `p[0]-n`       -> subs writes half  (+0x9A,+0x9C)   8 bytes
 *      for-init, `(p[0]-n)>>1`  -> asrs writes half  (+0x9C,+0x9E)   8 bytes
 *      loop bottom, either      -> reorders the bottom test      17/19 bytes
 *  - A set to a CONSTANT escapes both horns: it still bumps REG_N_SETS above
 *    one, so the truncation survives, and it carries no value for cse to
 *    elect, so block 4 computes in scratch exactly as the ROM does.
 *
 * ALSO MEASURED THIS WAVE, all dry, do not re-probe:
 *  - the do/while(0) wrapper applied to loop 2's body or to block 4's inner
 *    body instead of loop 1's is catastrophic (279 and 124 differing bytes);
 *    only loop 1's body tolerates it at all.
 *  - `half = n >> 1` written inside loop 1's body for LICM to hoist, rather
 *    than in the for-init: 215-220 differing bytes, size wrong.
 *
 * The wave-73 analysis of block 4 (the for-init comma sharing cse with the
 * loop bound, which took this from 13 differing bytes to 8) stands unchanged
 * and is still in the source below.
 *
 * gUnknown_0849957C is a POINTER global, not an array. gUnknown_08090C28 is
 * not a global at all: the ROM word holds 0x03003F68, this function's own
 * -fforce-addr copy of &gUnknown_03003F68. The promotion needs
 * rodata: ["0x08090C28"] (["0x08090C2C"] for sub_0802E130); trymatch reports
 * the reloc as "different symbols that resolve to the same address", which is
 * the wave-21 artefact and not a difference.
 *
 * THIS FILE IS sub_0802E010 WITH gUnknown_08499578 FOR gUnknown_0849957C AND
 * sub_08013AEC FOR sub_08013AFC, AND NOTHING ELSE. Nothing was derived here.
 * It matched on pure substitution -- the sixth and final
 * confirmation of the callee-normalised pair reading. Before the fix, both
 * were 288 bytes differing in the same 8, at the same offsets, with the same
 * target and candidate halfwords at every one.
 */

void sub_0802E130(void)
{
  u8 n;
  int half;
  u16 *row;
  u16 i;
  u16 j;
  n = ((u8 *) gUnknown_03003F68)[0];
  if (n > 0x20)
  {
    n = 0x20;
  }
  for (i = 0, half = n >> 1; i <= 0x3FF; i++)
  {
    gUnknown_08499578[i] = 0;
  }

  for (i = 0; i < ((u16) half); i++)
  {
    for (j = 0; j < ((((u8 *) gUnknown_03003F68)[1] >> 1) << 4); j += 0x10)
    {
      gUnknown_08499578[(j * 2) + i] = (j + i) + 0x5000;
    }

  }

  if (((u8 *) gUnknown_03003F68)[0] > 0x1F)
  {
    for (i = 0, half = (((u8 *) gUnknown_03003F68)[0] - n); i < ((((u8 *) gUnknown_03003F68)[0] - n) >> (half = 1)); i++)
    {
      for (j = 0; j < ((((u8 *) gUnknown_03003F68)[1] >> 1) << 4); j += 0x10)
      {
        int k;
        k = j * 2;
        row = gUnknown_08499578;
        row[(i + k) + 0x10] = (i + (j + 0x100)) + 0x5000;
      }

    }
  }
  sub_08013AEC();
}
