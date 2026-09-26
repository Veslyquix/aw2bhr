#include "global.h"

/* PARKED at 23.3%, -4 bytes (116 against 120), first difference at +0xa.
 *
 * !! HARNESS NOTE (wave 46, W46-J): try_match OVERWRITES this file with the
 * body it is handed and has no keep-existing guard, so re-running a draft to
 * re-measure it DELETES the analysis above the body. The block below was
 * restored by hand after exactly that happened. Copy a draft's comment header
 * back in after any re-measurement. !!
 *
 * VERIFIED wave 46 by W46-J, independently of W46-C: the body below compiles
 * to 116 bytes at 23.3% with the diff described at the end of this comment,
 * unchanged. Parked in data/parked.json with that evidence.
 *
 * Wave 46 (W46-C) re-derived this from the ROM's frame rather than patching the
 * wave-44 draft, and arrived at the SAME source shape. That is not inheritance:
 * every structural choice below is forced by a controlled probe run this wave.
 *
 * WHAT IS PROVED, AND WHY EACH IS NOT A MATTER OF TASTE
 *
 *  - The two pointer globals must be reached through LOCALS bound to their
 *    ADDRESSES. Naming gUnknown_081D9440 directly was re-probed this wave:
 *    agbcc routes the symbol through force_const_mem, emitting a `.rodata` word
 *    that holds the address and then a DOUBLE indirection (`ldr r0, [r1];
 *    ldr r3, [r0]`) per use, where the ROM has a single `ldr r3, [r7]` off a
 *    plain `.4byte gUnknown_081D9440` TEXT pool word. Binding `&g` to a
 *    `u16 **` local makes the MEM's address already a REG, which is the case
 *    -fforce-addr leaves alone.
 *  - The same probe showed direct naming ALSO stops check_dbra_loop reversing
 *    the counter: it emits `mov r7, #0` as a for-init at the TOP of the
 *    preheader and exits on `cmp r7, #3; ble`. The ROM has NO for-init in the
 *    preheader at all and exits on `subs r5, #1; cmp r5, #0; bge`, i.e. the
 *    source biv was eliminated and a reversed counter created afterwards --
 *    which is what puts `movs r5, #3` LAST. Two independent reasons for the
 *    local-binding form.
 *  - A source-level DESCENDING loop is ruled out by that same fact: a source
 *    `i = 3` init is a source statement and would sit FIRST in the preheader,
 *    ahead of the LICM-hoisted 0x2000, not last.
 *  - The three coordinates (0x50, 0x54, 0x97) are strength-reduction GIVs --
 *    their inits sit AFTER the LICM-hoisted 0x2000 -- so they are expressions
 *    in `i`, not accumulators.
 *
 * THE RESIDUAL IS ONE COUPLED FACT, NOT TWO. The ROM spends `sub sp, #8` and
 * keeps the 0x54 giv SPILLED at [sp, #4]. That leaves r7 free as a low scratch
 * for `mov r7, sl; ldr r3, [r7]`, and it therefore emits that load LAST in each
 * call's argument setup (after r0/r1/r2, the textbook gcc order). This
 * candidate fits all seven live values in registers, so no callee-saved low
 * scratch is needed, and gcc instead precomputes the `ldr r3` at the FRONT of
 * the setup where r0-r3 are free.
 *
 * The mechanism, which is the part worth carrying to the next reader: FOUR of
 * the seven live values demand LOW registers -- the counter and all three givs
 * are updated with `adds rN, #imm8` / `subs rN, #1` -- and there are exactly
 * four low callee-saved registers (r4-r7). A FIFTH low demand, the reload
 * scratch for the two high-register moves, is what tips the ROM into spilling
 * one giv. Whichever way gcc breaks that tie decides BOTH the spill and the
 * `ldr r3` position, so there is no spelling that fixes one without the other,
 * and every attempt that keeps seven values in seven registers reproduces this
 * candidate exactly. What is missing is an EIGHTH live value; nothing in the
 * ROM's instruction stream accounts for one, so it is probably a source local
 * this reading folds away.
 *
 * RULED OUT (waves 44 and 46): accumulators instead of givs; `x` / `x + 4`
 * instead of two coordinate givs (fewer live values, so it moves the wrong
 * way); volatile on the pointer objects and on the deref; binding the OAM word
 * to a local before each call (reorders the whole body); naming the globals
 * directly; a source-level descending loop; and swapping the declaration order
 * of the two pointer locals.
 *
 * DECOMP-PERMUTER: RUN, AND IT FAILED -- 900 seconds over two runs, 4 threads.
 * This is a fair test of the brief's "the permuter is not useless on register
 * allocation" rule and it came out NEGATIVE here, which is worth recording
 * because the residual looks exactly like the permuter's advertised case
 * (slot-wrong, instruction stream otherwise right).
 *
 * !! WARNING FOR THE NEXT READER: work/sub_08087040/best.c IS CONTAMINATED. !!
 * The permuter left it holding a candidate scored 55.8% at size 120 (exact),
 * which looks like a big lead over this 23.3% draft and is NOT one -- the body
 * is semantically broken. It reads `p` and `new_var2` before either is ever
 * assigned, and it "reaches" 120 bytes through undefined behaviour rather than
 * by finding the spill. Do not start from it, and do not read 55.8% as this
 * function's real state; the honest score is the 23.3% of the body below. A
 * further permuter run will START from that contaminated best.c, so reset it
 * before running one. Same failure mode as the wave-17 residue the wave brief
 * flags for sub_080149C0. The wave-46 brief quoted 55.8% as this function's
 * current score, which is how far that artefact has already propagated.
 *
 * Measured diff, unchanged: `sub sp,#8` vs `#4`; `movs r0,#84; str r0,[sp,#4]`
 * vs `movs r7,#84`; the two `ldr r0,[sp,#4]` reloads vs a plain `adds r7,#8`;
 * and the `mov r7,sl; ldr r3,[r7]` pair moved from after `movs r2,#0` to before
 * `adds r0,r6,#0`. Every other instruction is present with the same encoding,
 * and the preheader is in the ROM's exact order (p, q, 0x2000, 0x54, 0x50,
 * 0x97, counter). */

void sub_08087040(void)
{
    u16 **p;
    u16 **q;
    int i;

    p = &gUnknown_081D9440;
    q = &gUnknown_081D9444;

    for (i = 0; i < 4; i++)
    {
        PutSprite(1, 0x97 + i * 0x18, 0, *p, (0x50 + i * 8) | 0x2000);
        PutSprite(1, 0x97 + i * 0x18, 0x10, *q, (0x54 + i * 8) | 0x2000);
    }
}
