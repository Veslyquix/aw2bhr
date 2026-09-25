#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801B120.
 * FindNewestCompleteSave @ 0x0801B120
 *
 * Not a Xenesis-documented name. The old sub_0801B120 symbol is kept as a
 * linker alias below so every other unit keeps resolving it unchanged.
 */

/* Returns the save-table slot holding the newest COMPLETE copy tagged `id`,
 * or 0xffff when there is none. id 0xff asks for untagged slots instead: tag
 * 0 with a zero sector generation.
 *
 * Each tagged slot is one part of a save; gUnknown_0200CC38.unk30 packs the
 * part's index in its high nibble and (part count - 1) in its low nibble. The
 * scan keeps the newest generation among the matching slots, flags its parts
 * with bit 4 of unk20 and tallies them by index. If parts 0..count-1 each
 * appear exactly once and nothing lies beyond them, that generation wins.
 * Otherwise every slot of that generation is retagged 0xff and the scan
 * repeats on what is left.
 *
 * Measured spelling notes:
 * - `key` is u16. With a u32 `key` the same body is exact-size but misses on
 *   the tail's register assignment (79.6% -> 94.5% identical on the switch).
 * - The "count this part" tail is written once per arm. jump2 cross-jumps the
 *   copies, which is what leaves the equal-generation arm computing
 *   `unk30 + i` itself and branching into the middle of the shared tail. The
 *   same duplication makes loop.c hold the unk30 base in sl (as
 *   gUnknown_0200CC58 + 0x10); a single shared tail hoists
 *   gUnknown_0200CC88 there instead.
 * - `best > -1` rather than `best >= 0`: the ROM compares against the -1
 *   still live from the `best == -1` test.
 * - `part` is both the clear loops' counter and the part count. Sharing the
 *   one pseudo is what puts the count in r3.
 */
u16 FindNewestCompleteSave(u16 id)
{
    u8 partSeen[0x10];
    u8 slotTags[0x10];
    u16 key;
    int best;
    int i;
    int part;
    u32 generation;

    key = id;
    if (id == 0xff)
        key = 0;

    for (i = 0; i < 0x10; i++)
    {
        slotTags[i] = gUnknown_0200CC38.unk00[i];
        gUnknown_0200CC38.unk20[i] &= 0xef;
    }

    for (;;)
    {
        best = -1;
        for (i = 0; i < 0x10; i++)
        {
            if (slotTags[i] != key)
                continue;
            if (id == 0xff && gUnknown_0200CC88.sectorGeneration[i] != 0)
                continue;

            if (best == -1)
            {
                best = i;
                for (part = 0; part < 0x10; part++)
                {
                    partSeen[part] = 0;
                    gUnknown_0200CC38.unk20[part] &= 0xef;
                }
                partSeen[gUnknown_0200CC38.unk30[i] >> 4]++;
                gUnknown_0200CC38.unk20[i] |= 0x10;
            }
            else if (best > -1)
            {
                if (gUnknown_0200CC88.sectorGeneration[best] > gUnknown_0200CC88.sectorGeneration[i])
                    continue;
                if (gUnknown_0200CC88.sectorGeneration[best] == gUnknown_0200CC88.sectorGeneration[i])
                {
                    partSeen[gUnknown_0200CC38.unk30[i] >> 4]++;
                    gUnknown_0200CC38.unk20[i] |= 0x10;
                }
                else
                {
                    best = i;
                    for (part = 0; part < 0x10; part++)
                    {
                        partSeen[part] = 0;
                        gUnknown_0200CC38.unk20[part] &= 0xef;
                    }
                    partSeen[gUnknown_0200CC38.unk30[i] >> 4]++;
                    gUnknown_0200CC38.unk20[i] |= 0x10;
                }
            }
        }

        if (best == -1)
            return 0xffff;

        part = gUnknown_0200CC38.unk30[best] & 0xf;
        part++;
        for (i = 0; i < part && partSeen[i] == 1; i++)
            ;
        if (i == part)
        {
            for (; i < 0x10 && partSeen[i] == 0; i++)
                ;
            if (i == 0x10)
                return best;
        }

        generation = gUnknown_0200CC88.sectorGeneration[best];
        for (i = 0; i < 0x10; i++)
        {
            if (slotTags[i] == key && gUnknown_0200CC88.sectorGeneration[i] == generation)
                slotTags[i] |= 0xff;
            gUnknown_0200CC38.unk20[i] &= 0xef;
        }
    }
}

asm(".global sub_0801B120\n.thumb_set sub_0801B120, FindNewestCompleteSave\n");
