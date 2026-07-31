#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044560.
 * sub_08044560 @ 0x08044560
 */

void sub_08044560(void)
{
    gUnknown_08499598[gUnknown_030033EC].unk26 = Div(gUnknown_08499598[gUnknown_030033EC].unk00, 300);
    gUnknown_08499598[gUnknown_030033EC].unk28 = 10;
}
