#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080281F0.
 * sub_080281F0 @ 0x080281F0
 */

/* THIS IS A MATCH pending `.rodata` placement -- read the addends before
 * believing `matched: false` (wave 36, W36-M).
 * 500/500 bytes, SIZE MATCH, 98.4% identical, and every single instruction is
 * the ROM's. All 8 differing bytes are relocation ADDENDS, and they line up
 * exactly with the ROM's own `.rodata` layout offset from 0x08090AC4:
 *      .rodata+0x00 -> gUnknown_08090AC4   the { "OFF", "ON" } table
 *      .rodata+0x10 -> gUnknown_08090AD4   "O"
 *      .rodata+0x14 -> gUnknown_08090AD8   " MAP:%02d"
 *      .rodata+0x20 -> gUnknown_08090AE4   "SNOW:%s"
 *      .rodata+0x28 -> gUnknown_08090AEC   "SAKU:%s"
 *      .rodata+0x30 -> gUnknown_08090AF4   &gpKeySt        (force-addr)
 *      .rodata+0x34 -> gUnknown_08090AF8   &gUnknown_03001FBC
 *      .rodata+0x38 -> gUnknown_08090AFC   &gUnknown_03001470
 *      .rodata+0x3c -> gUnknown_08090B00   &gUnknown_03003FC0
 * `trymatch` resolves a force-addr word automatically (it reads the word's value
 * out of baserom.gba) but cannot do that for a string, which has no address to
 * check -- hence the false negative. Promotion needs the whole run
 * 0x08090AC4-0x08090B03 carved as this function's rodata.
 * SETTLED: the two `switch`es really are switches (gcc's balanced tree,
 * `cmp #1/beq; cmp #1/bgt; cmp #0/beq; b default`), gUnknown_08499F4C is a
 * `const u16 []` of six UNSIGNED bounds read in lower/upper pairs, and
 * gUnknown_03001FBC takes an ORDINARY inline pool word in the first arm (one
 * reference) and the force-addr word everywhere else (many) -- one global, two
 * codegens, one honest spelling. */
#include "hardware.h"
static const char *const sNames[] = { "OFF", "ON" };

void sub_080281F0(void)
{
    struct Unk03001470 *ent;
    int v;

    if (gpKeySt->held & 9)
    {
        sub_08015328(gUnknown_03001FBC);
        return;
    }

    if (gpKeySt->held & 0x40)
    {
        ent = &gUnknown_03001470[gUnknown_03001FBC];
        v = (u16)ent->unk1e;

        if (ent->unk1e > 0)
            ent->unk1e = v - 1;
    }

    if (gpKeySt->held & 0x80)
    {
        ent = &gUnknown_03001470[gUnknown_03001FBC];
        v = (u16)ent->unk1e;

        if (ent->unk1e <= 1)
            ent->unk1e = v + 1;
    }

    if (gpKeySt->unk02 & 0x20)
    {
        switch (gUnknown_03001470[gUnknown_03001FBC].unk1e)
        {
        case 0:
            if (gUnknown_08499F4C[0] < gUnknown_03003FC0.unk02)
                gUnknown_03003FC0.unk02--;
            break;

        case 1:
            if (gUnknown_08499F4C[2] < gUnknown_03003FC0.unk2c)
                gUnknown_03003FC0.unk2c--;
            break;

        case 2:
            if (gUnknown_08499F4C[4] < gUnknown_03003FC0.unk0d)
                gUnknown_03003FC0.unk0d--;
            break;
        }
    }

    if (gpKeySt->unk02 & 0x10)
    {
        switch (gUnknown_03001470[gUnknown_03001FBC].unk1e)
        {
        case 0:
            if (gUnknown_08499F4C[1] > gUnknown_03003FC0.unk02)
                gUnknown_03003FC0.unk02++;
            break;

        case 1:
            if (gUnknown_08499F4C[3] > gUnknown_03003FC0.unk2c)
                gUnknown_03003FC0.unk2c++;
            break;

        case 2:
            if (gUnknown_08499F4C[5] > gUnknown_03003FC0.unk0d)
                gUnknown_03003FC0.unk0d++;
            break;
        }
    }

    sub_08013428(8, (s16)(gUnknown_03001470[gUnknown_03001FBC].unk1e * 2 + 14), "O");
    sub_08013428(10, 14, " MAP:%02d", gUnknown_03003FC0.unk02);
    sub_08013428(10, 16, "SNOW:%s", sNames[gUnknown_03003FC0.unk2c]);
    sub_08013428(10, 18, "SAKU:%s", sNames[gUnknown_03003FC0.unk0d]);
}
