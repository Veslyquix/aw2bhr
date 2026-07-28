#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080366C4.
 * sub_080366C4 @ 0x080366C4, sub_080366D0 @ 0x080366D0
 */

void sub_080366C4(void (*fn)(void))
{
    gUnknown_030040EC = fn;
}

void sub_080366D0(void (*fn)(void))
{
    gUnknown_030040D0 = fn;
}
