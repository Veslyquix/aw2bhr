#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080275B4.
 * sub_080275B4 @ 0x080275B4, sub_08027608 @ 0x08027608, sub_08027658 @ 0x08027658
 */

void sub_080275B4(void)
{
    int v;

    v = gUnknown_03003130.unk04;

    if (v <= 3)
    {
        gUnknown_03003130.unk00 = 1;
        gUnknown_03003130.unk04 = v - (v + 0x57) / 2;

        if (gUnknown_03003130.unk04 <= -0x56)
            gUnknown_03003130.unk04 = 0xfa;
    }

    v = gUnknown_03003130.unk04;

    if (v > 0xad)
    {
        gUnknown_03003130.unk04 = v - (v - 0xad) / 2;

        if (gUnknown_03003130.unk04 <= 0xae)
            gUnknown_03003130.unk04 = 0xad;
    }
}

void sub_08027608(void)
{
    int v;

    v = gUnknown_03003130.unk04;

    if (v > 0xac)
    {
        gUnknown_03003130.unk00 = 0;
        gUnknown_03003130.unk04 = v - (v - 0xfa) / 2;

        if (gUnknown_03003130.unk04 > 0xf8)
            gUnknown_03003130.unk04 = -0x57;
    }

    v = gUnknown_03003130.unk04;

    if (v <= 2)
    {
        gUnknown_03003130.unk04 = v - (v - 3) / 2;

        if (gUnknown_03003130.unk04 > 1)
            gUnknown_03003130.unk04 = 3;
    }
}

/* Named per Xenesis's AW2 Subroutine List: "Draws the CO/CO Power/Funds
 * Combobox in the Main Game Window". Chooses which screen side the box
 * slides to (via sub_080275B4/sub_08027608, whichever eases the box's x
 * position away from the cursor) before the actual draw call. The old
 * sub_08027658 symbol is kept as a linker alias below so every other unit
 * keeps resolving it unchanged. */
void DrawInfoBoxCombobox(void)
{
    u16 x;
    u16 y;

    x = gUnknown_030033E4.unk00 * 16 - *(u16 *)(gUnknown_08499590 + 4);
    y = gUnknown_030033E4.unk02 * 16 - *(u16 *)(gUnknown_08499590 + 6);

    if ((s16)y <= 0x4f)
    {
        if ((s16)x <= 0x7f)
            sub_080275B4();
        else
            sub_08027608();
    }
    else
    {
        if (gUnknown_03003130.unk00 == 1)
            sub_080275B4();
        else
            sub_08027608();
    }

    sub_0804360C(gUnknown_03003130.unk04);
}

asm(".global sub_08027658\n.thumb_set sub_08027658, DrawInfoBoxCombobox\n");
