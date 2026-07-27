#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08025CF0.
 * sub_08025CF0 @ 0x08025CF0
 */

u8 sub_08025CF0(int index)
{
    return gUnknown_08499598[index].unk3a;
}
