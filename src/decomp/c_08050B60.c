#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08050B60.
 * sub_08050B60 @ 0x08050B60
 */

/* Three lsls/lsrs #0x10 pairs for two parameters and one result: the first two
 * are the u16 parameters' entry narrowing, the third is the u16 RETURN being
 * narrowed after the add. A wider return type drops that last pair. */
u16 sub_08050B60(u16 a, u16 b)
{
    return a + b;
}
