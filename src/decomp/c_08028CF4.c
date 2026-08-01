#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08028CF4.
 * sub_08028CF4 @ 0x08028CF4
 */

/* sub_08028B70 returns `int`: the result is tested with a BARE `cmp r0, #0` and
 * only then cast to u8 (`lsls #0x18; lsrs #0x18`) for sub_08019940's u8 first
 * parameter. A narrow return would have been re-narrowed before the compare
 * instead. sub_08028BAC does return a byte -- `lsls r0, #0x18; cmp r0, #0`. */
void sub_08028CF4(void)
{
    int r;

    if (sub_08028BAC())
    {
        sub_08028AEC();
        sub_08028568();
    }
    else
    {
        r = sub_08028B70();

        if (r != 0)
            sub_08019940(r, 0x20);
        else
            sub_08028A68();
    }
}
