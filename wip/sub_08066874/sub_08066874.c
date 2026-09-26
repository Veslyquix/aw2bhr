/* WAVE 87 (W87-D). REFUTED the park's "where I would start" recommendation.
 * `struct Unk08580934 **state = &gUnknown_08580934;` with `(*state)->unk70[i]`
 * measures 440 bytes (+12), NOT size-exact -- strictly worse. It does move
 * `cnt` from r6 to the ROM's r5, so the +0x7 first difference really was a
 * consequence of the indirection level; but `(*state)->unk70[i]` in the last
 * loop emits an extra `ldr r0,[r7]` because the ROM REUSES the pointer already
 * loaded for that loop's bound (`ldr r0,[r5] / ldrb r2,[r0,#8]` then
 * `adds r1,r0,#0`). A `**` local cannot produce a cse of the bound's own load.
 *
 * AND: THIS DRAFT'S SIZE-EXACTNESS IS A CANCELLATION OF THREE WRONG THINGS.
 * From target.s: the ROM's cnt test is a PLAIN `cmp r5,#0` (the narrow
 * `(new_var = cnt)` binding costs +2 for `lsls r0,r5,#24`); the ROM has no
 * `adds r7,r1,#0` (state costs +2); and the ROM's cross-jumped arm re-derives
 * `mov r1,r8 / ldr r0,[r1] / ldr r0,[r0]` after `bl sub_0806377C` where this
 * draft pays `ldr r0,[r5]` (-4). +2+2-4 = 0. So wave 77's "honest" 424 B /
 * 44.2% source is the RIGHT SHAPE, four bytes short in ONE place, and 93.9%
 * is a misleading number. Measure the next lever from the honest source, not
 * from this draft. Full record: work/sub_08066874/W87-notes.md.
 */
#include "global.h"
#include "hardware.h"

