#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08084544.
 * sub_08084544 @ 0x08084544
 */

struct Unk8084544
{
    u8 filler_00[0x48];
    u16 unk48;
};

void sub_08084544(struct Unk8084544 *proc)
{
    if ((proc->unk48 & 1) == 0)
    {
        gUnknown_0300200C++;
        gUnknown_03002000--;
    }

    gUnknown_03001FF8++;
    proc->unk48++;
}
