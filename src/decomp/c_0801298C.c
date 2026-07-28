#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801298C.
 * sub_0801298C @ 0x0801298C
 */

#include "hardware.h"

/* The two zeros are NOT one constant: the ROM materialises `movs #0` twice,
 * and the second one lands between `ldr =0x04000050` and `movs #0x8f` -- i.e.
 * inside the BLDCNT statement's setup. Writing all four stores with literals
 * shares one `mov` and comes out 4 bytes short; a plain `alpha = 0;` statement
 * ahead of the BLDCNT write puts the `mov` one slot too early. Binding the
 * alpha value inside the BLDCNT statement is what lands it. Byte-exact
 * alternative found by the same probe: bind 0x04000050 to a `vu16 *` local,
 * assign alpha, then store through the local.
 */
void sub_0801298C(void)
{
    u16 alpha;

    gUnknown_03002B2C = 0;
    REG_BLDCNT = (alpha = 0, 0x8f);
    REG_BLDALPHA = alpha;
    REG_BLDY = 8;
}
