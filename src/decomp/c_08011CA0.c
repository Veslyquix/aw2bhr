#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08011CA0.
 * sub_08011CA0 @ 0x08011CA0
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
 * Two parameters passed straight through to Decompress(u8 *, void *), which
 * reads both r0 and r1 before writing them. Nothing in the ROM references
 * this forwarder, so the arity comes entirely from the callee.
 */
void sub_08011CA0(u8 * src, void * dst)
{
    Decompress(src, dst);
}
