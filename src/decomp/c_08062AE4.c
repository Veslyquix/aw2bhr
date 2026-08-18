#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08062AE4.
 * sub_08062AE4 @ 0x08062AE4
 */

void sub_08062AE4(void)
{
    int i;
    int j;
    int x;
    int y;
    int a;
    int b;
    u8 *p;
    u8 *rows;
    u8 *cells;
    int t;
    int off;
    int v;

    for (j = 0; j <= 9; j++) {
        for (i = 0; i <= 0xb; i++) {
            a = 0;
            b = 0;
            for (y = j * 4; y < j * 4 + 4; y++) {
                for (x = i * 4; x < i * 4 + 4; x++) {
                    p = gUnknown_08499590;
                    t = y * 2;
                    rows = p + 0x417a;
                    off = *(u16 *)(rows + t) + x;
                    cells = p + 0x1432;
                    if (gUnknown_085767D5[cells[off] & 0x1f] != 0) {
                        gUnknown_0202DAD8[j][i].unk2a++;
                        if (sub_08026FD0(gUnknown_03003F2C,
                                         cells[*(u16 *)(rows + t) + x]) == 1)
                            a++;
                        else {
                            p = gUnknown_08499590;
                            rows = p + 0x417a;
                            off = *(u16 *)(rows + t) + x;
                            p += 0x1432;
                            p += off;
                            if ((*p & 0xe0) != 0)
                                b++;
                        }
                    }
                }
            }
            if ((s16)gUnknown_0202DAD8[j][i].unk2a != 0 && a + b != 0) {
                if (a > b)
                    v = a * 100 / (s16)gUnknown_0202DAD8[j][i].unk2a / 6 - 1;
                else
                    v = (b * 100 / (s16)gUnknown_0202DAD8[j][i].unk2a / 6 - 1) | 0x8000;
                gUnknown_0202DAD8[j][i].unk28 = v;
            }
        }
    }
}
