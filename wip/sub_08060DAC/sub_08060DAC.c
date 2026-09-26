#include "global.h"

/* WAVE 86 (W86-A).  THE W81-C READING IS REFUTED HERE.  Eleven spellings of
 * "a second local whose definitions disagree by value across paths" were
 * compiled and read off the .s (no try_match spent): `int ter` / `u8 ter`
 * binding tbl[...] at both sites, `int idx` / `u8 idx` binding the MASKED
 * INDEX at both sites (with two spellings of the second definition), an
 * explicit `int mask = 0x1f;`, a `struct Unk085766E4 *e` entry local, and the
 * pairwise combinations.  EVERY ONE leaves `#0x1f` count at 2 and the frame at
 * 8.  A single-valued `mask` local is const-propagated and additionally
 * shrinks the frame to 4; the `e` entry local is badly wrong at 120 insns
 * (W77-B: a ROM spill is pressure, not an instruction to add a local).
 * `int idx` reaches the ROM's exact instruction count (133 vs 132) while
 * moving no allocation at all.
 *
 * The missing live value is the 0x1f mask, and it is missing because ip is
 * occupied by 0x417A here and by 0x1f in the ROM.  ROM holds FIVE invariants
 * (0x417A in sl loaded once, 0x1f in ip, gUnknown_085767F2 in sb,
 * &gUnknown_085766E4 in r8, &gUnknown_08499590 in LOW r3); this draft holds
 * four.  0x1432 is loaded twice from one pool word in BOTH, so the two
 * `p + 0x1432` bindings are confirmed correct.
 *
 * Permuter chained from best.c, full length: 15,216 iterations, clean exit,
 * five candidates at 72.3-73.0% -- the 73.0% ceiling did NOT move (wave 85
 * reached the same ceiling).  Two independent full-length runs now agree.
 * See work/sub_08060DAC/W86-notes.md. */

