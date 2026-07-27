#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08029FC4.
 * sub_08029FC4 @ 0x08029FC4
 */

struct Unk03001470
{
    u8 filler_00[0x38];
    u16 unk38;
    u8 filler_3A[0x26];
};
extern struct Unk03001470 gUnknown_03001470[];
extern s16 gUnknown_03001FBC;

void sub_08029FC4(void)
{
    gUnknown_03001470[gUnknown_03001FBC].unk38 = 1;
}
