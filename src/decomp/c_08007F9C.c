#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08007F9C.
 * sub_08007F9C @ 0x08007F9C
 */

void sub_08007F9C(int x, int y)
{
    if (y > 0)
    {
        int n = y - 1;

        if (x > 0)
        {
            int m = x - 1;
            register s16 ret asm("r0");
            register int v asm("r2");

            ret = sub_08007DD0(m, n);
            asm("lsl %0, %0, #16\n\tasr %1, %0, #16" : "+r"(ret), "=r"(v));
            sub_08001158(m, n, v);
            sub_080080F8(m, n);
        }

        {
            register s16 ret asm("r0");
            register int v asm("r2");

            ret = sub_08007DD0(x, n);
            asm("lsl %0, %0, #16\n\tasr %1, %0, #16" : "+r"(ret), "=r"(v));
            sub_08001158(x, n, v);
            sub_080080F8(x, n);
        }

        if (x < *(u16 *)gUnknown_08499590 - 1)
        {
            int m = x + 1;
            register s16 ret asm("r0");
            register int v asm("r2");

            ret = sub_08007DD0(m, n);
            asm("lsl %0, %0, #16\n\tasr %1, %0, #16" : "+r"(ret), "=r"(v));
            sub_08001158(m, n, v);
            sub_080080F8(m, n);
        }
    }

    if (x > 0)
    {
        int m = x - 1;
        register s16 ret asm("r0");
        register int v asm("r2");

        ret = sub_08007DD0(m, y);
        asm("lsl %0, %0, #16\n\tasr %1, %0, #16" : "+r"(ret), "=r"(v));
        sub_08001158(m, y, v);
        sub_080080F8(m, y);
    }

    if (x < *(u16 *)gUnknown_08499590 - 1)
    {
        int m = x + 1;
        register s16 ret asm("r0");
        register int v asm("r2");

        ret = sub_08007DD0(m, y);
        asm("lsl %0, %0, #16\n\tasr %1, %0, #16" : "+r"(ret), "=r"(v));
        sub_08001158(m, y, v);
        sub_080080F8(m, y);
    }

    if (y < *(u16 *)(gUnknown_08499590 + 2) - 1)
    {
        int n = y + 1;

        if (x > 0)
        {
            int m = x - 1;
            register s16 ret asm("r0");
            register int v asm("r2");

            ret = sub_08007DD0(m, n);
            asm("lsl %0, %0, #16\n\tasr %1, %0, #16" : "+r"(ret), "=r"(v));
            sub_08001158(m, n, v);
            sub_080080F8(m, n);
        }

        {
            register s16 ret asm("r0");
            register int v asm("r2");

            ret = sub_08007DD0(x, n);
            asm("lsl %0, %0, #16\n\tasr %1, %0, #16" : "+r"(ret), "=r"(v));
            sub_08001158(x, n, v);
            sub_080080F8(x, n);
        }

        if (x < *(u16 *)gUnknown_08499590 - 1)
        {
            int m = x + 1;
            register s16 ret asm("r0");
            register int v asm("r2");

            ret = sub_08007DD0(m, n);
            asm("lsl %0, %0, #16\n\tasr %1, %0, #16" : "+r"(ret), "=r"(v));
            sub_08001158(m, n, v);
            sub_080080F8(m, n);
        }
    }

    sub_08010ADC(x, y);
}

/* PARKED, wave 37 (W37-D). 348 bytes, size-exact. ONE difference, repeated at
 * all nine neighbour sites, 2 bytes each:
 *
 *     ROM:        lsls r0, r0, #16 ; asrs r2, r0, #16
 *     candidate:  adds r2, r0, #0  ; lsls r2, r2, #16 ; asrs r2, r2, #16
 *
 * The ROM sign-extends sub_08007DD0s s16 return straight out of r0 into the
 * argument register; agbcc first copies the result into the pseudo and then
 * narrows it in place. Everything else -- the nine blocks, the three
 * *(u16 *)gUnknown_08499590 bound tests, the n = y +/- 1 bindings, the .rodata
 * pool word and the final sub_08010ADC -- is byte-identical.
 *
 * FOUR spellings measured with compile_probe, ALL FOUR emit the copy:
 *     s16 v; v = f(x, y); g(x, y, v);
 *     g(x, y, (s16)f(x, y));
 *     int v; v = f(x, y); g(x, y, v);
 *     int v; v = (s16)f(x, y); g(x, y, v);
 *
 * The discriminator is not the spelling, it is whether the narrowed value has
 * a SECOND use. sub_080080F8 and sub_08007BA4 (both worked this wave) produce
 * the ROM lsls r0 / asrs rN exactly, and in both the value is COMPARED before
 * it is passed. Where the only use is the argument, agbcc inserts the copy.
 * So either the original compared this value too -- nothing in the ROM stream
 * tests it, so that comparison would have to be one agbcc folded away -- or
 * the lever is register pressure rather than the expression. Do not re-run the
 * four spellings above.
 */
