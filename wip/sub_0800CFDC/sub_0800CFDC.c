#include "global.h"

/* Complete transcription checkpoint for the 6,384-byte neighbour-pattern
 * driver.  The repeated blocks deliberately bind p/rows/tiles separately:
 * the target reloads gUnknown_08499590 at each pattern region.
 *
 * Configured try_match checkpoint: 6,368 bytes (-16), 14.3% positional
 * identity, first difference +0x23.  The E336 family uses the ROM's sparse
 * switch order, D9 keeps its volatile reload, and D0F4 stages the first cell
 * offset through a statement-local u32.  EAF4, EB5C, and bridge counts are
 * exact. */

struct MapWave68Late
{
    u8 filler[0x417A];
    u16 rowOffset[1];
};

#define CELL_AT(DX, Y) \
    ({ \
        int rowIndex; \
        int rowOff; \
        int cellOff; \
        rowIndex = (Y); \
        rowOff = ((struct MapWave68Late *)p)->rowOffset[rowIndex] + (DX); \
        cellOff = (rowOff + x) * 2; \
        *(u16 *)(tiles + cellOff); \
    })
#define BRIDGE_AT(X, Y) ((u16)(CELL_AT((X), (Y)) - 0x86) <= 1)
#define NEAR_AT(X, Y, K) ((u16)(CELL_AT((X), (Y)) - (K)) <= 1)
#define CELL_DC32(DX, Y) \
    ({ \
        int rowIndex; \
        int rowOff; \
        int cellOff; \
        rowIndex = (Y); \
        rowIndex *= 2; \
        rowOff = *(u16 *)(rows + rowIndex) + (DX); \
        cellOff = (rowOff + x) * 2; \
        *(u16 *)(tiles + cellOff); \
    })
#define BRIDGE_DC32(X, Y) ((u16)(CELL_DC32((X), (Y)) - 0x86) <= 1)
#define NEAR_DC32(X, Y, K) ((u16)(CELL_DC32((X), (Y)) - (K)) <= 1)
#define CELL_ROW(DX, ROW) \
    ({ \
        int rowOff; \
        int cellOff; \
        rowOff = (ROW) + (DX); \
        cellOff = (rowOff + x) * 2; \
        *(u16 *)(tiles + cellOff); \
    })
#define BRIDGE_ROW(DX, ROW) ((u16)(CELL_ROW((DX), (ROW)) - 0x86) <= 1)
#define WIDTH (*(u16 *)p)
#define HEIGHT (*(u16 *)(p + 2))

