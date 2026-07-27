#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080157F4.
 * sub_080157F4 @ 0x080157F4
 */

void sub_080157F4(s16 a, u16 b)
{
    gUnknown_0200E438[gUnknown_03001470[a].unk26].unk3e = b;
}
