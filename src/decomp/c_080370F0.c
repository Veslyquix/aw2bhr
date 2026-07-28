#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080370F0.
 * sub_080370F0 @ 0x080370F0
 */

/* F010: `push {lr}; ldr r0,=g1; bl S1; ldr r0,=g2; bl S2; pop {r0}; bx r0` --
 * two statements, each with its own pool word, result of each discarded.
 * src/decomp/c_08044924.c is the matched exemplar.
 * Two different callees and two FUNCTION pool words. sub_080366C4/sub_080366D0
 * are already promoted in src/decomp/c_080366C4.c taking `void (*)(void)`, so
 * no cast is needed here -- unlike the sub_08011AAC/sub_0801F024 sites, which
 * take `void *`. sub_0803662C registers the same two slots with a different
 * pair of handlers, which is what pins the argument order. */
void sub_080370F0(void)
{
    sub_080366D0(sub_08036884);
    sub_080366C4(sub_080368E8);
}
