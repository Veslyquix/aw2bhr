#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800CB30.
 * sub_0800CB30 @ 0x0800CB30
 */

/* Wave 56 (W56-J).
 *
 * The four outer arms are one block of source repeated four times, differing
 * only in which 0x0848_88xx row table they read; every one of them ends with
 * the same `if (v >= 0) plane[...] = v;` and agbcc's cross-jumping merges all
 * four tails, plus the twenty case bodies, into the single shared block at
 * _0800CE7A / _0800CE98. Do not try to spell that sharing -- write the four
 * arms out and let jump.c fold them.
 *
 * Two spellings that are NOT interchangeable here:
 *   - the +0x10 row is reached as `(base + 0x10)[result]`, NOT
 *     `base[result + 0x10]`. The second hoists `result + 0x10` into one pseudo
 *     that CSE then shares across all four reads; the ROM re-forms
 *     `base + 0x10` per read and adds the index to it.
 *   - the flag word is a LOCAL, not the a2 parameter written back. The ROM
 *     moves a2 into a scratch and re-reads a1 out of sl to test it, which only
 *     happens when a2 and the returned value are different objects.
 *
 * The row byte is read TWICE inside each arm with a `strb` into the map's
 * +0x1432 terrain plane in between; that reload is why the tables must not be
 * `const` (see include/unknown-globals.h).
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
/* Each 0x0848_88xx symbol is TWO 0x10-byte rows (see include/unknown-globals.h).
 * Row 1 must be reached through a COMPONENT_REF, not as `base[k + 0x10]` and
 * not as `(base + 0x10)[k]`: the first hoists `k + 0x10`, the second folds the
 * whole address into one pool word, and only the member reference pins
 * `base + 0x10` as its own value the way the ROM does. */
struct Unk88Rows
{
    /* 0x00 */ u8 row0[0x10];
    /* 0x10 */ u8 row1[0x10];
};
#define ROW1(sym) (((struct Unk88Rows *)(sym))->row1)

int sub_0800CB30(int a1, int a2)
{
    int x, y;
    int c;
    int v;
    int result;

    if (a1 == 0)
    {
        result = (sub_0800C958(0x28) >= 0) ? 8 : 0;
        if (sub_0800C958(0x48) >= 0)
            result |= 4;
        if (sub_0800C958(0x68) >= 0)
            result |= 2;
        if (sub_0800C958(0x88) >= 0)
            result |= 1;
        gUnknown_03003FC0.unk33[1] = gUnknown_08488948[(ROW1(gUnknown_084888A0)[result] >> 1) - 1];
        gUnknown_03003FC0.unk33[2] = gUnknown_08488948[(ROW1(gUnknown_084888C0)[result] >> 1) - 1];
        gUnknown_03003FC0.unk33[3] = gUnknown_08488948[(ROW1(gUnknown_084888E0)[result] >> 1) - 1];
        gUnknown_03003FC0.unk33[4] = gUnknown_08488948[(ROW1(gUnknown_08488900)[result] >> 1) - 1];
    }
    else
    {
        result = a2;
        gUnknown_08499598[1].unk1a = 1;
        gUnknown_08499598[2].unk1a = 2;
        gUnknown_08499598[3].unk1a = 3;
        gUnknown_08499598[4].unk1a = 4;
    }

    for (y = 0; y < MAP->height; y++)
    {
        for (x = 0; x < MAP->width; x++)
        {
            c = MAP->cell[MAP->rowOffset[y] + x];
            switch (c & 0xE0)
            {
            case 0x20:
                c = (c & 0x1F) | (gUnknown_084888A0[result + a1 * 0x10] << 4);
                MAP->cell[MAP->rowOffset[y] + x] = c;
                switch (c & 0x1F)
                {
                case 8:
                    v = gUnknown_08488920[(gUnknown_084888A0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 6:
                    v = gUnknown_08488928[(gUnknown_084888A0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 14:
                    v = gUnknown_08488930[(gUnknown_084888A0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 10:
                    v = gUnknown_08488938[(gUnknown_084888A0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 11:
                    v = gUnknown_08488940[(gUnknown_084888A0[result + a1 * 0x10] - 2) >> 1];
                    break;
                default:
                    v = -1;
                    break;
                }
                if (v >= 0)
                    MAP->plane[MAP->rowOffset[y] + x] = v;
                break;

            case 0x40:
                c = (c & 0x1F) | (gUnknown_084888C0[result + a1 * 0x10] << 4);
                MAP->cell[MAP->rowOffset[y] + x] = c;
                switch (c & 0x1F)
                {
                case 8:
                    v = gUnknown_08488920[(gUnknown_084888C0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 6:
                    v = gUnknown_08488928[(gUnknown_084888C0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 14:
                    v = gUnknown_08488930[(gUnknown_084888C0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 10:
                    v = gUnknown_08488938[(gUnknown_084888C0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 11:
                    v = gUnknown_08488940[(gUnknown_084888C0[result + a1 * 0x10] - 2) >> 1];
                    break;
                default:
                    v = -1;
                    break;
                }
                if (v >= 0)
                    MAP->plane[MAP->rowOffset[y] + x] = v;
                break;

            case 0x60:
                c = (c & 0x1F) | (gUnknown_084888E0[result + a1 * 0x10] << 4);
                MAP->cell[MAP->rowOffset[y] + x] = c;
                switch (c & 0x1F)
                {
                case 8:
                    v = gUnknown_08488920[(gUnknown_084888E0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 6:
                    v = gUnknown_08488928[(gUnknown_084888E0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 14:
                    v = gUnknown_08488930[(gUnknown_084888E0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 10:
                    v = gUnknown_08488938[(gUnknown_084888E0[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 11:
                    v = gUnknown_08488940[(gUnknown_084888E0[result + a1 * 0x10] - 2) >> 1];
                    break;
                default:
                    v = -1;
                    break;
                }
                if (v >= 0)
                    MAP->plane[MAP->rowOffset[y] + x] = v;
                break;

            case 0x80:
                c = (c & 0x1F) | (gUnknown_08488900[result + a1 * 0x10] << 4);
                MAP->cell[MAP->rowOffset[y] + x] = c;
                switch (c & 0x1F)
                {
                case 8:
                    v = gUnknown_08488920[(gUnknown_08488900[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 6:
                    v = gUnknown_08488928[(gUnknown_08488900[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 14:
                    v = gUnknown_08488930[(gUnknown_08488900[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 10:
                    v = gUnknown_08488938[(gUnknown_08488900[result + a1 * 0x10] - 2) >> 1];
                    break;
                case 11:
                    v = gUnknown_08488940[(gUnknown_08488900[result + a1 * 0x10] - 2) >> 1];
                    break;
                default:
                    v = -1;
                    break;
                }
                if (v >= 0)
                    MAP->plane[MAP->rowOffset[y] + x] = v;
                break;

            }
        }
    }

    return result;
}
