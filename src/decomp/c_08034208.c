#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034208.
 * sub_08034208 @ 0x08034208
 */

#include "proc.h"

/* The script is picked out of a ROM table by gUnknown_0849B060->unk0d, the
 * same shape as sub_080342DC's fixed-script start one block down. */
void sub_08034208(ProcPtr parent)
{
    Proc_StartBlocking(gUnknown_0849BC44[gUnknown_0849B060->unk0d], parent);
    sub_0803BD54();
}
