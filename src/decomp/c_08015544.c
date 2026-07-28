#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015544.
 * sub_08015544 @ 0x08015544, sub_08015550 @ 0x08015550, sub_0801555C @ 0x0801555C
 */

/* A bare forwarder: `push {lr}; bl <callee>; pop {r0}; bx r0`. The `pop {r0}`
 * fixes it as void, and the callee reads no argument register, so there is no
 * parameter to pass through either.
 */
void sub_08015544(void)
{
    sub_0801D8B4();
}

/* A bare forwarder: `push {lr}; bl <callee>; pop {r0}; bx r0`. The `pop {r0}`
 * fixes it as void, and the callee reads no argument register, so there is no
 * parameter to pass through either.
 */
void sub_08015550(void)
{
    sub_0801DED8();
}

/* A bare forwarder: `push {lr}; bl <callee>; pop {r0}; bx r0`. The `pop {r0}`
 * fixes it as void, and the callee reads no argument register, so there is no
 * parameter to pass through either.
 */
void sub_0801555C(void)
{
    sub_0801DF20();
}
