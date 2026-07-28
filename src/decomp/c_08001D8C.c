#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08001D8C.
 * sub_08001D8C @ 0x08001D8C, sub_08001D9C @ 0x08001D9C
 */

void sub_08001D8C(void)
{
    gUnknown_0200B0B0->unk4c = 10;
}

void sub_08001D9C(void)
{
    gUnknown_0200B0B0->unk4c = 0;
}
