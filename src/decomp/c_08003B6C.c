#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003B6C.
 * sub_08003B6C @ 0x08003B6C
 */

int RandRange(int a, int b)
{
    return (DivRem(sub_080129E0(), (a - b) * 32) >> 5) + b;
}

asm(".global sub_08003B6C\n.thumb_set sub_08003B6C, RandRange\n");
