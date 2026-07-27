#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080665BC.
 * sub_080665BC @ 0x080665BC
 */

struct Unk08580934_Sub
{
    /* 0x00 */ u8 filler_00[0x08];
    /* 0x08 */ u32 unk08;
};
struct Unk08580934
{
    /* 0x00 */ u8 filler_00[0x74];
    /* 0x74 */ struct Unk08580934_Sub *unk74[1];
};
extern struct Unk08580934 *gUnknown_08580934;

void sub_080665BC(int index)
{
    gUnknown_08580934->unk74[index]->unk08 = 0;
}
