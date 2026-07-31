#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807823C.
 * sub_0807823C @ 0x0807823C
 */

#include "proc.h"

/* A bare `bx lr`. No caller anywhere in the ROM reaches it by `bl`, so it is a
 * proc-script callback slot filled with a do-nothing routine; nothing reads an
 * argument register, so `void (void)` is all the evidence there is. */

void sub_0807823C(void)
{
}
