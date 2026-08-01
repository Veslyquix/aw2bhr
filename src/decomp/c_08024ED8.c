#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08024ED8.
 * sub_08024ED8 @ 0x08024ED8
 */

/* Normalises a pair of signed counters at +8: if BOTH are non-positive the
 * larger becomes 1 and the other 0; otherwise each negative one is clamped to
 * 0. The two clamps are shared -- the `a` clamp falls THROUGH into the `b`
 * clamp, which is why the b test sits outside the outer `if`.
 *
 * The member is s16 and that is measured: every read is
 * `movs rI,#8; ldrsh rD,[rB,rI]`, the s16-OBJECT tell. A u16 member compared
 * `> 0` would give `ldrh` and an unsigned branch. The record itself is not
 * modelled -- only +8 is reached here -- so the struct stays local to this
 * file rather than going into unknown-globals.h. */

struct Unk8024ED8
{
    /* 0x00 */ u8 filler_00[0x08];
    /* 0x08 */ s16 unk08;
};

void sub_08024ED8(struct Unk8024ED8 *a, struct Unk8024ED8 *b)
{
    if (a->unk08 <= 0)
    {
        if (b->unk08 <= 0)
        {
            if (a->unk08 < b->unk08)
            {
                b->unk08 = 1;
                a->unk08 = 0;
            }
            else
            {
                a->unk08 = 1;
                b->unk08 = 0;
            }

            return;
        }

        if (a->unk08 < 0)
            a->unk08 = 0;
    }

    if (b->unk08 < 0)
        b->unk08 = 0;
}
