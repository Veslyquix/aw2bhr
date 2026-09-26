#ifndef GUARD_CO_H
#define GUARD_CO_H

/* The per-army player record and the CO data table it indexes through
 * PlayerStruct.co. Moved out of include/unknown-globals.h; every evidence
 * comment below is the original wave note, unchanged.
 *
 * gPlayers is 1-based: slots 1..4 are the four armies and slot 0 is unused.
 */

/* CO ids: PlayerStruct.co, and the row index into gUnknown_085D3DD0. Each
 * value was checked against its row's nameIndex in gTextTable in the ROM.
 * From npiriou's PR #1. */
enum CoId
{
    CO_NELL = 0,
    CO_ANDY = 1,
    CO_MAX = 2,
    CO_OLAF = 3,
    CO_SAMI = 4,
    CO_GRIT = 5,
    CO_KANBEI = 6,
    CO_SONJA = 7,
    CO_EAGLE = 8,
    CO_DRAKE = 9,
    CO_STURM = 10,
    CO_FLAK = 11,
    CO_LASH = 12,
    CO_ADDER = 13,
    CO_HAWKE = 14,
    CO_HACHI = 15,
    CO_COLIN = 16,
    CO_JESS = 17,
    CO_SENSEI = 18,
};

/* Merged from eight variants -- the widest disagreement in the tree. Every
 * variant agreed on 0x3c total; they differed only in which bytes they had
 * bothered to name.
 */
