#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800BEB8.
 * sub_0800BEB8 @ 0x0800BEB8
 */

/* Two guards then an action, all on the same (x, y) cell: run sub_080011F4
 * with terrain 7 only where sub_0800119C reports 0x13 and sub_0800BCD0 says
 * no. The second `cmp r0, #0; bne` to the same label is the short-circuit
 * `&&`; neither result is narrowed, so both callees are int-wide. */
void sub_0800BEB8(int a, int b)
{
    if (sub_0800119C(a, b, 0x13) && !sub_0800BCD0(a, b))
        sub_080011F4(a, b, 7);
}
