#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002510.
 * sub_08002510 @ 0x08002510
 */

/* Wave 37 (W37-E). Matched first attempt. PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D714"]
 * 0x0808D714 holds &gUnknown_0200B0B0 (dereferenced in baserom.gba), so this is
 * an -fforce-addr address constant and the honest `gUnknown_0200B0B0` spelling
 * is what produces the ROM's `ldr rN,=<pool>; ldr rM,[rN]; ldr rP,[rM]` triple.
 * Do not invent a `gUnknown_0808D714` global for it.
 *
 * This is sub_080030BC's state machine (src/decomp/c_080030BC.c) run on a
 * SINGLE lane: unk5a / unk5c here are unk72[i] / unk82[i] there, with the same
 * 0 -> 0xA -> 0x14 -> 0x1E -> 0x32 -> 0x3C -> 0x46 -> 0x50 ladder split across
 * two switches and the same `v += (K - v) >> 3` easing. Reading that exemplar
 * before this assembly is what made it a one-attempt match.
 *
 * a1 is declared and never read -- exactly like sub_080030BC's a2/a3.
 * 0xFD80 is unsigned because the ROM's pool word is `.4byte 0x0000FD80`, while
 * -928 / -480 are full negative ints (`0xFFFFFC60` / `0xFFFFFE20`). */

void sub_08002510(int a1, int a2)
{
    int v;

    v = a2 & 0xFF;

    switch (gUnknown_0200B0B0->unk5a)
    {
    case 0:
        if (sub_0800C9E8() == 0)
            return;
        gUnknown_0200B0B0->unk5a = gUnknown_0200B0B0->unk3e != 0 ? 0xA : 0x32;
        gUnknown_0200B0B0->unk5c = 0x1180;
        break;
    case 0xA:
        gUnknown_0200B0B0->unk5c += (0xB40 - gUnknown_0200B0B0->unk5c) >> 3;
        if (gUnknown_0200B0B0->unk5c <= 0xD60)
        {
            gUnknown_0200B0B0->unk5c = 0xD60;
            gUnknown_0200B0B0->unk5a = 0x14;
        }
        break;
    case 0x14:
        if (sub_0800C9E8() == 0 || gUnknown_0200B0B0->unk3e == 0
            || gUnknown_0200B0B0->unk04 != 1)
            gUnknown_0200B0B0->unk5a = 0x1E;
        break;
    case 0x1E:
        gUnknown_0200B0B0->unk5c += (0x12A0 - gUnknown_0200B0B0->unk5c) >> 3;
        if (gUnknown_0200B0B0->unk5c > 0x10DF)
        {
            gUnknown_0200B0B0->unk5c = 0x10E0;
            if (sub_0800C9E8() == 0)
                return;
            if (gUnknown_0200B0B0->unk04 == 1)
                gUnknown_0200B0B0->unk5a = gUnknown_0200B0B0->unk3e == 0 ? 0x32 : 0;
        }
        break;
    }

    switch (gUnknown_0200B0B0->unk5a)
    {
    case 0x32:
        if (sub_0800C9E8() == 0)
            return;
        gUnknown_0200B0B0->unk5a = gUnknown_0200B0B0->unk3e == 0 ? 0x3C : 0;
        gUnknown_0200B0B0->unk5c = 0xFD80;
        break;
    case 0x3C:
        gUnknown_0200B0B0->unk5c += (0x3C0 - gUnknown_0200B0B0->unk5c) >> 3;
        if (gUnknown_0200B0B0->unk5c > 0x19F)
        {
            gUnknown_0200B0B0->unk5c = 0x1A0;
            gUnknown_0200B0B0->unk5a = 0x46;
        }
        break;
    case 0x46:
        if (sub_0800C9E8() == 0 || gUnknown_0200B0B0->unk3e != 0
            || gUnknown_0200B0B0->unk04 != 1)
            gUnknown_0200B0B0->unk5a = 0x50;
        break;
    case 0x50:
        gUnknown_0200B0B0->unk5c += (-928 - gUnknown_0200B0B0->unk5c) >> 3;
        if (gUnknown_0200B0B0->unk5c <= -480)
        {
            gUnknown_0200B0B0->unk5c = -480;
            if (sub_0800C9E8() == 0)
                return;
            if (gUnknown_0200B0B0->unk04 == 1)
                gUnknown_0200B0B0->unk5a = gUnknown_0200B0B0->unk3e == 0 ? 0x32 : 0;
        }
        break;
    }

    sub_0801F34C(0x8F, ((gUnknown_0200B0B0->unk5c >> 4) - 0x18) & 0x1FF, v, 0, 0);
    gUnknown_0200B0B0->unk5b = (gUnknown_0200B0B0->unk5b + 1) & 0x3F;
}
