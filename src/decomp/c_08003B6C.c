#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003B6C.
 * sub_08003B6C @ 0x08003B6C
 */

int sub_08003B6C(int a, int b)
{
    return (DivRem(sub_080129E0(), (a - b) * 32) >> 5) + b;
}
