#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806DC50.
 * sub_0806DC50 @ 0x0806DC50
 */

void sub_0806DC50(int i)
{
    struct Unk08580934_Obj *obj = gUnknown_08580934->unk54[i];

    if (obj->unk47 == 1 || obj->unk48 != 0)
        sub_0806CFC8(obj->unk28 + 9, obj->unk2a - 0x10);

    if (obj->unk47 == 1 || obj->unk48 < obj->unk4b - 1)
        sub_0806D050(obj->unk28 + 9, obj->unk2a + 0x1f);
}
