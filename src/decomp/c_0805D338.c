#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805D338.
 * sub_0805D338 @ 0x0805D338
 */

/* Family F008, exemplar src/decomp/c_08010F94.c. The store is `strh`, and so
 * is the exemplar's -- the whole family is halfword stores, gUnknown_03002B5C
 * is declared u16 and gUnknown_03004780 already was too. sub_0805FFA0's shared
 * epilogue writes 2 into the same global the same way. */

void sub_0805D338(void)
{
    gUnknown_03004780 = 5;
}
