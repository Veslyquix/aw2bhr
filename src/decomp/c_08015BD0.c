#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015BD0.
 * sub_08015BD0 @ 0x08015BD0
 */

struct UnkBar
{
    u32 unk00;
    u8 filler_04[0x22];
    u16 unk26;
    u8 filler_28[0x38];
};
extern struct UnkBar gUnknown_03001470[];

s8 sub_08015BD0(s32 a)
{
    u8 i;

    for (i = 0; i < 30; i++)
    {
        if (gUnknown_03001470[i].unk00 == a)
            return i;
    }

    return -1;
}
