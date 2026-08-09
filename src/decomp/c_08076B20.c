#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08076B20.
 * sub_08076B20 @ 0x08076B20
 */

/* Walk gUnknown_0861515C for the record whose key matches
 * gUnknown_0202FDFC.unk0c, giving up at the 0xFF terminator, then clear bit 0
 * of the seven gUnknown_0202FDFC.unk12 entries that record names.
 *
 * gUnknown_0202FE0E in the disassembly is not a separate object: it is
 * &gUnknown_0202FDFC.unk12 (0x0202FDFC + 0x12), and the pool word carries that
 * addend.
 *
 * The index is `(s8)` over a `u8` member -- the ROM reads `ldrb` and then
 * `lsls #0x18; asrs #0x18`, where a declared `s8` array would have folded to
 * `ldrsb` off the register index. The 0xFE payload row is the -2 that produces.
 *
 * Reading the guarded entry once (`v & 1` then `v & 0xFE`) is CSE, not source:
 * the second `ands` reuses the loaded value rather than reloading. */
void sub_08076B20(void)
{
    const struct Unk0861515C *it;
    int i;

    for (it = gUnknown_0861515C; it->unk00 != gUnknown_0202FDFC.unk0c; it++)
        if (it->unk00 == 0xFF)
            return;

    for (i = 0; i < 7; i++)
        if (gUnknown_0202FDFC.unk12[(s8)it->unk01[i]] & 1)
            gUnknown_0202FDFC.unk12[(s8)it->unk01[i]] &= ~1;
}
