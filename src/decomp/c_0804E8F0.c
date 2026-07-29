#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804E8F0.
 * sub_0804E8F0 @ 0x0804E8F0
 */

/* sub_0804E8F0 and sub_0804FE10 are the SAME SOURCE apart from which
 * -fforce-addr pool word agbcc gave them; wave 18 proved it by diffing the
 * normalised assembly (one differing slot, the pool symbol).
 *
 * This names gUnknown_03001470 DIRECTLY, which is what the original source did,
 * so agbcc parks the address in this unit's own .rodata.  That word is the ROM's
 * gUnknown_08136090 and the build now places it there -- see
 * tools/split_rodata.py.  The `struct Unk08136090 *const` wrapper spelling
 * that wave 18 found is NOT needed: it reached 304 of 308 and the honest
 * spelling is exact.
 */
struct Unk0804E8F0
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ u16 unk04;
};

void sub_0804E8F0(s16 a, struct Unk0804E8F0 *dst)
{
    struct OamData oam;
    u16 v;
    int d;
    u16 c;
    u16 e;

    sub_0801566C(a, (struct UnkVec *)&oam);
    d = (u16)(dst->unk04 - oam.tileNum) & 0x3FF;
    if (gUnknown_08552A40[d] != 0xFFFF)
    {
        c = gUnknown_03001470[a].unk30;
        e = gUnknown_03001470[a].unk34;
        v = gUnknown_08552A40[d];
        dst->unk04 = (dst->unk04 & 0xFC00) + v + oam.tileNum;
        if (v == 0 && gUnknown_03001470[a].unk28 != d
            && a == gUnknown_02029A10[c].entries[e].unk18)
        {
            gUnknown_03001470[a].unk28 = d;
            sub_0804EA54(c, e, gUnknown_08552700[d]);
        }
        if (v == 0x28 && gUnknown_03001470[a].unk2c != d
            && a == gUnknown_02029A10[c].entries[e].unk18)
        {
            gUnknown_03001470[a].unk2c = d;
            sub_0804EAEC(c, e, gUnknown_08552700[d]);
        }
    }
}
