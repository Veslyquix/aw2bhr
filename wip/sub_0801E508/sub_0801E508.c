#include "global.h"

/* Wave 71: the old inline arithmetic let agbcc move both trig calls ahead of
 * sub_0801E3B4. The explicit temporaries below now reproduce the ROM's
 * observable helper/libgcc call order in both arms. The residual is allocation:
 * this draft has a 0x20-byte frame versus the ROM's 0x24 and keeps e in r6
 * instead of r9, omitting the ROM's repeated high-to-low copies. */

int sub_0801E508(int a1, int a2, int a3, u16 *a4, int a5)
{
    u16 *p;
    int n;
    int z;
    u16 *dst;
    s16 *e;
    int w;
    int u;
    int v;
    int xr;
    int yr;
    int du;
    int dw;
    float fz;
    float fv;
    float fx;
    float fy;

    n = *a4;
    p = a4 + 1;

    if (a1 + n > 0x80)
        return 1;

    dst = &gUnknown_03002520[a1 * 4];

    if (n == 0)
        return 0;

    e = (s16 *)&gUnknown_0200F720[a5];

    do
    {
        w = *p++;

        v = w & 0xFF;

        if (v & 0x80)
            v |= ~0xFF;

        if (w & 0x100)
            u = (*p++ & 0xC1FF) | gUnknown_0808F0B8[a5];
        else
            u = *p++;

        z = u & 0x1FF;

        if (z & 0x100)
            z |= ~0x1FF;

        if ((w & 0x300) == 0x300)
        {
            z += sub_0801E3B4(u);
            v += sub_0801E3B4(w);

            du = sub_0801E3B4(u);
            fz = (float)z;
            fx = fz * sub_0808B91C((float)e[2]) / (float)e[0];
            fv = (float)v;
            fy = fv * sub_0808B710((float)e[2]) / (float)e[0];
            xr = (int)(fx + fy + (float)a2 - (float)du);

            dw = sub_0801E3B4(w);
            fz = (float)(-z);
            fx = fz * sub_0808B710((float)e[2]) / (float)e[1];
            fy = fv * sub_0808B91C((float)e[2]) / (float)e[1];
            yr = (int)(fx + fy + (float)a3 - (float)dw);
        }
        else
        {
            z += sub_0801E3B4(u) / 2;
            v += sub_0801E3B4(w) / 2;

            du = sub_0801E3B4(u);
            fz = (float)z;
            fx = fz * sub_0808B91C((float)e[2]) / (float)e[0];
            fv = (float)v;
            fy = fv * sub_0808B710((float)e[2]) / (float)e[0];
            xr = (int)(fx + fy + (float)a2 - (float)(du / 2));

            dw = sub_0801E3B4(w);
            fz = (float)(-z);
            fx = fz * sub_0808B710((float)e[2]) / (float)e[1];
            fy = fv * sub_0808B91C((float)e[2]) / (float)e[1];
            yr = (int)(fx + fy + (float)a3 - (float)(dw / 2));
        }

        *dst++ = (w & ~0xFF) | (yr & 0xFF);
        *dst++ = (u & ~0x1FF) | (xr & 0x1FF);
        *dst = *p++;
        dst += 2;
    } while (--n != 0);

    return 0;
}





