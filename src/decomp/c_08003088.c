#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003088.
 * sub_08003088 @ 0x08003088
 */

void sub_08003088(int a, int b)
{
    sub_080030BC(0, a, b);
    sub_080030BC(1, a, b);
    sub_080030BC(2, a, b);
    sub_080030BC(3, a, b);
}
