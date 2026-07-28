#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017B8C.
 * sub_08017B8C @ 0x08017B8C, sub_08017BB0 @ 0x08017BB0
 */

bool8 sub_08017B8C(s16 a)
{
    struct UnkC528Node *p = gUnknown_0200C528[a].unk04;

    *(u16 *)p->unk04 = p->unk0c;
    gUnknown_0200C528[a].unk04 = p + 1;
    return TRUE;
}

bool8 sub_08017BB0(s16 a)
{
    struct UnkC528Node *p = gUnknown_0200C528[a].unk04;

    *(u32 *)p->unk04 = p->unk0c;
    gUnknown_0200C528[a].unk04 = p + 1;
    return TRUE;
}
