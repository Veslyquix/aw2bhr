#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806362C.
 * sub_0806362C @ 0x0806362C
 */

#include "hardware.h"

/* Wait for the serial transfer to finish, then settle. REG_SIOCNT's bit 7 is
 * the busy/start flag; the counter is a bail-out so a dead cable cannot hang
 * the game, and sub_08063614(0x258) is the hand-written cycle delay run
 * afterwards either way.
 *
 * The rotated `do/while` under an `if` is the source, not the optimiser: the
 * guard's `movs r0, #0x80` is written inline while the loop body's is hoisted
 * into r4 alongside the 0x795C limit, so the preheader between the two tests
 * is real. agbcc does not rotate the plain `while` spelling -- it leaves the
 * condition at the top of the loop and never emits this shape. */
void sub_0806362C(void)
{
    int i = 0;

    if (REG_SIOCNT & 0x80)
    {
        do
        {
            i++;

            if (i > 0x795C)
                break;
        } while (REG_SIOCNT & 0x80);
    }

    sub_08063614(0x258);
}
