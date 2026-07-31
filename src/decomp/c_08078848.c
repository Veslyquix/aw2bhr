#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078848.
 * sub_08078848 @ 0x08078848
 */

#include "proc.h"

/* The three-builder member of the src/decomp/c_08078864.c chain: the single
 * `movs r0, #0` sits between the first `bl` and the second, and there is
 * nothing at all between the middle three, so those three are a NEST and not
 * three statements -- three statements would each have had to reload r0. The
 * absence of any `lsl`/`lsr` pair between two `bl`s is also what keeps every
 * link int-wide. */

void sub_08078848(void)
{
    sub_080785FC();
    sub_080786A4(sub_08078608(sub_080786F0(0)));
    sub_08078740();
}
