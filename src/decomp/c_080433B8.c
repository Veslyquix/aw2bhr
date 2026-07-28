#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080433B8.
 * sub_080433B8 @ 0x080433B8, sub_080433C8 @ 0x080433C8, sub_080433D8 @ 0x080433D8, sub_080433E8 @ 0x080433E8
 */

u8 sub_080433B8(int a)
{
    return gUnknown_085D5ABC[a].unk0a;
}

u8 sub_080433C8(int a)
{
    return gUnknown_085D5ABC[a].unk0f;
}

u16 sub_080433D8(int a)
{
    return gUnknown_085D5ABC[a].unk06;
}

u8 sub_080433E8(int a)
{
    return gUnknown_085D5ABC[a].unk0c;
}