/* sub_08060DAC @ 0x08060DAC, 296 bytes. PARKED, SIZE EXACT (296/296).
 *
 * THE INSTRUCTION SEQUENCE IS CORRECT AND SO IS THE POOL ORDER. The byte score
 * (50.0%) is positional noise -- read the diff, not the score. Every
 * instruction, every branch target, both map-plane reads, both terrain lookups
 * and the whole store block are reproduced in the right order. What remains is
 * REGISTER ALLOCATION only, and it is one coupled fact:
 *
 *   ROM:  r3  = &gUnknown_08499590 (a LOW register, live across the whole
 *               if-body -- legal because there is no call after sub_08042424)
 *         sl  = 0x417A        sb = gUnknown_085767F2      ip = 0x1f
 *         r8  = &gUnknown_085766E4
 *         frame 12 bytes: n at sp+0, m at sp+4, and &gUnknown_085766E4[n]
 *         SPILLED to sp+8 across the terrain recomputation.
 *
 *   ours: sl  = &gUnknown_08499590     ip = 0x417A     r9 = gUnknown_085767F2
 *         r8  = &gUnknown_085766E4;  0x1f rematerialised as `movs r0,#31`
 *         twice instead of living in ip; frame 8 bytes, no spill.
 *
 * So the candidate carries one FEWER simultaneously-live value than the ROM
 * (it rematerialises the 0x1f mask rather than keeping it), which is why it
 * never needs the sp+8 spill and why &gUnknown_08499590 gets promoted into a
 * callee-saved register instead of staying in r3. The two halves balance and
 * the size stays exact.
 *
 * This is a pure register-allocation residual with the instruction order
 * already correct -- per the wave brief that is precisely decomp-permuter's
 * case ("order-wrong and slot-wrong"), and it is the documented next step.
 * NOT attempted here: I hit the 3-attempt cap first.
 *
 * WHAT WAS MEASURED (three try_match rounds, all size-exact):
 *
 *  1. No `t` local -- `rows` bound before the `y * 2`. WRONG: the ROM computes
 *     y*2 FIRST and then `adds r0,r4,r5` / `adds r0,r0,r1`, i.e. rows is the
 *     first operand of the final add. Without `t` the operands swap. This is
 *     exactly the `t = y * 2; rows = p + 0x417a;` ordering that
 *     src/decomp/c_0805AD90.c documents, and it must be a separate statement.
 *  2. With `t`, but with `cells = p + 0x1432;` bound before the table --
 *     WRONG POOL ORDER. The ROM's pool runs 0x417a, gUnknown_085767F2, 0x1432;
 *     binding `cells` first creates that pseudo first and emits 0x417a, 0x1432,
 *     gUnknown_085767F2. Per the brief a misplaced pool word and a swapped
 *     register pair are ONE fact (allocno creation order = RTL creation order).
 *  3. `tbl = gUnknown_085767F2;` bound BEFORE `cells` -- POOL ORDER NOW MATCHES
 *     the ROM exactly. This is the draft below.
 *
 * SETTLED, do not re-derive:
 *  - The two map planes are reached differently and both are proved:
 *    the GUARD keeps a separate `cells` local (three-operand `adds r0,r4,r5;
 *    adds r0,r0,r1`) because `p` is still live; the STORE block uses the
 *    in-place `p += 0x1432; p += off;` form (the ROM's `adds r3,r3,r0` twice)
 *    because `p` is dead after it. Same split as c_0805AD90.c's 0x1432 vs
 *    0x3C72 pair.
 *  - The whole terrain expression is genuinely RECOMPUTED in the store block,
 *    including re-reading gUnknown_08499590 and gUnknown_084995A0[k]. That is
 *    not a spelling choice: the `strb` into gUnknown_085766E4[n] may alias the
 *    map, which kills the CSE. Writing the statements out twice is correct.
 *  - `flags = p + 0x12` is computed AFTER `off`, and emits the ROM's
 *    `adds r0,r4,#0; adds r0,#0x12` copy-then-add because p stays live.
 *  - gUnknown_0816DAE8 / gUnknown_0816DADC are NOT objects: the ROM words hold
 *    0x085766E4 and 0x085D5ABC (read out of baserom.gba this wave), so they are
 *    agbcc -fforce-addr pool copies. The honest symbols are spelled below. */

int sub_08060DAC(void)
{
    int n;
    int m;
    int k;
    u8 *p;
    u8 *rows;
    u8 *cells;
    u8 *flags;
    const u8 *tbl;
    int t;
    int off;

    n = 0;
    m = 0;
    k = 0;
    gUnknown_030045C8 = 0;

    while (gUnknown_084995A0[k].unk00 != 0xff)
    {
        if (sub_08042424(gUnknown_084995A0[k].unk01, gUnknown_084995A0[k].unk02) == 1)
        {
            p = gUnknown_08499590;
            t = gUnknown_084995A0[k].unk02 * 2;
            rows = p + 0x417a;
            off = *(u16 *)(rows + t) + gUnknown_084995A0[k].unk01;
            flags = p + 0x12;

            if (flags[off] == 0)
            {
                tbl = gUnknown_085767F2;
                cells = p + 0x1432;

                if (tbl[cells[off] & 0x1f] != 0)
                {
                    gUnknown_085766E4[n].unk00 = gUnknown_084995A0[k].unk01;
                    gUnknown_085766E4[n].unk01 = gUnknown_084995A0[k].unk02;

                    p = gUnknown_08499590;
                    t = gUnknown_084995A0[k].unk02 * 2;
                    rows = p + 0x417a;
                    off = *(u16 *)(rows + t) + gUnknown_084995A0[k].unk01;
                    p += 0x1432;
                    p += off;
                    gUnknown_085766E4[n].unk02 = tbl[*p & 0x1f];

                    gUnknown_085766E4[n].unk03 = 0x7f;
                    n++;
                    m++;
                }
            }
        }
        k++;
    }

    gUnknown_085766E4[n].unk00 = 0xff;
    return m;
}