struct PlayerStruct /* 0x3c */
{
    /* 0x00 */ u32 funds; /* word: sub_08025B28 does `-= a2` with ldr/str.
                           * Unsigned: sub_08025B58 clamps it with `cmp; bls`
                           * against 999999 (0xf423f), an unsigned compare. */
    /* 0x04 */ u32 spent; /* word, unsigned, same 999999 clamp (sub_08025B28) */
    /* 0x08 */ u32 income; /* Wave 29, W29-A. Whole-word `ldr` at +8, and
                           * sub_08026F04 hands it straight to sub_08025B58's
                           * declared `u32` second parameter -- so a word, not
                           * four bytes of filler. Nothing writes it yet. */
    /* 0x0c */ u8 bases;
    /* 0x0d */ u8 cities;
    /* 0x0e */ u8 airports;
    /* 0x0f */ u8 ports;
    /* 0x10 */ u8 labs; /* Wave 45, W45-D. Was filler_10[0x01]; same extent, so
                          * nothing moves. sub_08026D68's terrain census counts
                          * one map property per army into 0x0c..0x10, and this
                          * is the fifth counter: `ldrb r0,[r4,#0x10]; adds r0,#1;
                          * strb` in the arm for terrain id 20, exactly the shape
                          * of the 0x0c/0x0d/0x0e/0x0f arms beside it. Width from
                          * the load; nothing in src/ named the filler. */
    /* 0x11 */ u8 captures; /* Wave 38, W38-I. sub_08028B70 walks slots 1..4 and
                          * returns the first whose +0x11 byte compares `bhs`
                          * against the u8 gPlaySt.unk31 -- a plain
                          * `ldrb` and an UNSIGNED compare against another u8, so
                          * u8. Carved out of the old filler_10[0x03]; 0x10 and
                          * 0x12 stay unnamed and nothing in src/ named the
                          * filler. */
    /* 0x12 */ u8 unk12; /* Wave 41, W41-D. Was filler_12. sub_08026BAC's
                          * per-army reset clears 0x11, 0x12 and 0x13 as three
                          * separate `strb` statements, each off its own
                          * reload of the array pointer, so 0x12 is a field of
                          * its own and not padding between unk11 and unk13.
                          * Width from the store; nothing reads it. */
    /* 0x13 */ u8 unk13; /* Wave 38, W38-L. A FLAG BYTE, bit 5: sub_080270B8
                          * walks slots 1..4 and returns TRUE for the first
                          * whose unk1b is set AND whose +0x13 byte passes
                          * `movs r4,#0x20; ands`. A plain `ldrb` and a mask
                          * held in a register across the loop, so a byte with
                          * a mask, not a bitfield -- a 1-bit field would have
                          * been a constant shift pair (same reasoning as
                          * unk2c). Reached as element base + 0x13 with the
                          * giv, so no displacement evidence either way. */
    /* 0x14 */ u16 defeated; /* Wave 38, W38-L. Confirmed a HALFWORD from a store,
                           * not only from reads: sub_08027118 clears it with a
                           * bare `strh r0, [rB, #0x14]` -- inside `ldrh`/`strh`
                           * displacement range, so no address arithmetic hides
                           * the width. */
    /* 0x16 */ u16 destroyedThisTurn; /* a running count: sub_08026588 does `unk16++` and
                           * then keeps unk18 as its high-water mark, comparing
                           * the two with `cmp; bls` -- an unsigned compare, so
                           * both halfwords are unsigned */
    /* 0x18 */ u16 totalDestroyed;
    /* 0x1a */ u8 teamColor; /* sub_0803D6D0 snapshots [0..4] of these into
                          * gUnknown_030040F8, one per player slot.
                          * Wave 38, W38-L: sub_08027198 is the reverse lookup
                          * -- it walks slots 1..4 and returns the index of the
                          * first live slot whose unk1a EQUALS its argument, so
                          * unk1a is a key that is unique across the four
                          * slots, not a count. Plain `ldrb` compared straight
                          * against an `int` parameter with no narrowing at
                          * either end, so the width is from the load only. */
    /* 0x1b */ u8 aiControlled; /* Wave 38, W38-L. The SLOT-OCCUPIED flag, and the
                          * guard every slot walk in block 0x08027000 opens
                          * with: sub_080270B8, sub_08027118 and sub_08027198
                          * all test it `!= 0` before touching any other member
                          * of the same element, and sub_080270F0 tests it
                          * `== 1` specifically -- so it carries more than one
                          * non-zero value and 1 is a distinguished one. Plain
                          * `ldrb` throughout. */
    /* 0x1c */ u8 turnState;  /* a flag byte; sub_080359A4 tests bit 1 with a plain
                           * `movs #2; ands` mask (wave 13, A2) */
    /* 0x1d */ u8 co; /* indexes gUnknown_085D3DD0 (sub_08043D84) */
    /* 0x1e */ u8 coMode;
    /* 0x1f */ u8 coActivationMode;
    /* 0x20 */ u32 coCharge;
    /* 0x24 */ u8 unk24; /* wave 25: zeroed with a plain `strb` by sub_0804438C
                          * right after it runs the per-turn income for the same
                          * army, so a companion counter to unk25 one byte over.
                          * Past `strb`'s 31-byte displacement, hence the
                          * `adds r0,#0x24` on the element base. */
    /* 0x25 */ u8 unk25;
    /* 0x26 */ u16 tempFirepower;
    /* 0x28 */ u16 tempDefense;
    /* 0x2a */ u8 team; /* sub_08026F9C/sub_08026FD0 compare it between two
                          * entries; both reach it as element [n + 1], so the
                          * runtime offset is 0x3c + 0x2a = 0x66 */
    /* 0x2b */ u8 unk2b; /* Wave 41, W41-D. Was filler_2b. THE ARMY'S OWN BIT:
                          * sub_08026BAC finishes its reset by storing 1, 2, 4
                          * and 8 into slots 1..4 at this offset (the ROM
                          * displacements 0x67 / 0xa3 / 0xdf / 0x11b are
                          * 0x3c * k + 0x2b), i.e. one set bit per army slot.
                          * That makes it the producer for the four-bit mask
                          * unk2c is documented as consuming, and its
                          * neighbour by construction. Plain `strb`. */
    /* 0x2c */ u8 unk2c; /* a FOUR-BIT MASK, one bit per 64-unit army slot:
                          * sub_08058254 / sub_08058318 loop i over 0..3 and
                          * skip army i when `(unk2c >> i) & 1` is set, then
                          * scan gUnknown_08499594[i * 64 .. i * 64 + 63].
                          * Plain `ldrb` and an `asrs` by a variable, so a byte
                          * and not a bitfield -- a bitfield would have been a
                          * constant shift pair (wave 20, W20-C). */
    /* 0x2d */ u8 hqX; /* bit 7 is a flag: sub_08026D44 returns
                          * `(unk2d & 0x80) == 0` */
    /* 0x2e */ u8 hqY; /* Wave 37, W37-I. The partner of unk2d: sub_080267AC
                          * masks BOTH with `& 0x7f` off the same `* 0x3c`
                          * element base (`adds rB,#0x2d` / `adds rB,#0x2e`,
                          * past the imm5 range) and hands the pair to
                          * sub_08022AAC(s16, s16) as one coordinate pair, the
                          * same role unk2f/unk30 play in the same function's
                          * tail. Byte from the `ldrb`; the 0x7f mask says bit 7
                          * is the flag unk2d's note describes and the value is
                          * seven bits wide. Was filler_2e. */
    /* 0x2f */ u8 cursorX; /* Wave 29, W29-A. An ADJACENT PAIR: sub_0802A4DC reads
                          * unk2f and unk30 off one element address (`adds
                          * rB,#0x2f` / `adds rB,#0x30`, both past `ldrb`'s
                          * 5-bit displacement) and hands them to
                          * sub_08029088(s16, s16) as its two coordinates. Width
                          * from the loads; the s16 parameters do not narrow
                          * them, so signedness is unproved. */
    /* 0x30 */ u8 cursorY;
    /* 0x31 */ u8 unk31;
    /* 0x32 */ u8 killOnEndTurn; /* wave 32 (W32-C): sub_08028944 tests it `!= 0` with a
                          * plain `ldrb` reached by `adds rB, #0x32`, the same
                          * past-the-imm5 address arithmetic unk30/unk31 use. */
    /* 0x33 */ u8 rank; /* Wave 41, W41-D. Was filler_33. sub_08026520 fills
                          * 0x33..0x36 and 0x38 for slots 1..4 in one loop body:
                          * unk34 = sub_080263A4(i), unk35 = sub_08026424(i),
                          * unk36 = sub_080264BC(i), unk38 = sub_08026368(i) and
                          * finally unk33 = sub_08037D80(unk38). All four byte
                          * stores are plain `strb` off `adds rB,#0xNN` on the
                          * element base. So unk33 is the summary/grade byte
                          * derived from unk38, written last. */
    /* 0x34 */ u8 speedScore; /* three adjacent byte counters summed by sub_08026368
                          * and clamped to 9999 above 999. Each needs its own
                          * `adds rB, #0x34` because 0x34 is past the `ldrb`
                          * displacement limit of 31 -- not an address being
                          * taken. */
    /* 0x35 */ u8 powerScore;
    /* 0x36 */ u8 techScore;
    /* 0x37 */ u8 filler_37[0x01];
    /* 0x38 */ u16 totalScore; /* Wave 41, W41-D. Carved out of the old
                           * filler_37[0x03]. A HALFWORD from a store, not only
                           * a load: sub_08026520 writes sub_08026368's u32
                           * result here with a bare `strh r0, [r1, #0x38]` --
                           * inside strh's displacement range, so no address
                           * arithmetic hides the width -- and immediately reads
                           * it back with `ldrh r0, [r1, #0x38]` to feed
                           * sub_08037D80. The store-then-reload is the source
                           * writing the field and then passing the FIELD, not
                           * the register. sub_08026368 sums unk34/unk35/unk36
                           * and clamps to 9999, which is why this needs 16
                           * bits where its three inputs are bytes.
                           * Signedness unproved: sub_08037D80 takes `int` and
                           * the ldrh is zero-extending by construction. */
    /* 0x3a */ u8 unitCount;
    /* 0x3b */ u8 unitsLost;
};

