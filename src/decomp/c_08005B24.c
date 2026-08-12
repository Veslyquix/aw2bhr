#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005B24.
 * sub_08005B24 @ 0x08005B24
 */

/* Wave 57 (W57-A). The A/B page-flip driver for the two-page help screen whose
 * pages are the promoted sub_080059FC / sub_08005AA0 in
 * src/decomp/c_080059FC.c -- both are this function's own callees, so their
 * prototypes and the gUnknown_08499578 window model came for free.  The nearer
 * exemplar for the KEY handling is src/decomp/c_08004970.c, which carries the
 * identical `(gpKeySt->held & 7) != 0` / `(gpKeySt->held & 2) == 0` pair and
 * the same trailing sub_08012BC8 / sub_08013B0C / sub_08015C30 teardown.
 * PROMOTION NEEDS BOTH POOL WORDS PLACED, in this order:
 *     "rodata": ["0x0808D7C8", "0x0808D7CC"]
 *
 * NEITHER POOL WORD IS A GLOBAL, and the second one is the trap this batch was
 * warned about.  Dereferenced in baserom.gba, 0x0808D7C8 holds 0x0200B0B0
 * (&gUnknown_0200B0B0) and 0x0808D7CC holds 0x03002EE0 -- and 0x03002EE0 is
 * `gpKeySt`, declared in include/hardware.h, NOT an unnamed global.  Wave 20
 * invented a gUnknown_03002EE0 for that address and the SPLIT build caught it
 * as an undefined reference, because aw2bhr.lds already binds it; the
 * unknown-globals.h comment at gUnknown_03005920 records the whole episode.
 * Both are ordinary -fforce-addr address constants and the honest
 * `gUnknown_0200B0B0` / `gpKeySt` spellings produce the ROM's
 * `ldr rN,=<pool>; ldr rM,[rN]; ldr rP,[rM]` triples.
 *
 * global.h does NOT include hardware.h, so the `#include "hardware.h"` below
 * is required -- the same line c_08004970.c carries for the same reason.
 *
 * gUnknown_03001FBC stays `s16`: the ROM's `ldrb` is not a narrower object but
 * sub_08015C30's declared `u8` parameter narrowing the load at the call site.
 *
 * The two `case` fallthroughs (0 -> 1 and 0xA -> 0xB) are real: each pair
 * shares one basic block, with the page draw running once and then dropping
 * into that page's key test on the same frame. */

#include "hardware.h"

void sub_08005B24(void)
{
    if (gUnknown_0200B0B0->unk06 != 0)
    {
        gUnknown_0200B0B0->unk06 = 0;
        gUnknown_0200B0B0->unk02 = 0;
        gUnknown_03001418 = 0;
        gUnknown_03001FF8 = 0;
        sub_0801A444(2, 2, 0x1A, 0xF);
        sub_0801B780(0);
    }

    if ((gpKeySt->held & 7) != 0)
        gUnknown_0200B0B0->unk02 = 0x5A;

    switch (gUnknown_0200B0B0->unk02)
    {
    case 0:
        sub_0801B780(0);
        gUnknown_0200B0B0->unk02++;
        sub_080059FC();
        sub_08005EF0(1);
        /* fallthrough */
    case 1:
        if ((gpKeySt->held & 0x80) != 0)
        {
            gUnknown_0200B0B0->unk02 = 0xA;
            sub_08012BC8(gUnknown_08499578, 0, 0, 0x1E, 0x14, 0);
            sub_08013AEC();
            sub_08005F1C();
            sub_0803B4DC(0x67);
        }
        break;
    case 0xA:
        sub_0801B780(0);
        gUnknown_0200B0B0->unk02++;
        sub_08005AA0();
        sub_08005EF0(0);
        /* fallthrough */
    case 0xB:
        if ((gpKeySt->held & 0x40) != 0)
        {
            gUnknown_0200B0B0->unk02 = 0;
            sub_08012BC8(gUnknown_08499578, 0, 0, 0x1E, 0x14, 0);
            sub_08013AEC();
            sub_08005F1C();
            sub_0803B4DC(0x67);
        }
        sub_0801F34C(0x35, 0x28, 0x421, 0, 0);
        sub_0801F34C(0x36, 0x28, 0x431, 0, 0);
        sub_0801F34C(0x37, 0x28, 0x441, 0, 0);
        sub_0801F34C(0x38, 0x28, 0x451, 0, 0);
        sub_0801F34C(0x3C, 0x20, 0x461, 0, 0);
        break;
    }

    if (gUnknown_0200B0B0->unk02 == 0x5A)
    {
        if ((gpKeySt->held & 2) == 0)
            gUnknown_03002F1C = 1;
        sub_08005F1C();
        sub_08012BC8(gUnknown_08499578, 0, 0, 0x1E, 0x14, 0);
        sub_08012BC8(gUnknown_08499580, 0, 0, 0x1E, 0x14, 0x360);
        sub_08013AEC();
        sub_08013B0C();
        sub_08015C30(gUnknown_03001FBC);
    }
}
