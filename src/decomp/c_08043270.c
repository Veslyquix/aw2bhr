#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043270.
 * sub_08043270 @ 0x08043270, sub_080432A8 @ 0x080432A8
 */

/* Family F038, the shape of the dozen accessors in src/decomp/c_08042E2C.c.
 * The address arithmetic `(a * 65 + b * 17) * 4` is already encoded by
 * struct Unk085D3DD0 (0x104) holding struct Unk085D3DD0Entry unk38[3] (0x44),
 * so the only thing to read out of the assembly is the member: the ROM's
 * `adds r0, #0x4c` is 0x38 + 0x14, i.e. unk14.
 *
 * `movs r1, #0; ldrsh r0, [r0, r1]` is not a variation on the matched siblings
 * -- every member of F038 uses it, including sub_08042E2C/E84/FC4 -- it is just
 * how an s16 member is reached once the offset has been folded onto the base.
 * No re-narrowing after the load, so the return is `int`. */

int sub_08043270(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk38[b].unk14;
}

/* Family F038, the twin of sub_08043270 one member down: the ROM's
 * `adds r0, #0x44` is 0x38 + 0x0c, i.e. unk0c. See the note on sub_08043270. */

int sub_080432A8(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk38[b].unk0c;
}
