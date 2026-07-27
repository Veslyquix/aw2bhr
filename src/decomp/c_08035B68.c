#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08035B68.
 * sub_08035B68 @ 0x08035B68
 */

struct Unk0849CD88
{
    /* 0x00 */ u8 filler_00[0x14];
    /* 0x14 */ u32 unk14;
    /* 0x18 */ u8 filler_18[0xC];
};
extern const struct Unk0849CD88 gUnknown_0849CD88[];

u32 sub_08035B68(u16 i)
{
    return gUnknown_0849CD88[i].unk14;
}
