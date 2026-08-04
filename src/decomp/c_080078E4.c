#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080078E4.
 * sub_080078E4 @ 0x080078E4
 */

/* MATCHED, wave 42 (W42-B2). Byte-for-byte identical.
 *
 * The one finding that closed it, and it is general: AGBCC EMITS SWITCH CASE
 * BODIES IN SOURCE ORDER, so the ROM's block order reads the original's case
 * order straight off. This body was 95.3% and size-exact with the cases
 * written in ascending case-value order (6, 8, 10, 11, 14); the ROM's five
 * blocks assign 0,1,2,3,4 in address order, so the source lists them ordered
 * by the ASSIGNED value, not by the case label. Reordering was the whole
 * difference -- 10 bytes, all of them in the jump table and the block
 * sequence. The last block in source order is the one with no trailing `b`.
 * sub_080077EC's switch is the same table with the values mirrored and its
 * blocks run 4,3,2,1,0, i.e. descending by assigned value.
 *
 * Two other things were worth a probe each:
 *   - `b = (b - 1) << 6;` REASSIGNS THE PARAMETER rather than binding a new
 *     local. That is what puts the shifted value back in b's own register
 *     (`lsls r5, r0, #6`) and drops the whole function from four callee-saved
 *     registers to three. It also stopped jump.c's duplicate_loop_exit_test
 *     from copying the second loop's `(v = *s++) != 0xFF` test to the top:
 *     with the copy the loop is entered by a 4-instruction guard, without it
 *     by the ROM's single `b` to the bottom test. One source change, both
 *     effects.
 *   - the table's second halfword is `e[1]` off a bound pointer, not a second
 *     subscript of the array. `gUnknown_084887AC[(b + k*5)*2 + 1]` recomputes
 *     the whole address; `e = &gUnknown_084887AC[(b + k*5)*2]` then e[0]/e[1]
 *     gives the ROM's `ldrh r1,[r0]` / `ldrh r0,[r0,#2]` pair. fold turns the
 *     doubled index into the `lsls #2` byte scale.
 * `int v` and not `u16 v`: a u16 local makes `v |= b` re-truncate with an
 * lsl/lsr pair the ROM has not.
 */

void sub_080078E4(int a, int b)
{
    u16 *q;
    const u16 *s;
    const u16 *e;
    int k;
    int v;

    k = 0;
    q = (u16 *)gUnknown_0200B224;
    if (a == 0)
    {
        s = gUnknown_08488810;
        while (*s != 0xFF)
        {
            v = *s++;
            if (v & 0xE0)
            {
                switch (v & 0x1F)
                {
                case 8:
                    k = 0;
                    break;
                case 6:
                    k = 1;
                    break;
                case 14:
                    k = 2;
                    break;
                case 10:
                    k = 3;
                    break;
                case 11:
                    k = 4;
                    break;
                }
                e = &gUnknown_084887AC[(b + k * 5) * 2];
                *q++ = e[0];
                *q++ = e[1];
                s++;
            }
            else
            {
                *q++ = v;
                *q++ = *s++;
            }
        }
    }
    else
    {
        s = gUnknown_08488856;
        b = (b - 1) << 6;
        while ((v = *s++) != 0xFF)
        {
            if (v != 0x19)
                v |= b;
            *q++ = v;
            *q++ = v;
        }
    }
}
