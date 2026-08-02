#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080032EC.
 * sub_080032EC @ 0x080032EC
 */

#include "hardware.h"

/* Wave 37 (W37-E). Matched on the third attempt. PROMOTION NEEDS THE POOL WORD:
 *     "rodata": ["0x0808D770"]
 * 0x0808D770 holds &gUnknown_0200B0B0 (dereferenced in baserom.gba) -- an
 * -fforce-addr address constant, not a global. Its neighbours 0x0808D760 /
 * 0x0808D768 / 0x0808D76C ARE real ROM tables (see include/unknown-globals.h);
 * do not treat the whole 0x0808D6DC..0x0808D8A8 run as one kind of thing.
 *
 * THE LAST 4 BYTES WERE `c3`. The ROM materialises 0x300 (`movs #192;
 * lsls #2`) BEFORE the first argument of the sub_0801F34C call. Written inline
 * as `(... & 0xFF) | 0x300` agbcc emits it at the point of use, three
 * instructions later, and the y parameter then lands in r3 instead of r4 --
 * size-exact, 5 bytes wrong, and decomp-permuter cannot reach it. Binding the
 * constant to its own local hoists it. The local must be NEW: reusing `s`
 * (already live inside the switch) moved 0x300 correctly but re-coloured the
 * whole switch. */

void sub_080032EC(int a1, int a2, int a3)
{
    u16 kind[4];
    s8 xo[4];
    s8 yo[4];
    int o1;
    int o2;
    int r;
    int s;
    int c3;

    sub_0808B6E8(kind, gUnknown_0808D760, 8);
    sub_0808B6E8(xo, gUnknown_0808D768, 4);
    sub_0808B6E8(yo, gUnknown_0808D76C, 4);

    switch (gUnknown_0200B0B0->unk76[a1])
    {
    case 0:
        if (sub_0800C6E8(kind[a1], &o1, &o2) != 0)
        {
            gUnknown_0200B0B0->unk76[a1] = 0xA;
            gUnknown_0200B0B0->unk8a[a1] = 5;
            gUnknown_0200B0B0->unk92[a1] = 0;
        }
        break;
    case 0xA:
        r = gUnknown_0200B0B0->unk92[a1] - 0x20;
        if (r < 0)
            r = gUnknown_0200B0B0->unk92[a1] + 0x148;
        gUnknown_0200B0B0->unk92[a1] = r;
        s = gUnknown_0200B0B0->unk8a[a1] + 0xA;
        if (s > 0xFF)
        {
            s = 0x100;
            gUnknown_0200B0B0->unk76[a1] = 0x14;
            gUnknown_0200B0B0->unk92[a1] = 0;
        }
        gUnknown_0200B0B0->unk8a[a1] = s;
        break;
    case 0x14:
        if (sub_0800C6E8(kind[a1], &o1, &o2) == 0)
        {
            gUnknown_0200B0B0->unk76[a1] = 0x1E;
            gUnknown_0200B0B0->unk92[a1] = 0;
            gUnknown_0200B0B0->unk8a[a1] = 0x100;
        }
        break;
    case 0x1E:
        r = gUnknown_0200B0B0->unk92[a1] - 0x20;
        if (r < 0)
            r = gUnknown_0200B0B0->unk92[a1] + 0x148;
        gUnknown_0200B0B0->unk92[a1] = r;
        s = gUnknown_0200B0B0->unk8a[a1] - 0x20;
        if (s <= 0)
        {
            s = 1;
            gUnknown_0200B0B0->unk76[a1] = 0;
        }
        gUnknown_0200B0B0->unk8a[a1] = s;
        break;
    }

    if (gUnknown_0200B0B0->unk76[a1] != 0)
    {
        SetObjAffine(a1 + 1,
            Div(COS_Q12(gUnknown_0200B0B0->unk92[a1]) << 4,
                gUnknown_0200B0B0->unk8a[a1] != 0 ? gUnknown_0200B0B0->unk8a[a1] : 2),
            Div(-SIN_Q12(gUnknown_0200B0B0->unk92[a1]) << 4,
                gUnknown_0200B0B0->unk8a[a1] != 0 ? gUnknown_0200B0B0->unk8a[a1] : 2),
            Div(SIN_Q12(gUnknown_0200B0B0->unk92[a1]) << 4,
                gUnknown_0200B0B0->unk8a[a1] != 0 ? gUnknown_0200B0B0->unk8a[a1] : 2),
            Div(COS_Q12(gUnknown_0200B0B0->unk92[a1]) << 4,
                gUnknown_0200B0B0->unk8a[a1] != 0 ? gUnknown_0200B0B0->unk8a[a1] : 2));

        c3 = 0x300;
        sub_0801F34C(a1 + 0x3E,
            ((a2 + xo[a1] - 7) & 0x1FF) | ((a1 + 1) << 9),
            ((a3 + yo[a1] - 6) & 0xFF) | c3,
            0, 0);
    }
}
