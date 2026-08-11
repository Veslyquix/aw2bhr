#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08085708.
 * sub_08085708 @ 0x08085708
 */

/* MATCHED (wave 55, W55-D). 384 bytes, relocs match.
 *
 * The twenty-row unit-info table builder. `a1` really is unused -- the header's
 * note on the prototype is right, the prologue is `mov sb, r1` with r0 written
 * before it is ever read, and an unused leading parameter costs no
 * instructions.
 *
 * TWO THINGS DECIDED THIS, both worth carrying forward:
 *
 * 1. THE TABLE SELECTION MUST BE ITS OWN STATEMENT. Written inline as
 *    `t = (sub_080261E8(a2) ? A : B)[i];` agbcc evaluates the SUBSCRIPT first
 *    and hoists `i * 2` into a callee-saved register ahead of the `bl`, then
 *    adds the selected base afterwards. The ROM does the opposite: the call and
 *    the `?:` run first, the pointer lands in r1, and only then is `i * 2`
 *    computed. Splitting it into
 *        p = sub_080261E8(a2) ? A : B;
 *        t = p[i];
 *    puts the two in the ROM's order and took the function from 91.9% (31 of
 *    384 bytes, size already exact) to a match. Nothing else changed, and the
 *    r1/r2 swap in the `movs #54; mov sl` pair three instructions later fixed
 *    itself -- it was downstream of this, not a second defect.
 *
 * 2. `DivRem(i, 4)` is recomputed at all four use sites and `(i >> 2) * 0x18`
 *    is written inline at all four as well; agbcc CSEs the shift into r7 and
 *    parks the shared 0x36 in sl by itself. Do not bind either to a local.
 *
 * `asrs r2, r1, #2` is `i >> 2`, not `i / 4`: a signed division by 4 would
 * carry the round-toward-zero fixup, and there is none.
 *
 * The two id tables are newly declared in include/unknown-globals.h; the two
 * callees sub_080859A0 / sub_08085410 (and sub_08085638 / sub_080856A0) were
 * already promoted and matching in src/decomp but had never been declared,
 * because this function was their only caller and it was still asm. The
 * declarations added to include/unknown-functions.h copy the promoted
 * definitions exactly.
 */

void sub_08085708(s16 *a1, int a2)
{
    int i;
    int t;
    const u16 *p;

    for (i = 0; i <= 0x13; i++)
    {
        p = sub_080261E8(a2) ? gUnknown_08616B22 : gUnknown_08616B4A;
        t = p[i];

        if (t != 0)
        {
            sub_080859A0(DivRem(i, 4) * 0x36 + 0x13, (i >> 2) * 0x18 + 0x28, 0, a2, t, 2);

            if (sub_080432E0(t) != 7)
                sub_0801F34C(sub_08085410(a2, t), DivRem(i, 4) * 0x36 + 0x24,
                             (i >> 2) * 0x18 + 0x28, 0, 1);

            if (sub_08043200(gUnknown_08499598[a2].unk1d, gUnknown_08499598[a2].unk1e, t) != 0)
            {
                sub_0801F34C(0x94, DivRem(i, 4) * 0x36 + 0x25,
                             (i >> 2) * 0x18 + 0x30, 0, 1);
                sub_0801F34C(sub_080856A0(a2, t), DivRem(i, 4) * 0x36 + 0x2d,
                             (i >> 2) * 0x18 + 0x30, 0, 1);
            }
            else if (sub_08043190(gUnknown_08499598[a2].unk1d, gUnknown_08499598[a2].unk1e, t) != 0)
            {
                sub_0801F34C(0x93, DivRem(i, 4) * 0x36 + 0x25,
                             (i >> 2) * 0x18 + 0x30, 0, 1);
                sub_0801F34C(sub_08085638(a2, t), DivRem(i, 4) * 0x36 + 0x2d,
                             (i >> 2) * 0x18 + 0x30, 0, 1);
            }
        }
    }
}
