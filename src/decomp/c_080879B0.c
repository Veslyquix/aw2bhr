#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080879B0.
 * sub_080879B0 @ 0x080879B0, sub_080879D8 @ 0x080879D8
 */

struct Unk080879D8
{
    /* 0x00 */ u8 filler_00[0x54];
    /* 0x54 */ int unk54;
};

void sub_080879B0(void)
{
    sub_08012BC8(gUnknown_08499580, 0xD, 4, 0x12, 0xC, 0);
    sub_08013B0C();
}

void sub_080879D8(struct Unk080879D8 *proc)
{
    sub_0801A368(0xD, 4, 0x12, 0xC, gUnknown_08499580, 0);
    sub_08013B0C();
    sub_08085F40();
    sub_08087C14(proc->unk54);
}
