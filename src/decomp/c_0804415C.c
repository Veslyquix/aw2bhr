#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804415C.
 * sub_0804415C @ 0x0804415C
 */

struct Unk08499598
{
    u8 filler_00[0x1E];
    u8 unk1E;
    u8 filler_1F[1];
    u32 unk20;
    u8 filler_24[0x18];
};
extern struct Unk08499598 * gUnknown_08499598;

int sub_0804415C(int a1)
{
    return gUnknown_08499598[a1].unk1E != 0;
}
