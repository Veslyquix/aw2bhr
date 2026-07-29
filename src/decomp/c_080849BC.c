#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080849BC.
 * sub_080849BC @ 0x080849BC
 */

/* Family F017, exemplar src/decomp/c_080198AC.c: a word `str` of a small
 * constant into a scalar global, no frame. gUnknown_03005940 is already
 * declared `int`. */

void sub_080849BC(void)
{
    gUnknown_03005940 = 0;
}
