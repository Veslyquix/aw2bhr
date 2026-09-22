#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014084.
 * sub_08014084 @ 0x08014084
 */

/* WAVE 78 (W78-A): MATCHED configured, 872/872. The former +8 was two
 * independent source shapes: the byte-command scan had to be a goto loop with
 * a named 0x80 lower bound, and case 11 needed a distinct signed value local.
 * A fresh s2 pointer then restored case 10's r6/r7 allocation. The final two
 * bytes were the false-arm zero in case 20: keeping the hoisted zero in r1
 * with a fixed-register local reproduces the ROM's cross-jump exactly. */

/* WAVE 72 ADDENDUM: the entry guard is now two separate comparisons, matching
 * the ROM instead of range-folding `> 0x83 || < 0x80`. The configured draft
 * remains 880/872 (+8), 13.9% positional identity: case 15's 0x208 lifetime
 * and case 0's recursive tail already match instruction-for-instruction, so
 * the remaining excess/register rotation is elsewhere in the switch bodies.
 *
 * WAVE 55 (W55-G) PARK, first attempt on this function, 3 try_match rounds on
 * 872 bytes. STRUCTURALLY COMPLETE: the entry loop, the 24-entry jump table,
 * all nine reachable cases and every shared tail read out and reproduce. What
 * is left is (a) REGISTER NAMING -- the ROM has p=r5, s=r6, n=r7 (n reusing
 * dst's register, which is dead from case 10 on) where this draft has p=r6,
 * s=r5, n=r5 and spends r7 on &p->unk32 -- and (b) an EIGHT-BYTE excess
 * somewhere before case 10, which I could not locate because try_match's report
 * is truncated at the front and every hunk I can see is downstream of it. The
 * two are very likely one fact: 8 bytes of extra code earlier is exactly the
 * kind of thing that flips a four-way tie between r5/r6/r7.
 *
 * WHERE TO LOOK FIRST for the 8 bytes, in my order of suspicion: case 15's
 * `dst[0x21] = p->unk2c | 0x208` (the ROM materialises 0x208 as
 * `movs r7,#0x82; lsls r7,r7,#2; adds r1,r7,#0` -- note it BURNS dst's register
 * on the constant, having already hoisted `dst + 1` into r4, so if this draft
 * keeps dst live the shape changes); then case 0's recursive tail; then the
 * switch dispatch itself.
 * This is also the documented case FOR the permuter -- instruction order
 * correct, slots wrong -- and it has not been run on this function.
 *
 * WAVE 77 (W77-D) CORRECTION: the permuter HAS been run. `work/sub_08014084/
 * permuter/` exists and `best.c` is 7,103 lines of RAW EXPANDED permuter
 * output scoring size-exact / 54.8% / first difference +0x8, against this
 * draft's +8 bytes / 13.9%. Per the wave-73 chapter on raw expanded output
 * that 54.8% is NOT reachable from any source spelling, so do not transplant
 * it and do not read it as this draft's score.
 * W77-D then ran ONE MORE chained run from that best.c: 1,921 iterations,
 * 4 threads, 300 s, base score 2515, and NOT ONE candidate scored below the
 * base. Under the wave-59 chaining rule ("keep going until a run returns no
 * improvement") that is the terminating run, so the permuter chain on this
 * function is exhausted as of wave 77. The active draft was verified byte
 * identical before and after.
 *
 * W77-D also checked the wave-77 address-expression lever: this function's
 * ROM pool contains NO -fforce-addr word (every entry is a plain symbol
 * literal, gUnknown_03002514 re-materialised four times, gUnknown_0848A3C4
 * and gUnknown_0848A398 three each), so the lever's precondition does not
 * hold and the array spellings must stay as they are.
 *
 * TWO CODEGEN FINDINGS, BOTH MEASURED HERE, BOTH WORTH MORE THAN THIS FUNCTION.
 * Each was worth several hundred bytes of diff and neither is in the brief.
 *
 * 1. SWITCH CASE BODIES ARE EMITTED IN SOURCE ORDER, NOT IN CASE-LABEL ORDER,
 *    AND THE JUMP TABLE DOES NOT CONSTRAIN THEM. Writing the cases in numeric
 *    order (0, 9, 10, 11, 12, 13, 14, 15, 20/22/23) put every block in the
 *    wrong place and made the diff look total. The ROM's block order is
 *    0, 20/22/23, 13, 15, 12, 14, 11, 10, 9 -- so THAT is the order the
 *    original source wrote them in, and it is recoverable for free by reading
 *    the jump table's targets and sorting them by ADDRESS. Do that before
 *    writing a single case. Generalises to any jump-table function.
 *
 * 2. TWO IDENTICAL if/else ARMS GET CROSS-JUMPED, AND WHERE THE SHARED TAIL
 *    LIVES IN THE SOURCE DECIDES WHETHER THEY DO. Case 10's arms differ only in
 *    `unk07[0]` vs `unk07[1]` and are identical for ~40 instructions after
 *    that. Written as `if (..) {A} else {B}` with the common
 *    `p->unk20 += 2; return 3;` AFTER the if, gcc merged the two tails into one
 *    block and the ROM's second copy vanished. Written with each arm carrying
 *    its OWN copy of that tail -- `if (..) { A; p->unk20 += 2; return 3; }` then
 *    B falling out of the switch arm -- gcc keeps both copies in full, which is
 *    what the ROM has, and still merges the final two-instruction tail into the
 *    shared `_080143C8`. So a duplicated block in the ROM is not evidence of a
 *    macro or of hand-written asm: it is evidence about where the `return` was.
 *
 * A third, smaller one: `if (x >= 0x80 && x <= 0x89)` gets RANGE-FOLDED into
 * `(u8)(x + 0x80) <= 9` -- one truncation and one unsigned compare. The ROM's
 * two separate signed compares against 0x80 and 0x89 need two separate `if`
 * statements with their own early `return`, which fold does not reach across.
 *
 * TYPE MODEL, all of it already written down by other waves -- this function
 * needed no new struct and only one new global:
 *   - the parameter is `struct Unk08014074 *`, and every offset this function
 *     touches (unk20/24/28/2c/2e/30..33/34/36/39/3a/3c/40) is already declared
 *     there at the right width. sub_08014074's prototype fixes it.
 *   - sub_080152EC's slot is reached through a file-local view because
 *     struct Unk03001470 declares u32 at 0x30 where this function does a
 *     `strh`; that is the overlay situation the header note on Unk08014074
 *     already describes, so the shared tag is NOT reshaped.
 *   - case 10 is the same unk04_0/Div/sub_0802216C idiom as sub_08013D7C's
 *     C1/C2 arms, character for character. Matching that function first is what
 *     made this one cheap.
 *   - gUnknown_08489518 was undeclared and is now in include/unknown-globals.h.
 */

