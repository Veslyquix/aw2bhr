#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08008E3C.
 * sub_08008E3C @ 0x08008E3C, sub_08008F6C @ 0x08008F6C
 */

/* MATCHED in wave 67 (304/304). The struct Map rowOffset member index expands
 * y * 2 before the rowOffset base is formed, while the separate rows pointer
 * preserves the later reuse. */

void sub_08008E3C(int x, int y)
{
    struct Map *p;
    u16 *rows;
    u8 *tiles;
    int row;
    int off;
    int v;
    int n;

    if (sub_08008CB8(x, y))
        return;

    p = gMap;
    row = p->rowOffset[y];
    rows = p->rowOffset;
    off = (row + x) * 2;
    tiles = (u8 *)p->tile;
    v = *(u16 *)(tiles + off);

    if (v == 0x13)
    {
        if (y > 0)
        {
            n = y - 1;
            off = (rows[n] + x) * 2;

            if (*(u16 *)(tiles + off) == 0x13)
            {
                sub_08001158(x, y, 0x16);
                sub_08001158(x, n, 0x16);
            }
        }

        if (y < gMap->height - 1)
        {
            struct Map *q;
            u8 *qrows;
            u8 *qtiles;
            int qt;
            int qoff;

            n = y + 1;
            q = gMap;
            qt = n * 2;
            qrows = (u8 *)q->rowOffset;
            qoff = (*(u16 *)(qrows + qt) + x) * 2;
            qtiles = (u8 *)q->tile;

            if (*(u16 *)(qtiles + qoff) == 0x13)
            {
                sub_08001158(x, y, 0x16);
                sub_08001158(x, n, 0x16);
            }
        }
    }
    else if (v == 0x16)
    {
        if (x > 0)
        {
            int m = row - 1;

            off = (m + x) * 2;

            if (*(u16 *)(tiles + off) == 0x16)
            {
                sub_08001158(x, y, 0x13);
                sub_08001158(x - 1, y, 0x13);
            }
        }

        if (x < gMap->width - 1)
        {
            struct Map *q;
            u8 *qrows;
            u8 *qtiles;
            int qoff;

            q = gMap;
            qrows = (u8 *)q->rowOffset;
            qoff = (*(u16 *)(qrows + y * 2) + (x + 1)) * 2;
            qtiles = (u8 *)q->tile;

            if (*(u16 *)(qtiles + qoff) == 0x16)
            {
                sub_08001158(x, y, 0x13);
                sub_08001158(x + 1, y, 0x13);
            }
        }
    }
}

/* MATCHED, wave 66. The typed gMap spelling is byte-exact here as long as the
 * rowOffset/terrain byte-pointer locals stay scoped per use. */

