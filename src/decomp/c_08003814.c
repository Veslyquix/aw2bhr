#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003814.
 * sub_08003814 @ 0x08003814, sub_08003890 @ 0x08003890
 */

void sub_08003814(void)
{
    int x;
    int t;

    x = gActiveMap->panelSide == 0 ? 2 : 0xCE;
    t = x & 0x1FF;
    DrawOamObject(0x91, t, 0xE, 0, 0);
    DrawOamObject(0x90, t, 0x18, 0, 0);
    t = (x + 0x18) & 0x1FF;
    sub_0802BD54(t, 0xE, gActiveMap->cursorX + 1);
    sub_0802BD54(t, 0x18, gActiveMap->cursorY + 1);
}

/* MATCHED, wave 36 (W36-I). PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D784"]
 * in this function's data/promoted.json entry. 0x0808D784 is agbcc's own
 * -fforce-addr word holding &gActiveMap (dereferenced in baserom.gba),
 * not a global of the original source, so the honest spelling is used here.
 *
 * unk42 is s16, and this function is what proves it: `movs r0,#0;
 * ldrsh r3,[r1,r0]` and then compares against -2, -3 and -10.
 *
 * `v = *q; v = <ternary on v>;` is deliberate. Folding the load into the
 * ternary (`v = *q >= -2 ? -2 : *q + 1;`) permutes r0/r3 through both arms and
 * drops the ROM's `adds r3, r0, #0` copy at the merge -- 47.7% instead of a
 * match. The `s16 *q` local is what keeps the `strh` on the pointer the arms
 * built rather than reloading the global before the store. */

void sub_08003890(void)
{
    s16 * q;
    int v;
    int t;

    if (gActiveMap->flags & 8)
    {
        q = &gActiveMap->introScreenY;
        v = *q;
        v = v >= -2 ? -2 : v + 1;
    }
    else
    {
        q = &gActiveMap->introScreenY;
        v = *q;
        v = v < -10 ? -10 : v - 1;
    }

    *q = v;

    if (v > -3)
    {
        t = gActiveMap->panelSide == 0 ? 0x20 : 0xD0;
        DrawOamObject(0x8E, (t - 0x20) & 0x1FF,
                     (u8)gActiveMap->introScreenY, 0, 0);
        sub_08003814();
    }
}
