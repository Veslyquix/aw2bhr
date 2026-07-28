#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080328C0.
 * sub_080328C0 @ 0x080328C0
 */

/* A bare `u16 *`, not a struct pointer. The first loop's exit test is a signed
 * pointer-vs-base compare (`cmp r1, r0; bge`), which is biv elimination
 * against a live bare pointer parameter -- a member array keeps its counter
 * instead. The second loop reaches the same object 0x40 bytes up as
 * `p[0x20 + i]`, which does keep the counter because the base `p + 0x40` is
 * not live anywhere; the `p->unk40[i]` spelling emits a second pointer compare
 * and misses. Both loops ascend in the source and GCC reverses them.
 */
void sub_080328C0(u16 *p)
{
    int i;

    for (i = 0; i < 10; i++)
        p[i] = i + 0x6300;

    for (i = 0; i < 10; i++)
        p[0x20 + i] = i + 0x630a;
}
