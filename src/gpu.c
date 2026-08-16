#include "global.h"

// 32 palette banks (BG + OBJ) of 16 colors each. gUnknown_0200B5F4 holds a per-bank signed
// brightness delta; gUnknown_0200B614 the running (bias +0x20) R/G/B accumulator bytes per
// color; gUnknown_030020C0 the resulting packed 15-bit colors ready for the real palette RAM.
extern s8 gUnknown_0200B5F4[0x20];
extern u8 gUnknown_0200B614[0x600];
extern u8 gUnknown_030020C0[0x400];

#ifdef NONMATCHING

// Semantically correct and ARM-mode identical in behavior to the retail function, but
// agbcc_arm if-converts this clamp into movmi/movge regardless of how it's phrased, which
// the original binary doesn't do -- see asm/nonmatching/gpu/sub_08000234.inc for the
// matching hand-transcribed version used by the real (non-NONMATCHING) build.
void sub_08000234(void)
{
    s32 group;

    for (group = 0x3e0; group >= 0; group -= 0x20)
    {
        s8 delta = gUnknown_0200B5F4[group >> 5];

        if (delta != 0)
        {
            u8 *rgb = &gUnknown_0200B614[(group >> 1) * 3 + 0x30];
            s32 i;

            for (i = 0x1e; i >= 0; i -= 2)
            {
                s32 r, g, b;

                rgb -= 3;

                r = rgb[0] + delta;
                rgb[0] = r;
                r -= 0x20;
                if (r < 0)
                    r = 0;
                if (r > 0x1F)
                    r = 0x1F;

                g = rgb[1] + delta;
                rgb[1] = g;
                g -= 0x20;
                if (g < 0)
                    g = 0;
                if (g > 0x1F)
                    g = 0x1F;

                b = rgb[2] + delta;
                rgb[2] = b;
                b -= 0x20;
                if (b < 0)
                    b = 0;
                if (b > 0x1F)
                    b = 0x1F;

                *(u16 *) (gUnknown_030020C0 + i + group) = r | (g << 5) | (b << 10);
            }
        }
    }
}

#else

// This literal pool sits immediately before sub_08000234 in the retail binary, not inside
// it -- it has to be emitted here, at file scope, rather than as part of the naked
// function's own body, or the compiler's function-start label (what callers actually
// branch to) would point at this data instead of the real code that follows it.
asm("_08000228: .4byte gUnknown_030020C0\n"
    "_0800022C: .4byte gUnknown_0200B614\n"
    "_08000230: .4byte gUnknown_0200B5F4\n");

NAKEDFUNC
void sub_08000234(void)
{
    asm(".include \"asm/nonmatching/gpu/sub_08000234.inc\"");
}

#endif
