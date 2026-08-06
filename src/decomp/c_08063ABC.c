#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063ABC.
 * sub_08063ABC @ 0x08063ABC
 */

#include "hardware.h"

/* Clears one 4bpp tile row with a halfword fill and then copies eleven pairs of
 * VRAM blocks between two tile bases, waiting for DMA3 to go idle before each
 * stage.
 *
 * THREE THINGS, all measured in wave 46; the wave-44 park had the first one
 * inverted.
 *  - The DMA cursor is a BLOCK-SCOPED local, one per region, NOT one local for
 *    the whole function. agbcc's CSE of the address constant does not cross the
 *    wait loops' basic-block boundaries, so the ROM materialises 0x040000D4
 *    three times; the fourth reference (the second wait) IS in the fill block's
 *    extended basic block, which is why it is a copy (`adds r4, r0, #0`) and
 *    not a fourth `ldr`. One function-wide local emits one `ldr` and loses the
 *    other three; naming REG_DMA3SAD/DAD/CNT separately is worse still, three
 *    distinct pool words (see src/decomp/c_080638A8.c).
 *  - The two VRAM addresses live in the PARAMETERS, updated in place with
 *    compound assignment. `a1 = 0x06010000 + (a1 & 0x3FF) * 32;` computes the
 *    shift into a fresh register; `a1 &= ...; a1 *= 32; a1 += ...;` keeps all
 *    three in a1's own register, which is the ROM's `ands r3,r1 / lsls r3,r3,#5
 *    / adds r3,r3,r0`.
 *  - The main loop is ASCENDING. The descending `for (i = 10; i >= 0; i--)`
 *    emits the same instructions but puts `movs r4, #0xa` BEFORE the LICM hoist
 *    of 0x80000020; the ROM has it after, and a counter init after a hoist is
 *    check_dbra_loop's, not the source's. See the preheader-order rule in
 *    docs/agbcc-codegen.md. */
void sub_08063ABC(int a1, int a2)
{
    int i;

    {
        vu32 *dma = (vu32 *)(REG_BASE + REG_OFFSET_DMA3SAD);

        while (dma[2] & 0x80000000)
            ;
    }

    a1 &= 0x3FF;
    a1 *= 32;
    a1 += 0x06010000;
    a2 &= 0x3FF;
    a2 *= 32;
    a2 += 0x06010000;

    {
        vu16 fill = 0;
        vu32 *dma = (vu32 *)(REG_BASE + REG_OFFSET_DMA3SAD);

        dma[0] = (u32)&fill;
        dma[1] = a2;
        dma[2] = 0x81000B00;
        dma[2];
    }
    {
        vu32 *dma = (vu32 *)(REG_BASE + REG_OFFSET_DMA3SAD);

        while (dma[2] & 0x80000000)
            ;
    }
    {
        vu32 *dma = (vu32 *)(REG_BASE + REG_OFFSET_DMA3SAD);

        for (i = 0; i < 11; i++)
        {
            a2 += 0xa0;
            dma[0] = a1;
            dma[1] = a2;
            dma[2] = 0x80000020;
            dma[2];
            a1 += 0x40;
            a2 += 0x80;
            dma[0] = a1;
            dma[1] = a2;
            dma[2] = 0x80000020;
            dma[2];
            a1 += 0x40;
            a2 += 0xe0;
        }
    }
}
