#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807BD50.
 * sub_0807BD50 @ 0x0807BD50
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
 * One pointer passed through. sub_0807BF74 opens `ldr r2,[r0,#0x58]` and
 * writes the decremented value back, so r0 is read before it is written;
 * +0x58 is past PROC_HEADER.
 */
void sub_0807BD50(ProcPtr proc)
{
    sub_0807BF74(proc);
}
