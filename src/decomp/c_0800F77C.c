#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800F77C.
 * sub_0800F77C @ 0x0800F77C
 */

struct Unk3F44Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 0x0004];
    /* 0x0A22 */ u16 plane[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 cell[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct Unk3F44Map *)gUnknown_08499590)

int sub_0800F77C(int x, int y, int dir)
{
    int i;
    int count;
    int r;
    int nx, ny;

    r = sub_0800F564(x, y, dir);
    count = 0;

    nx = x + gUnknown_0848895C[dir];
    if (nx < 0)
        return 2;
    if (nx >= MAP->width)
        return 2;
    ny = y + gUnknown_08488964[dir];
    if (ny < 0)
        return 2;
    if (ny >= MAP->height)
        return 2;

    if (MAP->plane[MAP->rowOffset[ny] + nx] == 0x162
     || MAP->plane[MAP->rowOffset[ny] + nx] == 0x163)
    {
        if (dir == 0 || dir == 1)
        {
            if (MAP->plane[MAP->rowOffset[ny] + nx] == 0x163)
            {
                if (sub_0800F564(nx, ny, 2) == 2)
                    return 2;
                if (sub_0800F564(x + gUnknown_0848895C[dir], y + gUnknown_08488964[dir], 3) == 2)
                    return 2;
            }
            return 0;
        }
        else if (dir == 2 || dir == 3)
        {
            if (MAP->plane[MAP->rowOffset[ny] + nx] == 0x162)
            {
                if (sub_0800F564(nx, ny, 0) == 2)
                    return 2;
                if (sub_0800F564(x + gUnknown_0848895C[dir], y + gUnknown_08488964[dir], 1) == 2)
                    return 2;
            }
            return 0;
        }
    }

    if (r != 2 && r != 3)
        return 2;

    for (i = 0; i < 4; i++)
    {
        if (gUnknown_0848895C[dir] + gUnknown_0848895C[i] != 0)
        {
            if (sub_0800F564(x + gUnknown_0848895C[dir], y + gUnknown_08488964[dir], i) == 2)
                count++;
        }
    }
    return count;
}
