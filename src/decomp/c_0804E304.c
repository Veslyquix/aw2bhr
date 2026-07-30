#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804E304.
 * sub_0804E304 @ 0x0804E304
 */

/* MATCHED. Byte-for-byte the same function as sub_0804D8F8 -- identical
 * instruction stream and identical pool words. One C body, two
 * addresses; read that one for the derivation. */
void sub_0804E304(void)
{
    sub_0804DC5C(gUnknown_03001470[gUnknown_03001FBC].unk30,
        gUnknown_03001470[gUnknown_03001FBC].unk34, gUnknown_03001FBC);
}
