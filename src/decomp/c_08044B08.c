#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044B08.
 * sub_08044B08 @ 0x08044B08
 */

void sub_08044B08(u8 a1, u8 a2, u8 a3)
{
    sub_08039ACC(a1, a2, 0x51CA, a3);
}