/* The 0x44-byte sub-record at +0x38 of struct Unk085D3DD0. Stride proved by
 * `lsls #4; adds` (x17) sharing the outer `lsls #2` with the x65 outer index in
 * sub_08042E2C, sub_08042E84, sub_08042EDC, sub_08042FC4 and sub_0804301C --
 * i.e. base + a*0x104 + b*0x44 + K, with K running 0x40, 0x46, 0x48, 0x4a,
 * 0x4e.
 *
 * The array base was +0x40 until wave 9. sub_08039F18 reaches this record with
 * the same a*0x104 + b*0x44 index math and K = 0x38, which +0x40 cannot express
 * (it would be member offset -8), so the array starts at +0x38 and every member
 * above moved up by 8. The new base also makes the record array cover the
 * struct exactly: 0x38 + 3 * 0x44 == 0x104, so the extent is 3 and the old
 * `filler_c8[0x3c]` tail is gone -- that tail was itself an artefact of the
 * wrong base. Anything citing the old numbering wants +8 added to it. */
struct Unk085D3DD0Entry /* 0x44 */
{
    /* 0x00 */ u32 powerNameId; /* indexes gTextTable (sub_08039F18) */
    /* 0x04 */ void (*powerAssembly)(void *); /* wave 32 (W32-C): sub_08044B28 loads it
                                       * and calls it through `bl _call_via_r1`
                                       * with its own ProcPtr argument in r0 --
                                       * r1 holds the pointer, so exactly one
                                       * argument. */
    /* 0x08 */ u32 specialAbilities;
    /* 0x0c */ s16 visionBonus; /* `ldrsh`, sub_080432A8 (K = 0x44 = 0x38 + 0x0c) */
    /* 0x0e */ s16 luckPositive;
    /* 0x10 */ s16 luckNegative;
    /* 0x12 */ s16 counterMultiplier;
    /* 0x14 */ s16 unitCostModifier; /* `ldrsh`, sub_08043270 (K = 0x4c = 0x38 + 0x14) */
    /* 0x16 */ s16 captureRateModifier;
    /* 0x18 */ s8 *movementChart[3]; /* Wave 34, W34-F. A pointer to a [movement type][32
                           * terrain] table of SIGNED cost bytes: sub_08041EA8
                           * reads `unk18[(cell & 0x1f) + gUnknown_085D5ABC[t]
                           * .unk19 * 32]` with `movs r0,#0; ldrsb r0,[r3,r0]`
                           * and rejects the cell when it is negative, so the
                           * pointee is s8 and the row stride is 32. Reached as
                           * the constant offset 0x154 == 1 * 0x104 + 0x38 +
                           * 0x18, i.e. gUnknown_085D3DD0[1].unk38[0].unk18.
                           *   WAVE 37 (W37-H): widened from a scalar `s8 *` to
                           * `s8 *[3]`, absorbing the old filler_1c[0x08] --
                           * 0x18 + 3*4 == 0x24 fills the gap up to unk24
                           * exactly. sub_08038848 selects between the three
                           * with gPlaySt.unk2c (`(unk1e * 17 +
                           * unk2c) << 2` off the +0x50 member base, i.e. a
                           * 4-byte element stride inside a 0x44 entry stride).
                           * The start offset is unchanged, so this is
                           * byte-neutral; src/decomp/c_08041EA8.c was updated
                           * to `.unk18[0]` and re-verified byte-exact. */
    /* 0x24 */ s16 *unk24[8]; /* An array of POINTERS, not values: family F049
                               * (sub_080430B0/08043120/08043190/08043200)
                               * loads one word out of it and then reads an s16
                               * THROUGH it (`ldr r7,[r3]; movs r2,#K;
                               * ldrsh r0,[r7,r2]` with K = 0, 2, 4, 6).
                               * The extent 8 is proved the same way the +0x38
                               * re-base was: 0x24 + 8*4 == 0x44 fills the
                               * record exactly, and the two indices in use
                               * span it -- gUnknown_085D5ABC[c].unk18 and
                               * sub_080432E0(c), which returns 5, 6 or 7.
                               * The pointee is modelled as bare `s16 *` and
                               * indexed p[0..3]; a pointer to a four-s16
                               * struct is byte-identical and NOT ruled out. */
};

