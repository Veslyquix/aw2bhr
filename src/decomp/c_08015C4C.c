#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015C4C.
 * sub_08015C4C @ 0x08015C4C, sub_08015C64 @ 0x08015C64, sub_08015C7C @ 0x08015C7C, sub_08015C94 @ 0x08015C94, sub_08015CB4 @ 0x08015CB4, sub_08015CCC @ 0x08015CCC
 */

void sub_08015C4C(u8 a, u32 b)
{
    gUnknown_03001470[a].unk0c = b;
}

void sub_08015C64(u8 a, u32 b)
{
    gUnknown_03001470[a].unk08 = b;
}

u32 sub_08015C7C(u8 a)
{
    return gUnknown_03001470[a].unk08;
}

void sub_08015C94(u8 a, const void *b)
{
    gUnknown_03001470[a].unk04 = b;
    gUnknown_03001470[a].unk10 = 0;
}

void sub_08015CB4(u8 a, u8 b)
{
    gUnknown_03001470[a].unk14 = b;
}

u8 sub_08015CCC(u8 a)
{
    return gUnknown_03001470[a].unk14;
}
