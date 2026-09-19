#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08045848.
 * sub_08045848 @ 0x08045848, sub_08045874 @ 0x08045874, sub_080458A0 @ 0x080458A0, sub_080458CC @ 0x080458CC, sub_080458F8 @ 0x080458F8
 */

/* One of five near-identical predicates over gMap: read a row offset from
 * gMap->rowOffset[], index gMap->terrain with it (plus a small fixed cell
 * offset), and test the top three bits of that byte for the value 1. All five
 * use `lsrs #5` and `cmp #1`; only the rowOffset slot and the cell offset
 * differ.
 *
 * `if (c) return 1; return 0;` and not `return c;` -- the ROM materialises
 * BOTH constants and puts its literal pool between the two return blocks,
 * which the short boolean form cannot produce. A leaf: no push, and the
 * epilogue is a bare `bx lr`. */
int sub_08045848(void)
{
    if (gMap->terrain[gMap->rowOffset[5] + 13] >> 5 == 1)
        return 1;

    return 0;
}

/* Sibling of the predicate above; only the rowOffset slot and cell offset differ. */
int sub_08045874(void)
{
    if (gMap->terrain[gMap->rowOffset[2] + 15] >> 5 == 1)
        return 1;

    return 0;
}

/* Sibling of the predicate above; only the rowOffset slot and cell offset differ. */
int sub_080458A0(void)
{
    if (gMap->terrain[gMap->rowOffset[8] + 3] >> 5 == 1)
        return 1;

    return 0;
}

/* Sibling of the predicate above; only the rowOffset slot and cell offset differ. */
int sub_080458CC(void)
{
    if (gMap->terrain[gMap->rowOffset[8] + 6] >> 5 == 1)
        return 1;

    return 0;
}

/* Fifth sibling: reads gMap->terrain[gMap->rowOffset[9]] with no cell offset. */
int sub_080458F8(void)
{
    if (gMap->terrain[gMap->rowOffset[9]] >> 5 == 1)
        return 1;

    return 0;
}
