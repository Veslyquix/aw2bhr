#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08028874.
 * sub_08028874 @ 0x08028874
 */

void sub_08028874(int index, u8 value)
{
    gUnknown_08499598[index].unk14 = gUnknown_03004080;
    gUnknown_08499598[index].unk13 = value;
}
