#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08054B7C.
 * sub_08054B7C @ 0x08054B7C
 */

struct Unk03002040
{
    /* 0x00 */ u8 filler_00[0x50];
    /* 0x50 */ u16 unk50;
    /* 0x52 */ u16 unk52;
    /* 0x54 */ u16 unk54;
    /* 0x56 */ u16 unk56;
};
extern struct Unk03002040 gUnknown_03002040;
extern u16 gUnknown_03004518;
extern u16 gUnknown_03004538;

void sub_08054B7C(void)
{
    gUnknown_03004538 = gUnknown_03002040.unk54;
    gUnknown_03004518 = gUnknown_03002040.unk50;
}
