#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034A7C.
 * sub_08034A7C @ 0x08034A7C
 */

void sub_08034A7C(int y, int b)
{
    char *s = (char *)gUnknown_08610A38[gUnknown_08499CCC[b]];
    int x = sub_08034A44(s);

    sub_08034A58(y, s);

    sub_0801F34C(b + 0x3d, x - 0x10, y - 4, 0, 0);
    sub_0801F34C(b + 0x3d, x + sub_0808B6B0(s) * 8, y - 4, 0, 0);
}
