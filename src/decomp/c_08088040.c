#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08088040.
 * sub_08088040 @ 0x08088040
 *
 * Named per src/aw2e-names.s (proc-table labels auto-generated from
 * AW2E.lua). The old sub_XXXXXXXX symbols are kept as linker aliases
 * below so every other unit keeps resolving them unchanged.
 */

void CoDesignC1_IDLE_08088041(ProcPtr proc)
{
}

asm(".global sub_08088040\n.thumb_set sub_08088040, CoDesignC1_IDLE_08088041\n");
