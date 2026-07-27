#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044144.
 * sub_08044144 @ 0x08044144
 */

struct Unk08499598
{
    /* 0x00 */ u8 filler_00[0x1E];
    /* 0x1E */ u8 unk1E;
    /* 0x1F */ u8 unk1F;
    /* 0x20 */ u32 unk20;
    /* 0x24 */ u8 filler_24[0x18];
};
extern struct Unk08499598 *gUnknown_08499598;

void sub_08044144(int a1)
{
    gUnknown_08499598[a1].unk1E = gUnknown_08499598[a1].unk1F;
}
