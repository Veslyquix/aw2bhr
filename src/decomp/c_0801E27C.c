#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801E27C.
 * sub_0801E27C @ 0x0801E27C
 */

void sub_0801E27C(int index, u16 a, u16 b, u16 c)
{
    gUnknown_0200F720[index].unk06 = a;
    gUnknown_0200F720[index].unk08 = b;
    gUnknown_0200F720[index].unk0a = c;
}
