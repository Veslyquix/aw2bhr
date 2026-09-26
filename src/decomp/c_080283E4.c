#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080283E4.
 * sub_080283E4 @ 0x080283E4
 */

/* MATCHED wave 90 (W90-C). Three changes from the 90.7% park, all spelling:
 *   - `gPlayers[1].aiControlled = gPlaySt.aiControlled[1];` (the sibling
 *     c_08026924.c's spelling) instead of `((u8 *)gPlayers)[0x57] = ...`:
 *     90.7% -> 95.4%, and it fixed the +0x16 operand-order difference.
 *   - the `& 0xc0` block as `gPlaySt.aiControlled[(s16)...unk38 + 1]` with the
 *     subscript inline three times, instead of `q = (u8 *)&gPlaySt; q += idx;
 *     q += 0x39;`: every instruction and register then equals the ROM's.
 *     (The same member with a bound `ent` is +4 bytes.)
 *   - the two strings have TWO spaces: "R: SAKUTEKI  ON" / "R: SAKUTEKI  OFF"
 *     (read from the ROM at 0x08090B04). The 17-byte OFF string pads to 20,
 *     which is the "zero word of padding" earlier waves could not explain.
 * The `--` line still needs `ent` bound (inline, the +0x38 folds into the
 * addend). Needs its .rodata run 0x08090B04-0x08090B4C placed; trymatch lists it. */
#include "hardware.h"

void sub_080283E4(void)
{
    struct Unk03001470 *ent;

    if (gpKeySt->pressed & 9)
    {
        gPlayers[1].aiControlled = gPlaySt.aiControlled[1];
        gPlayers[2].aiControlled = gPlaySt.aiControlled[2];
        sub_08015C30(gUnknown_03001FBC);
    }

    if (gpKeySt->pressed & 0x100)
        gPlaySt.fog = 1 - gPlaySt.fog;

    if (gpKeySt->pressed & 0x30)
        gUnknown_03001470[gUnknown_03001FBC].unk38
            = 1 - gUnknown_03001470[gUnknown_03001FBC].unk38;

    if (gpKeySt->pressed & 0xc0)
    {
        if (gPlaySt.aiControlled[(s16)gUnknown_03001470[gUnknown_03001FBC].unk38 + 1] == 1)
            gPlaySt.aiControlled[(s16)gUnknown_03001470[gUnknown_03001FBC].unk38 + 1] = 2;
        else
            gPlaySt.aiControlled[(s16)gUnknown_03001470[gUnknown_03001FBC].unk38 + 1] = 1;
    }

    if (gPlaySt.fog == 1)
        sub_08013428(8, 0xd, "R: SAKUTEKI  ON");
    else
        sub_08013428(8, 0xd, "R: SAKUTEKI  OFF");

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
