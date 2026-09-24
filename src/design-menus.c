#include "global.h"
#include "hardware.h"
#include "map.h"

#define MAP gMap

void sub_08004724(void)
{
    u16 tiles[4];
    const u8 *p;
    struct Map *m;
    int x;
    int y;
    int c;

    sub_0808B6E8(tiles, gUnknown_0808D7A0, 8);
    c = 7;
    p = gUnknown_08486FC4;

    for (y = 0; y < MAP->height; y++)
        for (x = 0; x < MAP->width; x++)
        {
            m = MAP;
            m->tile[MAP->rowOffset[y] + x] = 0x2A;
            m->terrain[MAP->rowOffset[y] + x] = c;
        }

    for (y = 0; y < MAP->height; y++)
        for (x = 0; x < MAP->width; x++)
            sub_08003F44(x, y, tiles[*p++]);
}

void sub_08004818(void)
{
    sub_0800056C(1);
}

void sub_08004824(void)
{
    sub_0803B4DC(0x66);
    sub_0800056C(1);
}

int sub_08004838(void)
{
    return 0;
}

void sub_0800483C(void)
{
    sub_0801A168();
    sub_0800056C(1);
}

void sub_0800484C(void)
{
    sub_0801A168();
    sub_0800485C();
}

void sub_0800485C(void)
{
    sub_0801A664();
    sub_0803B4DC(0x66);
    gActiveMap->mode = 3;
    sub_08004C5C();
}

void sub_0800487C(void)
{
    struct Unk03001470 * p;

    p = &gUnknown_03001470[gUnknown_03001FBC];

    if (sub_0808B694(&p->unk1e, gActiveMap->designName))
        gActiveMap->flags |= 0x1000;

    sub_08023348();
    sub_0803662C();
    sub_08024268();
    sub_08024830();
    sub_08002DEC();
}

void sub_080048D4(void)
{
    struct Unk03001470 *p;
    u8 *d;
    u8 *q;
    int i;

    sub_08011B18();
    p = &gUnknown_03001470[gUnknown_03001FBC];
    i = 0;
    d = (u8 *)&p->unk1e;

    do
    {
        d[i] = gActiveMap->designName[i];
        q = gActiveMap->designName;
        if (q[i] == 0)
            break;
        i++;
    } while (i <= 0x12);

    sub_0804B10C((int)q, 8);
}

void sub_0800492C(void)
{
    sub_0803B524(0xd8);
    sub_0800056C(1);
    gActiveMap->designName[0x12] = 0;
}

void sub_0800494C(void)
{
    sub_0800056C(4);
}

void sub_08004958(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_0848721C, 0);
}

void sub_08004970(void)
{
    sub_08002F1C();

    if ((gpKeySt->pressed & 7) != 0)
    {
        sub_08012BC8(gUnknown_08499580, 9, 2, 0xB, 0x11, 0x360);
        sub_08013B0C();
        sub_08002E5C();
        sub_08002E3C();
        sub_08015C30(gUnknown_03001FBC);

        if ((gpKeySt->pressed & 2) == 0)
            gUnknown_03002F1C = 1;
    }
}

void sub_080049DC(void)
{
    sub_08002FE4();
}

void sub_080049E8(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_0800056C(6);
    sub_080152EC(gUnknown_084872B4, 0);
    gActiveMap->menuCursorX = 0x57;
    gActiveMap->menuCursorY = 0x10;
}

void sub_08004A20(void)
{
    sub_0801A168();
    sub_0800485C();
}

void sub_08004A30(int a)
{
    sub_0801A168();
    sub_08003C48(a);
    sub_08002E3C();
    sub_08024268();
    gActiveMap->flags |= 0x1000;
}

void sub_08004A60(void)
{
    sub_08004A30(7);
}

void sub_08004A6C(void)
{
    sub_08004A30(1);
}

void sub_08004A78(void)
{
    sub_08004A30(3);
}

void sub_08004A84(void)
{
    sub_08004A30(4);
}

void sub_08004A90(void)
{
    sub_08004A30(-1);
}

void sub_08004AA0(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_084873BC, 0);
    sub_08000654();
}

void sub_08004ABC(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_08487404, 0);
    sub_08000654();
}

void sub_08004AD8(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_0848744C, 0);
    sub_08000654();
}

void sub_08004AF4(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_08487494, 0);
    sub_08000654();
}

void sub_08004B10(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_084874DC, 0);
    sub_08000654();
}

void sub_08004B2C(void)
{
    sub_080193B0(gUnknown_08487754);
}

void sub_08004B3C(void)
{
    sub_080193B0(gUnknown_084877F4);
}

void sub_08004B4C(void)
{
    sub_080193B0(gUnknown_08487894);
}

void sub_08004B5C(void)
{
    sub_080193B0(gUnknown_08487934);
}

void sub_08004B6C(void)
{
    sub_080193B0(gUnknown_084879D4);
}

void sub_08004B7C(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_0801B780(0x70);
    sub_0801A148(gUnknown_084872FC, 2, 2, 0);
    sub_0800056C(7);
    sub_08002DEC();
    gActiveMap->menuCursorX = 0x15;
    gActiveMap->menuCursorY = 0x10;
}

void sub_08004BC0(void)
{
    gActiveMap->flags |= 0x4000;
}

void sub_08004BD8(void)
{
    sub_0801A168();
    sub_0800056C(9);
    sub_080193B0((gActiveMap->flags & 0x1000) ? gUnknown_08487B64
                                                     : gUnknown_08487AC4);
}

void sub_08004C10(void)
{
    sub_080037AC();
    gActiveMap->state = 2;
    gActiveMap->menuCursorX = 0x15;
    gActiveMap->menuCursorY = 0x18;
}

void sub_08004C34(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_08024268();
    sub_0801A148(gUnknown_08487C04, 2, 3, 0);
    sub_08004C10();
}

void sub_08004C5C(void)
{
    gActiveMap->stateChanged = 0;
    gActiveMap->state = 1;
    sub_08003704();
    gActiveMap->menuCursorX = 0x15;
    gActiveMap->menuCursorY = 0x10;
    sub_0801B780(0x70);
    sub_08022AD0(0x10, 0x10);
    sub_08001D9C();
    sub_08003948();
}

void sub_08004CA0(void)
{
    int x;

    if (gActiveMap->stateChanged != 0)
    {
        sub_08004C5C();
        sub_08024268();
        sub_0801A104(gUnknown_08487C84, 2, 2, 0);
    }

    switch (gActiveMap->state)
    {
    case 1:
        sub_080036A4();
        break;
    case 2:
        sub_0800376C();
        break;
    case 3:
        x = 1;
        break;
    case 4:
        x = 2;
        break;
    case 5:
        x = 3;
        break;
    case 6:
        x = 4;
        break;
    case 7:
        x = 5;
        break;
    }
}

void sub_08004D10(void)
{
    sub_08001D9C();
    sub_08003040();
    sub_080193B0(gUnknown_08487D44);
}

void sub_08004D28(void)
{
    switch ((s8)gActiveMap->designSlot)
    {
    case 0:
        sub_080055B8(0, 0, 0);
        break;
    case 1:
        sub_08005634(0, 0, 0);
        break;
    case 2:
        sub_080056B0(0, 0, 0);
        break;
    }
}

void sub_08004D74(int a, int b)
{
    sub_08004DD4(a, b, gTextTable[0x9fa], 0);
}
