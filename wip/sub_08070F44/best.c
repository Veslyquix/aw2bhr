#include "global.h"

/* CgbModVol. PARKED at 56.7% with the SIZE EXACT (104 bytes) -- wave 47
 * (W47-C). Read the score positionally: every instruction is the right
 * instruction in the right order, and the entire residual is that the ROM
 * parks `chan` in r1 while this candidate parks it in r2, which renumbers
 * almost every register downstream.
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
 *   - declaring the two locals in the other order: no change, `chan` stays in
 *     r2.
 *   - `u32` locals instead of `u8`: `chan` stays in r2 AND the `<<24` temp
 *     swaps with the value, which is strictly worse.
 *   - binding chan->unk06 to a local before the multiply: no change to the
 *     allocation, and it turns the tail `asrs` into an `lsrs`, which is wrong.
 *   - decomp-permuter, 300 s x 4 threads: best 59.6%, no match.
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
    if ((right / 2) >= left)
    {
      chan->pan = 0x0F;
      goto CLAMPED;
    }
  }
  else
    if ((left / 2) >= right)
  {
    chan->pan = 0xF0;
    goto CLAMPED;
  }
  chan->pan = 0xFF;
  chan->envelopeGoal = ((u32) (chan->leftVolume + chan->rightVolume)) >> 4;
  goto REST;
  CLAMPED:
  chan->envelopeGoal = ((u32) (chan->leftVolume + chan->rightVolume)) >> 4;

  if (chan->envelopeGoal > 15)
  {
    chan->envelopeGoal = 15;
  }
  REST:
  chan->unk19 = ((chan->unk06 * chan->envelopeGoal) + 15) >> 4;

  left = chan->pan;
  right = chan->panMask;
  chan->pan = right & left;
}
