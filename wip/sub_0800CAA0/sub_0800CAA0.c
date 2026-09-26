#include "global.h"

/* PARKED at 15.3% / +8 bytes. Wave 58 took this from +12 to +8; wave 59 added
 * one more ruled-out axis and did not move it. READ NOTES.md.
 *
 * RESIDUAL: exactly one live value. The ROM does not hold the fourth table's
 * base across the loop -- it rematerialises `ldr r0,=gUnknown_08488900;
 * adds r0,#0x10; adds r0,r2,r0` every iteration -- while every candidate holds
 * it, giving 9 live values where the ROM has 8, saving `sl` the ROM does not
 * save, and costing gUnknown_084888F0 its LOW register (r6) plus a `mov r1,sl`.
 * It is NOT register pressure: the ROM pushes r7 and uses it only as a scratch,
 * so a callee-saved register was free and gcc still never created the pseudo.
 *
 * THE ASYMMETRY IS THE WHOLE PROBLEM. Bases 1-3 are single-insn force-addr'd
 * symbol loads and all three are hoisted. Base 4 needs a TWO-INSN chain
 * (`ldr` + `adds #0x10`) because there is no symbol at 0x08488910, and neither
 * of its two insns is hoisted. Four spellings now measured, ALL of which hold
 * the base:
 *   - `p = gUnknown_08488900; p[i + 0x10]`   (this draft)  +8, pool addend 0
 *   - `p = gUnknown_08488900; (p + 0x10)[i]`               +8, byte-identical
 *                                                          to the above
 *   - `p = gUnknown_08488900 + 0x10; p[i]`                 +8, but folds the
 *                                            addend INTO the pool word
 *                                            (R_ARM_ABS32 +0x10); ROM's is 0
 *   - `gUnknown_08488900[i + 0x10]` with no local          +12, becomes a
 *                                            pointer giv with a loop-bottom
 *                                            increment
 * KEEP THIS ONE: it is the only +8 spelling that also has the ROM's relocation.
 *
 * WAVE 59 NEGATIVE -- the COMPONENT_REF spelling, and it is worth recording
 * because src/decomp/c_0800CB30.c (the same table block's other reader, and the
 * exemplar this batch was given) states the opposite. That file says row 1 must
 * be reached as `((struct Unk88Rows *)sym)->row1[k]`, because `base[k + 0x10]`
 * hoists `k + 0x10` and `(base + 0x10)[k]` folds the whole address into one
 * pool word, and only the member reference pins `base + 0x10`. THAT IS TRUE IN
 * STRAIGHT-LINE CODE AND FALSE IN A LOOP. Measured here: the member reference
 * folds the addend into the pool word (`.word 0x10` + R_ARM_ABS32) AND lets
 * LICM hoist the result, i.e. it is strictly worse than this draft on both
 * counts -- still +8, but now with the wrong relocation. The exemplar's rule is
 * about which RTL the address expression BUILDS; in a loop, LICM then hoists
 * whatever it built, so the distinction the exemplar draws stops discriminating.
 *
 * DO NOT re-derive the shape: every statement, both loop tests, the break, the
 * preset-then-overwrite result and all five pool words in their ROM order are
 * byte-exact. `first difference at +0x2` is the push mask and is a SYMPTOM of
 * the extra live value, not a frame problem.
 *
 * The remaining axis is loop.c's `move_movables` cost test, which is not
 * addressable from C by any spelling tried in four waves. The same
 * hold/rematerialise inversion appears in sub_08026290 (+8) and sub_08028D28
 * (+4); see the wave-58 chapter in docs/agbcc-codegen.md.
 *
 * WAVE 87 (W87-A). Still +8. Two more axes measured, ZERO try_match spent; the
 * draft is unchanged and is still the best spelling. See W87-notes.md.
 *   - The 2-D ARRAY BASE (W86-C's sub_08053520 rule) is REFUTED here, both as
 *     a cast `((const u8 (*)[0x10])sym)[1][i]` and as a real `extern const u8
 *     g[][0x10]` with `g[1][i]`: BOTH fold the +0x10 into the RELOCATION
 *     (`sym+0x10`) and BOTH still hoist. W86-C's `adds rN,#K` tell only holds
 *     when the index must be SCALED; with a u8 element and an unscaled index
 *     `&g[1]` is a link-time constant and folds before -fforce-addr sees an
 *     array. The header was NOT retyped and c_0800CB30.c was NOT touched.
 *   - Ten reference spellings now partition COMPLETELY by which side of the
 *     `+` the constant sits on: INDEX side (`sym[i + 0x10]`, `sym[0x10 + i]`,
 *     `p = sym; p[i + 0x10]`) keeps the ROM's BARE pool word and emits a
 *     runtime `add #0x10`; POINTER side (`(sym + 0x10)[i]`, `*(sym+0x10+i)`,
 *     `*(&sym[0x10] + i)`, `q = sym + 0x10; q[i]`, and both casts) folds the
 *     constant into the relocation. This draft is on the right side.
 *   - Declaring the local at FUNCTION TOP instead of inside the `if` folds the
 *     0x10 into the ldrb displacement (`ldrb r0,[r0,#0x10]`), three in-loop
 *     insns instead of the ROM's four. Keep it inside the `if`.
 *   - So the residual is LICM POSITION ONLY, now proved: the bare no-local
 *     form emits the ROM's exact `add rN,r0,#0 / add rN,rN,#0x10` pair, in the
 *     PREHEADER, and then strength-reduces it to a pointer giv.
 *   - A malformed probe that happened to keep ONE extra value live across the
 *     loop left the bare `ldr =gUnknown_08488900` INSIDE the loop body with
 *     the other three bases still hoisted -- the exact inversion needed. The
 *     axis is move_movables' cost test and it IS flippable, by pressure, not
 *     by spelling. Look for a fifth live value in the ROM.
 */

int sub_0800CAA0(void)
{
    int i;
    int r;

    r = 0;

    for (i = 0; i <= 0xF; i++)
    {
        if (gUnknown_084888B0[i] >> 1 == gUnknown_03003FC0.unk33[1]
         && gUnknown_084888D0[i] >> 1 == gUnknown_03003FC0.unk33[2]
         && gUnknown_084888F0[i] >> 1 == gUnknown_03003FC0.unk33[3])
        {
            const u8 *p;

            p = gUnknown_08488900;

            if (p[i + 0x10] >> 1 == gUnknown_03003FC0.unk33[4])
            {
                r = i;
                break;
            }
        }
    }

    return r;
}
