#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805C114.
 * sub_0805C114 @ 0x0805C114
 */

#include "hardware.h"

void sub_0805C114(u16 keys)
{
    /* The `while (...) ;` and `do ; while (...)` spellings both come out four
     * bytes long: agbcc rotates them and, knowing the AND is zero on the back
     * edge, materialises a fresh zero register for the loop test. Written as a
     * while(1) with the exit test at the loop head there is no rotation guard
     * and the test block has two predecessors, so the value cannot be
     * propagated and the loop re-tests the hoisted AND. */
    while (1)
    {
        if (gpKeySt->held & keys)
            break;
    }
}
