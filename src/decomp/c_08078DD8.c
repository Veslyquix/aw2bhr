#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078DD8.
 * sub_08078DD8 @ 0x08078DD8
 */

/* Bumps one counter and drops another, but only on the frames bit 0 of
 * gUnknown_03004008 selects. sub_0807B858 is the same function on a different
 * pair of counters. */

void sub_08078DD8(void)
{
    if (gUnknown_03004008 & 1)
    {
        gUnknown_0300200C++;
        gUnknown_03002000--;
    }
}
