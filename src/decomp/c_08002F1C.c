#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002F1C.
 * sub_08002F1C @ 0x08002F1C, sub_08002FE4 @ 0x08002FE4
 */

/* Draws the 5x4 grid of unit icons from a 20-halfword template copied onto the
 * stack. `k` walks the template flat while `i` and `j` place the cell: `x`
 * steps 0x14 across a row from 0x4C, `y` steps 0x19 down from 0x13.
 *
 * `gUnknown_08485CC8[i + 1]` is why `adds r6, #1` sits in the middle of the
 * body rather than at the bottom -- the same idiom the matched sub_08003640
 * uses on gUnknown_08485C9C, and it is what makes the counter run 1..4 while
 * the coordinate givs run from the i = 0 origin.
 *
 * The `lsls #0x10` hoisted into the outer loop with only the `lsrs #0x10` left
 * at the call is LICM on the u16 conversion sub_0802BD54's second parameter
 * forces; it must not be authored. */
void sub_08002F1C(void)
{
    u16 buf[0x14];
    int i, j, k, x, y;
    u16 t;

    sub_0808B6E8(buf, gUnknown_0808D728, 0x28);
    y = 0x13;
    k = 0;
    for (j = 0; j <= 4; j++)
    {
        x = 0x4C;
        for (i = 0; i <= 3; i++)
        {
            t = buf[k];
            sub_0802BD54((x + 0xA) & 0x1FF, (y + 0x10) | 0x400, sub_0800C8A0(t));
            sub_0801BD00((x + 2) & 0x1FF, y | 0x400, gUnknown_08485CC8[i + 1],
                         sub_08001D04(t) << 12);
            x += 0x14;
            k++;
        }
        y += 0x19;
    }
}

/* Loads the four unit-slot graphics named by a 4-byte template on the stack.
 *
 * `gUnknown_08485C9C[i + 1]` is the same spelling the matched sub_08003640
 * (src/decomp/c_08003640.c) uses on the same table, and it is what puts
 * `adds r4, #1` between the two array reads: the template is indexed with the
 * pre-increment value and the tile table with the post-increment one. */
void sub_08002FE4(void)
{
    u8 buf[4];
    int i;

    sub_0808B6E8(buf, gUnknown_0808D750, 4);
    sub_0801A444(9, 2, 0xB, 0x11);
    sub_08013AD4(2);
    for (i = 0; i <= 3; i++)
    {
        sub_0803F6BC(buf[i] & 0x1F, 0,
                     (void *)(0x06010000 + (gUnknown_08485C9C[i + 1] << 5)), 1);
    }
}
