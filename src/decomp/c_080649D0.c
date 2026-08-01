#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080649D0.
 * sub_080649D0 @ 0x080649D0
 */

/* The four-entry table is COPIED to the stack before it is read -- that is what
 * the function does, not an artefact -- so the id lands in r0 from the buffer
 * and is reused as sub_0801F34C's first argument without being reloaded. The
 * two arms differ only in the +8 bias on the x coordinate. */
void sub_080649D0(struct Unk08580934_Obj *obj)
{
    u16 buf[4];

    sub_0808B6E8(buf, gUnknown_0816E0C8, 8);

    if (buf[obj->unk48] == 0xCB)
        sub_0801F34C(buf[obj->unk48], (obj->unk28 + 8) & 0x1FF,
                     (obj->unk2a + 0xC) & 0xFF, 0, 0);
    else
        sub_0801F34C(buf[obj->unk48], obj->unk28 & 0x1FF,
                     (obj->unk2a + 0xC) & 0xFF, 0, 0);
}
