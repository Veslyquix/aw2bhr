#include "global.h"

int sub_08058A2C(int *out)
{
    u8 *const *pp;
    struct Unk08499594 *u;
    s16 *e;
    u8 *p;
    u8 *rows;
    u8 *q;
    u8 *lvl;
    int atk;
    int def;
    int v;
    int t;
    int off;
    int n;
    int d;
    int t2;
    int res;

    v = 1;
    pp = &gUnknown_0816D948;
    u = *(struct Unk08499594 **)*pp;
    e = (s16 *)gUnknown_030013D0;
    atk = e[9];
    if (e[4] == 0)
        atk += 0x32;
    if (atk >= *gUnknown_03004784)
        return -1;

    if (u->unk00 <= 2)
    {
        p = gUnknown_08499590;
        t = u->unk03 * 2;
        rows = p + 0x417A;
        off = *(u16 *)(rows + t) + u->unk02;
        q = p + 0x193A;
        if (*(s8 *)(q + off) != -1)
        {
            lvl = p + 0x12;
            n = lvl[off];
            p += 0x1432;
            if (!sub_08026FD0(n, p[off]))
            {
                p = gUnknown_08499590;
                t = u->unk03 * 2;
                rows = p + 0x417A;
                off = *(u16 *)(rows + t) + u->unk02;
                p += 0x1432;
                n = p[off] & 0x1F;
                if (n == 8)
                    v = 0x20;
                if (n == 0xE || n == 0xA || n == 0xB)
                    v = v * 8;
                t = u->unk05_3;
                if (u->unk04_0 != 0)
                {
                    d = Div(u->unk04_0 - 1, 10);
                    t2 = t + 1;
                    n = t2 + d;
                }
                else
                    n = t;
                v *= n / 5 + 1;
                v *= 100;
                goto merge;
            }
        }
    }
    v = v * 10;
    if (sub_08042D50(gUnknown_030033EC, u->unk00) == 1)
        v = v * 10;
    else
        v = v * 15;

merge:
    def = ((s16 *)*pp)[9];
    if (((s16 *)*pp)[4] == 0 && def <= 0x31)
        def = 0x32;
    if (gUnknown_085D5ABC[u->unk00].unk1b == 2)
    {
        if (u->unk08 != 0)
            v = v * 2;
        else if (u->unk07 == 0)
            v = v >> 3;
    }
    def = def * (v >> 4);
    atk = atk * 6;
    res = def - atk;
    *out = res;
    if (res < 0)
        return -1;
    return 0;
}