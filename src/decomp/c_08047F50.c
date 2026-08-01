#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08047F50.
 * sub_08047F50 @ 0x08047F50
 */

struct Unk47F50
{
    u8 filler_00[0x24];
    u16 unk_24;
    u16 unk_26;
};

/* unk_26 is read into a binding local BEFORE the unk_24 test: the ROM's
 * `ldrh r2, [r1, #0x26]` sits above the `cmp`, where a plain `p->unk_26++`
 * inside the branch loads it after. */
void sub_08047F50(struct Unk47F50 *p)
{
    u16 v;

    if (p->unk_26 > 0x61)
        p->unk_26 = 0;

    v = p->unk_26;
    if (p->unk_24 == 0)
        p->unk_26 = v + 1;
    else
        p->unk_24--;
}
