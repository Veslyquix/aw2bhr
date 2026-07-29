#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802C6CC.
 * sub_0802C6CC @ 0x0802C6CC, sub_0802C6FC @ 0x0802C6FC, sub_0802C72C @ 0x0802C72C, sub_0802C75C @ 0x0802C75C
 */

/* Family F046: four copies of one predicate whose whole difference is the
 * constant gUnknown_03003FC0.unk09 is compared against (0, 1, 2, 3) -- the
 * single entry in data/families.json's `varies` for this family.
 *
 * The explicit `if (...) return TRUE;` chain and not `return a || b || c;`:
 * both 0 and 1 are materialised and the literal pool sits BETWEEN the two
 * return blocks, which per docs/agbcc-codegen.md is the four-byte-longer
 * if/return form. Probed against the one-`||` spelling in the same file --
 * that one inverts the last branch and puts the pool after the `return 1`
 * block, i.e. it is the short fallthrough shape.
 *
 * The two call-site narrowings are the callees' declared bool8 returns:
 * `lsls #0x18; lsrs #0x18; cmp #1` is the value kept for a compare against a
 * non-zero constant, `lsls #0x18; cmp #0` alone is a truth test.
 *
 * Nothing in the ROM calls any of the four, so the return type is a free
 * choice -- the body returns literal 0/1, so `int` is byte-identical and
 * bool8 is not proved. */

bool8 sub_0802C6CC(void)
{
    if (sub_0802C62C() == TRUE)
        return TRUE;

    if (sub_0802C660())
        return TRUE;

    if (gUnknown_03003FC0.unk09 != 0)
        return TRUE;

    return FALSE;
}

/* Family F046: four copies of one predicate whose whole difference is the
 * constant gUnknown_03003FC0.unk09 is compared against (0, 1, 2, 3) -- the
 * single entry in data/families.json's `varies` for this family.
 *
 * The explicit `if (...) return TRUE;` chain and not `return a || b || c;`:
 * both 0 and 1 are materialised and the literal pool sits BETWEEN the two
 * return blocks, which per docs/agbcc-codegen.md is the four-byte-longer
 * if/return form. Probed against the one-`||` spelling in the same file --
 * that one inverts the last branch and puts the pool after the `return 1`
 * block, i.e. it is the short fallthrough shape.
 *
 * The two call-site narrowings are the callees' declared bool8 returns:
 * `lsls #0x18; lsrs #0x18; cmp #1` is the value kept for a compare against a
 * non-zero constant, `lsls #0x18; cmp #0` alone is a truth test.
 *
 * Nothing in the ROM calls any of the four, so the return type is a free
 * choice -- the body returns literal 0/1, so `int` is byte-identical and
 * bool8 is not proved. */

bool8 sub_0802C6FC(void)
{
    if (sub_0802C62C() == TRUE)
        return TRUE;

    if (sub_0802C660())
        return TRUE;

    if (gUnknown_03003FC0.unk09 != 1)
        return TRUE;

    return FALSE;
}

/* Family F046: four copies of one predicate whose whole difference is the
 * constant gUnknown_03003FC0.unk09 is compared against (0, 1, 2, 3) -- the
 * single entry in data/families.json's `varies` for this family.
 *
 * The explicit `if (...) return TRUE;` chain and not `return a || b || c;`:
 * both 0 and 1 are materialised and the literal pool sits BETWEEN the two
 * return blocks, which per docs/agbcc-codegen.md is the four-byte-longer
 * if/return form. Probed against the one-`||` spelling in the same file --
 * that one inverts the last branch and puts the pool after the `return 1`
 * block, i.e. it is the short fallthrough shape.
 *
 * The two call-site narrowings are the callees' declared bool8 returns:
 * `lsls #0x18; lsrs #0x18; cmp #1` is the value kept for a compare against a
 * non-zero constant, `lsls #0x18; cmp #0` alone is a truth test.
 *
 * Nothing in the ROM calls any of the four, so the return type is a free
 * choice -- the body returns literal 0/1, so `int` is byte-identical and
 * bool8 is not proved. */

bool8 sub_0802C72C(void)
{
    if (sub_0802C62C() == TRUE)
        return TRUE;

    if (sub_0802C660())
        return TRUE;

    if (gUnknown_03003FC0.unk09 != 2)
        return TRUE;

    return FALSE;
}

/* Family F046: four copies of one predicate whose whole difference is the
 * constant gUnknown_03003FC0.unk09 is compared against (0, 1, 2, 3) -- the
 * single entry in data/families.json's `varies` for this family.
 *
 * The explicit `if (...) return TRUE;` chain and not `return a || b || c;`:
 * both 0 and 1 are materialised and the literal pool sits BETWEEN the two
 * return blocks, which per docs/agbcc-codegen.md is the four-byte-longer
 * if/return form. Probed against the one-`||` spelling in the same file --
 * that one inverts the last branch and puts the pool after the `return 1`
 * block, i.e. it is the short fallthrough shape.
 *
 * The two call-site narrowings are the callees' declared bool8 returns:
 * `lsls #0x18; lsrs #0x18; cmp #1` is the value kept for a compare against a
 * non-zero constant, `lsls #0x18; cmp #0` alone is a truth test.
 *
 * Nothing in the ROM calls any of the four, so the return type is a free
 * choice -- the body returns literal 0/1, so `int` is byte-identical and
 * bool8 is not proved. */

bool8 sub_0802C75C(void)
{
    if (sub_0802C62C() == TRUE)
        return TRUE;

    if (sub_0802C660())
        return TRUE;

    if (gUnknown_03003FC0.unk09 != 3)
        return TRUE;

    return FALSE;
}
