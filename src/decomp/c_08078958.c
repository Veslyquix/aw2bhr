#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078958.
 * sub_08078958 @ 0x08078958
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078958.
 * sub_08078958 @ 0x08078958
 */


/* Installs one gUnknown_0200C528 list script. sub_080193B0 returns the slot it
 * allocated, and `pop {r0}; bx r0` here discards it -- so this is void and the
 * call is a bare statement. The script is ROM data reached only as an address,
 * hence `const u8 []` and a clean pool word.
 */

void sub_08078958(void)
{
    sub_080193B0(gUnknown_08615B4C);
}
