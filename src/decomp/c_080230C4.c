#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080230C4.
 * sub_080230C4 @ 0x080230C4
 */

/* A pure forwarder whose three `lsls #0x10; asrs #0x10` pairs are PROMOTE_MODE
 * fused with the s16 conversion each argument needs at the `bl` -- combine
 * collapses the entry zero-extend and the sign-extend into one pair. */
void sub_080230C4(s16 a1, s16 a2, s16 a3)
{
    sub_08022DD4(a1, a2, a3);
}
