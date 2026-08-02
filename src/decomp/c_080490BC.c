#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080490BC.
 * sub_080490BC @ 0x080490BC
 */

#include "hardware.h"
#include "proc.h"

/* A proc tick. B (gpKeySt->last & 2) re-opens the view and bumps unk83c; the
 * proc then breaks unless unk836 is set AND unk83c has fallen back to zero,
 * waits out sub_08019260 and the sub_08048EC4 slide, and finally repaints and
 * breaks.
 *
 * `v` is not cosmetic: the ROM passes the sub_08048EC4 result straight back as
 * sub_08012BC8's sixth argument (`str r2, [sp, #4]` reusing the register the
 * `lsr #0x10` left it in), which is also what proves sub_08048EC4 returns a
 * value rather than a flag.
 *
 * gUnknown_0812A15C is a -fforce-addr address word holding &gUnknown_084C30F8,
 * not a global -- the same word as 0x0812A150/154/158. Four references across
 * a merge is what makes agbcc park &gUnknown_084C30F8 in r4 here. */
void sub_080490BC(ProcPtr proc)
{
    u16 v;

    if ((gpKeySt->last & 2) != 0)
    {
        sub_080485F8();
        gUnknown_084C30F8->unk83c++;
    }

    if (gUnknown_084C30F8->unk836 == 0 || gUnknown_084C30F8->unk83c != 0)
    {
        Proc_Break(proc);
        return;
    }

    if (sub_08019260())
        return;

    v = sub_08048EC4();

    if (v != 0)
        return;

    gUnknown_084C30F8->unk839++;

    if (gUnknown_084C30F8->unk836 != 0)
        sub_08012BC8(gUnknown_08499578, 7, 0xf, 0x17, 4, v);

    sub_0803B4DC(0x71);
    Proc_Break(proc);
}
