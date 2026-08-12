#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002298.
 * sub_08002298 @ 0x08002298
 */

/* Wave 57 (W57-A). sub_08002510's state machine (src/decomp/c_08002510.c) on a
 * DIFFERENT lane of the same record: unk64/unk60 here are unk5a/unk5c there,
 * with the same 0 -> 0xA -> 0x14 -> 0x1E -> 0x32 -> 0x3C -> 0x46 -> 0x50 ladder
 * split across two switches and the same `v += (K - v) >> 3` easing.  Reading
 * that exemplar before this assembly is what made it a two-probe match.
 * PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D710"]
 * 0x0808D710 holds &gUnknown_0200B0B0 (dereferenced in baserom.gba), its own
 * -fforce-addr copy beside sub_08002510's 0x0808D714, so the honest
 * `gUnknown_0200B0B0` spelling is what produces the ROM's
 * `ldr rN,=<pool>; ldr rM,[rN]; ldr rP,[rM]` triple.
 *
 * a1 is declared and never read, exactly as in sub_08002510.
 *
 * `a2 &= 0xFF` IS LOAD-BEARING and is not the same code as `v = a2 & 0xFF`.
 * The ROM passes the masked value to sub_0802BD54's u16 parameter as
 * `lsls #0x10; lsrs #0x10`, and that truncation is redundant on a value known
 * to fit in 8 bits -- combine deletes it via nonzero_bits, which is only
 * tracked for a pseudo with ONE set.  Masking the parameter in place gives it
 * two sets (the incoming copy and the AND), nonzero_bits goes unknown, and the
 * pair survives.  A separate `int v = a2 & 0xFF;` is a single-set pseudo and
 * folds the pair away -- measured both ways with compile_probe, and it is the
 * only difference between a 632-byte match and a 628-byte miss.  sub_08002510
 * never discriminated this because it passes its `v` only to sub_0801F34C's
 * int parameter.
 *
 * 0xFD80 is unsigned because the ROM's pool word is `.4byte 0x0000FD80`, while
 * -800 / -640 are full negative ints (`0xFFFFFCE0` / `0xFFFFFD80`).
 * unk12 stays u8 with an (s8) cast at each use, per its header comment. */
void sub_08002298(int a1, int a2)
{
    int a;

    a2 &= 0xFF;

    switch (gUnknown_0200B0B0->unk64)
    {
    case 0:
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            if (sub_0800C7E8(gUnknown_0200B0B0->unk2a) == 0)
                return;
        }
        else if (gUnknown_0200B0B0->unk24 == 0x19)
        {
            return;
        }
        gUnknown_0200B0B0->unk64 = gUnknown_0200B0B0->unk3e != 0 ? 0xA : 0x32;
        gUnknown_0200B0B0->unk60 = 0x1180;
        break;
    case 0xA:
        gUnknown_0200B0B0->unk60 += (0xBE0 - gUnknown_0200B0B0->unk60) >> 3;
        if (gUnknown_0200B0B0->unk60 <= 0xCC0)
        {
            gUnknown_0200B0B0->unk60 = 0xCC0;
            gUnknown_0200B0B0->unk64 = 0x14;
        }
        break;
    case 0x14:
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            if (gUnknown_0200B0B0->unk3e == 0
                || sub_0800C7E8(gUnknown_0200B0B0->unk2a) == 0)
                gUnknown_0200B0B0->unk64 = 0x1E;
        }
        else if (gUnknown_0200B0B0->unk3e == 0
                 || gUnknown_0200B0B0->unk24 == 0x19)
        {
            gUnknown_0200B0B0->unk64 = 0x1E;
        }
        break;
    case 0x1E:
        gUnknown_0200B0B0->unk60 += (0x1180 - gUnknown_0200B0B0->unk60) >> 3;
        if (gUnknown_0200B0B0->unk60 > 0x10DF)
        {
            gUnknown_0200B0B0->unk60 = 0x10E0;
            gUnknown_0200B0B0->unk64 = gUnknown_0200B0B0->unk3e == 0 ? 0x32 : 0;
        }
        break;
    }

    switch (gUnknown_0200B0B0->unk64)
    {
    case 0x32:
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            if (sub_0800C7E8(gUnknown_0200B0B0->unk2a) == 0)
                return;
        }
        else if (gUnknown_0200B0B0->unk24 == 0x19)
        {
            return;
        }
        gUnknown_0200B0B0->unk64 = gUnknown_0200B0B0->unk3e == 0 ? 0x3C : 0;
        gUnknown_0200B0B0->unk60 = 0xFD80;
        break;
    case 0x3C:
        gUnknown_0200B0B0->unk60 += (0x320 - gUnknown_0200B0B0->unk60) >> 3;
        if (gUnknown_0200B0B0->unk60 > 0xBF)
        {
            gUnknown_0200B0B0->unk60 = 0xC0;
            gUnknown_0200B0B0->unk64 = 0x46;
        }
        break;
    case 0x46:
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            if (gUnknown_0200B0B0->unk3e != 0
                || sub_0800C7E8(gUnknown_0200B0B0->unk2a) == 0)
                gUnknown_0200B0B0->unk64 = 0x50;
        }
        else if (gUnknown_0200B0B0->unk3e != 0
                 || gUnknown_0200B0B0->unk24 == 0x19)
        {
            gUnknown_0200B0B0->unk64 = 0x50;
        }
        break;
    case 0x50:
        gUnknown_0200B0B0->unk60 += (-800 - gUnknown_0200B0B0->unk60) >> 3;
        if (gUnknown_0200B0B0->unk60 <= -640)
        {
            gUnknown_0200B0B0->unk60 = -640;
            gUnknown_0200B0B0->unk64 = gUnknown_0200B0B0->unk3e == 0 ? 0x32 : 0;
        }
        break;
    }

    a = gUnknown_0200B0B0->unk60 >> 4;
    sub_0801F34C(0x54, (a - 0xC) & 0x1FF, a2 + 1, 0, 0);
    if (gUnknown_0200B0B0->unk07 == 0)
        sub_0802BD54((a + 0x1A) & 0x1FF, a2,
                     0x3C - (s8)gUnknown_0200B0B0->unk12);
    else
        sub_0802BD54((a + 0x1A) & 0x1FF, a2,
                     0x32 - (s8)((struct Unk0200B0B0 *)((u8 *)gUnknown_0200B0B0
                                 + gUnknown_0200B0B0->unk2f))->unk12);
}
