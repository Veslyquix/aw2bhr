#include "global.h"

/* PARKED at 25.6%, -4 bytes (160 vs 164), first difference at +0xe.
 * Wave 57 (W57-B), re-measured wave 59 (W59-E) -- score unchanged.
 *
 * The third walker of the gUnknown_02029ED8 0xFF-terminated index chain, beside
 * the matched sub_0805B4D8 / sub_0805B5BC in src/decomp/c_0805B4D8.c. It is
 * sub_0805B5BC minus the sub_08026FD0 filter: it returns the first chain entry
 * whose record x byte is not 0xFE, writing x and y through two int out-params,
 * and 0xFE means "advance the head cursor" rather than "stop".
 *
 * THERE IS NO `a = *a1;` LOCAL. Written sub_0805B5BC's way, with `*a1` named
 * inline at all three sites, the ROM's instruction ORDER falls straight out --
 * `ldr r7, =gUnknown_02029ED8` is emitted FIRST, before `ldr r6, [r0]`, because
 * the array base is operand 0 of pointer_int_sum and -fforce-addr forces it
 * into a register before the index tree is expanded.
 *   The reason the local is NOT needed: `a * 0x20` survives the `++*a2` store
 * without a reload because a1 and a2 are DIFFERENT pointer parameters, and
 * agbcc treats two argument-derived bases as non-aliasing.
 *
 * WAVE 59 (W59-E): THE "NO LOCALS" READING IS NOW POSITIVELY CONFIRMED against
 * the matched twins, which is worth stating because those twins DO bind `p` and
 * `x` and this function must not:
 *   - the ROM loads `p->x` TWICE out of the same register r1 (once for the
 *     `== 0xfe` test, once for the `*a3` store). A bound `x` collapses that.
 *   - the ROM recomputes the whole `p->y` address, including re-reading
 *     gUnknown_030033EC and redoing the *0xc00. A bound `p` collapses that.
 * The global re-read inside the loop is an ALIASING effect, not a missed
 * optimisation: the stores through a3/a4 mean agbcc cannot prove they do not
 * alias the global. Do NOT hoist it into a local.
 *
 * REMAINING DIFF -- ONE INSTRUCTION, a register SLOT tie, no missing statement:
 *
 *     ROM   ldr r7, =gUnknown_02029ED8      base -> r7  (LOW, kept all function)
 *           ldr r0, =gUnknown_030033EC / mov ip, r0     addr -> ip (HI)
 *           ... adds r3, r5, #0            copy a*0x20 out of r5 before reuse
 *     here  ldr r1, =gUnknown_02029ED8 / mov ip, r1     base -> ip (HI)
 *           ldr r5, =gUnknown_030033EC                  addr -> r5 (LOW)
 *           (no copy needed -- a*0x20 stays in r3 throughout)
 *
 * The two address constants have swapped registers, and because the candidate's
 * allocation is the BETTER one it does not need the ROM's `adds r3, r5, #0`
 * preheader copy. That copy plus the 2 bytes of pool alignment its size change
 * removes is the entire -4. Both constants are referenced four times and the
 * base's pseudo is created first in both, so allocno_compare ties and the
 * tie-break went the other way; per docs/agbcc-codegen.md a misplaced `ldr` and
 * a swapped pair of pool words are ONE fact, so do not chase the pool order.
 *
 * RULED OUT (measured, do not repeat):
 *   - (w48, w57) `u8 *base = gUnknown_02029ED8;` as the first statement -- the
 *     base still loses the low register.
 *   - (w57) the record subscript's operand order. Instruction COUNT is
 *     identical either way, so it is not part of the -4.
 *   - (w59) THE PERMUTER, which the wave-48 and wave-57 notes both name as the
 *     next thing to try. Do NOT run it through `mcp permute`: that tool is
 *     broken this wave (W59-A), fails with a KeyError on 'exit_code' and
 *     strands raw header-expanded output in work/<fn>/<fn>.c, destroying the
 *     draft. Any negative obtained that way is worthless. The residual is also
 *     ONE EXTRA INSTRUCTION in the ROM rather than a pure order/slot swap,
 *     which the brief records as the permuter's documented dead case.
 *   - (w59) old_agbcc is not worth a probe here: this function contains no
 *     calls at all, so the documented discriminator for that override (a call
 *     inside a loop body) cannot apply. */

