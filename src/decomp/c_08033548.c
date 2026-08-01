#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08033548.
 * sub_08033548 @ 0x08033548
 */

/* Passes the ADDRESS of gUnknown_03004008 -- `ldr r0, =gUnknown_03004008` with
 * no load through it. sub_0802F8FC reads its argument with `ldrh` on the way to
 * SIOMLT_SEND, so the parameter is `u16 *` and the global is the `s32` the
 * header already fixed from its arithmetic users; the cast is byte-neutral. */
void sub_08033548(void)
{
    sub_0802F8FC((u16 *)&gUnknown_03004008, -1);
}
