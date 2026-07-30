#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08000694.
 * sub_08000694 @ 0x08000694
 */

#include "hardware.h"

/* MATCHES -- verified by exit status of tools/trymatch.py, which reports
 * `relocs: name different symbols that resolve to the same address` and the
 * `rodata: ["0x0808D6DC"]` entry to carry at promotion.
 *
 * This draft was PARKED in wave 13 and the block it was parked on no longer
 * exists: the single difference was that agbcc puts `.LC0: .word
 * gUnknown_0200B0B0` in this unit's own `.rodata` where the ROM relocates
 * against gUnknown_0808D6DC, and wave 18 taught the split to PLACE that word
 * (tools/split_rodata.py). Nothing about the C below changed; the harness
 * caught up with it.
 *
 * It went unnoticed for two waves because it is NOT in data/parked.json --
 * only its own comment said "parked" -- so the pre-flight re-test of the
 * parked queue, which every wave since 18 has run by exit code, never covered
 * it. See docs/agbcc-codegen.md (wave 20, W20-A) for the sweep that found it
 * and the one-line command that repeats it.
 *
 * The wave-13 note kept for the record: the `struct Unk0200B0B0 **const
 * gUnknown_0808D6DC` workaround declaration reproduces the CSE exactly but
 * force-addr then fires on THAT symbol in turn -- 400 bytes against 392 --
 * which is why the honest spelling below is the right one and was all along. */

void sub_08000694(void)
{
    if (gUnknown_0200B0B0->unk06 != 0)
    {
        gUnknown_0200B0B0->unk06 = 0;
        gUnknown_0200B0B0->unk02 = 0;
        sub_08001D9C();
        sub_08003948();
        gUnknown_0200B0B0->unk0c = 2;
        sub_080039D0();
        sub_0803B4DC(0x76);
    }

    switch (gUnknown_0200B0B0->unk02)
    {
    case 0:
        if (--gUnknown_0200B0B0->unk0c <= 0)
            gUnknown_0200B0B0->unk02 = 50;
        break;

    case 50:
        gUnknown_03001418 = 0xFFD8;
        gUnknown_03001FF8 = 0xFFC4;
        gUnknown_0200B0B0->unk02 = 60;
        /* fall through */
    case 60:
    {
        /* The `int` temp is load-bearing: `gUnknown_03001FFC > 5` read straight
         * off the u16 global is shortened by the C front end to an UNSIGNED
         * compare (`bls`); binding it to an int first keeps the signed `ble`
         * the ROM has. */
        int blend = gUnknown_03001FFC;

        if (blend > 5)
        {
            gUnknown_0200B0B0->unk02 = 70;
            sub_0803CE28(0, 0);
        }
        break;
    }

    case 70:
        sub_08023824();
        sub_08023518();
        sub_08023908(8);
        if (gpKeySt->held & 0xb)
        {
            gUnknown_0200B0B0->unk02 = 80;
            gUnknown_0200B0B0->unk0c = 10;
        }
        break;

    case 80:
        if (--gUnknown_0200B0B0->unk0c < 0)
        {
            gUnknown_0200B0B0->unk02 = 90;
            sub_0803CEAC();
            sub_08012BC8(gUnknown_08499578, 0, 0, 15, 10, 0);
            sub_08013AEC();
            sub_080039BC();
            sub_0803B4DC(0x66);
        }
        break;

    case 90:
        if (gUnknown_03001FFC == 0)
        {
            gUnknown_03002EFC = 0xa0;
            gUnknown_0200B0B0->unk02 = 100;
            gUnknown_03001FE8.bits.mosaic = 0;
            ((union BgCntBuf *)&gUnknown_0300251C)->bits.mosaic = 0;
            *(u8 *)&gUnknown_030030C4 = 0;
            sub_08024268();
        }
        break;

    case 100:
        gUnknown_0200B0B0->unk02 = 40;
        sub_08001D8C();
        sub_08003934();
        sub_0800056C(1);
        break;
    }
}
