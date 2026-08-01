#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063760.
 * sub_08063760 @ 0x08063760
 */

#include "hardware.h"

/* The masked index is a local: written inline, agbcc loads the palette pool
 * word into r2 and copies it to r0 afterwards, where the ROM loads straight
 * into r0 between the `ands` and the `adds #0x10`. */
void sub_08063760(int a1)
{
    int n = a1 & 0xF;

    ApplyPalettes(gUnknown_0812B81C, n + 0x10, 1);
}
