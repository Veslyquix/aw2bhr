#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078968.
 * sub_08078968 @ 0x08078968, sub_08078988 @ 0x08078988
 */

#include "proc.h"

/* `movs r0, #0xd0; lsls r0, r0, #2` is a plain 0x340 -- minimal shift for that
 * value, and the `movs` and the `lsls` write the same register, so it is not
 * wave 23's named constant local. */

void sub_08078968(ProcPtr parent)
{
    sub_0801B780(0x340);
    Proc_StartBlocking(gUnknown_08615BBC, parent);
}

/* A second bare `bx lr` do-nothing callback, same reading as sub_0807823C. */

void sub_08078988(void)
{
}
