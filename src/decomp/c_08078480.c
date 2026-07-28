#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078480.
 * sub_08078480 @ 0x08078480
 */

#include "proc.h"
struct Unk8078480
{
    /* 0x00 */ u8 filler_00[0x54];
    /* 0x54 */ void * unk_54;
};

void sub_08078480(void * arg, ProcPtr parent)
{
    ((struct Unk8078480 *)Proc_StartBlocking(gUnknown_0861598C, parent))->unk_54 = arg;
}
