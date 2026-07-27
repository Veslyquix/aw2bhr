#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08018BAC.
 * sub_08018BAC @ 0x08018BAC
 */

bool8 sub_08018BAC(s16 a)
{
    gUnknown_0200C528[a].unk04 = gUnknown_0200C528[a].unk04->unk04;
    return TRUE;
}
