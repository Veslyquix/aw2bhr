#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080191B0.
 * sub_080191B0 @ 0x080191B0
 */

/* The reset for the whole gUnknown_0200C528 list system: clear the ten slots,
 * clear the eight gUnknown_0200C508 script pointers, then re-init the
 * subsystems and re-upload the two 0x200-byte tile blocks.
 *
 * Both loops are the `s16 i` shape of the already-matched sub_08019260
 * (src/decomp/c_08019260.c): the counter is kept zero-extended and
 * sign-extended at each use, and `i < 10` / `i < 8` come out as `cmp #9` /
 * `cmp #7` with `ble`. Neither loop is strength-reduced -- the index math is
 * recomputed every iteration -- which is what the s16 round-trip costs and is
 * NOT something an index spelling can change (wave 37, W37-N).
 *
 * 0x200 is materialised once into r4 and copied into r2 for both
 * sub_08011C68 calls: it is not an imm8, so gcc CSEs the
 * `movs r4,#0x80; lsls r4,#2` pair across the pair of calls. */
void sub_080191B0(void)
{
    s16 i;

    sub_080198C4();

    for (i = 0; i < 10; i++)
        gUnknown_0200C528[i].unk00 = NULL;

    for (i = 0; i < 8; i++)
        gUnknown_0200C508[i] = NULL;

    sub_0803CB8C();
    gUnknown_03002EF0 = 0;
    gUnknown_03001404 = 0;
    sub_0801797C();
    sub_080179AC();
    sub_08017A0C();
    gUnknown_03002F08.unk00 = 8;
    gUnknown_03002F08.unk02 = 0xFFFF;
    sub_08011C68(gUnknown_08499588, (void *)0x06006800, 0x200);
    sub_08011C68(gUnknown_0849958C, (void *)0x0600E000, 0x200);
}