/* WAVE 86 (W86-B). Held at 25.6%, 160/164 (-4), first difference +0xe
 * (configured profile -- unchanged from the wave-57/59 measurements).
 * TWO LEVERS TESTED. BOTH REFUTED, and the second one is the interesting one
 * because it is byte-neutral rather than worse.
 *
 * REFUTED 1 -- "BIND THE OTHER ADDRESS FIRST" IS NOT AVAILABLE HERE: EVERY
 * SPELLING THAT CREATES &gUnknown_030033EC's PSEUDO EARLY ALSO COLLAPSES THE
 * RE-READS. The park listed this as the untried axis. The only spelling that
 * creates the address pseudo before the array base without naming the global's
 * VALUE early is a pointer local, `u16 *zp = &gUnknown_030033EC;` with `*zp`
 * at all four sites. Measured: 136 bytes (-28), 103 of 136 differ, 20.1%,
 * first difference +0x8. It is far worse, and the .s says why: agbcc CSEs
 * `*zp * 0xc00` into one register (`add r3,r0,#0`) and HOISTS it out of the
 * loop, so the loop body no longer re-reads gUnknown_030033EC at all. That is
 * exactly the collapse W59-E proved must not happen. Binding the address
 * defeats the aliasing that keeps the re-read alive, so on this function
 * "bind the other address first" and "keep the ROM's re-reads" are mutually
 * exclusive. The axis is closed, not untried.
 *   Worth keeping from that probe: THE POOL ORDER MOVED AND THE REGISTER
 * ASSIGNMENT DID NOT. In the V1 .s the pool is `.word gUnknown_030033EC`
 * then `.word gUnknown_02029ED8` -- the swap this function has wanted for
 * five waves -- while the base still went to `ip` (`mov ip,r1`) exactly as
 * before. docs/agbcc-codegen.md says "a misplaced ldr and a swapped pair of
 * pool words are ONE fact, so never chase the pool order directly". On this
 * function they are TWO facts: pool order follows reference-creation order,
 * the register follows allocno priority, and they moved independently.
 *
 * REFUTED 2 -- THE WAVE-83 LIVE-RANGE-SPLIT LEVER IS EXACTLY BYTE-NEUTRAL.
 * The ROM pays `adds r3,r5,#0` to copy `*a1 * 0x20` out of r5, which says the
 * ROM keeps that product live across the loop -- so promoting it to a source
 * local is the well-motivated split here, and it also tests the strongest
 * form of the "creation order is the tie-break" mechanism: a local declared
 * at block top gets its pseudo from expand_decl BEFORE any statement is
 * expanded, so it is numbered ahead of EVERY compiler temp in the function,
 * including both -fforce-addr address pseudos. Measured, with `int n;`
 * declared second and `n = *a1 * 0x20;` as the first statement, used at both
 * index sites: 160 bytes (-4), 118 of 160 differ, 25.6%, first difference
 * +0xe. IDENTICAL TO THE BASELINE IN EVERY FIGURE.
 *   So on this function, moving a value from a compiler temp to the
 * lowest-numbered pseudo in the function changed NOTHING about which of the
 * two address constants got the low register. The tie is not decided by
 * allocno number.
 *
 * PREDICTION (c) FROM THE WAVE-86 BRIEF HELD, AND FOR THE STATED REASON.
 * The brief predicted that because the ROM has one MORE instruction than the
 * candidate, a split alone would not close it -- that this is a
 * rematerialisation question and not a priority one. It held: the split is
 * byte-neutral. The candidate's allocation is still the better one, it still
 * does not need the ROM's preheader copy, and no spelling tried in waves 48,
 * 57, 59, 81 or 86 has made agbcc choose the worse arrangement.
 */

struct Unk2029ED8Rec
{
    /* 0x00 */ u8 filler_00[0x60];
    /* 0x60 */ u8 x;
    /* 0x61 */ u8 y;
};

int sub_0805B6A0(int *a1, int *a2, int *a3, int *a4)
{
    int i;

    i = gUnknown_02029ED8[*a2 + *a1 * 0x20 + gUnknown_030033EC * 0xc00];

    while (i != 0xff)
    {
        if (((struct Unk2029ED8Rec *)&gUnknown_02029ED8[i * 8 + *a1 * 0x3e0
                                                        + gUnknown_030033EC
                                                              * 0xc00])
                ->x
            == 0xfe)
        {
            ++*a2;
            if (*a2 > 0x1f)
                return 0;
            i = gUnknown_02029ED8[*a2 + *a1 * 0x20
                                  + gUnknown_030033EC * 0xc00];
            continue;
        }

        *a3 = ((struct Unk2029ED8Rec *)&gUnknown_02029ED8[i * 8 + *a1 * 0x3e0
                                                          + gUnknown_030033EC
                                                                * 0xc00])
                  ->x;
        *a4 = ((struct Unk2029ED8Rec *)&gUnknown_02029ED8[i * 8 + *a1 * 0x3e0
                                                          + gUnknown_030033EC
                                                                * 0xc00])
                  ->y;
        return 1;
    }

    return 0;
}
