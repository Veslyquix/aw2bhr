#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806209C.
 * sub_0806209C @ 0x0806209C
 */

/* One setup call and three identical two-argument calls with a literal pair
 * each. The (index, value) pairs are 0/1, 1/6 and 2/5 -- an index that steps
 * and a value that does not, so the second argument is data rather than a
 * count. */
void sub_0806209C(void)
{
    sub_080620C0();
    sub_080620FC(0, 1);
    sub_080620FC(1, 6);
    sub_080620FC(2, 5);
}
