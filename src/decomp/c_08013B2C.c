#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013B2C.
 * sub_08013B2C @ 0x08013B2C
 */

#include "hardware.h"

/* Flushes the four BG tilemap shadows. gUnknown_03002F00 is a per-BG dirty
 * bitmask (bit 0 = BG0 ... bit 3 = BG3); each set bit blits 0x800 bytes from
 * the matching `u16 *` ROM pointer into that BG's screen block, whose base is
 * the tm_block field of the BG's own BGCNT shadow.
 *
 * `lsls #0x13; lsrs #0x1b` is the ordinary pure-read extraction of a 5-bit
 * field at bit 8 -- per the note on struct BgCnt the u16 container still emits
 * a whole-word `ldr` plus a shift pair, so the `ldr` here is not evidence of a
 * wider object. `lsls #0xb` is the `* 0x800` screen-block stride and
 * `movs #0xc0; lsls #0x13` is 0x06000000.
 *
 * gUnknown_08499578 and its three neighbours are REAL ROM pointer variables,
 * not force-addr pool words: the `ldr =sym; ldr [sym]` pair is identical for
 * both, but these four hold four DIFFERENT addresses and are already declared
 * `u16 *`. Dereferenced in baserom.gba to confirm before writing this.
 *
 * gUnknown_03000048 is cleared last: the palette shadow that sub_080135A4
 * marks dirty is flushed by the same frame boundary this function ends.
 */
void sub_08013B2C(void)
{
    if (gUnknown_03002F00 & 1)
        sub_08011C68(gUnknown_08499578,
            (void *)(gUnknown_03002B6C.bits.tm_block * 0x800 + 0x06000000), 0x800);

    if (gUnknown_03002F00 & 2)
        sub_08011C68(gUnknown_0849957C,
            (void *)(gUnknown_03001FE8.bits.tm_block * 0x800 + 0x06000000), 0x800);

    if (gUnknown_03002F00 & 4)
        sub_08011C68(gUnknown_08499580,
            (void *)(gUnknown_030030B4.bits.tm_block * 0x800 + 0x06000000), 0x800);

    if (gUnknown_03002F00 & 8)
        sub_08011C68(gUnknown_08499584,
            (void *)(gUnknown_0300251C.bits.tm_block * 0x800 + 0x06000000), 0x800);

    gUnknown_03002F00 = 0;
    gUnknown_03000048 = 0;
}
