#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004D74.
 * sub_08004D74 @ 0x08004D74
 */

/* Two pool words for one array element -- `ldr r2,=gUnknown_08610A38;
 * ldr r3,=0x27E8; adds r2,r2,r3; ldr r2,[r2]` -- is `-fforce-addr` holding the
 * BASE address in its own register and then adding a byte offset too large for
 * `adds #imm8`. It is a constant subscript, not a variable one:
 * 0x27E8 / 4 == 0x9FA on the `u8 *[]` element type.
 *
 * Both parameters are pass-throughs, invisible here (no argument register is
 * written before the `bl`), and are read off sub_08004DD4. */
void sub_08004D74(int a, int b)
{
    sub_08004DD4(a, b, gUnknown_08610A38[0x9fa], 0);
}
