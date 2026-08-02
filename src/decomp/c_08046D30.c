#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08046D30.
 * sub_08046D30 @ 0x08046D30, sub_08046E48 @ 0x08046E48
 */

#include "hardware.h"

void sub_08046D30(void)
{
    sub_08023274(2);

    switch (gUnknown_02028DD4)
    {
    case 1:
        if (gpKeySt->held & 0x80)
        {
            sub_0803B4DC(0x67);
            sub_080468D4(gUnknown_02028DD5);
            gUnknown_02028DD4 = 2;
            sub_08014878();
            sub_08014668((gUnknown_02028DD5 >> 3) + 1, 0xb, gUnknown_08499578,
                         gUnknown_085D583C[gUnknown_02028DD6].unk0e, 0x8000, 0x100);
        }
        break;

    case 2:
        if (gpKeySt->held & 0x40)
        {
            sub_0803B4DC(0x67);
            sub_08012BC8(gUnknown_08499578, (gUnknown_02028DD5 >> 3) + 1, 0xb, 0xc, 8, 0);
            sub_08046778(gUnknown_02028DD5, gUnknown_02028DD6);
            gUnknown_02028DD4 = 1;
            sub_08014878();
        }
        break;
    }

    if (gpKeySt->held & 0x102)
    {
        sub_08014878();
        sub_080470E8();
        sub_08015C30(gUnknown_03001FBC);
        sub_0803B4DC(0x66);
    }
}

void sub_08046E48(void)
{
    u8 *src;
    u16 *pal;

    gUnknown_03001FF8 = 0;
    gUnknown_03001418 = 0;

    sub_0801B780(0);
    sub_08022A34();
    sub_08071948(gUnknown_08499580, gUnknown_02028DD5 >> 3, 0, gUnknown_0812AF68, 0x8360);
    sub_08013B0C();
    sub_0801F114();

    sub_0801F150(0, (void *)0x06010000, 0x1fa, 0x16);
    sub_0801F234(0x1c);
    sub_0801F234(0x1d);
    sub_0801F234(0x1e);
    sub_0801F234(0x1f);
    sub_0801F234(0x21);
    sub_0801F234(0x20);
    sub_0801F234(0x22);
    sub_0801F234(0x2c);
    sub_0801F234(0x2d);
    sub_0801F234(0x2e);
    sub_0801F234(0x39);
    sub_0801F150(2, (void *)0x06010000, 0x27e, 0x11);
    sub_0801F234(0xa8);

    switch (gUnknown_02028DD6)
    {
    case 8:
        src = gUnknown_0849982C[gUnknown_02028DD7].unk00;
        pal = gUnknown_0849982C[gUnknown_02028DD7].unk04;
        break;

    case 6:
        src = gUnknown_084998A4[gUnknown_02028DD7].unk00;
        pal = gUnknown_084998A4[gUnknown_02028DD7].unk04;
        break;

    default:
        src = gUnknown_085D583C[gUnknown_02028DD6].unk00;
        pal = gUnknown_085D583C[gUnknown_02028DD6].unk04;
        break;
    }

    Decompress(src, (void *)0x060148E0);
    ApplyPaletteExt(pal, 0x260, 0x60);

    sub_08011C68(gUnknown_0812C024, (void *)0x06014EE0, 0x60);
    sub_08011C68(gUnknown_0812C024 + 0x20, (void *)0x06014F40, 0x40);
    sub_08011C68(gUnknown_0812C024 + 0x60, (void *)0x06014F80, 0x20);
    sub_08011C68(gUnknown_0812C024 + 0x60, (void *)0x06014FA0, 0x20);

    switch (gUnknown_02028DD4)
    {
    case 0:
        sub_08046914(gUnknown_02028DD5, gUnknown_02028DD6);
        sub_08014878();
        sub_08014668((gUnknown_02028DD5 >> 3) + 1, 0xb, gUnknown_08499578,
                     gUnknown_085D583C[gUnknown_02028DD6].unk0e, 0x8000, 0x100);
        break;

    case 1:
        sub_08046914(gUnknown_02028DD5, gUnknown_02028DD6);
        sub_08046778(gUnknown_02028DD5, gUnknown_02028DD6);
        break;

    case 2:
        sub_08014878();
        sub_08014668((gUnknown_02028DD5 >> 3) + 1, 0xb, gUnknown_08499578,
                     gUnknown_085D583C[gUnknown_02028DD6].unk0e, 0x8000, 0x100);
        break;
    }

    sub_0802465C();
    sub_0803B4DC(0x65);
}
