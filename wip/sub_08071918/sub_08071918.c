#include "global.h"
#include "hardware.h"

/* A debug/cheat hook: L held plus B newly down runs sub_0803DDF4. unk00 is the
 * held-key bitmask sub_0803B0EC already tests against 0x200 (L) per the
 * struct KeySt note in hardware.h; 0x200 arrives as `movs #0x80; lsls #2`
 * because it is not an imm8. */
/* WAVE 77, W77-E -- SIGNATURE RECONCILED. This draft had never compiled: it
 * said `(void)` while include/unknown-functions.h says `(void *, int, int, int)`.
 *
 * BOTH ARE CORRECT, which is the whole finding. The body genuinely reads none
 * of r0-r3, and the four call sites in sub_08077690 / sub_08077DF0 genuinely
 * set up four register arguments before the `bl`. The original source declared
 * this one way at its call sites and another at its definition -- residual kind
 * 5, a cross-TU prototype contract. The two callers are promoted and MATCHED
 * against the four-argument form, so the header cannot move; the parameters go
 * here instead, unused, which costs zero bytes (word-width parameters need no
 * prologue conversion and an unread one is never spilled).
 *
 * STILL UNMATCHABLE, and re-confirmed by eye this wave rather than taken on
 * trust: asm/code-0806CFC8.s:9494 shows FOUR leading `movs r0, r0` before the
 * `push {lr}`. The thumb_func_start label sits 8 bytes early, swallowing the
 * trailing alignment of the ARM/THUMB veneer table that ends at 0x08071918. No
 * C emits leading nops, so the source axis is closed. The signature fix is only
 * so the screens stop reporting this as an unmeasured draft. */
void sub_08071918(void *a, int b, int c, int d)
{
    if ((gpKeySt->unk00 & 0x200) && (gpKeySt->held & 2))
        sub_0803DDF4();
}
