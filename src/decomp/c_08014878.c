#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014878.
 * sub_08014878 @ 0x08014878
 */

/* Three `sub_0801537C(<script>)` stops in a row, result discarded at each.
 * gUnknown_08489548 and gUnknown_08489568 are the two blobs sub_08014668 and
 * sub_080146D4 start, so this is the stop half of that pairing. */
void sub_08014878(void)
{
    sub_0801537C(gUnknown_08489530);
    sub_0801537C(gUnknown_08489548);
    sub_0801537C(gUnknown_08489568);
}
