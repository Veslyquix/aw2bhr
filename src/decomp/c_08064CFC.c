#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08064CFC.
 * sub_08064CFC @ 0x08064CFC
 */

/* sub_08064CA8's downward twin: same integrator, but the object is drawn first
 * and the bound is the bottom of the screen rather than the top. The `movs r1,
 * #0x2a; ldrsh r0, [r4, r1]` after the call is a genuine re-read -- the
 * sub_08064BF4 call clobbered the register the store left the value in. */
void sub_08064CFC(struct Unk08580934_Obj *obj)
{
    obj->unk3a += obj->unk3c;
    obj->unk2a += obj->unk3a;

    sub_08064BF4(obj);

    if (obj->unk2a > 0xA0)
    {
        gUnknown_08580934->unk2d--;
        sub_08030178();
        sub_08015C30(gUnknown_03001FBC);
    }
}
