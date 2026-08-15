#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08008E3C.
 * sub_08008E3C @ 0x08008E3C, sub_08008F6C @ 0x08008F6C
 */

struct Map08008E3C
{
    u8 filler[0x417A];
    u16 rowOffset[1];
};

/* MATCHED in wave 67 (304/304).  The local aggregate view is load-bearing:
 * member indexing expands y * 2 before the +0x417A base is formed, while the
 * separate rows pointer preserves the later reuse.  Promotion also needs the
 * ROM pool word at 0x0808D80C. */

void sub_08008E3C(int x, int y)
{
    u8 *p;
    u16 *rows;
    u8 *tiles;
    int row;
    int off;
    int v;
    int n;

    if (sub_08008CB8(x, y))
        return;

    p = gUnknown_08499590;
    row = ((struct Map08008E3C *)p)->rowOffset[y];
    rows = (u16 *)(p + 0x417A);
    off = (row + x) * 2;
    tiles = p + 0xA22;
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

        if (y < *(u16 *)(gUnknown_08499590 + 2) - 1)
        {
            u8 *q;
            u8 *qrows;
            u8 *qtiles;
            int qt;
            int qoff;

            n = y + 1;
            q = gUnknown_08499590;
            qt = n * 2;
            qrows = q + 0x417A;
            qoff = (*(u16 *)(qrows + qt) + x) * 2;
            qtiles = q + 0xA22;

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

        if (x < *(u16 *)gUnknown_08499590 - 1)
        {
            u8 *q;
            u8 *qrows;
            u8 *qtiles;
            int qoff;

            q = gUnknown_08499590;
            qrows = q + 0x417A;
            qoff = (*(u16 *)(qrows + y * 2) + (x + 1)) * 2;
            qtiles = q + 0xA22;

            if (*(u16 *)(qtiles + qoff) == 0x16)
            {
                sub_08001158(x, y, 0x13);
                sub_08001158(x + 1, y, 0x13);
            }
        }
    }
}

/* MATCHED, wave 66.  The local struct view is load-bearing: direct member
 * indexing expands y * 2 before materialising the +0x417A member base, while
 * the following flat `rows` binding lets CSE retain that base in ip.  The old
 * flat `rows[y]` spelling emitted the same operations in the opposite order
 * and differed by nine bytes.  Promotion needs the pool word at 0x0808D80C. */

void sub_08008F6C(int x, int y)
{
    u8 *p;
    u8 *rows;
    u8 *cells;
    int t;
    int idx;
    int cell;

    p = gUnknown_08499590;
    t = y * 2;
    rows = p + 0x417A;
    idx = *(u16 *)(rows + t) + x;
    cells = p + 0x1432;
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
                u8 *q;
                u8 *qrows;
                u8 *qcells;
                int qt;
                int qidx;

                q = gUnknown_08499590;
                qt = y * 2;
                qrows = q + 0x417A;
                qidx = *(u16 *)(qrows + qt) + (x - 1);
                qcells = q + 0x1432;

                if (*(qcells + qidx) == 0xC)
                    goto set13;
            }

            if (x < *(u16 *)gUnknown_08499590 - 1)
            {
                u8 *q;
                u8 *qrows;
                u8 *qcells;
                int qt;
                int qidx;

                q = gUnknown_08499590;
                qt = y * 2;
                qrows = q + 0x417A;
                qidx = *(u16 *)(qrows + qt) + (x + 1);
                qcells = q + 0x1432;

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
                u8 *q;
                u8 *qrows;
                u8 *qcells;
                int n;
                int qt;
                int qidx;

                q = gUnknown_08499590;
                n = y - 1;
                qt = n * 2;
                qrows = q + 0x417A;
                qidx = *(u16 *)(qrows + qt) + x;
                qcells = q + 0x1432;

                if (*(qcells + qidx) == 0xC)
                    goto set16;
            }

            if (y < *(u16 *)(gUnknown_08499590 + 2) - 1)
            {
                u8 *q;
                u8 *qrows;
                u8 *qcells;
                int n;
                int qt;
                int qidx;

                q = gUnknown_08499590;
                n = y + 1;
                qt = n * 2;
                qrows = q + 0x417A;
                qidx = *(u16 *)(qrows + qt) + x;
                qcells = q + 0x1432;

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

/* MATCHED, wave 66. The missing 12 bytes were the two inner predicates, not
 * duplicated repaint bodies. Each predicate is a three-case switch: agbcc's
 * balanced case tree emits six more bytes than the equivalent if expression,
 * reproducing both ROM compare trees while leaving the exact suffix intact.
 */
