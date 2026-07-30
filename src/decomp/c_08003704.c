#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003704.
 * sub_08003704 @ 0x08003704
 */

/* MATCHED, first draft. A font/graphics load list: one sub_0801F150 followed by
 * fourteen sub_0801F234 ids. sub_080037AC is the same function again, byte for
 * byte, which is why both were taken together. The same idiom is already
 * matched in src/decomp/c_080339B0.c and c_08065990.c. */
void sub_08003704(void)
{
    sub_0801F150(0, (void *)0x06010000, 0x28D, 0x1D);
    sub_0801F234(0x02);
    sub_0801F234(0x0C);
    sub_0801F234(0x2F);
    sub_0801F234(0x30);
    sub_0801F234(0x31);
    sub_0801F234(0x32);
    sub_0801F234(0x33);
    sub_0801F234(0x34);
    sub_0801F234(0x35);
    sub_0801F234(0x36);
    sub_0801F234(0x37);
    sub_0801F234(0x38);
    sub_0801F234(0x3C);
}
