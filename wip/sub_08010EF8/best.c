#include "global.h"

/* Renders `value` as right-aligned decimal digits into the tilemap `dest`,
 * writing least-significant digit first and walking backwards, so the caller
 * passes the column of the LAST digit: the start cell is dest[x + 0x20], one
 * row of 32 tiles down. Each digit indexes the glyph run based at
 * gUnknown_0300308C[0]. The second parameter is genuinely unused -- r1 is
 * never read before `movs r1, #0xa` overwrites it.
 *
 * `dest += ...` rather than a fresh local: the ROM copies r3 into the
 * callee-saved r5 at function entry and then adds, which is the parameter
 * pseudo living across the two libgcc calls. A fresh `p = dest + (...)` folds
 * both into one `add r5, r3, r0` and loses the copy.
 *
 * u16 on `value` is measured, not assumed: the division result is re-narrowed
 * `lsl #16; lsr #16` before the exit test, and the helpers are the UNSIGNED
 * __udivsi3/__umodsi3. */
void sub_08010EF8(u16 x, int unused, u16 value, u16 *dest)
{
    dest += x + 0x20;
    do
    {
        *dest = gUnknown_0808DF8C[0] + value % 10;
        dest--;
        value = value / 10;
    } while (value != 0);
}
