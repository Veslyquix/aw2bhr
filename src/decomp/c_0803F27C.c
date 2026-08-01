#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803F27C.
 * sub_0803F27C @ 0x0803F27C
 */

/* A four-entry id remap. The tell that this is a `switch` and not an if/else
 * chain is that ALL FOUR compares are contiguous and the four value blocks
 * follow them, which is what expand_end_case emits; an if/else chain
 * interleaves each test with its own result.
 *
 * `case 0:` sharing the default arm is what fixes the decision tree. With the
 * three cases 1/2/3 alone, balance_case_nodes bisects at 2 and emits
 * `cmp #2; beq; cmp #2; bgt; ...` -- measured, wave 29. A fourth node makes the
 * bisect land on 1, giving the ROM's `cmp #1; beq; cmp #1; ble; cmp #2; beq;
 * cmp #3; beq` with the default falling through, and it also puts the `0` arm
 * FIRST among the bodies, which is the order the ROM has.
 */
int sub_0803F27C(int a)
{
    switch (a)
    {
    case 0:
    default:
        return 0;

    case 1:
        return 1;

    case 2:
        return 4;

    case 3:
        return 5;
    }
}
