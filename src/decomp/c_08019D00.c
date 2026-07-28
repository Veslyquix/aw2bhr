#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019D00.
 * sub_08019D00 @ 0x08019D00
 */

/* Family F001 forwarder, 12 bytes:
 *     push {lr}
 *     bl   <callee>
 *     pop  {r0}
 *     bx   r0
 * The `pop {r0}` fixes THIS function as void: it overwrites whatever
 * the callee returned, so nothing about the callee is visible from
 * here. Everything below was read off the callee's own body instead.
 *
 * One pointer passed through. sub_08019B50 reads r0 before writing it
 * (`adds r2, r0, #0`) and takes nothing else; it is not a Proc -- see the
 * note on its declaration in include/unknown-functions.h -- hence void *.
 */
void sub_08019D00(void * a)
{
    sub_08019B50(a);
}
