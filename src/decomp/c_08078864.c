#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078864.
 * sub_08078864 @ 0x08078864, sub_08078884 @ 0x08078884, sub_08078890 @ 0x08078890
 */

/* Six `bl`s with a single `movs r0, #0` between the first and the second, and
 * nothing at all between the middle four. That gap is the whole reading: the
 * four gUnknown_030058E0 builders each take an index in r0 and return the
 * advanced index in r0, so consecutive calls with no argument setup are a
 * NEST, not four statements. Four statements would each have had to reload r0.
 *
 * The absent code is also what fixes the width: a `u8`/`u16` parameter or
 * return anywhere in the chain would have put `lsl #24; lsr #24` between two
 * `bl`s, and there is none, so every link is int-wide.
 *
 * sub_08078790, 0xd4 bytes above, is the short version of the same source --
 * `sub_080785FC(); sub_08078740(sub_08078608(0));`.
 */
void sub_08078864(void)
{
    sub_080785FC();
    sub_080786A4(sub_080786F0(sub_08078658(sub_08078608(0))));
    sub_08078758();
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
 * The callee reads no argument register before writing it, so there
 * is no parameter to pass through either.
 */
void sub_08078884(void)
{
    sub_08078864();
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
 * The callee reads no argument register before writing it, so there
 * is no parameter to pass through either.
 */
void sub_08078890(void)
{
    sub_08078790();
}
