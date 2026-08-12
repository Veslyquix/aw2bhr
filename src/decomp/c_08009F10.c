#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08009F10.
 * sub_08009F10 @ 0x08009F10
 */

struct MapScreen
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 4];
    /* 0x0A22 */ u16 cells[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 terrain[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct MapScreen *)gUnknown_08499590)

int sub_08009F10(int x, int y)
{
    int a;
    int b;

    a = sub_0800A6AC(x, y);
    if (a < 0)
    {
fail:
        return 0;
    }

    if (a != 0)
    {
        b = sub_0800A95C(x, y);
        if (b != 0)
        {
            if (b <= 0)
                goto fail;
            if ((a & 0xfe00) == 0x4000)
            {
                sub_080011F4(x, y, 2);
                sub_08001158(x, y, b);
            }
            if ((a & 0xfe00) == 0x2000)
            {
                sub_080011F4(x, y, 2);
                sub_08001158(x, y, b);
            }
            if ((a & 0xfe00) == 0)
            {
                sub_080011F4(x, y, 2);
                sub_08001158(x, y, b);
            }
            goto placed;
        }
    }
    else
    {
        if (sub_0800A6AC(x, y) < 0)
            goto fail;
        a = sub_0800A884(x, y);
        if (a == 0)
            goto fail;
        b = sub_0800A95C(x, y);
        if (b != 0)
            a = b;
        if (a <= 0)
            goto fail;
    }

    sub_080011F4(x, y, 2);
    sub_08001158(x, y, a);

placed:
    sub_0800A588(x, y);
    if (sub_08009BF4(x, y))
        sub_0800A098(x, y);

    if (y > 0)
    {
        int ny = y - 1;
        if (sub_0800119C(x, ny, 1))
        {
            sub_08001158(x, ny, 1);
            sub_08007D70(x, ny);
            if (MAP->terrain[MAP->rowOffset[y] + x] == 3)
                sub_0800AF74(x, y);
        }
    }
    if (y < MAP->height - 1)
    {
        int ny = y + 1;
        if (sub_0800119C(x, ny, 1))
            sub_08007F14(x, ny, 1);
    }

    sub_08007F9C(x, y);
    sub_0800EC20(x, y);
    return 1;
}
