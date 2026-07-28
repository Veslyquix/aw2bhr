#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08087884.
 * sub_08087884 @ 0x08087884
 */

#include "proc.h"
struct Unk8087884Proc
{
    u8 filler_00[0x54];
    int unk54;
};

void sub_08087884(int a, ProcPtr parent)
{
    ((struct Unk8087884Proc *)Proc_Start(gUnknown_08616D94, parent))->unk54 = a;
}
