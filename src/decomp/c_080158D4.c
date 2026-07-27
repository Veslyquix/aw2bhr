#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080158D4.
 * sub_080158D4 @ 0x080158D4, sub_08015900 @ 0x08015900
 */

void sub_080158D4(s16 a, s16 b)
{
    gUnknown_0200E438[gUnknown_03001470[a].unk26].unk40 = b;
}

s16 sub_08015900(s16 a)
{
    return gUnknown_0200E438[gUnknown_03001470[a].unk26].unk40;
}
