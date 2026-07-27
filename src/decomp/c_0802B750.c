#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802B750.
 * sub_0802B750 @ 0x0802B750
 */

struct Unk03003130
{
    u8 filler_00[0x10];
    u8 unk10;
    u8 unk11;
};
extern struct Unk03003130 gUnknown_03003130;
struct Unk030033E4
{
    u16 unk00;
    u16 unk02;
};
extern struct Unk030033E4 gUnknown_030033E4;

void sub_0802B750(void)
{
    gUnknown_03003130.unk10 = gUnknown_030033E4.unk00;
    gUnknown_03003130.unk11 = gUnknown_030033E4.unk02;
}
