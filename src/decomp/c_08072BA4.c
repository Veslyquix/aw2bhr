#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08072BA4.
 * sub_08072BA4 @ 0x08072BA4
 */

/* Schedules sub_08072BBC to run after a delay: sub_0807298C's three u32
 * parameters are (callback, argument, frames), and the callback reaches the
 * proc's +0x2c slot that sub_08072948 calls through `_call_via_r1`.
 *
 * The cast is what makes the pool word a RELOCATION against sub_08072BBC
 * rather than a bare constant -- naming the function is the honest spelling
 * even though sub_0807298C's promoted signature takes u32. */
void sub_08072BA4(u32 a, u32 b)
{
    sub_0807298C((u32)sub_08072BBC, a, b);
}
