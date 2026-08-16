#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080263A4.
 * sub_080263A4 @ 0x080263A4
 */

/* A percentage ramp: below the chapter's threshold the answer is a flat 100,
 * above four times it zero, and in between it falls linearly. sub_0803866C
 * selects which of the chapter row's two thresholds applies.
 *
 * unk20 and unk22 are a PAIR at +0x20/+0x22 of the 0x5c-byte chapter row; the
 * second read repeats the whole `gUnknown_03003FC0.unk02 * 0x5c` index rather
 * than reusing the first, because the call to sub_0803866C sits between them.
 *
 * The first compare is `bhi` and the second `bge` -- unsigned then signed --
 * from ONE u16 global against a u16 member and then against `t * 4`. Nothing is
 * declared unsigned here: agbcc knows a zero-extended value is non-negative and
 * takes the unsigned condition, and the multiply destroys that knowledge.
 *
 * Named per Xenesis's AW2 Subroutine List: "Speed Scoring Subroutine". The
 * old sub_080263A4 symbol is kept as a linker alias below so every other
 * unit keeps resolving it unchanged. */
u8 GetSpeedScore(u8 a)
{
    u16 t;

    t = gUnknown_085C77A0[gUnknown_03003FC0.unk02].unk20;
    if (sub_0803866C())
        t = gUnknown_085C77A0[gUnknown_03003FC0.unk02].unk22;

    if (sub_080266DC(a))
    {
        if (gUnknown_03004080 <= t)
            return 100;
        if (gUnknown_03004080 < t * 4)
            return 100 - (gUnknown_03004080 - t) * 100 / (t * 3);
    }
    return 0;
}

asm(".global sub_080263A4\n.thumb_set sub_080263A4, GetSpeedScore\n");
