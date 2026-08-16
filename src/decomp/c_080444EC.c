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
/* Named per Xenesis's AW2 Subroutine List: "COP Animation - Heals unit 2 HP
 * (Hyper Repair)". The old sub_080444EC symbol is kept as a linker alias
 * below so every other unit keeps resolving it unchanged. */
void HealUnitHyperRepair(void * a)
{
    sub_08029AF8(a, 2, 0);
}

asm(".global sub_080444EC\n.thumb_set sub_080444EC, HealUnitHyperRepair\n");

/* F079 -- a three-argument forwarder that passes its own argument through
 * untouched and supplies the other two as literals.
 *
 * The forwarded argument costs no instruction, so its width and its arity are
 * invisible here; both come off sub_08029AF8's prologue, which is
 * `adds r5,r0,#0 with a later `ldrb [r5]`, then two narrowings`. The `movs r1; movs r2` order is
 * agbcc's argument setup grouped by operand class -- every `mov #imm8`
 * together -- not source order.
 */
/* Named per Xenesis's AW2 Subroutine List: "COP Animation - Heals unit 5 HP
 * (Hyper Upgrade)". The old sub_080444FC symbol is kept as a linker alias
 * below so every other unit keeps resolving it unchanged. */
void HealUnitHyperUpgrade(void * a)
{
    sub_08029AF8(a, 5, 0);
}

asm(".global sub_080444FC\n.thumb_set sub_080444FC, HealUnitHyperUpgrade\n");