void sub_0800CFDC(int x, int y)
{
    int a;
    int b;
    int c;
    int drew;

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int ht;
        int off;

        p = gUnknown_08499590;
        ht = y * 2;
        rows = p + 0x417A;
        off = (*(u16 *)(rows + ht) + x) * 2;
        tiles = p + 0xA22;

        if ((u16)(*(u16 *)(tiles + off) - 0x86) > 1)
            return;
    }

    drew = 0;

    if (x > 0)
        a = sub_0800E8CC(x - 1, y);
    else
        a = 0;

    b = sub_0800E8CC(x, y);

    if (x < *(u16 *)gUnknown_08499590 - 1)
        c = sub_0800E8CC(x + 1, y);
    else
        c = 0;

    a &= b;
    b &= c;

    switch (a)
    {
    case 28:
    case 29:
    case 30:
    case 31:
    {
        if (x > 0 && y > 0)
        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int ym1;
            int rowIndex;
            int rowm1;
            u32 first;

            p = gUnknown_08499590;
            ym1 = y - 1;
            rowIndex = ym1 * 2;
            rows = p + 0x417A;
            rowm1 = *(u16 *)(rows + rowIndex);
            first = rowm1 - 1;
            first += x;
            first *= 2;
            tiles = p + 0xA22;
            first += (u32)tiles;
            first = *(u16 *)first;
            if ((u16)(first - 0x86) <= 1
                && BRIDGE_ROW(0, rowm1)
                && BRIDGE_AT(-1, y))
            {
                sub_0800EAF4(x - 1, ym1);
                drew = 1;
            }
        }
        break;
    }

    case 7:
    case 23:
    {
        int n;

        n = sub_0800E9F4(x, y + 1);
        if (n == 1)
        {
            u8 *p;
            u8 *rows;
            u8 *tiles;

            p = gUnknown_08499590;
            rows = p + 0x417A;
            tiles = p + 0xA22;
            if (x < WIDTH - 2 && y < HEIGHT - 2
                && BRIDGE_AT(1, y)
                && BRIDGE_AT(2, y)
                && BRIDGE_AT(2, y + 1)
                && BRIDGE_AT(2, y + 2))
            {
                sub_0800EB5C(x, y);
                drew = 1;
            }
        }
        else if (n == 2)
        {
            u8 *p;
            u8 *rows;
            u8 *tiles;

            p = gUnknown_08499590;
            rows = p + 0x417A;
            tiles = p + 0xA22;
            if (x > 0 && x < WIDTH - 1 && y < HEIGHT - 2
                && BRIDGE_AT(-1, y)
                && BRIDGE_AT(1, y)
                && BRIDGE_AT(1, y + 1)
                && BRIDGE_AT(1, y + 2))
            {
                sub_0800EB5C(x - 1, y);
                drew = 1;
            }
        }
        break;
    }

    case 12:
    case 13:
    {
        u8 *p;
        u8 *rows;
        u8 *tiles;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        if (x > 0 && y > 0
            && BRIDGE_AT(-1, y)
            && BRIDGE_AT(0, y)
            && BRIDGE_AT(-1, y - 1)
            && BRIDGE_AT(0, y - 1))
        {
            sub_0800EAF4(x - 1, y - 1);
            drew = 1;
        }
        break;
    }

    case 6:
    case 22:
    {
        u8 *p;
        u8 *rows;
        u8 *tiles;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        if (x > 0 && y < HEIGHT - 1
            && BRIDGE_AT(0, y)
            && BRIDGE_AT(-1, y)
            && BRIDGE_AT(-1, y + 1)
            && BRIDGE_AT(0, y + 1))
        {
            sub_0800EAF4(x - 1, y);
            drew = 1;
        }
        break;
    }
    }

    if (drew && a == b)
        return;

    /* From this point the target keeps y * 2 live in r8.  Reuse a, whose first
     * switch value is dead here, so the candidate models that non-overlap. */
    a = y * 2;
#define CELL_Y(DX) \
    ({ \
        int rowOff; \
        int cellOff; \
        rowOff = *(u16 *)(rows + a) + (DX); \
        cellOff = (rowOff + x) * 2; \
        *(u16 *)(tiles + cellOff); \
    })
