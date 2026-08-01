#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003910.
 * sub_08003910 @ 0x08003910
 */

void sub_08003910(void)
{
    sub_080152EC(gUnknown_08485D8C, 0);
    gUnknown_0200B0B0->unk42 = 0xFFF6;
}
