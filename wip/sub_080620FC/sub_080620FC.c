#include "global.h"

struct Unk620FCRec
{
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
};

void sub_080620FC(int a1, int a2)
{
    int x;
    int y;
    int n;
    int k;
    int i;
    int j;
    u8 *p;
    u8 *rows;
    u8 *cells;
    int t;
    int off;

    n = 0;
    k = 0;
    sub_080581A4(gUnknown_08499590 + 0x3262, 0);
    sub_0801F92C(gUnknown_08499590 + 0x2852);
    sub_08062330();

    while ((u8)sub_080623C4(&x, &y)) {
        gUnknown_030013EC(x, y, a2, 0x78, 0);
        n = gUnknown_02029ED8[k + a1 * 0x20 + gUnknown_030033EC * 0xc00];
        for (j = 0; j < *(u16 *)(gUnknown_08499590 + 2); j++) {
            for (i = 0; i < *(u16 *)gUnknown_08499590; i++) {
                if ((s8)gUnknown_03003340[j][i] >= 0) {
                    p = gUnknown_08499590;
                    t = j * 2;
                    rows = p + 0x417a;
                    off = *(u16 *)(rows + t) + i;
                    cells = p + 0x1432;
                    if (gUnknown_085767D5[cells[off] & 0x1f] != 0) {
                        cells = p + 0x3262;
                        if (cells[off] == 0) {
                            ((struct Unk620FCRec *)&gUnknown_02029ED8[n * 8
                                + a1 * 0x3e0
                                + gUnknown_030033EC * 0xc00])->x = i;
                            ((struct Unk620FCRec *)&gUnknown_02029ED8[n * 8
                                + a1 * 0x3e0
                                + gUnknown_030033EC * 0xc00])->y = j;
                            p = gUnknown_08499590;
                            rows = p + 0x417a;
                            off = *(u16 *)(rows + t) + i;
                            *(u8 **)&gUnknown_02029F3C[n * 8 + a1 * 0x3e0
                                + gUnknown_030033EC * 0xc00]
                                = &p[off + 0x193a];
                            cells = p + 0x3262;
                            cells[*(u16 *)(rows + t) + i] = 0xff;
                            n++;
                            if (n > 0x7a)
                                goto done;
                        }
                    }
                }
            }
        }
    done:
        ((struct Unk620FCRec *)&gUnknown_02029ED8[n * 8 + a1 * 0x3e0
            + gUnknown_030033EC * 0xc00])->x = 0xfe;
        k++;
        if (k > 0x1e)
            break;
        gUnknown_02029ED8[k + a1 * 0x20 + gUnknown_030033EC * 0xc00] = n + 1;
    }

    ((struct Unk620FCRec *)&gUnknown_02029ED8[n * 8 + a1 * 0x3e0
        + gUnknown_030033EC * 0xc00])->x = 0xff;
    gUnknown_02029ED8[k + a1 * 0x20 + gUnknown_030033EC * 0xc00] = -1;
}



