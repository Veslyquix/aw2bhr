#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043A80.
 * sub_08043A80 @ 0x08043A80, sub_08043A90 @ 0x08043A90
 */

void *sub_08043A80(int a)
{
    return gUnknown_084A06F0[a].unk00;
}

void *sub_08043A90(int a)
{
    return gUnknown_084A06F0[a].unk04;
}
