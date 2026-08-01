#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080180A8.
 * sub_080180A8 @ 0x080180A8, sub_080180CC @ 0x080180CC
 */

/* The countdown half of the sub_080180CC install/remove pair: sub_080180CC
 * counts +0x11 up to 0xf and installs this one, which counts back down and
 * clears the slot's own callback at zero. The parameter is the SLOT, not a
 * node: +0x08 is the callback word and +0x0e the counter.
 *
 * The counter is `s16`. The step itself is `ldrh`/`strh` -- movhi needs no
 * extension either way -- but the test reloads it with `ldrsh`, which is
 * extendhisi2 on a SIGNED member; an unsigned one would have been `ldrh`. The
 * stored zero is the compare's own zero, reused. */
void sub_080180A8(struct Unk0200C528 *slot)
{
    slot->unk0e--;
    sub_08018018(slot->unk0e);

    if (slot->unk0e == 0)
    {
        slot->unk0e = 0;
        slot->unk08 = NULL;
    }
}

/* sub_080180A8's twin, counting up to 0xf and then installing it. The `ldrb`
 * on gUnknown_03002F08.unk02 -- a `u16` -- is the u8-context read that fixes
 * sub_0801815C's parameter at `u8`. The +8 slot is declared
 * `struct Unk0200C528Node *` because sub_08018B40 stores a node link there;
 * this half of the union stores a function, so it is cast rather than retyped
 * (the sub_08017B08 precedent). */
void sub_080180CC(struct Unk0200C528 *slot)
{
    slot->unk0e++;
    sub_08018018(slot->unk0e);

    if (slot->unk0e == 0xf)
    {
        sub_0801815C(gUnknown_03002F08.unk02);
        slot->unk08 = (struct Unk0200C528Node *)sub_080180A8;
    }
}
