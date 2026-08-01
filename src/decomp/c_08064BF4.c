#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08064BF4.
 * sub_08064BF4 @ 0x08064BF4
 */

/* `adds r1, #0x11` on the DEREFERENCED global before the index add is the ldrb
 * displacement limit, not an address being taken: unk11 is a per-slot byte
 * table indexed by the object's own unk1c, the same key that drives
 * gUnknown_08580934->unk44[]. */
void sub_08064BF4(struct Unk08580934_Obj *obj)
{
    sub_0801F34C(gUnknown_08580934->unk11[obj->unk1c] + 0xBD, obj->unk28 & 0x1FF,
                 (obj->unk2a + 0xC) & 0xFF, 0, 0);
}
