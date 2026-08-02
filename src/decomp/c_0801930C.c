#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801930C.
 * sub_0801930C @ 0x0801930C, sub_08019348 @ 0x08019348, sub_08019380 @ 0x08019380
 */

/* sub_08019290's scan with the hit handled instead of returned: every slot
 * holding this script is torn down through sub_080192EC, and the function
 * still returns the not-found -1 unconditionally. The loop does NOT stop at
 * the first hit -- there is no branch out of the body -- so the counter has to
 * survive the call and moves from r1 to callee-saved r4, which is the only
 * difference from sub_08019290's stream. */
int sub_0801930C(const u8 *a)
{
    s16 i;

    for (i = 0; i < 10; i++)
    {
        if (gUnknown_0200C528[i].unk00 == (struct Unk0200C528Node *)a)
            sub_080192EC(i);
    }
    return -1;
}

/* Start a script now, or queue it: if any gUnknown_0200C528 slot is still busy
 * (sub_08019260) the script is parked in the first free gUnknown_0200C508
 * slot; otherwise it runs immediately through sub_080193B0.
 *
 * The guard is written NEGATED and the immediate-start arm comes FIRST. That
 * is not cosmetic: with the arms the other way round agbcc emits `beq` and
 * lays the sub_080193B0 call last, and the queue loop then keeps a second
 * pointer pseudo alive (an extra `adds r1, r2, #0` per iteration) instead of
 * bumping one in place.
 *
 * `return` and not `break`: `break` leaves the loop with two exits that both
 * fall into the epilogue, which costs the same extra copy. With `return` the
 * loop reduces to a single pointer biv (`adds r1, #4`) plus the `i` counter,
 * and the store block is laid out ahead of the loop. */
void sub_08019348(const u8 *a)
{
    int i;

    if (!sub_08019260())
    {
        sub_080193B0(a);
        return;
    }

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200C508[i] == NULL)
        {
            gUnknown_0200C508[i] = a;
            return;
        }
    }
}

/* Pop the most recently queued gUnknown_0200C508 script and start it. The
 * sweep runs BACKWARDS from slot 7 and stops at the first non-NULL entry.
 *
 * The source counts down and the ROM counts down: `subs r1,#1; cmp r1,#0; bge`
 * is a genuine descending source loop, not check_dbra_loop's reversal of an
 * ascending one (that leaves a `bne`).
 *
 * `return` and not `break`, and this one is worth 12 bytes. With `break` the
 * loop is never strength-reduced: the array address then has three references
 * left at expand time, agbcc's -fforce-addr gives it a private `.rodata` word,
 * and the resulting `ldr r1,[r3]` inside the loop is not loop-invariant to
 * loop.c, so the index math is recomputed every iteration. With `return` the
 * address has one reference, gets an ordinary direct pool word, and
 * strength_reduce produces the ROM's single descending pointer biv -- the
 * `ldr r0,=g; adds r4,r0,#0; adds r4,#0x1c` preheader is that giv's
 * initialiser (base + 7*4), NOT a source `&gUnknown_0200C508[7]`. */
void sub_08019380(void)
{
    int i;

    for (i = 7; i >= 0; i--)
    {
        if (gUnknown_0200C508[i] != NULL)
        {
            sub_080193B0(gUnknown_0200C508[i]);
            gUnknown_0200C508[i] = NULL;
            return;
        }
    }
}
