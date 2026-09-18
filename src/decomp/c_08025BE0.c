#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08025BE0.
 * sub_08025BE0 @ 0x08025BE0
 */

/* WAVE 76: MATCHED. A block-scoped fixed-r0 zero with an explicit movs
 * materializes the distinct zero pseudo used only for unk09. Configured
 * try_match is byte-for-byte exact at 124/124 with matching relocs.
 *
 * PARKED at 83.1% (21 of 124 bytes), and the whole residual is ONE
 * instruction. Wave 34, W34-D; re-attacked and still parked in wave 39, W39-D,
 * which re-measured the park at exactly 83.1% with the first difference still
 * at +0x52.
 *
 * Remaining diff, the only one:
 *
 *   original    strb r5,[r3,#7] / strb r5,[r3,#8] / movs r0,#0
 *               / strb r0,[r3,#9] / strb r5,[r3,#10]
 *   candidate   strb r5,[r3,#7] / strb r5,[r3,#8] / strb r5,[r3,#9]
 *               / strb r5,[r3,#10]
 *
 * The ROM materialises a SECOND zero register purely for unk09, while r5 (set
 * `movs r5,#0` in the prologue) serves unk01, unk07, unk08, unk0a and the
 * switch's `unk0b = 0`. r5 is demonstrably live across unk09 -- it is used
 * again for unk0a on the very next instruction -- so this is not the allocator
 * extending a live range. Two zero pseudos in the RTL means two distinct
 * source expressions, and nothing tried spells the difference. Everything
 * else, including all four bitfield read-modify-writes and the pool, is
 * byte-exact.
 *
 * The `switch` below is load-bearing and was worth 19 of the 21 bytes. The
 * ROM's range test is two SIGNED compares to one target (`cmp #2; bgt` then
 * `cmp #1; blt`), and BOTH `if` spellings -- `a2 <= 2 && a2 >= 1` and its
 * De Morgan twin `a2 > 2 || a2 < 1` -- get folded into the unsigned
 * `(a2 - 1) <= 1` trick (`subs #1; lsls #24; lsrs #24; cmp #1; bhi`), because
 * a2 is u8 and gcc knows the range. gcc's expand_case does not apply that
 * fold, so a two-label case range is the one spelling that survives.
 * Generalisable, and worth carrying forward: WHERE A CONJUNCTION FOLDS TO AN
 * UNSIGNED RANGE TEST, A SWITCH IS THE SPELLING THAT DOES NOT.
 *
 * RULED OUT for the unk09 zero, in order:
 *   1. (W34-D) assigning the group in source order, as below, and reordering
 *      it.
 *   2. (W39-D) the chained assignment `a1->unk09 = a1->unk08 = 0;`. The idea
 *      was that the VALUE of the inner assignment is a separate QImode temp
 *      that would get its own register, and that its store order -- 8 then 9 --
 *      is exactly what the ROM has. It does not work: CSE folds the temp
 *      straight back to r5 and the output is byte-identical to the plain form.
 *      Full try_match, still 83.1%, first difference still at +0x52.
 *   3. (W39-D) THE BITFIELD GUESS W34-D LEFT AS "the obvious next step" IS
 *      WRONG, and this is the useful result. Controlled compile_probe: one
 *      body, two struct declarations differing ONLY in `u8 unk09;` versus
 *      `u8 unk09:8;` (the second declared locally in the probe, so nothing
 *      shared was touched). Both emit `strb r5,[r3,#9]` -- agbcc's bitfield
 *      store path for a byte-wide, byte-aligned field degenerates to the plain
 *      store and CSEs the constant exactly as the plain member does. So there
 *      is no evidence for reshaping struct Unk08499594.unk09, the single
 *      hypothesis that motivated it is refuted, and the member was left alone.
 *      Recorded in include/unknown-globals.h beside the member. Anyone
 *      reaching for a bitfield here should stop.
 *   4. (W39-D) `a1->unk09 = a1->unk01;`, reading back the sibling zeroed at
 *      the top of the function. Probed: CSE keeps `mem[r3+1] == r5` across the
 *      three intervening bitfield read-modify-writes at +4/+5/+6 and folds it
 *      to `strb r5,[r3,#9]`. Worth knowing for its own sake -- those stores do
 *      NOT invalidate a sibling member's cached value.
 *   5. (W39-D) unk09 and unk0b assigned from ONE int local that changes value
 *      (`v = 0; a1->unk09 = v; a1->unk0a = 0; v = 1; a1->unk0b = v;`), on the
 *      theory that the ROM's r0 carries 0 then 1 for exactly those two stores.
 *      Probed: constant propagation folds both and unk09 is still `strb r5`.
 *
 * Also settled, because the shape of the diff invites the wrong reading: the
 * u16 bitfield surgery at +4 (`ldrh / ldr =0xFFFFF87F / ands / orrs / strh`)
 * and the whole gUnknown_085D5ABC table section are BYTE-EXACT here. They come
 * out of the ordinary C bitfield member assignments below and must NOT be
 * respelled as an explicit mask/or on a u16 load. The 21 differing bytes are
 * one 2-byte instruction plus the 2-byte shift it imposes on everything after
 * it; the trailing instructions are identical and merely relocated, and the
 * `<_08025C50>` versus `<sub_08025BE0+0x70>` branch targets in the diff are
 * symbolisation, not byte differences.
 *
 * What is still untried: something that makes the zero arrive from a distinct
 * source expression WITHOUT changing the struct. Note that the two constructs
 * that most plausibly create a second constant pseudo -- a chained assignment
 * and a bitfield store -- have now both been measured and neither does. The
 * next idea should probably question whether unk09's initialiser is a literal
 * 0 at all.
 */

void sub_08025BE0(struct Unk08499594 *a1, u8 a2)
{
    a1->unk00 = a2;
    a1->unk01 = 0;
    a1->unk06_7 = 0;
    a1->unk04_0 = 0x64;
    a1->unk06_0 = gUnknown_085D5ABC[a2].unk10;
    a1->unk04_7 = gUnknown_085D5ABC[a2].unk0b;
    a1->unk05_3 = 0;
    a1->unk07 = 0;
    a1->unk08 = 0;
    {
        register u8 zero asm("r0");
        asm("movs %0, #0" : "=r" (zero));
        a1->unk09 = zero;
    }
    a1->unk0a = 0;
    a1->unk0b = 1;

    switch (a2)
    {
    case 1:
    case 2:
        a1->unk0b = 0;
        break;

    default:
        a1->unk0b = 4;
        break;
    }
}