/* WAVE 86 (W86-B). Held at 93.9%, 26/428, size-exact, first difference +0x7
 * (configured profile). THREE LEVERS TESTED, ALL REFUTED, and the FIRST OF
 * THEM WAS WRONG IN MY PROMPT -- stating that here because the prompt's
 * reading of the ROM was the reason it was assigned.
 *
 * REFUTED 1 -- THE CROSS-JUMP ARM-COUNT LEVER DOES NOT APPLY: THE DRAFT
 * ALREADY WRITES THE TAIL THE RIGHT NUMBER OF TIMES. W80-C's rule (N written
 * out arm tails give the shared pointer N times the refs and the first
 * callee-saved register) was proposed here on the guess that the ROM's
 * cross-jumped tail had MORE arms falling into it than the draft's two. Count
 * it in work/sub_08066874/target.s instead of guessing: _08066904 is entered
 * exactly TWICE -- by `b _08066904` from the `unk31 == 1` test, and by
 * FALL-THROUGH from `_08066900: cmp r5,#0 / beq _08066964`. Two arms, and this
 * draft writes two. There is no third arm to add; the lever has no room to
 * act. No probe was spent -- the ROM settles it.
 *
 * REFUTED 2 -- DECLARATION ORDER OF THE LOCALS IS BYTE-NEUTRAL. The W83
 * live-range-split lever was assigned to this batch with the mechanism "the
 * new pseudo's allocno NUMBER (creation order) becomes the tie-break, so the
 * split must be placed so the NEW pseudo is created before the competitor's".
 * For SOURCE LOCALS that predicts DECLARATION ORDER is the lever, because
 * agbcc's expand_decl gives every non-addressable scalar local its pseudo at
 * block entry in declaration order, before ANY statement is expanded -- so a
 * statement's position cannot change a local's allocno NUMBER, only its live
 * RANGE. Tested directly: moving `int cnt;` ahead of `struct Unk08580934
 * *state;` in the declaration list, nothing else changed, is BYTE-IDENTICAL --
 * 26 of 428 differ, 93.9%, first difference +0x7, exactly the baseline. The
 * tie here is not broken by allocno number.
 *
 * REFUTED 3 -- THE HONEST ROM-SHAPED SOURCE IS WORSE, and it localises the
 * coupling. Dropping `state` AND replacing the narrow `(new_var = cnt) != 0`
 * with a plain `cnt != 0` (which is literally what the ROM's `cmp r5,#0 /
 * beq` is) gives 424 bytes (-4), 235 of 424 differ, 44.2%. That is the SAME
 * figure the wave-77 note recorded for dropping `state` ALONE, so the plain
 * int test is byte-neutral once `state` is gone. Read with the wave-77 type
 * sweep (`int new_var` alone = 81.8%), the 12 bytes the narrow binding buys
 * exist ONLY while `state` is present: the two are ONE lever, not two --
 * exactly as W79-E found for sub_08062C94's `(u = 0)` and the store order.
 *
 * WHAT THE ROM ACTUALLY SAYS, read off target.s. The wave-77 header describes
 * this correctly but does not name the level of indirection, which is the
 * whole fact. There are TWO address values and the ROM splits them one level
 * higher than this draft does:
 *   r8   = &gUnknown_0816E150 -- the -fforce-addr POOL WORD's OWN address,
 *          set once in the prologue (`mov r8,r2`), live for the whole
 *          function.
 *   [r8] = &gUnknown_08580934 -- the pool word's CONTENT. The ROM re-derives
 *          this PER BLOCK and never carries it across a call: r3/r7 in the
 *          first loop, r2 at the dispatch (_080668CA -- a CALL-CLOBBERED
 *          register), r6 in the second loop (`adds r6,r2,#0`), r5 after
 *          `bl sub_0806666C`. FOUR short-lived pseudos, one per block, which
 *          is the wave-57 "a pseudo used in two basic blocks leaves
 *          local_alloc entirely" rule seen from the ROM side.
 * This draft instead keeps [r8] in callee-saved r5 ACROSS `bl sub_0806377C`,
 * which is why it can afford `ldr r0,[r5]` (2 B) where the ROM pays
 * `mov r1,r8; ldr r0,[r1]; ldr r0,[r0]` (6 B). The ROM's r2 choice at the
 * dispatch is the ROOT fact: an address in a call-clobbered register cannot
 * survive a call, and that is what forces the re-derivation.
 * So the goal is not "make r5 dead across the call" as a wish -- it is "stop
 * [r8] being callee-saved at the DISPATCH block". Note too that the ROM's
 * second-loop base r6 is a copy of the dispatch's r2, i.e. the ROM's `state`
 * analogue is the ADDRESS-OF-THE-POINTER, not the pointer: it does
 * `ldr r1,[r6]` afresh every iteration. A `struct Unk08580934 **state =
 * &gUnknown_08580934;` spelling with `(*state)->unk70[i]` is the one shape
 * that has never been measured, and is where I would start.
 *
 * The other symptoms (cnt in r6 here against r5 in the ROM, with the
 * LICM-hoisted `2` mask constant taking the other register of that pair) ride
 * on the same fact.
 */

/* Wave 77 (W77-C): 428/428 size-exact, 81.8% -> 93.9%, 26 differing bytes.
 * THE PERMUTER FOUND IT, and the whole of the 12-byte gain is the one line
 * `if ((new_var = cnt) != 0)` with a NARROW `new_var`. Type sweep: `char`,
 * `short`, `u8`, `s8` and `u16` all give 93.9%; `int` folds the binding away
 * and goes straight back to 81.8%. Do not tidy it into `if (cnt != 0)`.
 *
 * MEASURED AND WORSE, do not repeat: dropping the `state` local and naming
 * gUnknown_08580934 in the last loop (424/428, 44.2%); assigning `state`
 * inside the `cnt == 0` arm (44.9%); assigning it just before the last loop
 * (80.6%); a second narrow binding on the `unk31 == 1` or `unk08 == 2` test
 * (byte-identical, the dead assignment folds).
 *
 * THE REMAINING 26 BYTES ARE ONE ALLOCATION FACT WITH THREE SYMPTOMS, and the
 * permuter cannot reach it -- three runs, ~30,000 iterations after the win,
 * ceiling unmoved at score 465. In the cross-jumped seven-statement arm the ROM
 * re-derives gUnknown_08580934 from the force-addr word ADDRESS in r8
 * (`mov r1, r8; ldr r0,[r1,#0]; ldr r0,[r0,#0]`, 6 bytes) while this candidate
 * keeps the word's CONTENT alive in callee-saved r5 across the
 * `bl sub_0806377C` and reloads one level (`ldr r0,[r5,#0]`, 2 bytes); it then
 * pays 2 bytes for `adds r7, r1, #0` to park the state pointer that the ROM
 * still has in r1, and 2 more for the narrow test's `lsls r0, r6, #24`. The
 * three cancel, which is why the size is exact. `cnt` sits in r6 here and r5 in
 * the ROM for the same reason. Anything that reaches this has to make r5 dead
 * across that call without adding an instruction. */
