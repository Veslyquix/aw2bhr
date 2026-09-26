#include "global.h"

/* Draws the overworld marker sprites: walk gUnknown_0849D5F8's parallel
 * per-slot tables from the last slot down, and for every marker whose 16x16
 * box is on screen put a sprite at the camera-relative position, with the tile
 * looked up in gUnknown_0849D5C4 by whatever sub_080390CC and sub_08039064
 * classify the slot as.
 *
 * PARKED at 31.8%, 224 bytes against 220 (+4). The control flow, the loop
 * shape, the -fforce-addr word for &gUnknown_0849D5F8 (which is the ROM's
 * gUnknown_08090F2C), the whole PutSprite argument block and the pool order all
 * come out right.
 *
 * WAVE 88 (W88-D) RE-CLASSIFIED THIS FUNCTION. It was parked as kind 5, a
 * cross-TU prototype contract. The prototype conflict IS real -- see below and
 * see the long note above the declaration in include/unknown-functions.h --
 * but it is NOT what blocks the match, and the old two-fact accounting of the
 * +4 was wrong. There is exactly ONE blocker left and it is fact 1.
 *
 * 1. THE `ldrsb` FOLD -- THE WHOLE REMAINING RESIDUAL, +4.
 *    The two `s8` member-array reads come out `ldrb; lsls #24; asrs #24` where
 *    the ROM has `movs rN,#0; ldrsb` -- one extra instruction per table.
 *      THUMB `ldrsb` exists only in register-offset form, so agbcc has to
 *    materialise a zero index register for it, and in the ROM that zero goes
 *    into the load's own DESTINATION register:
 *      ROM        adds r0,r1,#0 / adds r0,#0x20 / adds r0,r0,r6
 *                 movs r2,#0 / ldrsb r2,[r0,r2]           base r0, dest r2
 *      candidate  adds r0,r1,#0 / adds r0,#0x20 / adds r0,r0,r6
 *                 ldrb r0,[r0,#0] / lsls #24 / asrs #24   base r0, dest r0
 *    In every spelling tried, local-alloc TIES the loaded value to the address
 *    register (the address pseudo dies at the load), and with dest == base the
 *    zero-index template is unusable, so the `ldrb`+shifts alternative is
 *    taken. The residual is that tie. It is a register-allocation fact with a
 *    real construct behind it, but no spelling has reached it in three waves.
 *      Spellings measured, all emitting `ldrb; lsls; asrs` for BOTH tables:
 *      wave 57 -- a single array-indexed read of this member in isolation
 *                 DOES fold to `movs r0,#0; ldrsb`; an `s8 *t = ...unk20`
 *                 local; an `int` index; the bare member read multiplied
 *                 inline. Reading BOTH parallel tables off the same base is
 *                 what breaks it.
 *      wave 88 -- binding the PRODUCTS instead of the raw values
 *                 (`x = ...unk20[i] * 16;`); `s8` locals instead of `int`
 *                 locals for the two values; an `int` index local copied from
 *                 the `s8` loop counter.
 *    The wave-57 note predicted this would resolve on its own once fact 2
 *    stopped costing a register. WAVE 88 MEASURED THAT AND IT IS REFUTED --
 *    with the narrowing gone the fold is unchanged, and the -2 register-shuffle
 *    credit the old accounting counted disappeared at the same time, so the
 *    total stayed +4 rather than falling to +2.
 *      The wave-30 `volatile` lever remains unusable regardless: struct
 *    Unk0849D5F8's unk20/unk2c are written by the already matched
 *    src/decomp/c_08038848.c and read by src/decomp/c_08039064.c. DO NOT add
 *    `volatile` to that struct to buy this.
 *
 * 2. THE PROTOTYPE -- REAL, MEASURED ON BOTH SIDES, AND NOT THE BLOCKER.
 *    sub_08039140 is declared `u8 sub_08039140(u16, s16, u8, u8)` and this
 *    caller passes `x * 16` for parameter 0, which under `u16` costs a
 *    narrowing (`lsls #20; lsrs #16`) where the ROM has a bare `lsls #4`: +2.
 *      Wave 88 applied the retype-plus-explicit-cast form of the kind-5 lever,
 *    the form that closed sub_0807F57C in the same wave. The CALLER half
 *    CONFIRMED: with parameter 0 declared `int` the narrowing collapses to the
 *    ROM's bare `lsls r7, r0, #4` and this function goes 31.8% -> 33.6%.
 *      The DEFINITION half is REFUTED. `int x` plus `u16 a = (u16)x;` as the
 *    first statement of src/decomp/c_08039140.c is size-exact at 72 bytes with
 *    10 of 72 differing, and the entire residual is a four-instruction block
 *    swap: the ROM converts x FIRST, then w, then h, while the compensated
 *    source converts w and h first and x third. A sub-word PARAMETER's
 *    conversion is emitted in the prologue insn group ahead of every source
 *    statement, and the compensating cast IS a source statement -- it can
 *    reproduce the conversion's instructions but never its position. `a = x;`
 *    plain and the inline `(s16)(u16)x` were tested too and are no better.
 *      `s16` for parameter 0 is refuted without a probe: the ROM zero-extends
 *    x at entry AND re-signs it at the single use, two pairs, and a signed
 *    narrow parameter gets only the one sign-extending pair (parameter y in
 *    that same prologue is the control). Only `u16` produces both.
 *      The unprototyped route (`u8 sub_08039140();`) was closed by probe in
 *    wave 57: agbcc rejects it as a hard C89 6.5.4.3 error, not a warning.
 *      So the conflict is genuine and irreducible under one shared prototype,
 *    and it is worth exactly 2 bytes -- which is not what stands between this
 *    function and a match. Everything was restored: the header is back to
 *    `u16` and sub_08039140 was re-verified MATCHED by exit code.
 *
 * The `u8` return, by contrast, IS consistent and was fixed: c_08039140.c was
 * retyped from `int` and re-verified, which is what produces the ROM's
 * `lsls r0,#0x18; cmp r0,#0` on the result. */
void sub_08039188(void)
{
    s8 i;
    int x;
    int y;

    if (gUnknown_0849D5F8->unk45 == 0)
        return;

    for (i = gUnknown_0849D5F8->unk45; i >= 0; i--)
    {
        x = gUnknown_0849D5F8->unk20[i];
        y = gUnknown_0849D5F8->unk2c[i];

        if (sub_08039140(x * 16, y * 16, 0x10, 0x10) != 0)
        {
            PutSprite(3,
                      (x * 16 - *(s16 *)(gUnknown_08499590 + 4)) & 0x1FF,
                      (y * 16 - *(s16 *)(gUnknown_08499590 + 6)) & 0xFF,
                      gUnknown_0848B690,
                      0x3000 | gUnknown_0849D5C4[sub_080390CC(i)][sub_08039064(i)]);
        }
    }
}
