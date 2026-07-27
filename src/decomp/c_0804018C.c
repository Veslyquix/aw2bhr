#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804018C.
 * sub_0804018C @ 0x0804018C
 */

#include "proc.h"

struct UnkProc0849FB44
{
    u8 filler_00[0x4c];
    s32 unk_4c;
};

void sub_0804018C(s32 arg0)
{
    ((struct UnkProc0849FB44 *)(Proc_Start(gUnknown_0849FB44, PROC_TREE_3)))->unk_4c = arg0;
}
