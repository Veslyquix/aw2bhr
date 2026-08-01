#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080185A0.
 * sub_080185A0 @ 0x080185A0, sub_080185BC @ 0x080185BC
 */

void sub_080185A0(void)
{
    sub_08011E54(gUnknown_08499588, (void *)0x06006800, 0x200);
}

/* sub_08017ABC's shape exactly: an installed callback that clears the slot's
 * own callback word when its predicate fails, reusing the compare's zero for
 * the store. The bare `cmp r0, #0` with no narrowing is what makes
 * sub_08014824's return at least `int`. */
void sub_080185BC(struct Unk0200C528 *slot)
{
    if (sub_08014824() == 0)
        slot->unk08 = NULL;
}
