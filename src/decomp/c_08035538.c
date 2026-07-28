#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08035538.
 * sub_08035538 @ 0x08035538, sub_08035548 @ 0x08035548, sub_08035558 @ 0x08035558
 */

void sub_08035538(void)
{
    gUnknown_03003FC0.unk2d = 1;
}

void sub_08035548(void)
{
    gUnknown_03003FC0.unk2d = 2;
}

void sub_08035558(void)
{
    gUnknown_03003FC0.unk2d = 0;
}
