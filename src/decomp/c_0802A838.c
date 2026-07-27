#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802A838.
 * sub_0802A838 @ 0x0802A838, sub_0802A85C @ 0x0802A85C
 */

struct Unk0849A354
{
    u16 unk00;
    u16 unk02;
};
extern const struct Unk0849A354 gUnknown_0849A354[];
extern const u8 gUnknown_08108264[][32];
struct Unk0849A2C8
{
    u16 unk00;
    u16 unk02;
};
extern const struct Unk0849A2C8 gUnknown_0849A2C8[];
extern const u8 gUnknown_08106A64[][32];

const u8 * sub_0802A838(int a1)
{
    return gUnknown_08108264[(gUnknown_0849A354[a1].unk00 * 8) & 0x3ff];
}

const u8 * sub_0802A85C(int a1)
{
    return gUnknown_08106A64[(gUnknown_0849A2C8[a1].unk00 * 8) & 0x3ff];
}
