#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080030BC.
 * sub_080030BC @ 0x080030BC
 */

/* MATCHED first attempt, wave 36 (W36-I). PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D75C"]
 * 0x0808D75C holds &gUnknown_0200B0B0 (checked in baserom.gba). The neighbour
 * 0x0808D754 immediately in front of it is NOT such a word -- it is the real
 * eight-byte table `01 03 05 07 03 01 07 05` this function memcpys to the
 * stack, which is why it is passed to sub_0808B6E8 without a deref.
 *
 * unk72/unk7a/unk82 are four-entry ARRAYS indexed by the lane parameter (see
 * include/unknown-globals.h); sub_08003088 calls this with lanes 0..3. The two
 * switches are one state machine run twice per frame:
 *   0 -> 0xA -> 0x14 -> 0x1E -> 0x32 -> 0x3C -> 0x46 -> 0x50 -> 0x32
 * with unk82 eased toward a target by `v += (K - v) >> 3` and unk7a counting
 * frames down. a2 and a3 are declared by the header and never read.
 *
 * 0xFD80 is written as an unsigned literal because the ROM's pool word is
 * `.4byte 0x0000FD80`, while the -640 and -928 in the case 0x50 arm are full
 * negative ints (`0xFFFFFD80`, `0xFFFFFC60`) -- the same constant appearing
 * both ways is the tell for which spelling the source used where. */

void sub_080030BC(int a1, int a2, int a3)
{
    u8 buf[8];

    sub_0808B6E8(buf, gUnknown_0808D754, 8);

    switch (gUnknown_0200B0B0->unk72[a1])
    {
    case 0:
        gUnknown_0200B0B0->unk72[a1] = gUnknown_0200B0B0->unk3e != 0 ? 0xA : 0x32;
        gUnknown_0200B0B0->unk82[a1] = 0x1180;
        gUnknown_0200B0B0->unk7a[a1] =
            buf[gUnknown_0200B0B0->unk3e == 0 ? a1 + 4 : a1];
        break;
    case 0xA:
        gUnknown_0200B0B0->unk7a[a1]--;
        if (gUnknown_0200B0B0->unk7a[a1] <= 0)
        {
            gUnknown_0200B0B0->unk82[a1] +=
                (0xBE0 - gUnknown_0200B0B0->unk82[a1]) >> 3;
            if (gUnknown_0200B0B0->unk82[a1] <= 0xCC0)
            {
                gUnknown_0200B0B0->unk82[a1] = 0xCC0;
                gUnknown_0200B0B0->unk72[a1] = 0x14;
            }
        }
        break;
    case 0x14:
        if (gUnknown_0200B0B0->unk3e == 0 || gUnknown_0200B0B0->unk04 != 1)
            gUnknown_0200B0B0->unk72[a1] = 0x1E;
        break;
    case 0x1E:
        gUnknown_0200B0B0->unk82[a1] +=
            (0x1180 - gUnknown_0200B0B0->unk82[a1]) >> 3;
        if (gUnknown_0200B0B0->unk82[a1] > 0x10DF)
        {
            gUnknown_0200B0B0->unk82[a1] = 0x10E0;
            if (gUnknown_0200B0B0->unk04 == 1)
                gUnknown_0200B0B0->unk72[a1] =
                    gUnknown_0200B0B0->unk3e == 0 ? 0x32 : 0;
        }
        break;
    }

    switch (gUnknown_0200B0B0->unk72[a1])
    {
    case 0x32:
        gUnknown_0200B0B0->unk72[a1] = gUnknown_0200B0B0->unk3e == 0 ? 0x3C : 0;
        gUnknown_0200B0B0->unk82[a1] = 0xFD80;
        gUnknown_0200B0B0->unk7a[a1] =
            buf[gUnknown_0200B0B0->unk3e == 0 ? a1 + 4 : a1];
        break;
    case 0x3C:
        gUnknown_0200B0B0->unk7a[a1]--;
        if (gUnknown_0200B0B0->unk7a[a1] <= 0)
        {
            gUnknown_0200B0B0->unk82[a1] +=
                (0x140 - gUnknown_0200B0B0->unk82[a1]) >> 3;
            if (gUnknown_0200B0B0->unk82[a1] > 0x1F)
            {
                gUnknown_0200B0B0->unk82[a1] = 0x20;
                gUnknown_0200B0B0->unk72[a1] = 0x46;
            }
        }
        break;
    case 0x46:
        if (gUnknown_0200B0B0->unk3e != 0 || gUnknown_0200B0B0->unk04 != 1)
            gUnknown_0200B0B0->unk72[a1] = 0x50;
        break;
    case 0x50:
        gUnknown_0200B0B0->unk82[a1] +=
            (-928 - gUnknown_0200B0B0->unk82[a1]) >> 3;
        if (gUnknown_0200B0B0->unk82[a1] <= -640)
        {
            gUnknown_0200B0B0->unk82[a1] = -640;
            if (gUnknown_0200B0B0->unk04 == 1)
                gUnknown_0200B0B0->unk72[a1] =
                    gUnknown_0200B0B0->unk3e == 0 ? 0x32 : 0;
        }
        break;
    }

    sub_080032EC(a1, gUnknown_0200B0B0->unk82[a1] >> 4, 0x6A);
}
