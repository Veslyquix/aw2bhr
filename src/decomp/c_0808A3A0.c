#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808A3A0.
 * sub_0808A3A0 @ 0x0808A3A0
 */

/* Byte-for-byte the same routine as sub_08084544, on the same globals and the
 * same +0x48 halfword. Two copies of one source function. */

struct Unk808A3A0
{
    u8 filler_00[0x48];
    u16 unk48;
};

void sub_0808A3A0(struct Unk808A3A0 *proc)
{
    if ((proc->unk48 & 1) == 0)
    {
        gUnknown_0300200C++;
        gUnknown_03002000--;
    }

    gUnknown_03001FF8++;
    proc->unk48++;
}
