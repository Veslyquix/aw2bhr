#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802C154.
 * sub_0802C154 @ 0x0802C154
 */

struct Unk08499598
{
    u8 filler_00[0x1E];
    u8 unk1E;
    u8 filler_1F[1];
    u32 unk20;
    u8 filler_24[1];
    u8 unk25;
    u8 filler_26[0xB];
    u8 unk31;
    u8 filler_32[0xA];
};
extern struct Unk08499598 * gUnknown_08499598;

void sub_0802C154(int a1)
{
    gUnknown_08499598[a1].unk31 = 1;
}
