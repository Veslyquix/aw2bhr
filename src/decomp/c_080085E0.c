#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080085E0.
 * sub_080085E0 @ 0x080085E0
 */

/* The tile-action dispatcher: read the map cell under the cursor, then run one
 * of nineteen handlers picked by the low five bits of gUnknown_0200B0B0->unk2a,
 * leaving a result code in unk6a.
 *
 * gUnknown_0808D800 is NOT a global of the original source -- see the note on
 * it in unknown-globals.h. The source says `gUnknown_0200B0B0` and agbcc's
 * -fforce-addr parks the address in this unit's .rodata. The split can now
 * place that word directly, so the honest spelling below is byte-exact and
 * promotion must carry `rodata: ["0x0808D800"]`.
 *
 * The global is named again in every case arm rather than bound to a local:
 * the five reads before the switch share one deref because no call separates
 * them, but each arm re-derefs from scratch, which a local pointer could not
 * produce. x and y ARE locals -- they survive nineteen calls in r5/r6.
 *
 * Cases 9 and 18 are absent, not empty: their jump-table slots point at the
 * same epilogue the range check does.
 */

void sub_080085E0(void)
{
    u8 *p;
    u8 *rows;
    u8 *tiles;
    int x, y, t, off;

    x = gUnknown_0200B0B0->unk08;
    y = gUnknown_0200B0B0->unk0a;

    p = gUnknown_08499590;
    t = y * 2;
    rows = p + 0x417A;
    off = (*(u16 *)(rows + t) + x) * 2;
    tiles = p + 0xA22;
    gUnknown_0200B0B0->unk20 = *(u16 *)(tiles + off);
    gUnknown_0200B0B0->unk00 |= 0x1000;

    switch (gUnknown_0200B0B0->unk2a & 0x1f) {
    case 7:
        sub_08007CA0(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x8a;
        break;

    case 13:
        if (sub_0800B528(x, y) >= 0 && sub_0800C840(x, y) != 0)
        {
            sub_0800C608(x, y);
            sub_080011F4(x, y, 1);
            sub_08007F14(x, y, 1);
        }
        sub_0800BA9C(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x4b;
        break;

    case 5:
        if (sub_0800C840(x, y) != 0)
        {
            sub_0800C608(x, y);
            sub_080011F4(x, y, 1);
            sub_08007F14(x, y, 1);
        }
        sub_0800F4E0(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x89;
        break;

    case 2:
        if (sub_0800C840(x, y) != 0)
        {
            sub_0800C608(x, y);
            sub_080011F4(x, y, 1);
            sub_08007F14(x, y, 1);
        }
        if (sub_08009F10(x, y) == 0)
            break;
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x2d;
        break;

    case 12:
        sub_08008F6C(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x89;
        break;

    case 3:
        if (sub_0800C840(x, y) != 0)
        {
            sub_0800C608(x, y);
            sub_080011F4(x, y, 1);
            sub_08007F14(x, y, 1);
        }
        sub_0800AF74(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x4b;
        break;

    case 19:
        if (sub_0800BF78(x, y) == 0)
            break;
        gUnknown_0200B0B0->unk6a = 0x8a;
        break;

    case 4:
        sub_0800CF28(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x4b;
        break;

    case 8:
        sub_0800C454(x, y, gUnknown_0200B0B0->unk2a);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x88;
        break;

    case 6:
    case 10:
    case 11:
    case 14:
    case 17:
        sub_0800C454(x, y, gUnknown_0200B0B0->unk2a);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x87;
        break;

    case 15:
        if (sub_0800C840(x, y) != 0)
        {
            sub_0800C608(x, y);
            sub_080011F4(x, y, 1);
            sub_08007F14(x, y, 1);
        }
        sub_08010D28(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x87;
        break;

    case 16:
        if (sub_0800C840(x, y) != 0)
        {
            sub_0800C608(x, y);
            sub_080011F4(x, y, 1);
            sub_08007F14(x, y, 1);
        }
        sub_08010D80(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x87;
        break;

    case 1:
        if (sub_0800C840(x, y) != 0)
            sub_0800C608(x, y);
        sub_080011F4(x, y, 1);
        sub_08007F14(x, y, 1);
        sub_0800EC20(x, y);
        sub_0800BEE4(x, y);
        sub_08008BB8(x, y);
        gUnknown_0200B0B0->unk6a = 0x4b;
        break;
    }
}