void MakeBridge(int x, int y)
{
    struct Map *p;
    u8 *rows;
    u8 *cells;
    int t;
    int idx;
    int cell;

    p = gMap;
    t = y * 2;
    rows = (u8 *)p->rowOffset;
    idx = *(u16 *)(rows + t) + x;
    cells = p->terrain;
    cell = *(cells + idx);

    if (cell == 7 || cell == 0xD || cell == 0x13)
    {
        switch (sub_08008D14(x, y))
        {
        case 1:
        case 8:
        {
            switch (sub_08008CB8(x, y))
            {
            case 2:
            case 4:
            case 6:
                goto tile14;
            }
        }
        case 9:
            sub_0800C608(x, y);
            if (cell == 0xD)
                sub_08007CA0(x, y);
            sub_080011F4(x, y, 0xC);
            sub_08001158(x, y, 0x36);
            sub_08007F9C(x, y);
            break;

        case 2:
        case 4:
        {
            switch (sub_08008CB8(x, y))
            {
            case 1:
            case 8:
            case 9:
                break;
            default:
                goto tile14;
            }
        }
            sub_0800C608(x, y);
            if (cell == 0xD)
                sub_08007CA0(x, y);
            sub_080011F4(x, y, 0xC);
            sub_08001158(x, y, 0x36);
            sub_08007F9C(x, y);
            break;

        case 11:
        case 13:
            sub_0800C608(x, y);
            if (cell == 0xD)
                sub_08007CA0(x, y);
            sub_080011F4(x, y, 0xC);
            sub_08001158(x, y, 0x36);
            sub_08007F9C(x, y);
            break;

        case 6:
        case 7:
        case 14:
        tile14:
            sub_0800C608(x, y);
            if (cell == 0xD)
                sub_08007CA0(x, y);
            sub_080011F4(x, y, 0xC);
            sub_08001158(x, y, 0x14);
            sub_08007F9C(x, y);
            break;

        case 3:
        case 5:
        case 10:
        case 12:
            break;

        default:
        {
            int k;

            if (cell == 0xD)
            {
                sub_0800C608(x, y);
                sub_08007CA0(x, y);
            }

            k = sub_08008D70(x, y);

            if (k > 0)
            {
                sub_0800C608(x, y);
                sub_080011F4(x, y, 0xC);
                sub_08001158(x, y, k);
            }
            break;
        }
        }
    }
    else
    {
        int v;
        int k;

        if (!sub_08009B38(x, y))
            return;

        v = 0;

        switch (sub_08008CB8(x, y))
        {
        case 0:
        case 8:
        case 9:
            k = sub_08008D14(x, y);
            if (k & 6)
                goto set13;

            if (x > 0)
            {
                struct Map *q;
                u8 *qrows;
                u8 *qcells;
                int qt;
                int qidx;

                q = gMap;
                qt = y * 2;
                qrows = (u8 *)q->rowOffset;
                qidx = *(u16 *)(qrows + qt) + (x - 1);
                qcells = q->terrain;

                if (*(qcells + qidx) == 0xC)
                    goto set13;
            }

            if (x < gMap->width - 1)
            {
                struct Map *q;
                u8 *qrows;
                u8 *qcells;
                int qt;
                int qidx;

                q = gMap;
                qt = y * 2;
                qrows = (u8 *)q->rowOffset;
                qidx = *(u16 *)(qrows + qt) + (x + 1);
                qcells = q->terrain;

                if (*(qcells + qidx) == 0xC)
                    goto set13;
            }
            break;

        set13:
            v = 0x13;
            break;

        case 2:
        case 4:
        case 6:
            k = sub_08008D14(x, y);
            if (k & 9)
            {
                v = 0x16;
                break;
            }

            if (y > 0)
            {
                struct Map *q;
                u8 *qrows;
                u8 *qcells;
                int n;
                int qt;
                int qidx;

                q = gMap;
                n = y - 1;
                qt = n * 2;
                qrows = (u8 *)q->rowOffset;
                qidx = *(u16 *)(qrows + qt) + x;
                qcells = q->terrain;

                if (*(qcells + qidx) == 0xC)
                    goto set16;
            }

            if (y < gMap->height - 1)
            {
                struct Map *q;
                u8 *qrows;
                u8 *qcells;
                int n;
                int qt;
                int qidx;

                q = gMap;
                n = y + 1;
                qt = n * 2;
                qrows = (u8 *)q->rowOffset;
                qidx = *(u16 *)(qrows + qt) + x;
                qcells = q->terrain;

                if (*(qcells + qidx) == 0xC)
                    goto set16;
            }
            break;

        set16:
            v = 0x16;
            break;
        }

        if (v > 0)
        {
            sub_0800C608(x, y);
            sub_080011F4(x, y, 0xC);
            sub_08001158(x, y, v);
        }
    }
}

asm(".global sub_08008F6C\n.thumb_set sub_08008F6C, MakeBridge\n");

/* MATCHED, wave 66. The missing 12 bytes were the two inner predicates, not
 * duplicated repaint bodies. Each predicate is a three-case switch: agbcc's
 * balanced case tree emits six more bytes than the equivalent if expression,
 * reproducing both ROM compare trees while leaving the exact suffix intact.
 */
