#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004BC0.
 * sub_08004BC0 @ 0x08004BC0
 */

/* `orr` with the constant's register as the destination -- the aggregate-member
 * `|=` operand swap, same as its neighbour sub_08003934.
 */
void sub_08004BC0(void)
{
    gUnknown_0200B0B0->unk00 |= 0x4000;
}
