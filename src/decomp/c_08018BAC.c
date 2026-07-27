#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08018BAC.
 * sub_08018BAC @ 0x08018BAC
 */

struct UnkC528Node
{
    u8 filler_00[4];
    struct UnkC528Node *unk04;
};
struct UnkC528
{
    struct UnkC528Node *unk00;
    struct UnkC528Node *unk04;
    u8 filler_08[0x10];
};
extern struct UnkC528 gUnknown_0200C528[];

bool8 sub_08018BAC(s16 a)
{
    gUnknown_0200C528[a].unk04 = gUnknown_0200C528[a].unk04->unk04;
    return TRUE;
}
