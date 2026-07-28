#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080358AC.
 * sub_080358AC @ 0x080358AC, sub_080358B8 @ 0x080358B8
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
 * One pointer passed through. sub_08035F68 reads r0 first thing
 * (`adds r4, r0, #0`) and dereferences +0x36, past PROC_HEADER's 0x29
 * bytes; its other caller sub_08035760 treats the same object as a proc.
 */
void sub_080358AC(ProcPtr proc)
{
    sub_08035F68(proc);
}

/* Family F001 forwarder, 12 bytes:
 *     push {lr}
 *     bl   <callee>
 *     pop  {r0}
 *     bx   r0
 * The `pop {r0}` fixes THIS function as void: it overwrites whatever
 * the callee returned, so nothing about the callee is visible from
 * here. Everything below was read off the callee's own body instead.
 *
 * One pointer passed through, same shape as sub_080358AC twelve bytes above:
 * sub_08035FA8 opens `adds r3, r0, #0` and reads +0x36.
 */
void sub_080358B8(ProcPtr proc)
{
    sub_08035FA8(proc);
}
