#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080639E8.
 * sub_080639E8 @ 0x080639E8
 */

/* `lsls #0x15; lsrs #0x10` is a net LEFT shift of five under a (u16) cast,
 * i.e. `(u16)(n * 0x20)`, and it has to be a MULTIPLY: shorten_binary_op folds
 * a MULT_EXPR into the narrow mode where a shift would need a third
 * instruction. Unlike sub_08063760 there is no mask, so the ApplyPalettes
 * macro does not fit -- the truncation is in the source. */
void sub_080639E8(int a1)
{
    ApplyPaletteExt(gUnknown_08131B4C, (u16)(a1 * 0x20), 0x20);
}
