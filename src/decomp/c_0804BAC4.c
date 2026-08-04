#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804BAC4.
 * sub_0804BAC4 @ 0x0804BAC4
 */

/* A timing loop in front of a CpuFastSet, and the sibling sub_0804BB74 has the
 * same tail (`ldr; ldr; ands 0x1fffff; bl CpuFastSet`) reached through its own
 * private -fforce-addr copy of &gUnknown_085519FC at 0x08136044, where this one
 * uses the copy at 0x08136040.
 *
 * The inner counter advances in the INCREMENT CLAUSE, not the body. With
 * `for (j = 0; j < 15; j++) n++;` agbcc emits the body first and the reversed
 * counter second (`adds r3,#1; subs r0,#1`); the ROM has them the other way
 * round, which is check_dbra_loop rewriting the FIRST of two comma-separated
 * increments and leaving the second where it stands. Writing it descending as
 * `for (j = 14; j >= 0; j--) n++;` was probed too and gives the body-first
 * order as well -- the comma is the only spelling that flips the pair. */
void sub_0804BAC4(int a, void *b, u32 c, int d)
{
    int i;
    int j;
    int n;

    if (d != 0)
    {
        n = 0;

        for (i = 0; i <= 0x2c; i++)
        {
            for (j = 0; j < 15; j++, n++)
                ;

            n += 17;

            if (n + 15 > 0x800)
                break;
        }
    }
    else
    {
        for (i = 0; i < 0x800; i++)
            ;
    }

    CpuFastSet(gUnknown_085519FC, b, (c >> 2) & 0x1fffff);
}
