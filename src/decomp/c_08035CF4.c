#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08035CF4.
 * sub_08035CF4 @ 0x08035CF4
 */

/* The `adds r0, #0x2c` ahead of the `ldrb` is the THUMB ldrb displacement limit
 * (0-31), not an address being taken. */
int sub_08035CF4(void)
{
    if (gUnknown_03003FC0.unk2c == 1)
        return 1;

    return 0;
}
