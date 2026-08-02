#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005874.
 * sub_08005874 @ 0x08005874, sub_08005964 @ 0x08005964
 */

#include "hardware.h"

/* sub_0800572C's shape with the first argument of the two forwarders changed
 * from 0 to 1 and a four-call tail. See work/sub_0800572C for the pool-word
 * note; the 0x0808D7C0 the listing names holds 0x0200B204. */
void sub_08005874(void)
{
    sub_0801F150(0, (void *)(0x06000000 + (gUnknown_03002B6C.bits.chr_block << 14)), 0x2FC, 10);
    sub_0801F234(9);
    if (sub_0803CCB8(0, gUnknown_0200B204) != 1)
        sub_08004D74(1, 0);
    else
        sub_08004D90(1, 0, gUnknown_0200B204);
    if (sub_0803CCB8(1, gUnknown_0200B204) != 1)
        sub_08004D74(1, 1);
    else
        sub_08004D90(1, 1, gUnknown_0200B204);
    if (sub_0803CCB8(2, gUnknown_0200B204) != 1)
        sub_08004D74(1, 2);
    else
        sub_08004D90(1, 2, gUnknown_0200B204);
    gUnknown_0200B0B0->unk46 = 0x15;
    gUnknown_0200B0B0->unk48 = 0x30;
    sub_0801A444(3, 2, 0xA, 4);
    sub_080149C0(4, 3, gUnknown_08499578, &gUnknown_0200B0B0->unk9c, 0x8000, 0);
    sub_08013AEC();
}

/* sub_080057EC's shape with a sub_0801B780 fade in front; see that draft for
 * why the slot id is read twice rather than bound to a local. */
void sub_08005964(void)
{
    sub_0801B780(0x70);
    sub_08019F2C(gUnknown_08488514, 2, 6, 0,
                 (s8)gUnknown_0200B0B0->unk10 < 0 ? 0 : (s8)gUnknown_0200B0B0->unk10);
    sub_08005874();
    gUnknown_0200B0B0->unk02 = 4;
}
