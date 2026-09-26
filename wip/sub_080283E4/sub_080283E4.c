/* WAVE 87 (W87-F) -- `do { } while (0)` TRANSFER TEST: NEGATIVE, 5 placements.
 * The five pool pointers (live across seven bl's) ARE global.c allocnos and the
 * wrapper does move them -- but the BASELINE already holds the ROM's assignment
 * (gpKeySt r4, &gPlaySt r5, &gUnknown_03001FBC r7, gPlayers
 * r3, &gUnknown_03001470 r6) and all four wrappers break it. The actual
 * residual, the r2/r3 destination pair inside the `& 0xc0` block, is INVARIANT
 * across every placement. ALSO: the park's `remaining_diff` is out of date --
 * the FIRST difference (+0x16) is in the `held & 9` block and is an
 * operand-ORDER difference, not a register name. Draft unchanged at 90.7%.
 * See work/sub_080283E4/W87-notes.md. */
#include "global.h"

/* PARKED at 388/388 bytes (wave 36, W36-M). SIZE-EXACT, and every instruction
 * is the ROM's instruction -- what differs is which register holds what in two
 * blocks, plus the `.rodata` addends.
 *   - `gUnknown_08090B44/B48/B4C` are force-addr words for &gPlaySt,
 *     &gUnknown_03001FBC and &gUnknown_03001470; this draft reproduces all three
 *     (they land in r5/r7/r6 exactly as the ROM does). Benign.
 *   - the nine string literals reproduce the ROM's `.rodata` layout offset from
 *     0x08090B04, so those relocs are addend-only differences too -- BUT the
 *     "1P" run is 4 bytes early: the ROM has a zero word of padding at
 *     0x08090B24 after "R: SAKUTEKI OFF" that a plain string literal does not
 *     produce. Worth checking whether the original declared that one as a sized
 *     array.
 *   - REAL residual: in the `& 0x30` and `& 0xc0` blocks the encoded source
 *     operands already have the same index/base order. What differs is which
 *     operand register is reused as the destination, with downstream renaming.
 *     This is allocation/target reuse, not source operand order.
 * SETTLED, do not re-derive: binding `ent` before the `--` line is REQUIRED --
 * written inline as `*(s16 *)&gUnknown_03001470[i].unk38` the +0x38 folds into
 * the relocation addend and the `ldrsh` reads offset 0. gpKeySt gets an ORDINARY
 * inline pool word here while the other three globals get force-addr words, in
 * the same function; that is the reference-count trigger and not something to
 * spell differently.
 *
 * WAVE 73 (W73-F): first decomp-permuter runs this function has ever had.
 * The `& 0x30` block does NOT bind `ent` -- the subscript is written inline on
 * both sides of the assignment. Note this is the OPPOSITE of the `--` line
 * above, where binding is required, so the rule is per-statement and not
 * per-function. */
#include "hardware.h"

void sub_080283E4(void)
{
    struct Unk03001470 *ent;
    u8 *q;

    if (gpKeySt->pressed & 9)
    {
        ((u8 *)gPlayers)[0x57] = gPlaySt.aiControlled[1];
        ((u8 *)gPlayers)[0x93] = gPlaySt.aiControlled[2];
        sub_08015C30(gUnknown_03001FBC);
    }

    if (gpKeySt->pressed & 0x100)
        gPlaySt.fog = 1 - gPlaySt.fog;

    if (gpKeySt->pressed & 0x30)
        gUnknown_03001470[gUnknown_03001FBC].unk38
            = 1 - gUnknown_03001470[gUnknown_03001FBC].unk38;

    if (gpKeySt->pressed & 0xc0)
    {
        q = (u8 *)&gPlaySt;
        ent = &gUnknown_03001470[gUnknown_03001FBC];
        q += *(s16 *)&ent->unk38;
        q += 0x39;

        if (*q == 1)
            *q = 2;
        else
            *q = 1;
    }

    if (gPlaySt.fog == 1)
        sub_08013428(8, 0xd, "R: SAKUTEKI ON");
    else
        sub_08013428(8, 0xd, "R: SAKUTEKI OFF");

    if (gPlaySt.aiControlled[1] == 1)
        sub_08013428(0xb, 0xa, "1P");
    else
        sub_08013428(0xb, 0xa, "CP");

    if (gPlaySt.aiControlled[2] == 1)
        sub_08013428(0x11, 0xa, "2P");
    else
        sub_08013428(0x11, 0xa, "CP");

    sub_08013428(0xe, 0xa, "VS");

    ent = &gUnknown_03001470[gUnknown_03001FBC];
    sub_08013428((s16)(*(s16 *)&ent->unk38 * 6 + 11), 0xb, "--");
    sub_08013428(0xc, 6, "PAUSE");
}
