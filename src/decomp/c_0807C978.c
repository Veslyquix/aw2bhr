#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807C978.
 * sub_0807C978 @ 0x0807C978
 */

#include "proc.h"

/* Family F075, third member -- see sub_0802C4B8. Both `varies` entries move
 * together here: a different reset routine (sub_0807F238, which likewise reads
 * no argument register) and Proc_Start instead of Proc_StartBlocking. */

void sub_0807C978(ProcPtr parent)
{
    sub_0807F238();
    Proc_Start(gUnknown_08616638, parent);
}
