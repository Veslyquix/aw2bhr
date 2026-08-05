#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08085888.
 * sub_08085888 @ 0x08085888
 */

/* Three runs of sub_08071AF0(id, 8, proc) over the ids 0..5, 8, and 0x10..0x16
 * -- the middle one is a single call, not a one-trip loop: the ROM sets its
 * first argument with `movs r0, #8` and never touches the counter, where a
 * `for (i = 8; i <= 8; ...)` would still emit the increment and the test. */

void sub_08085888(ProcPtr proc)
{
    int i;

    for (i = 0; i <= 5; i++)
        sub_08071AF0(i, 8, proc);
    sub_08071AF0(8, 8, proc);
    for (i = 0x10; i <= 0x16; i++)
        sub_08071AF0(i, 8, proc);
}