#define BRIDGE_Y(DX) ((u16)(CELL_Y(DX) - 0x86) <= 1)
#define NEAR_Y(DX, K) ((u16)(CELL_Y(DX) - (K)) <= 1)

    switch (b)
    {
    case 28:
    case 29:
    {
        u8 *p;
        u8 *rows;
        u8 *tiles;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        if (x < WIDTH - 2 && y > 1
            && BRIDGE_Y(0)
            && CELL_Y(1) == 0x65
            && CELL_AT(1, y - 1) == 0x45
            && CELL_Y(2) == 0x67
            && BRIDGE_AT(0, y - 1)
            && BRIDGE_AT(0, y - 2))
        {
            sub_0800EB5C(x, y - 2);
        }
        else
        {
            u8 *p;
            u8 *rows;
            u8 *tiles;

            p = gUnknown_08499590;
            rows = p + 0x417A;
            tiles = p + 0xA22;
            if (x < WIDTH - 1 && y > 0
                && BRIDGE_Y(0)
                && BRIDGE_AT(1, y - 1)
                && BRIDGE_AT(0, y - 1)
                && BRIDGE_Y(1))
                sub_0800EAF4(x, y - 1);
        }
        break;
    }

    case 15:
    case 31:
    {
        u8 *p;
        u8 *rows;
        u8 *tiles;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        if (x < WIDTH - 2 && y > 1
            && BRIDGE_Y(0)
            && CELL_AT(2, y - 2) == 0x27
            && CELL_AT(2, y - 1) == 0x47
            && CELL_AT(1, y - 2) == 0x25
            && BRIDGE_AT(0, y - 2)
            && BRIDGE_AT(0, y - 1))
        {
            sub_0800EB5C(x, y - 2);
        }
        else
        {
            u8 *p;
            u8 *rows;
            u8 *tiles;

            p = gUnknown_08499590;
            rows = p + 0x417A;
            tiles = p + 0xA22;
            if (x < WIDTH - 1 && y > 0
                && BRIDGE_Y(0)
                && BRIDGE_AT(0, y - 1)
                && BRIDGE_AT(1, y - 1)
                && BRIDGE_Y(1))
                sub_0800EAF4(x, y - 1);
        }
        break;
    }

    case 30:
    {
        u8 *p;
        u8 *rows;
        u8 *tiles;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        if (x < WIDTH - 1 && y < HEIGHT - 1
            && BRIDGE_Y(0)
            && BRIDGE_Y(1)
            && BRIDGE_AT(0, y + 1)
            && BRIDGE_AT(1, y + 1))
            sub_0800EAF4(x, y);
        break;
    }

    case 7:
    case 23:
    {
        int n;

        n = sub_0800E9F4(x, y + 1);
        if (n == 1)
        {
            u8 *p;
            u8 *rows;
            u8 *tiles;

            p = gUnknown_08499590;
            rows = p + 0x417A;
            tiles = p + 0xA22;
            if (x < WIDTH - 2 && y < HEIGHT - 2
                && BRIDGE_Y(0)
                && BRIDGE_Y(1)
                && BRIDGE_Y(2)
                && BRIDGE_AT(2, y + 1)
                && BRIDGE_AT(2, y + 2))
                sub_0800EB5C(x, y);
        }
        else if (n == 2)
        {
            u8 *p;
            u8 *rows;
            u8 *tiles;

            p = gUnknown_08499590;
            rows = p + 0x417A;
            tiles = p + 0xA22;
            if (x > 0 && x < WIDTH - 1 && y < HEIGHT - 2
                && BRIDGE_Y(0)
                && BRIDGE_Y(-1)
                && BRIDGE_Y(1)
                && BRIDGE_AT(1, y + 1)
                && BRIDGE_AT(1, y + 2))
                sub_0800EB5C(x - 1, y);
        }
        break;
    }

    case 12:
    case 13:
    {
        u8 *p;
        u8 *rows;
        u8 *tiles;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        if (x < WIDTH - 1 && y > 0
            && BRIDGE_Y(0)
            && BRIDGE_Y(1)
            && BRIDGE_AT(1, y - 1)
            && BRIDGE_AT(0, y - 1))
            sub_0800EAF4(x, y - 1);
        break;
    }

    case 6:
    case 22:
    {
        u8 *p;
        u8 *rows;
        u8 *tiles;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        if (x < WIDTH - 1 && y < HEIGHT - 1
            && BRIDGE_Y(0)
            && BRIDGE_Y(1)
            && BRIDGE_AT(1, y + 1)
            && BRIDGE_AT(0, y + 1))
            sub_0800EAF4(x, y);
        break;
    }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;

        if (x > 0)
        {
            p = *(u8 * volatile *)&gUnknown_08499590;
            rows = p + 0x417A;
            tiles = p + 0xA22;
            if (x < WIDTH - 1 && y > 0 && y < HEIGHT - 1)
            {
                if (!BRIDGE_Y(0))
                    return;
                if (BRIDGE_AT(-1, y - 1)
                    && BRIDGE_AT(0, y - 1)
                    && BRIDGE_AT(1, y - 1)
                    && BRIDGE_Y(-1)
                    && BRIDGE_Y(1)
                    && BRIDGE_AT(-1, y + 1)
                    && BRIDGE_AT(0, y + 1)
                    && BRIDGE_AT(1, y + 1))
                    sub_0800EB5C(x - 1, y - 1);
            }
        }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int v;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        if (!BRIDGE_Y(0))
            return;
        v = CELL_AT(0, y - 1);
        if (v == 0x67)
        {
            if (x > 0 && x < WIDTH - 1 && y > 1
                && NEAR_AT(-1, y - 2, 0x24)
                && BRIDGE_AT(1, y - 2)
                && BRIDGE_AT(1, y - 1)
                && BRIDGE_Y(1)
                && BRIDGE_Y(-1))
                sub_0800EB5C(x - 1, y - 2);
        }
        else if ((u16)(v - 0x64) <= 1)
        {
            if (x > 0 && x < WIDTH - 1 && y > 1
                && CELL_AT(1, y - 2) == 0x27
                && BRIDGE_AT(-1, y - 2)
                && BRIDGE_AT(-1, y - 1)
                && BRIDGE_Y(-1)
                && BRIDGE_Y(1))
                sub_0800EB5C(x - 1, y - 2);
        }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int v;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        v = CELL_DC32(1, y - 1);
        if ((u16)(v - 0x24) <= 1)
        {
            if (x < WIDTH - 2 && y > 1 && BRIDGE_Y(0)
                && CELL_Y(2) == 0x67
                && BRIDGE_DC32(0, y - 1)
                && BRIDGE_DC32(0, y - 2)
                && BRIDGE_DC32(1, y - 2)
                && BRIDGE_DC32(2, y - 2))
                sub_0800EB5C(x, y - 2);
        }
        else if (v == 0x67)
        {
            if (x < WIDTH - 2 && y > 1 && BRIDGE_Y(0)
                && NEAR_DC32(0, y - 2, 0x24)
                && BRIDGE_DC32(2, y - 2)
                && BRIDGE_DC32(2, y - 1)
                && BRIDGE_Y(2)
                && BRIDGE_Y(1))
                sub_0800EB5C(x, y - 2);
        }
        else if ((u16)(v - 0x64) <= 1)
        {
            if (x < WIDTH - 2 && y > 1 && BRIDGE_Y(0)
                && CELL_DC32(2, y - 2) == 0x27
                && BRIDGE_DC32(0, y - 2)
                && BRIDGE_DC32(0, y - 1)
                && BRIDGE_Y(1)
                && BRIDGE_Y(2))
                sub_0800EB5C(x, y - 2);
        }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int v;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        v = CELL_Y(1);
        if ((u16)(v - 0x24) <= 1)
        {
            if (x < WIDTH - 2 && y > 0 && y < HEIGHT - 1
                && BRIDGE_Y(0)
                && CELL_AT(2, y + 1) == 0x67
                && BRIDGE_AT(0, y + 1)
                && BRIDGE_AT(0, y - 1)
                && BRIDGE_AT(1, y - 1)
                && BRIDGE_AT(2, y - 1))
                sub_0800EB5C(x, y - 1);
        }
        else if ((u16)(v - 0x64) <= 1)
        {
            if (x < WIDTH - 2 && y > 0 && y < HEIGHT - 1
                && BRIDGE_Y(0)
                && CELL_AT(2, y - 1) == 0x27
                && BRIDGE_AT(0, y - 1)
                && BRIDGE_AT(0, y + 1)
                && BRIDGE_AT(1, y + 1)
                && BRIDGE_AT(2, y + 1))
                sub_0800EB5C(x, y - 1);
        }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int v;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        v = CELL_AT(1, y + 1);
        if (v == 0x27)
        {
            if (x < WIDTH - 2 && y < HEIGHT - 2 && BRIDGE_Y(0)
                && NEAR_AT(0, y + 2, 0x64)
                && BRIDGE_Y(1)
                && BRIDGE_Y(2)
                && BRIDGE_AT(2, y + 1)
                && BRIDGE_AT(2, y + 2))
                sub_0800EB5C(x, y);
        }
        else if ((u16)(v - 0x24) <= 1)
        {
            if (x < WIDTH - 2 && y < HEIGHT - 2 && BRIDGE_Y(0)
                && CELL_AT(2, y + 2) == 0x67
                && BRIDGE_Y(1)
                && BRIDGE_Y(2)
                && BRIDGE_AT(0, y + 1)
                && BRIDGE_AT(0, y + 2))
                sub_0800EB5C(x, y);
        }
        else if ((u16)(v - 0x64) <= 1)
        {
            if (x < WIDTH - 2 && y < HEIGHT - 2 && BRIDGE_Y(0)
                && CELL_Y(2) == 0x27
                && BRIDGE_AT(0, y + 1)
                && BRIDGE_AT(0, y + 2)
                && BRIDGE_AT(1, y + 2)
                && BRIDGE_AT(2, y + 2))
                sub_0800EB5C(x, y);
        }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int v;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        v = CELL_AT(0, y + 1);
        if (v == 0x27)
        {
            if (x > 0 && x < WIDTH - 1 && y < HEIGHT - 2
                && BRIDGE_Y(0)
                && NEAR_AT(-1, y + 2, 0x64)
                && BRIDGE_Y(-1)
                && BRIDGE_Y(1)
                && BRIDGE_AT(1, y + 1)
                && BRIDGE_AT(1, y + 2))
                sub_0800EB5C(x - 1, y);
        }
        else if ((u16)(v - 0x24) <= 1)
        {
            if (x > 0 && x < WIDTH - 1 && y < HEIGHT - 2
                && BRIDGE_Y(0)
                && CELL_AT(1, y + 2) == 0x67
                && BRIDGE_Y(-1)
                && BRIDGE_Y(1)
                && BRIDGE_AT(-1, y + 1)
                && BRIDGE_AT(-1, y + 2))
                sub_0800EB5C(x - 1, y);
        }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int v;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        v = CELL_AT(-1, y + 1);
        switch (v)
        {
        case 0x27:
        {
            if (x > 1 && y < HEIGHT - 2 && BRIDGE_Y(0)
                && NEAR_AT(-2, y + 2, 0x64)
                && BRIDGE_Y(-2)
                && BRIDGE_Y(-1)
                && BRIDGE_AT(0, y + 1)
                && BRIDGE_AT(0, y + 2))
                sub_0800EB5C(x - 2, y);
        }
            break;
        case 0x67:
        {
            if (x > 1 && y < HEIGHT - 2 && BRIDGE_Y(0)
                && NEAR_Y(-2, 0x24)
                && BRIDGE_AT(0, y + 1)
                && BRIDGE_AT(0, y + 2)
                && BRIDGE_AT(-1, y + 2)
                && BRIDGE_AT(-2, y + 2))
                sub_0800EB5C(x - 2, y);
        }            break;
        case 0x24:
        case 0x25:
        {
            if (x > 1 && y < HEIGHT - 2 && BRIDGE_Y(0)
                && CELL_AT(0, y + 2) == 0x67
                && BRIDGE_Y(-2)
                && BRIDGE_Y(-1)
                && BRIDGE_AT(-2, y + 1)
                && BRIDGE_AT(-2, y + 2))
                sub_0800EB5C(x - 2, y);
        }
            break;
        }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int v;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        v = CELL_Y(-1);
        if (v == 0x27)
        {
            if (x > 1 && y > 0 && y < HEIGHT - 1 && BRIDGE_Y(0)
                && NEAR_AT(-2, y + 1, 0x64)
                && BRIDGE_AT(-2, y - 1)
                && BRIDGE_AT(-1, y - 1)
                && BRIDGE_AT(0, y - 1)
                && BRIDGE_AT(0, y + 1))
                sub_0800EB5C(x - 2, y - 1);
        }
        else if (v == 0x67)
        {
            if (x > 1 && y > 0 && y < HEIGHT - 1 && BRIDGE_Y(0)
                && NEAR_AT(-2, y - 1, 0x24)
                && BRIDGE_AT(0, y - 1)
                && BRIDGE_AT(0, y + 1)
                && BRIDGE_AT(-1, y + 1)
                && BRIDGE_AT(-2, y + 1))
                sub_0800EB5C(x - 2, y - 1);
        }
    }

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int v;

        p = gUnknown_08499590;
        rows = p + 0x417A;
        tiles = p + 0xA22;
        v = CELL_AT(-1, y - 1);
        if (v == 0x27)
        {
            if (x > 1 && y > 1 && BRIDGE_Y(0)
                && NEAR_Y(-2, 0x64)
                && BRIDGE_AT(-2, y - 2)
                && BRIDGE_AT(-1, y - 2)
                && BRIDGE_AT(0, y - 2)
                && BRIDGE_AT(0, y - 1))
                sub_0800EB5C(x - 2, y - 2);
        }
        else if (v == 0x67)
        {
            if (x > 1 && y > 1 && BRIDGE_Y(0)
                && NEAR_AT(-2, y - 2, 0x24)
                && BRIDGE_AT(0, y - 2)
                && BRIDGE_AT(0, y - 1)
                && BRIDGE_Y(-1)
                && BRIDGE_Y(-2))
                sub_0800EB5C(x - 2, y - 2);
        }
        else if ((u16)(v - 0x64) <= 1)
        {
            if (x > 1 && y > 1 && BRIDGE_Y(0)
                && CELL_AT(0, y - 2) == 0x27
                && BRIDGE_AT(-2, y - 2)
                && BRIDGE_AT(-2, y - 1)
                && BRIDGE_Y(-2)
                && BRIDGE_Y(-1))
                sub_0800EB5C(x - 2, y - 2);
        }
    }
}

#undef CELL_AT
#undef CELL_DC32
#undef BRIDGE_DC32
#undef NEAR_DC32
#undef BRIDGE_AT
#undef NEAR_AT
#undef CELL_ROW
#undef BRIDGE_ROW
#undef WIDTH
#undef HEIGHT
#undef CELL_Y
#undef BRIDGE_Y
#undef NEAR_Y













