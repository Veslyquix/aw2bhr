#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08045770.
 * sub_08045770 @ 0x08045770
 */

/* One of three identical wrappers -- sub_08038548 and sub_08038568 are the
 * others, and the only thing that changes between them is the callback.
 * The `lsls #24; lsrs #24` between the two calls is the s8 -> u8 conversion
 * of sub_08016D04's result for sub_0803D73C's `u8` first parameter; see the
 * prototypes in include/unknown-functions.h for how both widths were settled.
 * `pop {r0}; bx r0` -- void.
 */
void sub_08045770(void)
{
    sub_0803D73C(sub_08016D04(gUnknown_03003FC0.unk01), sub_0803B8A0);
}
