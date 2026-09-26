#include "global.h"

/* CgbModVol. PARKED with the SIZE EXACT (104 bytes) -- wave 47 (W47-C, then
 * W47-F). Read the score positionally: every instruction is the right
 * instruction in the right order, and the entire residual is that the ROM
 * parks `chan` in r1 while this candidate parks it in r2, which renumbers
 * almost every register downstream.
 *
 * COMPILE THIS WITH old_agbcc (minus -fprologue-bugfix). Wave 47 (W47-F)
 * settled the m4a block's configuration when the neighbour sub_08070BAC
 * matched byte-for-byte under old_agbcc with NO source change at all. Under
 * old_agbcc this draft is 68.3% (33 of 104 bytes); the 56.7% that try_match
 * reports by default is this same source judged with the wrong compiler,
 * because there is deliberately no data/compiler-overrides.json entry yet --
 * that file's standard is a byte-level match, and an override that changes no
 * verdict is unfalsifiable. Add the entry the moment it matches.
 * -O1 (the wave-47 flash-library finding) is NOT this block: 19.2%, worse.
 *
 * EVERY NEGATIVE RECORDED BELOW BY EARLIER WAVES WAS MEASURED UNDER THE
 * DEFAULT COMPILER, i.e. in the wrong context. The ones re-measured under
 * old_agbcc in wave 47 are marked; the rest have not been re-measured and
 * should not be trusted as closed.
 *
 * RESIDUAL 1 OF THE WAVE-32 PARK IS SOLVED, and it was the open question two
 * waves left behind: rightVolume and leftVolume are `volatile u8`. See the
 * evidence comment on struct CgbChannel in include/unknown-globals.h, where
 * the members are now carved out of filler_01 with the qualifier. It accounts
 * for all three things wave 32 could not explain at once:
 *   - the `ldrb; lsls #0x18; lsrs #0x18` round trip on each volume (a
 *     volatile QImode member is loaded into a QImode pseudo and zero-extended
 *     afterwards, instead of being folded into the `ldrb`),
 *   - `lsrs r0, r2, #0x19` taking the halving straight out of the `<<24`
 *     value (CSE shares the shift once it exists), and
 *   - the function RE-READING both bytes for the `(left + right)` sum rather
 *     than reusing the two values already in registers.
 * Wave 32 guessed "a bitfield or a wider member narrowed at the read" and
 * wave 35 refuted the bitfield; the qualifier is what was left and it
 * reproduces the sequence instruction for instruction under compile_probe.
 *
 * RESIDUAL 2 OF THE WAVE-32 PARK IS ALSO CLOSED, using wave 35's own
 * unapplied fix: `(u32)(chan->leftVolume + chan->rightVolume) >> 4` emits the
 * ROM's `lsrs` where the plain `>> 4` on two u8 members promoted to int emits
 * `asrs`.
 *
 * Two more things settled this wave, both read off the ROM's load order:
 *   - the tail is `chan->pan = chan->panMask & chan->pan;`, NOT
 *     `chan->pan &= chan->panMask;` -- the ROM loads +0x1c before +0x1b.
 *   - the final scale is `(x + 15) >> 4`, not `x / 16`. The ROM's
 *     `adds r0,#0xf; asrs r0,r0,#4` is an unconditional bias then an
 *     arithmetic shift; a real signed `/ 16` costs the sign-correction
 *     sequence and is four instructions longer.
 *
 * The goto structure below is not a stylistic choice -- it is the only shape
 * that produces the ROM's block order. Both clamped arms branch FORWARD past
 * the 0xFF block to a single shared clamp, so the 0xFF block must sit between
 * them and the clamp. Writing the four arms out flat duplicates the clamp
 * (measured, and it is what wave 35 measured at +12 bytes); writing one
 * common `x = sum; if (x > 15) x = 15;` collapses the two stores the ROM
 * keeps. The ROM's `b _08070F8E` into the middle of the clamp block is
 * agbcc's own cross-jumping of the two `chan->envelopeGoal = sum;` stores and
 * must not be authored.
 *
 * WHAT WAS TRIED FOR THE ALLOCATION AND FAILED:
 *   - [RE-MEASURED UNDER old_agbcc, wave 47] declaring the two locals in the
 *     other order, and u8 / u16 / u32 / int / s32 local types. u8, u8-swapped
 *     and u16 are all 68.3% with `chan` still in r2; u32 is 67.3%; int and
 *     s32 break the shape outright (96 bytes, 2.9%). Dead in both compilers.
 *   - [RE-MEASURED UNDER old_agbcc, wave 47] decomp-permuter, 300 s x 4
 *     threads, after fixing tools/permute.py -- it was calling agbenv.flags()
 *     WITHOUT the function name, so every earlier run on this function was
 *     scored under the default toolchain and its 59.6% means nothing. Best
 *     73.1%, no byte-level match. work/sub_08070F44/permuter/ holds that
 *     candidate in best.c; check its body before believing the score.
 *   - binding chan->unk06 to a local before the multiply: no change to the
 *     allocation, and it turns the tail `asrs` into an `lsrs`, which is wrong.
 *     (Not re-measured under old_agbcc.)
 *
 * WHAT I WOULD TRY NEXT: this is an allocno-priority near-tie, not a shape
 * problem. gcc orders by roughly log2(n_refs)*freq/live_length, and `chan`
 * (many refs, function-long range) and `left` (few refs, short range) come
 * out within a few percent of each other -- the ROM gives r1 to `chan`, the
 * candidate gives it to `left`. The lever is therefore anything that
 * lengthens `left`'s live range or shortens `chan`'s, not anything about the
 * expressions. The same one-register rotation also explains the only
 * remaining instruction-count difference, the ROM's `adds r0, r2, #0` copy
 * ahead of `muls r0, r3`: with `chan` in r2 the multiply's operands land
 * where a copy is needed, and with it in r1 they do not.
 */
void sub_08070F44(struct CgbChannel *chan)
{
    u8 right;
    u8 left;

    right = chan->rightVolume;
    left = chan->leftVolume;

    if (right >= left)
    {
        if (right / 2 >= left)
        {
            chan->pan = 0x0F;
            goto CLAMPED;
        }
    }
    else
    {
        if (left / 2 >= right)
        {
            chan->pan = 0xF0;
            goto CLAMPED;
        }
    }

    chan->pan = 0xFF;
    chan->envelopeGoal = (u32)(chan->leftVolume + chan->rightVolume) >> 4;
    goto REST;

CLAMPED:
    chan->envelopeGoal = (u32)(chan->leftVolume + chan->rightVolume) >> 4;

    if (chan->envelopeGoal > 15)
        chan->envelopeGoal = 15;

REST:
    chan->unk19 = (chan->unk06 * chan->envelopeGoal + 15) >> 4;
    chan->pan = chan->panMask & chan->pan;
}
