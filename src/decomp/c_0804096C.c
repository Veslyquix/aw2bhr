#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804096C.
 * sub_0804096C @ 0x0804096C
 */

/* Family F072, second member -- see sub_080215B8. The bracketing here is
 * legible: sub_0802C57C saves gUnknown_03003F24.pos into gUnknown_030044A4 and
 * sub_0802C594 puts it back, so the two middle calls run with the position
 * stashed. */

void sub_0804096C(void)
{
    sub_0802C57C();
    sub_080424FC();
    sub_0802C594();
    sub_08034F48();
}
