#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043E3C.
 * sub_08043E3C @ 0x08043E3C
 */

void sub_08043E3C(int a, void *b, int c)
{
    Decompress(gUnknown_084A0090[a % 24].unk0c[a / 24], b);
    sub_08043AA0(a, c);
}
