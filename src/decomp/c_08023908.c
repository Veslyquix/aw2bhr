#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08023908.
 * sub_08023908 @ 0x08023908
 */

/* MATCHED, wave 71 (W71-C), 324/324 configured bytes.
 *
 * The two missing post-truncation copies were a scope/lifetime readout: one
 * function-scope `u16 d` lets both definitions coalesce into the truncation
 * result, while a separate block-local `d` in each of the first two arms emits
 * the ROM's `lsrs r0; adds r1,r0` sequence in both places.
 *
 * The later allocation follows from keeping the flag and xor-mask as distinct
 * pseudos. Fixed short-lived locals plus an empty read/write asm constraint
 * preserve the duplicate immediate that the ROM carries; fixed r0 outputs keep
 * the copy-before-xor/store form. The first two arms likewise use fixed map,
 * flag and output pseudos to retain the ROM's reload destinations.
 *
 * The `.rodata` relocation at +0x13c is the expected private force-address
 * word for gUnknown_08499590 (original symbol gUnknown_08090A18). */

void sub_08023908(int a1)
{
    {
        register u8 *map0 asm("r3");
        register u16 flag0 asm("r4");

        map0 = gUnknown_08499590;
        flag0 = *(u16 *)(map0 + 0x10);
        if ((flag0 & 3) == 0)
        {
            u16 d;

            d = gUnknown_030033E4.unk00 - ((s16)*(u16 *)(map0 + 4) >> 4);
            if (d <= 1)
            {
                register u16 out0 asm("r0");
                out0 = flag0;
                out0 |= 2;
                *(u16 *)(map0 + 0x10) = out0;
            }
            if (d > 0xc)
            {
                register u8 *map2 asm("r2");
                register u16 flag2 asm("r1");
                register u16 out2 asm("r0");
                map2 = gUnknown_08499590;
                flag2 = *(u16 *)(map2 + 0x10);
                out2 = 1;
                out2 |= flag2;
                *(u16 *)(map2 + 0x10) = out2;
            }
        }
    }

    {
        register u8 *map1 asm("r3");
        register u16 flag1 asm("r4");

        map1 = gUnknown_08499590;
        flag1 = *(u16 *)(map1 + 0x10);
        if ((flag1 & 0xc) == 0)
        {
            u16 d;

            d = gUnknown_030033E4.unk02 - ((s16)*(u16 *)(map1 + 6) >> 4);
            if (d <= 1)
            {
                register u16 out1 asm("r0");
                out1 = flag1;
                out1 |= 4;
                *(u16 *)(map1 + 0x10) = out1;
            }
            if (d > 7)
            {
                register u8 *map2 asm("r2");
                register u16 flag2 asm("r1");
                register u16 out2 asm("r0");
                map2 = gUnknown_08499590;
                flag2 = *(u16 *)(map2 + 0x10);
                out2 = 8;
                out2 |= flag2;
                *(u16 *)(map2 + 0x10) = out2;
            }
        }
    }

    {
        u8 *map;
        register u16 f asm("r4");
        register u16 mask asm("r5");
        register u16 out asm("r0");

        map = gUnknown_08499590;
        f = *(u16 *)(map + 0x10);
        mask = 1;
        asm("" : "+r" (mask));
        if ((f & 1) != 0)
        {
            if (*(u16 *)map - ((s16)*(u16 *)(map + 4) >> 4) == 0xf
             || ((*(u16 *)(map + 4) += a1) & 0xf) == 0)
                {
                    out = f;
                    out ^= mask;
                    *(u16 *)(map + 0x10) = out;
                }
        }
    }

    {
        u8 *map;
        register u16 f asm("r3");
        register u16 mask asm("r4");
        register u16 out asm("r0");

        map = gUnknown_08499590;
        f = *(u16 *)(map + 0x10);
        mask = 2;
        asm("" : "+r" (mask));
        if ((f & 2) != 0)
        {
            if (*(s16 *)(map + 4) == 0
             || ((*(u16 *)(map + 4) -= a1) & 0xf) == 0)
                {
                    out = f;
                    out ^= mask;
                    *(u16 *)(map + 0x10) = out;
                }
        }
    }

    {
        u8 *map;
        register u16 f asm("r3");
        register u16 mask asm("r4");
        register u16 out asm("r0");

        map = gUnknown_08499590;
        f = *(u16 *)(map + 0x10);
        mask = 4;
        asm("" : "+r" (mask));
        if ((f & 4) != 0)
        {
            if (*(s16 *)(map + 6) == 0
             || ((*(u16 *)(map + 6) -= a1) & 0xf) == 0)
                {
                    out = f;
                    out ^= mask;
                    *(u16 *)(map + 0x10) = out;
                }
        }
    }

    {
        u8 *map;
        register u16 f asm("r4");
        register u16 mask asm("r5");
        register u16 out asm("r0");

        map = gUnknown_08499590;
        f = *(u16 *)(map + 0x10);
        mask = 8;
        asm("" : "+r" (mask));
        if ((f & 8) != 0)
        {
            if (*(u16 *)(map + 2) - ((s16)*(u16 *)(map + 6) >> 4) == 0xa
             || ((*(u16 *)(map + 6) += a1) & 0xf) == 0)
                {
                    out = f;
                    out ^= mask;
                    *(u16 *)(map + 0x10) = out;
                }
        }
    }

    sub_08023860();
}
