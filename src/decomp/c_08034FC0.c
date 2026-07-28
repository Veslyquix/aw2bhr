#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034FC0.
 * sub_08034FC0 @ 0x08034FC0
 */

/* `ldrh` then `ldrsh` of the same halfword with no `volatile` anywhere: agbcc
 * will not CSE two reads in different machine modes, so the guard reads the s16
 * object as s16 and the decrement's operand comes off the HImode load. The
 * `movs r3, #0` is only `ldrsh` having no immediate-offset form. */
void sub_08034FC0(void)
{
    if (gUnknown_030040E8 != 0)
        gUnknown_030040E8--;
}
