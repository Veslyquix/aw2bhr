#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805040C.
 * sub_0805040C @ 0x0805040C
 */

/* A pass-through forwarder. Every instruction in it is the u16 parameters'
 * own prologue narrowing -- agbcc's PROMOTE_MODE re-narrows each sub-word
 * parameter at entry, and the arguments then need no setup at all.
 *
 * sub_08050424's third parameter is int, so the third lsls/lsrs pair belongs
 * to this function's own u16 c, not to the call. */
void sub_0805040C(u16 a, u16 b, u16 c)
{
    sub_08050424(a, b, c);
}
