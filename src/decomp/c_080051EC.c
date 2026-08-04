#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080051EC.
 * sub_080051EC @ 0x080051EC
 */

/* THIS FUNCTION IS BROKEN IN THE ORIGINAL SOURCE, and reproducing the bug is
 * what matches. Two independent defects, both visible in the ROM:
 *   (1) `s` is never advanced, so the `while (*s)` test reads the same byte
 *       forever -- agbcc hoists the load and the bottom test becomes
 *       `cmp r1,#0; bne` on a register nothing writes.
 *   (2) the loop body compares that BYTE against gUnknown_0808D7B4's ADDRESS
 *       (`cmp r0,r2` with no load through r2), which no byte can equal.
 * So the reachable behaviour is `return *s != 0`, and the loop is dead code
 * that would hang if the comparison could ever succeed. Written honestly here
 * because the degenerate control flow IS the 32 bytes; a clean
 * `return *s != 0;` is a different, shorter function. */
bool8 sub_080051EC(const char *s)
{
    while (*s != 0)
    {
        if (*s != (int)gUnknown_0808D7B4)
            return TRUE;
    }
    return FALSE;
}
