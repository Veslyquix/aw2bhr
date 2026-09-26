#include "global.h"

/* PARKED at 87.5% -- 11 of 88 bytes differ, size EXACT. Full entry with the
 * ruled-out list is in data/parked.json; this header is the short version.
 *
 * The 43-instruction stream is 1:1 with the ROM: same opcodes, same order,
 * same immediates, same branch structure, same `mov ip, r0`. Every differing
 * byte is a register NUMBER. There is no statement-order or type error left to
 * find -- do not go looking for one.
 *
 *   this draft                  ROM
 *   dst/base -> r5 (one pseudo) dst -> r4 (dies), base -> r2 (scratch)
 *   src      -> r4              src -> r5
 *   p        -> r2              p   -> r4 (recycles dst's dead register)
 *   w r6, h r7, i r1, j r3, add ip -- already correct
 *
 * THE CORE TENSION, and it is a real one. The ROM wants two things that pull
 * against each other: `dst` gets a prologue copy (`adds r4, r0, #0`), AND the
 * row base is a separate pseudo so dst dies at instruction 14 and r4 is freed
 * for `p`. Reassigning dst (as below) buys the prologue copy but fuses dst and
 * the base into one long-lived pseudo, which then holds a callee-saved
 * register to the end and pushes `p` into scratch. Giving the base its own
 * local splits them correctly but LOSES the prologue copy -- with dst
 * read-only gcc loads the stack parameter into r1 instead of r0, dst never
 * leaves r0, and the result is 42 instructions / 4 bytes short. Five
 * separate-base spellings were probed and all five come out at 42.
 * Unparking needs a construct that keeps dst alive across the
 * stack-parameter load WITHOUT making it the row base.
 *
 * Do NOT re-run the permuter as-is: four runs, ~43,000 iterations, 60.2 ->
 * 72.7 -> 86.4 -> 87.5%, and a final 600 s run from 87.5% found nothing
 * better. It has converged. Its two surviving edits are kept below and are
 * worth 14.8 points between them -- the zero-trip `do { } while (0)` around
 * the second offset add plus `src++`, and `y * 0x20` bound to an `int` local.
 * `first`/`hdr` is likewise a permuter edit that pays; do not collapse it.
 *
 * Do NOT re-try old_agbcc: MEASURED via a throwaway compiler-overrides.json
 * entry at 85.2%, worse than the default's 87.5%, keeping the same wrong
 * registers and additionally emitting `ldrb` before `ldrh`. The wave-38
 * discriminator explains it -- the two allocators diverge on a CALL inside a
 * loop body, and this function has no calls.
 *
 * TYPES ARE SETTLED and are not the reason it misses. Parameters 3-5 are u16
 * (a prologue `lsls #0x10` with its matching `lsrs` MISSING, fused into the
 * scale at the use: `lsrs #0xf` = *2, `lsrs #0xa` = *0x40); parameter 2 is a
 * directly-walked `u16 *` (its `adds r5, r1, #0` is a prologue copy, ahead of
 * the `ldr r0, [sp, #0x14]`); w and h come from ONE halfword, `hdr = *src`
 * then `w = (u8)hdr` re-loaded as ldrb and `h = hdr >> 8`. The prototype was
 * retyped and all three callers re-verified byte-identical. */

void sub_08012B70(u16 *dst, u16 *src, u16 x, u16 y, u16 add)
{
    u16 *p;
    u16 hdr;
    u16 w;
    u16 first;
    u16 j;
    u16 h;
    u16 i;
    int yoff;

    first = *src;
    hdr = first;
    w = (u8)hdr;
    h = hdr >> 8;
    dst = dst + x;
    do
    {
        yoff = y * 0x20;
        dst = dst + yoff;
        src++;
    }
    while (0);

    for (i = 0; i < h; i++)
    {
        p = dst + i * 0x20;
        for (j = 0; j < w; j++)
        {
            *p = *src + add;
            p++;
            src++;
        }
    }
}
