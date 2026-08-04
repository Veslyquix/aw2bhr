#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807823C.
 * sub_0807823C @ 0x0807823C
 */

#include "proc.h"

/* A bare `bx lr` -- it does nothing at all, so its arity is invisible from the
 * body and can only come from a call site. Wave 43 found one: sub_08038484
 * emits `ldrb r0, [r5, #2]; subs r0, #0x8a; bl sub_0807823C`, materialising an
 * int argument in r0 immediately before the call. The earlier reading -- "no
 * caller anywhere in the ROM reaches it by `bl`, so `void (void)` is all the
 * evidence there is" -- was correct when written and is now falsified. Taking
 * the parameter is byte-neutral here: the body reads nothing either way. */

void sub_0807823C(int a)
{
}
