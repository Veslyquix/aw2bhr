#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805C268.
 * sub_0805C268 @ 0x0805C268
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805C268.
 * sub_0805C268 @ 0x0805C268
 */


/* `subs #2; lsls #0x18; lsrs #0x18; cmp #1; bls` is a u8-wrapped range test:
 * unk2d is 2 or 3. Both members need an `adds` on the base because 0x2c and
 * 0x2d are past `ldrb`'s 5-bit displacement. */

int sub_0805C268(void)
{
    if (gUnknown_03003FC0.unk2c == 1 && (u8)(gUnknown_03003FC0.unk2d - 2) > 1)
        return 0;

    return 1;
}
