#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080392BC.
 * sub_080392BC @ 0x080392BC
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
 * One pointer passed through. sub_0803927C reads +0x2c and +0x30 off r0, and
 * its two siblings sub_080392C8 / sub_080392F4 hand the identical pointer
 * to Proc_Break -- which is what makes it a proc rather than a bare
 * pointer.
 */
void sub_080392BC(ProcPtr proc)
{
    sub_0803927C(proc);
}
