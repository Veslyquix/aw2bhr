#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08038474.
 * sub_08038474 @ 0x08038474
 */

/* Nested and not sequential: sub_08037DA4 takes an argument and so READS r0,
 * which sub_08038434 has just written. `pop {r1}` leaves that result live. */
int sub_08038474(void)
{
    return sub_08037DA4(sub_08038434());
}
