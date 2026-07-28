#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017860.
 * sub_08017860 @ 0x08017860
 */

u8 sub_08017860(int index)
{
    return gUnknown_0200C420.unk20[index];
}
