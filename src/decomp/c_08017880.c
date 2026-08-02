#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017880.
 * sub_08017880 @ 0x08017880
 */

#include "hardware.h"

/* The HBlank raster handler: three scanline triggers, each reprogramming a
 * group of display registers mid-frame. Two of the three compare against a
 * moving offset -- `0x2f - (s16)gUnknown_030030A8` and `0x2c - ...` -- which is
 * the same scroll value the 0xe2 arm writes to BG0VOFS/BG1VOFS.
 *
 * UNPARKED, wave 35 (W35-I). The 92.5% park note blamed 18 bytes of register
 * fields on the BLDALPHA statement needing a fourth register and called that
 * the cause; that reading was right and the cause is VOLATILE. Reading both
 * gUnknown_030030C0 and gUnknown_03001FEC through a `vu16` gives exactly the
 * ROM's four-register block -- `ldr r3,=REG_BLDALPHA; ldr r2,=&gUnknown_030030C0;
 * ldr r0,=&gUnknown_03001FEC; ldrh r1,[r0]; lsls #8; ldrh r0,[r2]` -- with the
 * pool words in the ROM's order, and that in turn pushes `v` into r4 and
 * &gUnknown_030030A8 into r5, which is the whole rest of the residual. A
 * non-volatile read lets combine fold each address into its own load and reuse
 * one register for both, which is the 3-register block the park recorded.
 * gUnknown_030030A8 was already known volatile; these two are its neighbours in
 * the same HBlank shadow-register set, so all three being volatile is the
 * consistent reading. The operand ORDER is NOT the lever and was the obvious
 * thing to try: swapping to `(gUnknown_03001FEC << 8) + gUnknown_030030C0`
 * reverses the two pool words away from the ROM's order. */
void sub_08017880(void)
{
    int v;

    v = REG_VCOUNT & 0xff;

    if (v == 0x2f - (s16)gUnknown_030030A8)
    {
        *(vu32 *)(REG_BASE + REG_OFFSET_BG0CNT) = gUnknown_03002010;
        *(vu32 *)(REG_BASE + REG_OFFSET_BG0HOFS) = gUnknown_03003030;
        *(vu32 *)(REG_BASE + REG_OFFSET_BG1HOFS) = gUnknown_03002B3C;
        REG_BLDCNT = gUnknown_03002014;
        REG_BLDALPHA = *(vu16 *)&gUnknown_030030C0 + (*(vu16 *)&gUnknown_03001FEC << 8);
        REG_BLDY = gUnknown_03001FB4;
    }

    if (v == 0x2c - (s16)gUnknown_030030A8)
        REG_DISPCNT = gUnknown_03002F38;

    if (v == 0xe2)
    {
        REG_DISPCNT = gUnknown_03002EDC;
        *(vu32 *)(REG_BASE + REG_OFFSET_BG0CNT) = gUnknown_03002030;
        REG_BG0VOFS = gUnknown_030030A8;
        REG_BG1VOFS = gUnknown_030030A8;
        *(vu32 *)(REG_BASE + REG_OFFSET_BLDCNT) = 0;
        REG_BLDY = gUnknown_03001424;
        REG_BG0HOFS = 0;
        REG_BG1HOFS = 0;
    }
}
