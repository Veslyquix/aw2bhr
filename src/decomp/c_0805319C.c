#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805319C.
 * sub_0805319C @ 0x0805319C
 */

/* Eight 1-bit writes to gUnknown_03004504's flag byte, in the ROM's source
 * order -- bit 0, then bit 7, then bits 1..6. The order is readable straight
 * off the mask sequence and is not the natural 0..7.
 *
 * Note bit 7's clear is `movs r1, #0x7f; ands` where every other clear is
 * `movs #N; neg`. That is not a plain scalar `&= ~0x80` sneaking in: a
 * complement mask whose QImode sign bit is 0 gets truncated to 8 bits by
 * immed_double_const, so a 1-bit field clear at bit 7 always materialises as a
 * positive `movs`. See docs/agbcc-codegen.md.
 */
void sub_0805319C(void)
{
    gUnknown_03004504.bit0 = 1;
    gUnknown_03004504.bit7 = 0;
    gUnknown_03004504.bit1 = 1;
    gUnknown_03004504.bit2 = 0;
    gUnknown_03004504.bit3 = 0;
    gUnknown_03004504.bit4 = 1;
    gUnknown_03004504.bit5 = 1;
    gUnknown_03004504.bit6 = 0;
    gUnknown_03004504.unk02 = 0xFFFF;
}
