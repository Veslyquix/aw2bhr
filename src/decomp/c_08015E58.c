#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015E58.
 * sub_08015E58 @ 0x08015E58
 */

bool8 sub_08015E58(u8 a)
{
    gUnknown_03001470[a].unk0c = *(const u32 *)gUnknown_03001470[a].unk04;
    gUnknown_03001470[a].unk04 = (const u32 *)gUnknown_03001470[a].unk04 + 2;
    return TRUE;
}
