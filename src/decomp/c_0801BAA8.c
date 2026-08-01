#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801BAA8.
 * sub_0801BAA8 @ 0x0801BAA8
 */

/* A one-line forwarder onto a field 0x5a into its parameter. `lsls #0x10;
 * asrs #0x10` after the call is agbcc re-narrowing a narrow-returning callee,
 * and the ARITHMETIC shift makes sub_0801BA4C's return SIGNED -- the one thing
 * this function measures that its callee's own body would have to be read to
 * confirm. Nothing here types what lives at +0x5a, so the parameter stays the
 * byte cursor the address arithmetic implies. */
s16 sub_0801BAA8(u8 *p)
{
    return sub_0801BA4C(p + 0x5a);
}