/* The per-CO data table, indexed by gPlayers[].co. Field names nameIndex,
 * music, snowBringerPercent, rainBringerPercent, coPowerStars,
 * superCoPowerStars, copQuote, victoryQuote and power, and every name on
 * struct Unk085D3DD0Entry, come from the 'aw2co' Nightmare module -- a
 * community ROM-editor definition, not this tree's work and not SRR_AW2's;
 * that repo only carries a copy of the module set.
 *
 * The module's flat offsets are what revealed the shape this tree had already
 * found: its three named groups at 0x38, 0x7C and 0xC0 are 0x44 apart, which
 * is exactly unk38[3] -- one Unk085D3DD0Entry per power level, day-to-day,
 * CO power and super CO power, the same 0/1/2 that gPlayers[].coMode holds.
 * unk20[6] likewise lines up with its six COP quotes and Entry's
 * movementChart[3] with its normal/snow/rain movement charts, all three of
 * which were derived here independently before the module was consulted.
 *
 * NOT applied: the module calls +0x14 'Army Sprites' (two bytes), but
 * sub_08039948 reads +0x14 as a bare `ldrb` switched over 0..3, so that one
 * is left alone. +0x16 'Colour' has no corroboration here either. */
struct Unk085D3DD0 /* 0x104 */
{
    /* 0x00 */ u32 nameIndex; /* Wave 36, W36-K: carved out of filler_00[0x04]. A
                           * subscript into gTextTable[] (the same role
                           * unk38[..].unk00 plays at +0x38): sub_080686E8 and
                           * sub_08068810 both do `ldr` at the row base and then
                           * `lsls #2; adds` off gTextTable to reach the
                           * graphics blob they hand sub_08068038. Whole word,
                           * so not four filler bytes. Start offset unchanged,
                           * so the carve is byte-neutral for every other
                           * reader. */
    /* 0x04 */ u16 music;
    /* 0x06 */ s16 snowBringerPercent; /* both `ldrsh`, sub_08042F7C and sub_08042F34 */
    /* 0x08 */ s16 rainBringerPercent;
    /* 0x0a */ u8 filler_0a[0x02];
    /* 0x0c */ int coPowerStars; /* This CO power's star count, and
                           * superCoPowerStars at +0x10 is the super's. Read
                           * `ldr` off `adds r3,#0xc` / `adds r3,#0x10` on the
                           * bare table symbol with the x0x104 outer index, by
                           * sub_080441D4 and sub_08044208, each of which
                           * returns `sub_0804419C(army) * <this>` -- a
                           * per-star cost times a star count, which is what
                           * fixes the meaning. Whole words here; the Nightmare
                           * module declares only the low byte of each.
                           * Signedness unproved -- `muls` is byte-neutral -- so
                           * `int` is the weakest model that fits.
                           *
                           * WAVE 25 READ THIS PAIR WRONG and the old note is
                           * worth recording: it called them "the two income/
                           * repair rates for the terrain named by
                           * gPlayers[army].unk1d". That field is gPlayers[].co,
                           * a CO id and not a terrain, so the subscript was
                           * misread and the per-terrain reading followed from
                           * it. */
    /* 0x10 */ int superCoPowerStars;
    /* 0x14 */ u8 unk14; /* Wave 34 (W34-H): sub_08039948 switches on it with a
                          * bare `ldrb r1,[r0,#0x14]` over cases 0..3, each
                          * arm picking one of four (unk2c, unk30) offset pairs
                          * -- so it is a small enumerated direction/side tag. */
    /* 0x15 */ u8 unk15;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ u8 unk17; /* Wave 37, W37-K2. sub_0805DB70 reads it with a
                          * plain `ldrb` off the 0x104 element and multiplies
                          * sub_08044208's result minus sub_080441D4's by it
                          * before `Div(.., 100)` -- a per-terrain percentage,
                          * the companion of unk0c/unk10 above. */
    /* 0x18 */ u8 unk18; /* Wave 37, W37-K2. Compared UNSIGNED (`cmp; bhs`)
                          * against `sub_080129E0() % 100` in the same
                          * function -- a percentage chance. Plain `ldrb`. */
    /* 0x19 */ u8 filler_19[0x03];
    /* 0x1c */ u8 (*unk1c)(int); /* Wave 37, W37-K2. A whole-word function
                          * pointer: sub_0805DB70 loads it, tests it against
                          * NULL and calls it through `bl _call_via_r1` with
                          * ONE argument (2 on one path, 1 on the other), then
                          * narrows the result with `lsls #0x18; lsrs #0x18`
                          * before `cmp #1` -- so u8 in, one int argument. The
                          * register index of the veneer is what fixes the
                          * arity. Carved out of filler_17, offsets
                          * unchanged. */
    /* 0x20 */ u16 copQuote[0x06]; /* Wave 30, W30-A: sub_080398D0 picks one of
                                 * SIX with `sub_080129E0() % 6` and hands it
                                 * to sub_080397F4(u16). The `adds r4,#0x20` on
                                 * the bare table symbol -- kept in r4 across
                                 * the __umodsi3 call -- is the member-array
                                 * hoist, the same idiom sub_08039F18 uses for
                                 * unk38. The extent is proved by the modulus,
                                 * not by the layout. */
    /* 0x2c */ u16 dossierPage[4]; /* the four CO dossier text ids; carved out
                                    * of filler_2c[0x08], same offset and same
                                    * eight bytes, and nothing named the filler. */
    /* 0x34 */ u16 victoryQuote; /* Wave 55 (W55-B), carved out of filler_2c without
                           * moving anything: sub_0807A3AC's fallback return is
                           * `ldrh r0,[r1,#0x34]` off `gUnknown_085D3DD0[a]`
                           * (the `(a*64+a)*4` stride synthesis), reached
                           * whenever its 42-case lookup finds no entry. Width
                           * only -- a `ldrh` feeding an `int` return signs
                           * nothing. */
    /* 0x36 */ u8 filler_36[0x02];
    /* 0x38 */ struct Unk085D3DD0Entry power[3];
};
extern const struct Unk085D3DD0 gUnknown_085D3DD0[];

/* Wave 41, W41-B. THE ROM WORD AT 0x08090940 (gen_lds.py's gUnknown_08090940)
 * HOLDS 0x08499598, i.e. &gPlayers, and it must NOT be declared as a
 * global. It is agbcc's own -fforce-addr address-constant pool entry, and the
 * honest spelling reproduces it: sub_080208C8 reads the array with the
 * THREE-level chain (`ldr rA,=<pool>; ldr rB,[rA]; ldr rC,[rB]`) at all five
 * sites, and writing plain `gPlayers[i]` emits exactly that, with
 * trymatch reporting only `relocs: name different symbols that resolve to the
 * same address`. The promotion carries "rodata": ["0x08090940"].
 *   This is the wave-18/39 case, NOT the W38-C sub_0803E6C4 case where naming
 * the word was required -- the difference is that here EVERY reference goes
 * through the pool word, so there is no two-level read for the honest spelling
 * to get wrong. Check that before reaching for a `**` declaration on one of the
 * other accessor words for this same array. */
extern struct PlayerStruct *gPlayers;

#endif /* GUARD_CO_H */
