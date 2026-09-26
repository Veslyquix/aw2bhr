#include "global.h"

/* PARKED, size-exact at 79.7%. See work/sub_08010EF8/NOTES.md for the full
 * residual, the ten spellings ruled out and the one axis still open. */
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
