#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807F414.
 * sub_0807F414 @ 0x0807F414
 */

#include "hardware.h"
#include "proc.h"

/* The `ldrh` immediately after the `strh` is the VOLATILE tell, and
 * gUnknown_03001FFC is already declared `volatile u16` in include/hardware.h on
 * exactly this evidence from sub_08078F00. Without it agbcc forwards the stored
 * value and re-narrows with `lsls #0x10; lsrs #0x10` instead of reloading.
 * `bls` is an UNSIGNED compare, which is what the u16 promotes to. */
void sub_0807F414(ProcPtr proc)
{
    gUnknown_03001FFC++;

    if (gUnknown_03001FFC > 0xF)
        Proc_Break(proc);
}
