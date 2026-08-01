#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801D348.
 * sub_0801D348 @ 0x0801D348
 */

/* A two-way dispatch on bit 0 of argument 1. The `long long` seventh argument
 * is not a guess: the pair of adjacent word loads carries agbcc's own "created
 * by thumb_load_double_from_address" note and lands in sub_0801E338's declared
 * 64-bit slot, which forces the 8-byte alignment that puts it at +0x24. */
void sub_0801D348(int a, int b, int c, int d, int e, int f, long long g, u16 h)
{
    if (a & 1)
        sub_0801E4B0(e, b, c, d, f);
    else
        sub_0801E338(e, b, c, d, g, (s16)h);
}