/* sub_08013D64 is promoted in src/decomp/c_08013D4C.c against the file-local
 * `struct Unk8013D4C`, which the header note on struct Unk08014074 records as a
 * drop-in retype of this same object (identical types at identical offsets).
 * Declared locally rather than in include/unknown-functions.h for exactly the
 * reason that note gives, and the way work/sub_080149C0/ already does it.
 * Unifying the two tags is an open, self-contained job; doing it here would
 * force a re-verify of c_08013D4C.c that this draft has not earned. */
u16 *sub_08013D64(struct Unk08014074 *);
struct Unk8014084Slot
{
    /* 0x00 */ u8 filler_00[0x18];
    /* 0x18 */ u16 *unk18;
    /* 0x1c */ u8 filler_1c[0x02];
    /* 0x1e */ s16 unk1e;
    /* 0x20 */ u8 filler_20[0x08];
    /* 0x28 */ u16 *unk28;
    /* 0x2c */ void (*unk2c)(void);
    /* 0x30 */ u16 unk30;
};

s16 sub_08014084(struct Unk08014074 *p, u16 *dst)
{
    u8 *s;
    u8 *s2;
    u16 n;
    int c;
    int c2;
    int lo;
    u16 q30;
    register int zero asm("r1");
    struct Unk08499594 *e;
    struct Unk8014084Slot *q;

entry_loop:
    c = *p->unk20;
    s = p->unk20;
    lo = 0x80;
    if (c > 0x83)
        goto entry_done;
    if (c < lo)
        goto entry_done;
    p->unk2e = c - 0x80;
    p->unk20 = s + 1;
    goto entry_loop;
entry_done:

    switch (s[0])
    {
    case 0:
        if (p->unk24 == 0)
            return 0;
        p->unk20 = (u8 *)p->unk24;
        p->unk24 = 0;
        return sub_08014084(p, dst);

    case 20:
    case 22:
    case 23:
        q = (struct Unk8014084Slot *)sub_080152EC(gUnknown_0848A3C4, 0);
        q->unk18 = dst + 1;
        q->unk28 = sub_08013D64(p);
        q->unk2c = p->unk3c;
        q30 = p->unk2c;
        zero = 0;
        q->unk30 = q30;
        if (p->unk20[0] == 0x17)
            q->unk1e = 1;
        else
            q->unk1e = zero;
        p->unk20 += 1;
        p->unk32 += 8;
        return 2;

    case 13:
        p->unk33 += 2;
        p->unk32 = p->unk30;
        p->unk34 += 2;
        p->unk40 = 0;
        p->unk20 += 1;
        return 3;

    case 15:
        dst[1] = 0;
        dst[0x21] = p->unk2c | 0x208;
        p->unk20 = s + 1;
        p->unk32 = p->unk30;
        p->unk33 = p->unk31;
        p->unk34 = p->unk36;
        p->unk40 = 0;
        q = (struct Unk8014084Slot *)sub_080152EC(gUnknown_0848A398, 0);
        q->unk18 = dst + 1;
        q->unk28 = sub_08013D64(p);
        q->unk2c = p->unk3c;
        sub_0803670C();
        return 2;

    case 12:
        p->unk20 = s + 1;
        p->unk32 = p->unk30;
        p->unk33 = p->unk31;
        p->unk34 = p->unk36;
        p->unk40 = 0;
        sub_080179D0(sub_08013D64(p));
        p->unk3c();
        return 2;

    case 14:
        p->unk20 = s + 1;
        if (p->unk3a == 0)
            return 3;
        sub_080152EC(gUnknown_08489518, 0)->unk1e = 0xa;
        return 2;

    case 11:
        p->unk20 = s + 1;
        c2 = s[1];
        if (c2 == 0x80)
        {
            sub_08014074(p);
        }
        else
        {
            if (c2 < lo)
                return 3;
            if (c2 > 0x89)
                return 3;
            p->unk3a = s[1] + 0x80;
            p->unk39 = 0;
        }
        p->unk20 += 1;
        return 3;

    case 10:
        if (s[1] == 0x80)
        {
            e = &gUnits[gUnknown_030040D8->unk07[0]];
            if (e->unk04_0 != 0)
                n = Div(e->unk04_0 - 1, 10) + 1;
            else
                n = 0;
            s2 = (u8 *)p + 0x32;
            sub_0802216C(p->unk28 + s2[0] + p->unk33 * 32, e->unk00,
                         gUnknown_03003F2C, e->unk07, 0, n, 0, 0);
            s2[0] += 2;
            p->unk20 += 2;
            return 3;
        }
        e = &gUnits[gUnknown_030040D8->unk07[1]];
        if (e->unk04_0 != 0)
            n = Div(e->unk04_0 - 1, 10) + 1;
        else
            n = 0;
        s2 = (u8 *)p + 0x32;
        sub_0802216C(p->unk28 + s2[0] + p->unk33 * 32, e->unk00,
                     gUnknown_03003F2C, e->unk07, 0, n, 0, 0);
        s2[0] += 2;
        p->unk20 += 2;
        return 3;

    case 9:
        dst[0] = s[1] * 4 - 0x604C;
        dst[1] = s[1] * 4 - 0x604B;
        dst[0x20] = s[1] * 4 - 0x604A;
        dst[0x21] = s[1] * 4 - 0x6049;
        p->unk32 += 2;
        p->unk20 += 2;
        return 3;
    }

    return 1;
}
