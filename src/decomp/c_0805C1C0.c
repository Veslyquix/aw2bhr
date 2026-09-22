#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805C1C0.
 * CopCondAlways @ 0x0805C1C0
 */

u8 CopCondAlways(int mode)
{
    return 1;
}

asm(".global sub_0805C1C0\n.thumb_set sub_0805C1C0, CopCondAlways\n");
