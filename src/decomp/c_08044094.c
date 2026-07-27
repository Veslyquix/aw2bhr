#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044094.
 * sub_08044094 @ 0x08044094
 */

struct Unk08499598
{
    u8 filler_00[0x20];
    u32 unk20;
    u8 filler_24[0x18];
};
extern struct Unk08499598 * gUnknown_08499598;

u32 sub_08044094(int a1)
{
    return gUnknown_08499598[a1].unk20;
}
