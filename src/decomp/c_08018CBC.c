#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08018CBC.
 * sub_08018CBC @ 0x08018CBC
 */

bool8 sub_08018CBC(s16 a)
{
    gUnknown_03002F08.unk02 = gUnknown_0200C528[a].unk04->unk0a;
    gUnknown_0200C528[a].unk04++;
    return TRUE;
}
