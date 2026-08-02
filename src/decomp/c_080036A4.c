#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080036A4.
 * sub_080036A4 @ 0x080036A4
 */

/* A five-entry sprite load list, the same idiom as src/decomp/c_0800376C.c. */
void sub_080036A4(void)
{
    sub_0801F34C(0x30, 0x19, 0x418, 0, 0);
    sub_0801F34C(0x2F, 0x19, 0x428, 0, 0);
    sub_0801F34C(0x02, 0x19, 0x438, 0, 0);
    sub_0801F34C(0x34, 0x18, 0x448, 0, 0);
    sub_0801F34C(0x0C, 0x19, 0x458, 0, 0);
}
