#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805CDF0.
 * sub_0805CDF0 @ 0x0805CDF0, sub_0805CE20 @ 0x0805CE20
 */

void sub_0805CDF0(void)
{
    u8 **pp;
    u8 *p;

    /* Both locals are load-bearing. Binding &gUnknown_030046B0 first is what
     * puts its pool word ahead of gUnknown_030045F0's and keeps the address
     * live in r2 across the two byte stores; binding the array base is what
     * stops the stored zero being hoisted into a register of its own. Writing
     * `gUnknown_030046B0 = gUnknown_030045F0;` directly emits the `str` before
     * the byte stores, whichever order the statements are in. */
    pp = &gUnknown_030046B0;
    p = gUnknown_030045F0;
    p[0] = 0x40;
    p[1] = 0;
    *pp = p;
    gUnknown_03004778 = sub_0805DB64;
    gUnknown_03004780 = 2;
}

void sub_0805CE20(void)
{
    u8 **pp;
    u8 *p;

    /* Twin of sub_0805CDF0, differing only in the callback stored into
     * gUnknown_03004778; see that function for why the two locals are needed. */
    pp = &gUnknown_030046B0;
    p = gUnknown_030045F0;
    p[0] = 0x40;
    p[1] = 0;
    *pp = p;
    gUnknown_03004778 = sub_0805DB70;
    gUnknown_03004780 = 2;
}
