#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080444EC.
 * sub_080444EC @ 0x080444EC, sub_080444FC @ 0x080444FC
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080444EC.
 * sub_080444EC @ 0x080444EC
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080444FC.
 * sub_080444FC @ 0x080444FC
 */


/* F079 -- a three-argument forwarder that passes its own argument through
 * untouched and supplies the other two as literals.
 *
 * The forwarded argument costs no instruction, so its width and its arity are
 * invisible here; both come off sub_08029AF8's prologue, which is
 * `adds r5,r0,#0 with a later `ldrb [r5]`, then two narrowings`. The `movs r1; movs r2` order is
 * agbcc's argument setup grouped by operand class -- every `mov #imm8`
 * together -- not source order.
 */
void sub_080444EC(void * a)
{
    sub_08029AF8(a, 2, 0);
}

/* F079 -- a three-argument forwarder that passes its own argument through
 * untouched and supplies the other two as literals.
 *
 * The forwarded argument costs no instruction, so its width and its arity are
 * invisible here; both come off sub_08029AF8's prologue, which is
 * `adds r5,r0,#0 with a later `ldrb [r5]`, then two narrowings`. The `movs r1; movs r2` order is
 * agbcc's argument setup grouped by operand class -- every `mov #imm8`
 * together -- not source order.
 */
void sub_080444FC(void * a)
{
    sub_08029AF8(a, 5, 0);
}
