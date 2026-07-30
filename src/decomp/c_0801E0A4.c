#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801E0A4.
 * sub_0801E0A4 @ 0x0801E0A4
 */

/* MATCHED, and the first of a byte-identical pair with sub_0801EFC0. Pushes
 * the whole OAM shadow to hardware. Both constants are materialised by shift
 * (`movs #0xe0; lsls #0x13` for 0x07000000 and `movs #0x80; lsls #3` for 0x400)
 * rather than from the pool, which is agbcc's own choice and needs nothing in
 * the source. */
void sub_0801E0A4(void)
{
    sub_08011C90(gUnknown_03002520, (void *)0x07000000, 0x400);
}
