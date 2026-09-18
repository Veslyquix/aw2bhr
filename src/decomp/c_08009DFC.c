#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08009DFC.
 * sub_08009DFC @ 0x08009DFC
 */

struct Map08009DFC
{
    u16 width;
    u16 height;
    u8 filler_0004[0x1432 - 4];
    u8 terrain[0x417A - 0x1432];
    u16 rowOffset[1];
};
#define MAP08009DFC ((struct Map08009DFC *)gUnknown_08499590)

/* MATCHED in wave 67 (276/276).  The aggregate map view fixes the address
 * pseudo ordering and the ROM's r2-to-r7 copy.  The x-neighbour indices must
 * stay block-scoped and be adjusted in separate statements.  Promotion also
 * needs the ROM pool word at 0x0808D82C. */

int sub_08009DFC(int x, int y)
{
    int v;
    int n;

    v = MAP08009DFC->terrain[MAP08009DFC->rowOffset[y] + x];
    if (v == 7 || v == 0xD || v == 2)
        return -1;

    n = 0;
    if (y > 0)
    {
        v = MAP08009DFC->terrain[MAP08009DFC->rowOffset[y - 1] + x];
        if (v == 7 || v == 0xD || v == 2)
            n++;
    }

    if (y < MAP08009DFC->height - 1)
    {
        v = MAP08009DFC->terrain[MAP08009DFC->rowOffset[y + 1] + x];
        if (v == 7 || v == 0xD || v == 2)
            n++;
    }

    if (x > 0)
    {
        int idx;

        idx = MAP08009DFC->rowOffset[y];
        idx--;
        idx += x;
        v = MAP08009DFC->terrain[idx];
        if (v == 7 || v == 0xD || v == 2)
            n++;
    }

    if (x < MAP08009DFC->width - 1)
    {
        int idx;

        idx = MAP08009DFC->rowOffset[y];
        idx++;
        idx += x;
        v = MAP08009DFC->terrain[idx];
        if (v == 7 || v == 0xD || v == 2)
            n++;
    }

    if (n == 4 && sub_080094EC(x, y) == 0)
        n = -1;
    return n;
}
