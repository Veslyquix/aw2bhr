#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08061CDC.
 * sub_08061CDC @ 0x08061CDC
 */

void sub_08061CDC(void)
{
    struct Unk084995A0 *p;
    int i;

    p = gUnknown_084995A0;

    for (i = 0; i < 92; i++)
    {
        /* Descending element order -- agbcc keeps the three stores in source
         * order, and the ROM has them at +5, +4, +3. */
        p->unk03[2] = 0;
        p->unk03[1] = 0;
        p->unk03[0] = 0;
        p++;
    }
}
