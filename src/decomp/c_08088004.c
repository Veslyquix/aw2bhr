#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08088004.
 * sub_08088004 @ 0x08088004
 */

#include "proc.h"
#include "hardware.h"

void sub_08088004(ProcPtr proc)
{
    gUnknown_03005908 = 0;
    sub_0808A5C4();
    sub_0801A5B0(1);
    sub_0802D5CC(gUnknown_03005958[0], 8);
    sub_0808A47C();
    Proc_Start(gUnknown_08616EB4, proc);
}
