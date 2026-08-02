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

/* WAVE 36 (W36-A): the local struct is GONE and the parameters are the shared
 * struct Unk030013D0. sub_08024F20's call site settles it -- it passes
 * gUnknown_030013D0 and gUnknown_030013B0, the same two records it hands to
 * sub_08024A2C / sub_08024ABC / sub_08024C58 / sub_08024E60 -- and the choice
 * is byte-visible at that caller, because two tags naming one symbol split
 * agbcc's -fforce-addr pool word in two where the ROM has one. The `s16 unk08`
 * measured below IS Unk030013D0's unk08; this function still matches
 * byte-for-byte after the change. See include/unknown-functions.h. */

void sub_08024ED8(struct Unk030013D0 *a, struct Unk030013D0 *b)
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
