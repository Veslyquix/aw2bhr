#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080858C0.
 * sub_080858C0 @ 0x080858C0, sub_08085908 @ 0x08085908
 */

/* Decompresses a tile blob into *gUnknown_08499580 and biases every one of the
 * 0x400 halfwords by 0x360. Byte-identical duplicate of sub_08085908, which
 * names gUnknown_0823DF48 instead.
 *
 * The pointer global is re-read INSIDE the loop (`ldr r0,[r4]` every
 * iteration) -- that is what naming a non-const pointer global directly gives,
 * and binding it to a local would hoist the load out. The bias is written
 * `0x360 + x` and not `x + 0x360`: the constant is in the first operand of the
 * `adds`. */
void sub_080858C0(void)
{
    int i;

    gUnknown_030030A0 = 0;
    Decompress(gUnknown_0823DE38, gUnknown_08499580);

    for (i = 0; i <= 0x3ff; i++)
        gUnknown_08499580[i] = 0x360 + gUnknown_08499580[i];

    sub_08013B0C();
}

/* Byte-identical duplicate of sub_080858C0 -- only the source blob differs. */
void sub_08085908(void)
{
    int i;

    gUnknown_030030A0 = 0;
    Decompress(gUnknown_0823DF48, gUnknown_08499580);

    for (i = 0; i <= 0x3ff; i++)
        gUnknown_08499580[i] = 0x360 + gUnknown_08499580[i];

    sub_08013B0C();
}
