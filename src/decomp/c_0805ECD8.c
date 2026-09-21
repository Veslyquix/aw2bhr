#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805ECD8.
 * sub_0805ECD8 @ 0x0805ECD8
 */

void AiDoNothing(void)
{
}

asm(".global sub_0805ECD8\n.thumb_set sub_0805ECD8, AiDoNothing\n");
