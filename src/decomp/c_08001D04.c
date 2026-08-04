#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08001D04.
 * sub_08001D04 @ 0x08001D04, sub_08001D24 @ 0x08001D24
 */

/* A linear search over the byte pairs at gUnknown_084859E0: key, value, with
 * 0xFF terminating the table and 0xE returned when the key is absent.
 *
 * The `result` local is what puts the 0xE ahead of the loop -- both exits
 * arrive at one `bx lr` with the value already in r0, so this cannot be spelled
 * as two returns. The table pointer is initialised FIRST: source order is what
 * puts the pool `ldr` ahead of the `movs`, and swapping the two statements
 * swaps the two instructions (measured, wave 42).
 *
 * The key test comes first and the terminator test is the loop's exit
 * condition, so the shape is `for (;;)` with both breaks. A `while (p[0] != key)`
 * header emits the 0xFF compare first and costs an extra `adds r0, r3, #0` on
 * the not-found path. */
int sub_08001D04(int a1)
{
    const u8 *p;
    int result;

    p = gUnknown_084859E0;
    result = 0xE;
    for (;;)
    {
        if (p[0] == a1)
        {
            result = p[1];
            break;
        }
        if (p[0] == 0xFF)
            break;
        p += 2;
    }
    return result;
}

/* Look up an id in gUnknown_0200B224 and return its index, or -1.
 *
 * gUnknown_0200B0B0->unk07 selects both the mask and the entry count: 0x1F over
 * 17 entries, or 0x3F over 20. The two arms are structurally identical but the
 * ROM carries both bodies -- they share only the `return i` block and the -1
 * tail, which agbcc cross-jumps on its own.
 *
 * unk07 is the plain `s8` member: the `ldrb; lsls #0x18; asrs #0x18` here is
 * what agbcc emits for it when the base pointer is already in a register, and
 * is not evidence of a cast (src/decomp/c_08002EC8.c reads the same member and
 * gets the reg+reg `ldrsb` form instead).
 *
 * The `ldrh` on the s16 unk00 is the mask narrowing the load: only the low 5 or
 * 6 bits survive, so agbcc drops the sign extension. */
int sub_08001D24(int a1)
{
    int i;

    if (gUnknown_0200B0B0->unk07 == 0)
    {
        a1 &= 0x1F;
        for (i = 0; i <= 0x10; i++)
        {
            if ((gUnknown_0200B224[i].unk00 & 0x1F) == a1)
                return i;
        }
    }
    else
    {
        a1 &= 0x3F;
        for (i = 0; i <= 0x13; i++)
        {
            if ((gUnknown_0200B224[i].unk00 & 0x3F) == a1)
                return i;
        }
    }

    return -1;
}
