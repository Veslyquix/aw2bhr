#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806DFF0.
 * sub_0806DFF0 @ 0x0806DFF0
 */

#include "hardware.h"

/* The map-screen L/R "swap to the other overlay" handler, and an if/else-if
 * chain with five exits that agbcc cross-jumps down to two.
 *
 * All three of this function's pool slots are `-fforce-addr` ADDRESS CONSTANTS
 * and none of them is a global of its own:
 *
 *     [0x0816E1C0] = 0x08580934  ->  gUnknown_08580934
 *     [0x0816E1C4] = 0x0202F2C8  ->  gUnknown_0202F2C8
 *     [0x0816E1C8] = 0x03002EE0  ->  gpKeySt
 *
 * The third one is NOT `gUnknown_03002EE0`. There is no such symbol and none
 * can be created: aw2bhr.lds already binds 0x03002EE0 as `gpKeySt`, wave 20
 * invented the gUnknown_ name for it and the SPLIT build caught it as an
 * undefined reference. See the note under gUnknown_03005920 in
 * include/unknown-globals.h. Every reader in the ROM spells it
 * `ldr rN,=<pool>; ldr rM,[rN]; ldr rM,[rM]`, so the address only ever appears
 * as pool-word content and never as a direct `ldr rN,=gpKeySt`.
 *
 * The two `sub_08015C30(gUnknown_03001FBC)` tails are written out twice
 * because they are two separate early returns in the source; agbcc's
 * cross-jumping merges them into the one block at _0806E03A. Likewise the
 * `1` stored to the stack for sub_08073304's fifth and sixth arguments in the
 * second branch is the SAME register the `unk30 == 1` test just proved to hold
 * 1 -- that is CSE on a known constant, not a different value.
 */
void sub_0806DFF0(void)
{
    sub_0806DF20();

    if (gUnknown_08580934->unk2d != 0)
        return;

    if (gUnknown_0202F2C8 == 0 && (gpKeySt->held & 8))
    {
        sub_08015C30(gUnknown_03001FBC);
        return;
    }

    if (gpKeySt->unk00 & 2)
    {
        gUnknown_0202F2C8 = 1;
        sub_08015C30(gUnknown_03001FBC);
        return;
    }

    if (gUnknown_08580934->unk30 == 0 && (gpKeySt->held & 0x200))
    {
        sub_0803B4DC(0x73);
        sub_080733B8();
        sub_08073304(gUnknown_085802A4, gUnknown_0200FC50, 0x230, 0xf, 1, 1, 3);
        sub_0806D34C();
        sub_0806D53C();
        gUnknown_08580934->unk30 = 1;
        return;
    }

    if (gUnknown_08580934->unk30 == 1 && (gpKeySt->held & 0x100))
    {
        sub_0803B4DC(0x73);
        sub_080733B8();
        sub_08073304(gUnknown_085802AC, gUnknown_0200FC50, 0x230, 0xf, 1, 1, 3);
        sub_0806D620();
        sub_0806D268();
        gUnknown_08580934->unk30 = 0;
        return;
    }

    if (gUnknown_08580934->unk30 == 0)
        sub_0806DE38();

    sub_0806DF58();
}