/* sub_08066A20's twin on the other arm of sub_08066B40's dispatch: same
 * opening scan over gUnknown_03002040[] and ->unk70[], same closing
 * "every slot is still zero" test.
 *
 * The shared tail body is written TWICE in the source and cross-jumped by the
 * compiler into one copy -- that is what puts the body ahead of the
 * `cnt == 0` arm in address order and what turns the `unk31` test into
 * `bne <else>` plus `b <body>` rather than a single conditional branch.
 *
 * gUnknown_0816E150 is a -fforce-addr pool word holding &gUnknown_08580934. */
void sub_08066874(void)
{
  int i;
  struct Unk08580934 *state;
  int cnt;
  char new_var;
  struct KeySt *key;
  cnt = 0;
  gUnknown_08580934->unk32 = gUnknown_08580934->unk25;
  for (i = 0; i < gUnknown_08580934->unk08; i++)
  {
    if (((struct KeySt *) (&gUnknown_03002040))[i].held & 2)
    {
      cnt++;
    }
    if (((s8) gUnknown_08580934->unk70[i]) == (-1))
    {
      cnt = 0;
      break;
    }
  }

  if (gUnknown_08580934->unk08 == 2)
  {
    if (gUnknown_08580934->unk31 == 1)
    {
      sub_0806377C(gUnknown_08580D0C);
      gUnknown_08580934->unk26 = 0;
      sub_08063A00(gUnknown_08580AF0, sub_08066200);
      sub_08063A00(gUnknown_08580B90, sub_08066200);
      sub_08063A00(gUnknown_08580BC8, sub_08066200);
      sub_08063A00(gUnknown_08580A38, sub_08066210);
      sub_08063A00(gUnknown_08580A08, sub_08066210);
    }
    else
    {
      sub_080152EC(gUnknown_08580D54, 4);
    }
  }
  else
  {
    state = gUnknown_08580934;
    if ((new_var = cnt) != 0)
    {
      sub_0806377C(gUnknown_08580D0C);
      gUnknown_08580934->unk26 = 0;
      sub_08063A00(gUnknown_08580AF0, sub_08066200);
      sub_08063A00(gUnknown_08580B90, sub_08066200);
      sub_08063A00(gUnknown_08580BC8, sub_08066200);
      sub_08063A00(gUnknown_08580A38, sub_08066210);
      sub_08063A00(gUnknown_08580A08, sub_08066210);
    }
    else
    {
      for (i = 0; i < gUnknown_08580934->unk08; i++)
      {
        if (((s8) gUnknown_08580934->unk70[i]) == 0)
        {
          key = &((struct KeySt *) (&gUnknown_03002040))[i];
          sub_080660BC(key->repeated, i, i == gUnknown_08580934->unk25);
        }
      }

      sub_0806666C();
      if (((s8) gUnknown_08580934->unk70[gUnknown_08580934->unk25]) == 0)
      {
        sub_08066078();
      }
      for (i = 0; i < gUnknown_08580934->unk08; i++)
      {
        if (((s8) state->unk70[i]) == 0)
        {
          break;
        }
      }

      if (i == gUnknown_08580934->unk08)
      {
        sub_080152EC(gUnknown_08580D54, 4);
      }
    }
  }
}
