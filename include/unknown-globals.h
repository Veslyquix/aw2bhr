#ifndef UNKNOWN_GLOBALS_H
#define UNKNOWN_GLOBALS_H

#include "global.h"

/* Types and declarations for the still-unnamed globals, the counterpart to
 * unknown-functions.h. Every promoted file gets this through global.h.
 *
 * Why it exists: before this header each translation unit carried its own
 * `extern` and its own idea of the layout. They compiled because they were
 * separate TUs, not because they agreed -- gUnknown_08499598 had eight
 * different bodies and gUnknown_03002B6C had three different types. Nothing
 * caught the disagreement, and every wave of promotions added more.
 *
 * Rules for editing:
 *   * A struct here is a superset. Adding a field is fine; moving one is not.
 *     Offsets, member types and the total size are all load-bearing -- agbcc
 *     picks the instruction from the member type and the index stride from
 *     sizeof, so a change to any of them silently breaks a match somewhere
 *     else. The size in the comment on each struct is the checked value.
 *   * `filler_XX` is unexplored space, `unkXX` is a field something reads.
 *     Narrowing a filler into a field is the normal way this grows.
 *   * The display-register shadows (gUnknown_03002B6C, gUnknown_030030A4,
 *     gUnknown_030030E0 and neighbours) are NOT here -- they live in
 *     hardware.h, next to the register types they mirror.
 */

/* ---------------------------------------------------------------- types -- */

struct UnkVec
{
    u32 unk00;
    u32 unk04;
};

/* The GBA OBJ attribute triple. `struct UnkVec` is the SAME eight bytes seen
 * from the accessor side -- sub_08015608/sub_0801566C move it as two words and
 * therefore cannot see any structure in it. sub_0804D928 and sub_0804E3B4 do:
 * they fetch one into a stack local, poke four fields and hand it back, and
 * every access lands exactly where the hardware layout says.
 *
 * Evidence, all from those two (identical) functions:
 *   hFlip      `ldrb [fp,#3]` + mask ~0x10  -> attr1 bit 12
 *   paletteNum `ldrb [fp,#5]` + mask  0x0f  -> attr2 bits 12-15
 *   priority   `ldrb [fp,#5]` + mask ~0x0c  -> attr2 bits 10-11
 *   tileNum    `ldrh [fp,#4]` + mask 0xfc00 -> attr2 bits 0-9
 * The two `mov #N; neg` masks are the bitfield-store tell from
 * docs/agbcc-codegen.md, and the widths pin get_best_mode's choice of QI for
 * the three byte-contained fields and HI for the one that straddles bytes 4-5.
 * The u32 container for attr0/attr1 and the u16 one for attr2 are what put
 * hFlip in byte 3 rather than byte 1; a u16 container for every group is
 * byte-identical here and only a field spanning attr0/attr1 could tell them
 * apart. Names outside the four proved fields are the conventional GBA ones
 * and are NOT evidence. */
struct OamData
{
    /* 0x00 */ u32 y : 8;
               u32 affineMode : 2;
               u32 objMode : 2;
               u32 mosaic : 1;
               u32 bpp : 1;
               u32 shape : 2;
    /* 0x02 */ u32 x : 9;
               u32 matrixNum : 3;
               u32 hFlip : 1;
               u32 vFlip : 1;
               u32 size : 2;
    /* 0x04 */ u16 tileNum : 10;
               u16 priority : 2;
               u16 paletteNum : 4;
    /* 0x06 */ u16 affineParam;
};

/* 0x10 bytes: sub_08017A58/sub_08017B8C/sub_08017BB0 all advance a cursor of
 * this type by exactly 0x10. unk04 is a `next` link in sub_08018BAC and the
 * destination address of a store in sub_08017B8C/sub_08017BB0, which cast it;
 * unk0c is the value written there.
 *
 * unk0c has BOTH readings and the handlers are interleaved, so do not settle it
 * from a neighbour. It is an immediate in sub_08017B8C/sub_08017BB0 (`strh`/
 * `str` of the word itself) and sub_08017B64 (`strb`), and a SOURCE ADDRESS in
 * sub_08017BD4/sub_08017BFC/sub_08017C24, which deref it `ldrb`/`ldrh`/`ldr`
 * before the store. Six one-instruction variants of one 40-byte template:
 * {u8, u16, u32} x {immediate, indirect}. The declared `u32` covers both; the
 * indirect trio casts it to a pointer in the .c.
 */
struct Unk0200C528Node /* 0x10 */
{
    /* 0x00 */ u8 filler_00[4];
    /* 0x04 */ struct Unk0200C528Node *unk04;
    /* 0x08 */ u16 unk08; /* ldrh at +8, sub_08018C54/sub_08018D90 */
    /* 0x0a */ u16 unk0a; /* ldrh at +a, sub_08018CBC/sub_08018D90 */
    /* 0x0c */ u32 unk0c;
};

struct Unk0200C528 /* 0x18 */
{
    /* 0x00 */ struct Unk0200C528Node *unk00;
    /* 0x04 */ struct Unk0200C528Node *unk04;
    /* 0x08 */ struct Unk0200C528Node *unk08; /* word slot; sub_08018B40
                                               * writes the node's unk04 here,
                                               * exactly as sub_08018B18 writes
                                               * it to gUnknown_03002F20 */
    /* 0x0c */ u16 unk0c;
    /* 0x0e */ u8 filler_0e[0x0a];
};

struct SpriteEntry /* 0x10 */
{
    /* 0x00 */ struct SpriteEntry *next;
    /* 0x04 */ u16 oam1;
    /* 0x06 */ u16 oam0;
    /* 0x08 */ u16 oam2;
    /* 0x0c */ u16 *object;
};

/* Merged from six variants. unk30 was `u32 unk30; u32 unk34` in the setters
 * and `struct UnkVec unk30` in sub_08015608/sub_08015638, which return it by
 * value; the pair form was never actually read, so the vector form wins.
 *
 * unk0c/unk10 and unk14/unk18 are TWO 8.8 fixed-point pairs, not four loose
 * words: sub_0801D98C sets the first from (s16 x, s16 y) << 8 and sub_0801D96C
 * the second, and sub_0801DDBE does `unk14 + unk0c` -- so unk0c/unk10 is the
 * step and unk14/unk18 the accumulated position.
 *
 * unk1e and unk28 are read by six functions and every one of them uses a bare
 * `ldrb`, so `u8` is the best available model -- but no access sign-extends
 * and none clears them, so an `s8` object read in a `u8` context would look
 * identical. Unproved in the direction the codegen doc warns about.
 */
struct Unk0200E438 /* 0x4c */
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ u32 unk04;
    /* 0x08 */ u32 unk08;
    /* 0x0c */ s32 unk0c;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s32 unk18;
    /* 0x1c */ u16 unk1c;
    /* 0x1e */ u8 unk1e;
    /* 0x1f */ u8 filler_1f[0x01];
    /* 0x20 */ u32 unk20; /* set by sub_08015778 */
    /* 0x24 */ u8 filler_24[0x04];
    /* 0x28 */ u8 unk28;
    /* 0x29 */ u8 filler_29[0x03];
    /* 0x2c */ u32 unk2c; /* returned by sub_0801DA44 */
    /* 0x30 */ struct UnkVec unk30;
    /* 0x38 */ u8 filler_38[0x04];
    /* 0x3c */ u16 unk3c;
    /* 0x3e */ u16 unk3e;
    /* 0x40 */ s16 unk40;
    /* 0x42 */ u8 filler_42[0x02];
    /* 0x44 */ u32 unk44;
    /* 0x48 */ u32 *unk48;
};

/* 0xe0 bytes, per the map (gUnknown_0200C500 is the next symbol) -- not the
 * u32[2] it was first declared as. Only the first two words are the save/restore
 * pair shared with gUnknown_0200C500, which really is 8 bytes; the rest of the
 * object is unrelated. unk20 is indexed by `a % 24` (sub_08017860 via __modsi3),
 * which is what fixes its extent at 0x18.
 */
struct Unk0200C420 /* 0xe0 */
{
    /* 0x00 */ u32 unk00; /* UNSIGNED, and a spendable counter: sub_08017704 is
                           * "subtract if affordable" -- `cmp; bhs` is the
                           * unsigned compare, and it returns 0 rather than
                           * underflowing. Its one caller (sub_08049360)
                           * discards the result. */
    /* 0x04 */ u32 unk04; /* sub_0803BB90 is the predicate `unk04 != 0` */
    /* 0x08 */ u8 unk08; /* sub_08016A14 bumps it while bit 0 is clear */
    /* 0x09 */ u8 filler_09[0x7];
    /* 0x10 */ u16 unk10; /* `ldrh r0, [r4, #0x10]` in sub_0803C52C, twice, and
                           * fed straight to sub_08037DA4, which bands it into
                           * 2..5 at 0xc7 / 0xf9 / 0x117. A monotone counter of
                           * some kind; the compare in sub_08037DA4 is signed
                           * (`bgt`) but nothing narrows or sign-extends the
                           * value here, so only the 16-bit width is proved. */
    /* 0x12 */ u8 filler_12[0xe];
    /* 0x20 */ u8 unk20[0x18];
    /* 0x38 */ u8 filler_38[0xa8];
};

/* Reached as a struct, not as the u16 array it was first declared as: there is
 * a `strb` at +6, which no u16 element addresses. The distinction is not
 * cosmetic -- sub_08003934's `|= 8` at +0 only matches through an aggregate
 * member lvalue (see the `orr` operand rule in docs/agbcc-codegen.md), so a
 * scalar spelling of this global cannot express it at all.
 */
struct Unk0200B0B0 /* >= 0x76 */
{
    /* 0x00 */ u16 unk00; /* flags; bit 3 set by sub_08003934, cleared by sub_08003948;
                           * bit 14 set by sub_08004BC0 */
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ s8 unk06; /* SIGNED, same tell as unk07/unk11 one line down:
                          * sub_08000694 (wave 13) reads it `movs r0,#6;
                          * ldrsb r0,[r2,r0]`. Was u8; its only other user,
                          * sub_0800056C's `= 1`, is a bare `strb` and is
                          * byte-identical either way (re-verified with
                          * trymatch after the change). */
    /* 0x07 */ s8 unk07; /* SIGNED: sub_08007328 reads it `movs r0,#7;
                          * ldrsb r0,[r2,r0]` -- the register offset is ldrsb
                          * having no immediate form, same shape as unk11.
                          * Used only as a zero test, selecting a ring size of
                          * 10 when clear and 8 when set. */
    /* 0x08 */ s16 unk08; /* The cell coordinate pair the whole 0x0800xxxx tile
                           * family is keyed by. SIGNED: sub_080085E0 reads both
                           * halves `movs r0,#8; ldrsh` / `movs r2,#0xa; ldrsh`
                           * and hands them to nineteen different callees. */
    /* 0x0a */ s16 unk0a;
    /* 0x0c */ s32 unk0c; /* A word countdown: sub_08000694 stores 2 and 10
                           * into it and steps it with `ldr; subs #1; str`,
                           * testing the result with `ble`/`bge` -- a signed
                           * word, so `int`/`s32` and not a narrow field. */
    /* 0x10 */ u8 unk10; /* set to 0, 1 or 2 by family F057 (sub_08004EDC /
                          * sub_08004F1C / sub_08004F5C), which is one body
                          * three times: each tests a different bit of unk00
                          * (0x200 / 0x400 / 0x800) and stores the matching
                          * 0 / 1 / 2 here before starting the same script.
                          * A mode selector, not a flag. Bare `strb` of a
                          * literal, so the width is not otherwise constrained. */
    /* 0x11 */ s8 unk11; /* SIGNED: sub_08000D9C reads it `movs r0,#0x11;
                          * ldrsb r0,[r1,r0]` -- the register offset is ldrsb
                          * having no immediate form, and the sign extension is
                          * the object's, not a cast. Written 0x14 when zero. */
    /* 0x12 */ u8 filler_12[0x0e];
    /* 0x20 */ u16 unk20; /* sub_080085E0 stores the map tile under (unk08,
                           * unk0a) here on entry -- `strh`, so 16 bits. */
    /* 0x22 */ u8 filler_22[0x06];
    /* 0x28 */ u16 unk28; /* index into gUnknown_0200B224 (sub_08001CE8) */
    /* 0x2a */ u16 unk2a; /* The action code sub_080085E0 dispatches on: it
                           * switches on `unk2a & 0x1f` over cases 1..19 and
                           * separately passes the UNMASKED halfword to
                           * sub_0800C454, so the low five bits are a selector
                           * inside a wider word rather than the whole field. */
    /* 0x2c */ u8 filler_2c[0x03];
    /* 0x2f */ u8 unk2f; /* set by sub_080078D4 */
    /* 0x30 */ u8 filler_30[0x0a];
    /* 0x3a */ s16 unk3a; /* SIGNED: sub_08007328 reads it `movs r4,#0x3a;
                           * ldrsh r0,[r2,r4]`. A ring index -- 08007328 stores
                           * (unk3a + n - 1) % n into unk3c, with n from unk07. */
    /* 0x3c */ u16 unk3c;
    /* 0x3e */ u8 filler_3e[0x0e];
    /* 0x4c */ u16 unk4c;
    /* 0x4e */ u8 filler_4e[0x1c];
    /* 0x6a */ u8 unk6a;  /* A one-byte result code sub_080085E0 leaves behind:
                           * 0x2d, 0x4b, 0x87, 0x88, 0x89 or 0x8a depending on
                           * which of its nineteen cases ran. Reached as
                           * `adds rN, #0x6a; strb` because THUMB's strb
                           * immediate stops at 31. */
    /* 0x6b */ s8 unk6b;   /* a proc/sprite id with -1 as "none", and SIGNED:
                           * sub_08005F1C / sub_08007B74 read it `ldrsb`, test
                           * it against -1 and hand it to sub_08015328's s16
                           * parameter, then write 0xFF back. Reached as
                           * `adds rN, #0x6b; ldrsb` / `strb` for the same
                           * addressing-mode reason as unk6a above (wave 20,
                           * W20-C). */
    /* 0x6c */ u8 unk6c;  /* cleared alongside unk6e/unk70 by sub_08005D50,
                           * sub_08007A0C */
    /* 0x6d */ u8 filler_6d[0x01];
    /* 0x6e */ u16 unk6e; /* an x/y pair: (0x100,0x800) by sub_08005D50,
                           * (0x780,0x970) by sub_08007A0C */
    /* 0x70 */ u16 unk70;
    /* 0x72 */ u8 unk72;  /* four bytes written together, all 0 by sub_08003040
                           * and all 0x32 by sub_08003064 */
    /* 0x73 */ u8 unk73;
    /* 0x74 */ u8 unk74;
    /* 0x75 */ u8 unk75;
};

/* Stride 4, proved by `lsls #2` in sub_08001CE8, sub_08001D24 and sub_08006288;
 * sub_080077EC reaches element 9 as `+ 0x24`. Member +0x00 is SIGNED --
 * sub_08001CE8 reads it `ldrsh`, while the sub_08001D24 readers use `ldrh` and
 * immediately mask with 0x1f/0x3f, which is a u16 context on a signed object.
 * Nothing yet reaches +0x02.
 */
struct Unk0200B224 /* 0x04 */
{
    /* 0x00 */ s16 unk00;
    /* 0x02 */ u8 filler_02[0x02];
};

/* Stride 0x0c, proved by `lsls #1; adds; lsls #2` in sub_08011C18, which is
 * also the only reader so far -- it clears all four members of all 48 entries.
 * The word members hoist their offset onto the base (`adds r5, r4, #4`) while
 * the byte and halfword ones fold into a displacement, which is the array-
 * global rule in docs/agbcc-codegen.md and is what fixes the layout.
 * unk08 and unk0a are VOLATILE: each store is preceded by a load of its own
 * address into a register nothing reads, which for a QI/HImode aggregate
 * member is the volatile tell. The two words carry no such signal -- SImode
 * never gets the dead load -- so they are left plain.
 */
struct Unk0200B3B4 /* 0x0c */
{
    /* 0x00 */ u32 unk00;
    /* 0x04 */ u32 unk04;
    /* 0x08 */ volatile u16 unk08;
    /* 0x0a */ volatile u8 unk0a;
    /* 0x0b */ u8 filler_0b[0x01];
};

struct Unk0200F720 /* 0x10 */
{
    /* 0x00 */ u8 filler_00[0x06];
    /* 0x06 */ u16 unk06;
    /* 0x08 */ u16 unk08;
    /* 0x0a */ u16 unk0a;
    /* 0x0c */ u16 unk0c; /* 0x0c/0x0e set together by sub_0801E294 */
    /* 0x0e */ u16 unk0e;
};

struct Unk0200F920Entry
{
    u16 unk00;
    u16 unk02;
};

struct Unk0200F920 /* 0x88 */
{
    u8 filler_00[8];
    struct Unk0200F920Entry unk08[32];
};

/* 0x02027F74 -- unk36/unk37 are a cursor and its inclusive upper bound, reset
 * together by sub_080374F0 (0, 0xff), sub_08037508 (0, 0xff) and
 * sub_0803753C/sub_08037570 (0, 0x6a).
 */
struct Unk02027F74 /* >= 0x38 */
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 unk01;
    /* 0x02 */ u8 unk02;
    /* 0x03 */ u8 unk03;
    /* 0x04 */ u8 filler_04[0x32];
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 unk37;
};

struct Unk02028030 /* 0x48 */
{
    /* 0x00 */ u8 unk00[8];
    /* 0x08 */ u8 unk08[8];
    /* 0x10 */ u8 unk10[2];
    /* 0x12 */ u8 unk12[0x18];
    /* 0x2a */ u8 unk2a[3];
    /* 0x2d */ u8 unk2d[3];
    /* 0x30 */ u8 unk30[0x18];
};

struct Unk020280C0 /* 0x1c */
{
    /* 0x00 */ u8 filler_00[0x02];
    /* 0x02 */ u8 unk02[0x11]; /* a NUL-terminated byte string: sub_0803CCB8
                                * hands &g[i].unk02 to the copier sub_0803CC84,
                                * which walks it until a zero byte. The extent
                                * is the space available before unk13, not a
                                * proved bound. */
    /* 0x13 */ u8 unk13; /* 0xff = the slot is empty; sub_0803CCB8 refuses to
                          * copy the name out when it holds 0xff, and
                          * sub_0803CD14 returns it. sub_0803CCEC makes the
                          * same test and hands out gUnknown_0849F320 instead
                          * of &g[i].unk02 when it fires, which is what fixes
                          * that symbol as a fallback string of the same
                          * shape. */
    /* 0x14 */ u8 filler_14[0x08];
};

struct Unk02029A10 /* 0x24 */
{
    /* 0x00 */ u8 unk00; /* sub_08051F4C sets it to 1 with `strb` when unk01
                          * reads 1. Both are BYTES -- `ldrb [r1,#1]` and
                          * `strb [r1]` off the same element address -- which
                          * is what narrows the old filler_00[4]. */
    /* 0x01 */ u8 unk01; /* a three-way state: sub_08051F4C branches on == 1,
                          * then on == 0, and does nothing for anything else. */
    /* 0x02 */ u8 filler_02[0x02];
    /* 0x04 */ u16 unk04; /* sub_0804D290/sub_0804DCA8 fill unk04/unk06 from a
                           * two-halfword ROM record and then copy them into
                           * x/y in the very next statement, so this pair is the
                           * source the position is seeded from. `strh`, hence
                           * 16 bits.
                           *   sub_0804FA2C seeds the same four from a 2-D view
                           * of that record -- `pos[gUnknown_03004580[i][5]]
                           * [i*5 + j]` with a 40-byte row -- and writes x/y
                           * from the table rather than from unk04/unk06, so the
                           * copy in the twins is a choice of that function and
                           * not a property of the fields. */
    /* 0x06 */ u16 unk06;
    /* 0x08 */ u16 x;  /* UNSIGNED still, despite the `ldrsh` in sub_0804FA2C:
                        * a u16 member handed to sub_080155C0's s16 parameter
                        * compiles to `ldrsh` anyway, because combine folds
                        * sign_extend(truncate(zero_extend(mem:HI))). Verified
                        * by compiling it both ways. `ldrsh` is only the
                        * s16-object tell where there is no narrowing context. */
    /* 0x0a */ u16 y;
    /* 0x0c */ u16 xSub;
    /* 0x0e */ u16 ySub;
    /* 0x10 */ u16 xStep;
    /* 0x12 */ u16 yStep;
    /* 0x14 */ u16 frame;
    /* 0x16 */ u16 frameCount;
    /* 0x18 */ s16 unk18; /* A proc id, and SIGNED: sub_08053860 / sub_08053BB8
                           * read all ten of these with `ldrsh` and hand each to
                           * sub_08053614, which tests the value against -1
                           * before passing it to sub_080153F0. -1 is
                           * "no proc". */
    /* 0x1a */ u8 filler_1a[0x02];
    /* 0x1c */ u16 unk1c; /* a flag, and the producer/consumer pair that types
                           * it is independent (wave 20, W20-C): sub_08052818
                           * SETS it with `movs r0,#1; strh r0,[r4,#0x1c]` off
                           * the entry base, and sub_08052650/sub_08052AF4 test
                           * `ldrh [r0,#0x1c]; cmp #1` before calling
                           * sub_08052E04. Halfword at both ends, so it is not
                           * the `u8 unk00`/`u8 unk01` pair's third byte. */
    /* 0x1e */ u16 unk1e; /* zeroed with `strh` by sub_0804D290/sub_0804DCA8 as
                           * the last of the five entry writes. */
    /* 0x20 */ u8 filler_20[0x04];
};

struct Unk02029A10Group /* 0xb4 */
{
    /* 0x00 */ struct Unk02029A10 entries[5];
};

/* 0x02029BA8 -- an array of 0x20-byte records that is nothing but eight
 * pointers. 24 sites in code-0801D390.s reach it and every one of them is
 * `lsls #5` for the element and then a word `ldr`; the element offsets seen
 * are 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14 and 0x18, and 0x04/0x08/0x0c/0x10/
 * 0x14 are each handed straight to sub_080156E8.
 *   THE "SO THEY ARE ADDRESSES, NOT COUNTERS" THAT USED TO BE ON THAT SENTENCE
 * IS WRONG and wave 20 (W20-C) retracts it. sub_080156E8 narrows its second
 * parameter `lsls #0x10; lsrs #0x10` at entry and its matched tail-callee
 * sub_080156FC uses that value as `(u16)x * 4` added to the pointer at
 * gUnknown_0200E438[..].unk48 -- a small TABLE INDEX. `void *` is kept anyway,
 * because every caller loads the member with a word `ldr` and passes it with
 * no narrowing in front of the `bl`, so the declaration is byte-identical at
 * all of them and a `u16` member would have wanted `ldrh`. See the note on
 * sub_080156E8 in include/unknown-functions.h.
 * Nothing reads any field narrower than a word and nothing writes
 * one, so `void *` is the weakest type that fits every use.
 *   unk18  is an ARRAY, not a scalar: sub_0804EAEC and sub_08050424 both
 *          compute `base + 0x18 + i*0x20 + j*4` with j in a register, while
 *          sub_0804D25C/sub_0804D6C8/sub_0804E100 take element 0 of it. Two
 *          words is all that fits inside the 0x20 stride, so the extent is
 *          bounded even though no site proves j reaches 1.
 * The count is unknown -- no loop over the array has been matched yet. */
struct Unk02029BA8 /* 0x20 */
{
    /* 0x00 */ void *unk00;
    /* 0x04 */ void *unk04;
    /* 0x08 */ void *unk08;
    /* 0x0c */ void *unk0c;
    /* 0x10 */ void *unk10;
    /* 0x14 */ void *unk14;
    /* 0x18 */ void *unk18[2];
};

/* 0x0202FDFC -- one record, not the three separate globals the disassembly
 * suggests. sub_08074670 loads a SINGLE pool word holding 0x0202FE38 and then
 * recovers the record base with `subs #0x3c` and the byte array with
 * `adds #0x12`; two independent symbols could never be related that way, so
 * 0x0202FE0E and 0x0202FE38 are members of this object at +0x12 and +0x3c.
 *   unk10  cleared by sub_08074AAC just before it starts its proc
 *   unk12  42 entries, scanned 0..0x29 by sub_08076858 (which reaches it by its
 *          own pool word, i.e. `&g.unk12`) and cleared whole by sub_080745C0
 *   unk3c  SIGNED: sub_08074670 reads it `ldrsh` and compares against -1, which
 *          is the value sub_080745C0 resets it to. Signedness is settled by
 *          that read, not by the reset.
 * The extent past +0x3e is unexplored.
 */
struct Unk0202FDFC /* >= 0x3e */
{
    /* 0x00 */ s16 unk00;      /* wave 19: a CAMERA ORIGIN pair. sub_080748A0
                                * subtracts them from a proc's own s16 +0x2c and
                                * +0x2e to get the two PutSprite coordinates, so
                                * they are the scroll offset of the view this
                                * struct describes. Both `ldrsh` off a zero index
                                * register, which is what pins them as SIGNED
                                * halfwords at 0 and 2 rather than part of a
                                * wider field -- an unsigned pair would have been
                                * `ldrh [.,#0]` / `ldrh [.,#2]` with no index. */
    /* 0x02 */ s16 unk02;
    /* 0x04 */ u8 filler_04[0x08];
    /* 0x0c */ s32 unk0c;      /* wave 24: a plain word `ldr`, added to a proc's
                                * own +0x58 counter in sub_0807831C to index the
                                * 8-byte records of gUnknown_0861500C, so it is a
                                * BASE INDEX into that table. Nothing narrows it
                                * and nothing proves the sign; s32 is the weakest
                                * type that gives the bare `ldr`. */
    /* 0x10 */ u8 unk10;
    /* 0x11 */ u8 filler_11[0x01];
    /* 0x12 */ u8 unk12[0x2a];
    /* 0x3c */ s16 unk3c;
};

/* 0x03000278 -- a pending DMA/CpuFastSet descriptor. sub_0801BB88 fills it
 * with src = gUnknown_03002520 (the OAM shadow), dst = 0x07000000 (OAM),
 * unk08 = 0 and unk0a = a halfword count; sub_0801BC08 skips the copy when
 * unk0a is zero and otherwise does CpuFastSet(unk00, unk04, unk0a << 1).
 * The neighbour gUnknown_03000268 is a second descriptor of the same shape.
 */
struct Unk03000278 /* 0x0c */
{
    /* 0x00 */ void *unk00;
    /* 0x04 */ void *unk04;
    /* 0x08 */ u16 unk08;
    /* 0x0a */ u16 unk0a;
};

/* 0x03000288 -- 16 entries of stride 0x2c. sub_0801C6E8 scans unk00 for a
 * key and returns the entry; sub_0801C1F8 clears every unk00 in reverse.
 * Both loops compare the cursor against the base with a SIGNED branch.
 */
struct Unk03000288 /* 0x2c */
{
    /* 0x00 */ u32 unk00;
    /* 0x04 */ u8 filler_04[0x28];
};

/* Merged from four variants. unk00 is a word in sub_080153F0 and unk08 is a
 * word in sub_08015C30, so this one carries two independent word fields.
 *
 * unk04 is a bytecode cursor and the record it points at is 8 bytes: every
 * advancing handler adds exactly 8 (sub_08015D78, sub_08015DA0, sub_08015E58,
 * sub_080160DC), and the two fields reached inside it are a word at +0 and a
 * halfword at +4. The word at +0 is read three ways -- into unk08
 * (sub_08015D78), into unk0c (sub_08015E58), and back into unk04 itself as a
 * jump target (sub_08015E04/sub_08015E2C, which also zero unk10 and unk38).
 * The halfword at +4 goes to unk10 (sub_08015DA0). Left as `const void *` and
 * cast at each use rather than given a struct: the +0 field is a u32 in two
 * handlers and a pointer in a third, so no single member type is right.
 *
 * Wave 11 added ten more handlers on the same cursor and they settle the +4
 * halfword as an UNSIGNED 16-bit operand, independently of unk10's declared
 * type. Eight of them (sub_08015FE4, sub_08016010, sub_0801603C, sub_08016068,
 * sub_08016104, sub_08016130, sub_0801615C, sub_08016188) are the same 44 bytes
 * differing only in the `bl` target: read `((const u16 *)unk04)[2]`, hand it to
 * one call, advance the cursor by 8, return FALSE. The read is a bare
 * `ldrh r0, [r0, #4]` in every one, with no `ldrsh` and no re-narrowing --
 * which is what forced sub_0803B4DC and sub_0803B524 off `s16` in
 * unknown-functions.h; see the note there.
 * sub_08016094 is the tenth and the only one that does not advance: when
 * gUnknown_03002F1C is set it clears the flag and takes the JUMP instead,
 * `unk04 = *(const void *const *)unk04` -- the same word-at-+0 target
 * sub_08015E04 uses, reached through a one-shot flag rather than an opcode.
 * All ten return a bool8 explicitly (`movs r0,#0` / `movs r0,#1` with
 * `pop {r1}`), so these handlers are non-void; the flag is presumably
 * "the interpreter should yield after this command".
 */
struct Unk03001470 /* 0x60 */
{
    /* 0x00 */ u32 unk00;
    /* 0x04 */ const void *unk04;
    /* 0x08 */ u32 unk08;
    /* 0x0c */ u32 unk0c;
    /* 0x10 */ u16 unk10;
    /* 0x12 */ u8 filler_12[0x02];
    /* 0x14 */ u8 unk14;
    /* 0x15 */ u8 filler_15[0x03];
    /* 0x18 */ int unk18; /* sub_08037610 is
                           * `sub_080152EC(gUnknown_0849D41C, 0)->unk18 = a`,
                           * a whole-word `str`. Its one caller sub_08037638
                           * computes the value as `base + ((n & 0x3ff) << 5)`,
                           * so this is very likely an address; `int` is kept
                           * because the shift is explicit in the caller rather
                           * than coming from a pointer type, and the store is
                           * byte-identical either way. */
    /* 0x1c */ u8 filler_1c[0x02];
    /* 0x1e */ s16 unk1e; /* SIGNED, and measured: sub_0803B118 does
                           * `ldrh; adds #1; strh` and then sign-extends the
                           * stored value with `lsls #0x10; asrs #0x10` before
                           * `cmp r0,#0x5a; ble` -- a SIGNED compare of the
                           * value of `++p->unk1e`. A `u16` member gives the
                           * zero-extending `lsrs` there instead. A frame
                           * counter: it is bumped once per call and the
                           * function gives up at 0x5a (90 frames). Wave 24. */
    /* 0x20 */ s16 unk20; /* every sub_080152EC caller that stores anything
                           * stores a halfword here (sub_08035144,
                           * sub_08042B84).
                           * SIGNED, from wave 13: sub_0802966C reads it
                           * `movs r2,#0x20; ldrsh r1,[r0,r2]` to index
                           * gUnknown_0849A06C, and `ldrh` where only the low
                           * byte survives -- the s16-object pattern. The two
                           * plain `strh` writers are byte-identical either
                           * way (re-verified with trymatch). */
    /* 0x22 */ s16 unk22; /* SIGNED, same `ldrsh` tell in sub_0802966C, where
                           * it indexes gUnknown_030040D8->unk07[]. */
    /* 0x24 */ u16 unk24; /* sub_0802966C stores 1 here when sub_0802E7C8
                           * reports 1. */
    /* 0x26 */ u16 unk26;
    /* 0x28 */ u32 unk28; /* four consecutive words, all written as `str` with
                           * the offset hoisted onto the base -- the `g[i].m`
                           * shape from docs/agbcc-codegen.md. sub_0804D928 and
                           * sub_0804E3B4 zero unk28/unk2c and load unk30/unk34
                           * from the u16 globals gUnknown_0300453C /
                           * gUnknown_0300451C, so the members are at least 32
                           * bits and the sources are narrower. */
    /* 0x2c */ int unk2c; /* SIGNED, and that is measured rather than assumed
                           * (wave 17). sub_08050958 bumps it once per tick and
                           * then compares it against the u16
                           * gUnknown_02029710[side].unk16 with `cmp r0,r1;
                           * bgt` -- a SIGNED branch. `u32 unk2c` promotes the
                           * u16 to unsigned and emits `bhi` instead, so the
                           * member cannot be unsigned. The three `= 0` writers
                           * (c_0804D928, c_0804E3B4, c_0804EEFC) are
                           * byte-identical either way and were re-verified. */
    /* 0x30 */ u32 unk30;
    /* 0x34 */ u32 unk34;
    /* 0x38 */ u16 unk38;
    /* 0x3a */ u8 filler_3a[0x26];
};

/* Defined here, out of address order, because struct Unk030020A8 below holds a
 * pointer to one. The ROM word gUnknown_0808E5C8 points at an array of these:
 * sub_0801A6C0 clears unk00 of entries [0..0x80] with a stride of 0x0c, then
 * zeroes entry 0's unk04. unk04 is a `next` link -- sub_0801A700 pops the list
 * whose head is gUnknown_030020A8.unk04 with `head = head->unk04` and returns
 * the popped node's unk00. The last four bytes are unreached. */
struct Unk0808E5C8 /* 0x0c */
{
    /* 0x00 */ u32 unk00;
    /* 0x04 */ struct Unk0808E5C8 *unk04;
    /* 0x08 */ u8 filler_08[0x04];
};

/* Exactly 8 bytes -- gUnknown_030020B0 is the next symbol. sub_0801A6C0
 * initialises it (`strh` at +0, `str` at +4) and sub_0801A700 pops unk04. */
struct Unk030020A8 /* 0x08 */
{
    /* 0x00 */ u16 unk00;
    /* 0x02 */ u8 filler_02[0x02];
    /* 0x04 */ struct Unk0808E5C8 *unk04;
};

struct Unk03002040 /* 0x58 */
{
    /* 0x00 */ u8 filler_00[0x50];
    /* 0x50 */ u16 unk50;
    /* 0x52 */ u16 unk52;
    /* 0x54 */ u16 unk54;
    /* 0x56 */ u16 unk56;
};

struct Unk03002B80 /* 0x35a */
{
    /* 0x000 */ u8 unk00;
    /* 0x001 */ u8 filler_01[0x357];
    /* 0x358 */ u16 unk358;
};

/* 0x03002F50 -- an 8-byte-entry stack, with gUnknown_03002F24 as its cursor.
 * sub_0801A604 resets the cursor to the base; sub_0801A614 fills one entry and
 * bumps the cursor by 8; sub_0801A664 pops (compares the cursor against the
 * base for empty, then steps back 8 and reads the entry it uncovered).
 * The four bytes are read back with `ldrb; lsls #24; asrs #24`, so they are
 * signed; +0x04 is a whole word copied from another struct's +0x20. */
struct Unk03002F50 /* 0x08 */
{
    /* 0x00 */ s8 unk00;
    /* 0x01 */ s8 unk01;
    /* 0x02 */ s8 unk02;
    /* 0x03 */ s8 unk03;
    /* 0x04 */ u32 unk04;
};

/* Three byte-sized flags reached off one symbol. Not three separate globals:
 * every access goes through one pool word for 0x030030F0 plus a displacement,
 * so the original had a single aggregate here.
 *   unk00  a countdown -- sub_08034F7C bumps it, sub_08034F8C decrements it
 *          with a floor at zero, sub_08034FA4 clears it. SIGNED: sub_08034F8C
 *          reads it with `ldrsb` and sub_08034F6C returns it sign-extended.
 *   unk01  set/cleared by sub_08034F48 / sub_08034F54, read by sub_08034F60
 *   unk02  set/cleared by sub_0803BD54 / sub_0803BD60, read by sub_0803BD6C
 * unk01 and unk02 are only ever read zero-extended, so u8 is the weakest type
 * that fits; s8 fits equally well if a sign-extending read ever turns up.
 */
struct Unk030030F0 /* 0x03 */
{
    /* 0x00 */ s8 unk00;
    /* 0x01 */ u8 unk01;
    /* 0x02 */ u8 unk02;
};

/* 8 bytes exactly: sub_080171B4 and sub_08017540 copy it whole through the
 * two-word thumb_load_double_from_address pair, to and from a caller struct at
 * +0xB98. unk00 is written 0/8/0xf as a byte (sub_08074384, sub_080743B8,
 * sub_08078468); unk02 is read `ldrh` by sub_08017FA8 and `ldrb` by
 * sub_080180DC -- the byte read is a u8-context read of the halfword.
 */
struct Unk03002F08 /* 0x08 */
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 filler_01[0x01];
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u8 filler_04[0x04];
};

struct Unk03003130 /* 0x12 */
{
    /* 0x00 */ u8 filler_00[0x10];
    /* 0x10 */ u8 unk10;
    /* 0x11 */ u8 unk11;
};

/* A 2 x u16 pair used for several independent cursor/position globals.
 * gUnknown_03003F24 and gUnknown_03003100 are also compared as a whole word,
 * so those two are declared through the union below.
 */
struct Unk802C57C
{
    u16 unk00;
    u16 unk02;
};

/* The SIGNED view of the same pair. gUnknown_03003100 is read both ways and the
 * two readings are distinguishable: sub_0802CBA0, sub_0802CBC8 and sub_0802CC04
 * all reach its two halves with `movs rI,#0 / ldrsh rD,[rB,rI]` and
 * `movs rI,#2 / ldrsh`, the s16-OBJECT tell -- a u16 member converted to the
 * s16 parameters those callees declare would emit `ldrh` and let the CALLEE
 * sign-extend, not `ldrsh` at the call site, and an (s16) cast on a u16 member
 * would emit `ldrh; lsls #16; asrs #16` instead. Added as a union member rather
 * than by retyping struct Unk802C57C, which a dozen promoted files share and
 * which several of them genuinely read unsigned. Layout is unchanged. */
struct Unk802C57CS
{
    s16 unk00;
    s16 unk02;
};

union Unk802C57CBuf
{
    struct Unk802C57C pos;
    struct Unk802C57CS spos;
    u32 raw;
};

struct Unk03003FC0 /* 0x47 */
{
    /* 0x00 */ u8 filler_00[0x01];
    /* 0x01 */ u8 unk01; /* a mode selector written immediately before a
                          * Proc_Start on tree 3, once per mode: 1 by
                          * sub_0803BADC, 2 by sub_0803BA00, 3 by
                          * sub_0803B8C4 -- three near-identical starters that
                          * differ only in this constant and the script */
    /* 0x02 */ u8 unk02; /* set by sub_0803BCD0; sub_0803BD14 uses it to index
                          * gUnknown_085C77A0[] */
    /* 0x03 */ u8 unk03;
    /* 0x04 */ u8 unk04; /* strb, sub_08018C54 */
    /* 0x05 */ u8 filler_05[0x01];
    /* 0x06 */ u8 unk06;
    /* 0x07 */ u8 unk07;
    /* 0x08 */ u8 unk08; /* a mode flag: the whole sub_08042E2C..sub_0804301C
                          * table-lookup family reads it and returns a fixed
                          * fallback when it is zero */
    /* 0x09 */ u8 unk09; /* a small slot id, plain `ldrb`: family F046
                          * (sub_0802C6CC/6FC/72C/75C) is four copies of one
                          * predicate that differ ONLY in whether they compare
                          * it against 0, 1, 2 or 3 -- the same 0..3 player /
                          * team range gUnknown_03003FC0.unk43..unk46 permutes. */
    /* 0x0a */ u8 filler_0a[0x02];
    /* 0x0c */ u8 unk0c; /* two predicates read it plain `ldrb`: sub_0802C78C
                          * is `!= 1` and sub_0802C7A0 is `!= 0`, so it is a
                          * small enum rather than a flag */
    /* 0x0d */ u8 unk0d; /* wave 15 (C): sub_08042998 gates a whole block on
                          * `unk32 == 0 && unk0d == 0`, then reuses the loaded
                          * zero to clear gUnknown_03004074 -- a second mode
                          * flag beside unk32, not part of the filler. */
    /* 0x0e */ u8 filler_0e[0x1e];
    /* 0x2c */ u8 unk2c; /* sub_08035CF4 returns whether it equals 1 */
    /* 0x2d */ u8 unk2d; /* set to 0/1/2 by sub_08035558/sub_08035538/sub_08035548 */
    /* 0x2e */ u8 unk2e; /* plain `ldrb`, reached through the same
                          * `adds rB,#0x2e` on the base that unk32 needs (both
                          * are past `ldrb`'s 5-bit displacement, so the add is
                          * addressing and not a member-array tell).
                          * sub_0802CF6C hands it to sub_080344F0 as that
                          * function's only argument, guarded by unk32 -- so it
                          * is the payload of whatever mode unk32 selects. */
    /* 0x2f */ u8 filler_2f[0x03];
    /* 0x32 */ u8 unk32;
    /* 0x33 */ u8 filler_33[0x05];
    /* 0x38 */ u8 unk38[0x05]; /* A byte array, not a scalar: sub_08018C0C
                                * writes it as `.unk38[i]` with a variable
                                * index (the `adds rB,#0x38` on the BASE that
                                * only the member-array spelling produces).
                                * The index is the same small slot id that
                                * indexes gUnknown_08499598, so 5 is borrowed
                                * from gUnknown_030040F8's player-slot count
                                * and is NOT proved -- the extent may be
                                * anything up to 0x43. */
    /* 0x3d */ u8 filler_3d[0x06];
    /* 0x43 */ u8 unk43;
    /* 0x44 */ u8 unk44;
    /* 0x45 */ u8 unk45;
    /* 0x46 */ u8 unk46;
};

struct Unk030040D8
{
    /* 0x00 */ u8 unk00; /* plain `ldrb` at offset 0, compared against 0x18 by
                          * sub_0802CC90 -- a small id, not a flag. sub_080421D0
                          * and sub_0804223C read the same byte off the same
                          * pointer and multiply it by 0x5c to index
                          * gUnknown_085D5ABC, so it is a record selector. */
    /* 0x01 */ u8 unk01;  /* wave 13 (A2): bit 0 tested by sub_0802E4B4, which
                           * also ASSIGNS this pointer from
                           * &gUnknown_08499594[gUnknown_03003F38] -- so the
                           * object is a `struct Unk08499594` and unk01 is that
                           * type's unk01. The two struct names should be
                           * merged, but retyping the global would change
                           * c_080424BC.c's `->unk05 &= 7` into the bitfield
                           * spelling, so the layout-preserving split of
                           * filler_00 is left here instead. */
    /* 0x02 */ u8 filler_02[0x03];
    /* 0x05 */ u8 unk05;
    /* 0x06 */ u8 filler_06[0x01];
    /* 0x07 */ u8 unk07[0x05]; /* wave 13 (A4): sub_0802966C reads
                                * `->unk07[i]` with the `adds rB,#7` on the
                                * BASE that only the member-array spelling
                                * produces. The extent 5 makes this 0x0c
                                * bytes, which is exactly struct Unk08499594 --
                                * independent corroboration of the note on
                                * unk01 above. */
};

/* 0x02028360 -- 8-byte entries. sub_0803F5C8 returns &g[i], sub_0803F5D4
 * recovers the index as a u8 with (p - g), so the stride is load-bearing.
 * unk02 carries a bitfield cleared with ~0x03C0 by sub_0803DE68.
 * gUnknown_020283E0 is a second object of the same shape.
 */
struct Unk02028360 /* 0x08 */
{
    /* 0x00 */ u16 unk00;
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u16 unk06;
};

/* 0x03003338 points at ROM (set from gUnknown_0849FE74[0] by sub_0803486C).
 * Stride 8, four u16 written together by sub_080413B4.
 */
struct Unk03003338 /* 0x08 */
{
    /* 0x00 */ u16 unk00;
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u16 unk06;
};

struct Unk030044E0 /* 0x5e */
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ u8 unk2c[0x31];
    /* 0x5d */ u8 unk5d;
};

/* A flag byte plus a halfword. sub_080546BC writes seven of the eight bits
 * individually, and the four clears carry the `mov #N; neg` shape that only a
 * bitfield store produces (masks ~0x01, ~0x04, ~0x08 -- the last derived from
 * the previous by `subs r1, #4`), so this is a bitfield container and not a
 * plain u8. The three sets are OR-only, which a 1-bit field always is.
 * Width of the container is not recoverable from the access (wave 7 probe);
 * u8 is chosen so that unk02 lands at +2 as the `strh r0, [r2, #2]` requires. */
struct Unk03004504 /* >= 0x04 */
{
    /* 0x00 */ u8 bit0 : 1;
    /* 0x00 */ u8 bit1 : 1;
    /* 0x00 */ u8 bit2 : 1;
    /* 0x00 */ u8 bit3 : 1;
    /* 0x00 */ u8 bit4 : 1;
    /* 0x00 */ u8 bit5 : 1;
    /* 0x00 */ u8 bit6 : 1;
    /* 0x00 */ u8 bit7 : 1;
    /* 0x01 */ u8 filler_01[0x01];
    /* 0x02 */ u16 unk02;
};

struct Unk08090CD8Entry /* 0x88 */
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 unk01;
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u8 unk06[20];
    /* 0x1a */ u8 filler_1a[0x88 - 0x1a];
};

struct Unk08090CD8Buf
{
    /* 0x0000 */ u8 filler_00[6];
    /* 0x0006 */ u8 unk06;
    /* 0x0007 */ u8 filler_07[0x20 - 0x07];
    /* 0x0020 */ volatile u16 unk20;
    /* 0x0022 */ u8 filler_22[0x12c - 0x22];
    /* 0x012c */ struct Unk08090CD8Entry unk12c[48];
    /* 0x1aac */ u8 filler_1aac[1];
    /* 0x1aad */ volatile u8 unk1aad;
};

struct Unk08090CD8
{
    /* 0x00 */ struct Unk08090CD8Buf *unk00;
};

/* The bitfields at 0x04..0x06 come from sub_08042998, which reads the same
 * three offsets with the same widths off BOTH gUnknown_08499594[i] (stride
 * 0x0c, so this type) and **gUnknown_08091364 -- so the two are one type, and
 * sub_08025B80's pointer parameter is this struct.
 */
struct Unk08499594 /* 0x0c */
{
    /* 0x00 */ u8 unk00;      /* the unit-type id, and it is UNSIGNED on its own
                               * evidence rather than only by the
                               * gUnknown_085D5ABC[unk00] subscript: sub_0805CC88
                               * filters on `(u8)(unk00 - 0x10) <= 1`
                               * (`subs #0x10; lsls #0x18; lsrs #0x18; cmp #1;
                               * bhi`) -- a u8 truncation of the difference and
                               * an unsigned compare, which is how a two-value
                               * id range is spelled with one branch. 0 is the
                               * "empty slot" sentinel every builder tests
                               * first, so the ids 0x10 and 0x11 are a pair of
                               * adjacent types. */
    /* 0x01 */ u8 unk01;      /* a flag byte; the 0x0805Cxxx list builders skip
                               * an entry whose bit 0 is set (`ldrb [.,#1];
                               * movs #1; ands`). Plain mask, not a bitfield --
                               * a 1-bit field would have been extracted with a
                               * shift pair. */
    /* 0x02 */ u8 unk02;      /* wave 15 (C): a CELL COLUMN. sub_08058A2C adds
                               * it to gUnknown_08499590's rowOffset[unk03] to
                               * form the screen index, which is the x half of
                               * the c_08001158.c idiom. */
    /* 0x03 */ u8 unk03;      /* the matching row: `ldrb [.,#3]; lsls #1` is the
                               * `y * 2` that indexes rowOffset[] at +0x417A. */
    /* 0x04 */ u16 unk04_0:7; /* ldrb [.,#4]; lsls #25; lsrs #25 */
               u16 unk04_7:4; /* ldrh [.,#4]; lsls #21; lsrs #28 -- spans into
                               * byte 5, which is why the container is u16 */
               u16 unk05_3:5; /* byte 5 bits 3..7, kept by `movs #7; ands` */
    /* 0x06 */ u8 unk06_0:7;  /* sub_08025B80: ldrb [.,#6]; lsls #25; lsrs #25,
                               * cleared with `movs #0x80; rsbs` = ~0x7f */
               u8 unk06_7:1;  /* sub_08042998: lsrs #7 */
    /* 0x07 */ u8 unk07;      /* wave 15 (C): two flag bytes read as a pair by
                               * sub_08058A2C -- `if (unk08) v *= 2; else if
                               * (!unk07) v >>= 3;` -- so they are alternatives
                               * rather than one field. Both plain `ldrb`. */
    /* 0x08 */ u8 unk08;
    /* 0x09 */ u8 filler_09[0x03];
};

/* Merged from eight variants -- the widest disagreement in the tree. Every
 * variant agreed on 0x3c total; they differed only in which bytes they had
 * bothered to name.
 */
struct Unk08499598 /* 0x3c */
{
    /* 0x00 */ u32 unk00; /* word: sub_08025B28 does `-= a2` with ldr/str.
                           * Unsigned: sub_08025B58 clamps it with `cmp; bls`
                           * against 999999 (0xf423f), an unsigned compare. */
    /* 0x04 */ u32 unk04; /* word, unsigned, same 999999 clamp (sub_08025B28) */
    /* 0x08 */ u8 filler_08[0x04];
    /* 0x0c */ u8 unk0c;
    /* 0x0d */ u8 unk0d;
    /* 0x0e */ u8 unk0e;
    /* 0x0f */ u8 unk0f;
    /* 0x10 */ u8 filler_10[0x03];
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u16 unk16; /* a running count: sub_08026588 does `unk16++` and
                           * then keeps unk18 as its high-water mark, comparing
                           * the two with `cmp; bls` -- an unsigned compare, so
                           * both halfwords are unsigned */
    /* 0x18 */ u16 unk18;
    /* 0x1a */ u8 unk1a; /* sub_0803D6D0 snapshots [0..4] of these into
                          * gUnknown_030040F8, one per player slot */
    /* 0x1b */ u8 unk1b;
    /* 0x1c */ u8 unk1c;  /* a flag byte; sub_080359A4 tests bit 1 with a plain
                           * `movs #2; ands` mask (wave 13, A2) */
    /* 0x1d */ u8 unk1d; /* indexes gUnknown_085D3DD0 (sub_08043D84) */
    /* 0x1e */ u8 unk1e;
    /* 0x1f */ u8 unk1f;
    /* 0x20 */ u32 unk20;
    /* 0x24 */ u8 filler_24[0x01];
    /* 0x25 */ u8 unk25;
    /* 0x26 */ u16 unk26;
    /* 0x28 */ u16 unk28;
    /* 0x2a */ u8 unk2a; /* sub_08026F9C/sub_08026FD0 compare it between two
                          * entries; both reach it as element [n + 1], so the
                          * runtime offset is 0x3c + 0x2a = 0x66 */
    /* 0x2b */ u8 filler_2b[0x01];
    /* 0x2c */ u8 unk2c; /* a FOUR-BIT MASK, one bit per 64-unit army slot:
                          * sub_08058254 / sub_08058318 loop i over 0..3 and
                          * skip army i when `(unk2c >> i) & 1` is set, then
                          * scan gUnknown_08499594[i * 64 .. i * 64 + 63].
                          * Plain `ldrb` and an `asrs` by a variable, so a byte
                          * and not a bitfield -- a bitfield would have been a
                          * constant shift pair (wave 20, W20-C). */
    /* 0x2d */ u8 unk2d; /* bit 7 is a flag: sub_08026D44 returns
                          * `(unk2d & 0x80) == 0` */
    /* 0x2e */ u8 filler_2e[0x03];
    /* 0x31 */ u8 unk31;
    /* 0x32 */ u8 filler_32[0x02];
    /* 0x34 */ u8 unk34; /* three adjacent byte counters summed by sub_08026368
                          * and clamped to 9999 above 999. Each needs its own
                          * `adds rB, #0x34` because 0x34 is past the `ldrb`
                          * displacement limit of 31 -- not an address being
                          * taken. */
    /* 0x35 */ u8 unk35;
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 filler_37[0x03];
    /* 0x3a */ u8 unk3a;
    /* 0x3b */ u8 unk3b;
};

struct Unk0849A2C8
{
    u16 unk00;
    u16 unk02;
};

struct Unk0849A354
{
    u16 unk00;
    u16 unk02;
};

/* 0x084995A0 -- ROM pointer to 8-byte records, at least 92 of them
 * (sub_08061CDC clears unk03[] over 0..91). unk03 is a 3-entry counter array:
 * sub_08058144 reaches it as `p[i].unk03[j]` with j a parameter, which is what
 * fixes it as an array rather than three named bytes. */
struct Unk084995A0 /* 0x08 */
{
    /* 0x00 */ u8 filler_00[0x03];
    /* 0x03 */ u8 unk03[0x03];
    /* 0x06 */ u8 filler_06[0x02];
};

struct Unk0849B018 /* 0x0a */
{
    /* 0x00 */ u8 filler_00[0x01];
    /* 0x01 */ u8 unk01; /* sub_080303B0 returns whether it equals 2. Read with
                          * a plain `ldrb` and never stored here, so nothing
                          * settles volatile either way -- unlike unk04. */
    /* 0x02 */ u8 filler_02[0x02];
    /* 0x04 */ volatile u16 unk04; /* volatile: sub_08030574's plain `= 5` emits a
                                    * dead `ldrh` of the field right before the
                                    * `strh`, which a non-volatile member does not */
    /* 0x06 */ s8 unk06; /* signed: sub_0802F4F4 reads it ldrb; lsls #24; asrs #24 */
    /* 0x07 */ u8 filler_07[0x01];
    /* 0x08 */ u8 unk08; /* a second bitmask byte alongside unk09: sub_0802F480
                          * is sub_0802F460 with the offset changed and nothing
                          * else, `(unk08 >> index) & 1` on the same s8 index */
    /* 0x09 */ u8 unk09;
};

/* 0x0849B01C -- ROM pointer to a RAM record, distinct from gUnknown_0849B018
 * next door (different widths at the same offsets). EVERY member listed here is
 * volatile, and the evidence is uniform: in sub_0802F23C all seven stores are
 * preceded by a dead load of the very address being stored to, and sub_08031B30
 * does the same at unk06 and unk212. All of them are QImode/HImode aggregate
 * members, which is the pair of conditions the dead load needs.
 */
struct Unk0849B01C /* >= 0x214 */
{
    /* 0x000 */ volatile u16 unk00;
    /* 0x002 */ volatile u16 unk02;
    /* 0x004 */ volatile u8 unk04;
    /* 0x005 */ volatile u8 unk05;
    /* 0x006 */ volatile u16 unk06;
    /* 0x008 */ u8 filler_08[0x208];
    /* 0x210 */ volatile u16 unk210;
    /* 0x212 */ volatile u16 unk212;
};

/* 0x0849B060 -- ROM pointer to a RAM record. unk00 is round-tripped through
 * sub_080315E8 by sub_080319A8 and sub_08031BF0; unk0a is set from a byte by
 * sub_08031BE0 and cleared by sub_08031CD4.
 */
struct Unk0849B060 /* >= 0x0c */
{
    /* 0x00 */ u16 unk00;
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u8 filler_04[0x06];
    /* 0x0a */ u16 unk0a;
};

struct Unk0849CD88 /* 0x24 */
{
    /* 0x00 */ u8 filler_00[0x14];
    /* 0x14 */ u32 unk14;
    /* 0x18 */ u8 filler_18[0x0c];
};

/* 0x0849D5F8 -- ROM pointer to a >= 0x46 byte record, ~12 callers, reloaded
 * at every use (so not const). unk20 is indexed by unk45, which is signed:
 * every reader of +0x45 and of the +0x20 array either uses `ldrsb` or the
 * `ldrb; lsls #24; asrs #24` byte-twin, so both are s8 objects. */
struct Unk0849D5F8 /* >= 0x46 */
{
    /* 0x00 */ u8 filler_00[0x1e];
    /* 0x1e */ u8 unk1e;
    /* 0x1f */ u8 unk1f;
    /* 0x20 */ s8 unk20[0x25];
    /* 0x45 */ s8 unk45;
};

/* 0x0849ECDC -- ROM pointer to a small record, reloaded at every use (so not
 * const: sub_0803BF10 re-`ldr`s it across a `strb`). unk00 is a limit and
 * unk01 a cursor -- sub_0803BF70 returns `unk01 == unk00`, sub_0803BEF8 resets
 * unk01 to 0 and sub_0803BF10 walks it. unk00 is set to 2/3/4 by
 * sub_0803BDF8/sub_0803BE10/sub_0803BE28 and to a u8 argument by sub_0803B930.
 */
/* A cursor/limit pair, in that order: sub_0803BF70 raises gUnknown_03002F1C
 * when unk01 differs from unk00, and sub_0803BFA4 loads gUnknown_020288B0 with
 * unk01 + 1. Both bytes are read with a bare `ldrb`, so the signedness is
 * open. */
struct Unk0849ECDC /* >= 0x02 */
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 unk01;
};

struct Unk08580934_Sub
{
    /* 0x00 */ u8 filler_00[0x08];
    /* 0x08 */ u32 unk08;
};

/* The objects held in Unk08580934.unk44[]. Every field is written as a
 * halfword by the spawner family at 0x080646BC-0x0806517C (sub_080646BC,
 * sub_08064BC8, sub_08064CE0, sub_08064D44, sub_08064EE0, sub_08064FB0,
 * sub_08065098, sub_080650FC, sub_0806517C), which all take the object in r0
 * and all also bump Unk08580934.unk2d.
 *   unk1c  the object's own slot index -- sub_08064BC8 stores the argument
 *          here AND uses the same value to index gUnknown_08580934->unk44[]
 *   unk24  set to unk1c*2 at the sub_0806502C call site
 *   unk26  a kind/opcode; 0x0b, 0x0c, 0x0e and 0x10 are each written literally
 *   unk28  SIGNED: sub_0806502C reads its own unk28 with `ldrsh`, adds 8, and
 *          passes that as the argument stored back here
 *   unk38  0x4e (sub_08064D44), 0 (sub_080650FC, sub_0806517C)
 *   unk3a/unk3c  written together as 0 and 2 (sub_08064CE0, sub_08065098)
 * Widths are floors, not proofs: a bare `strh` setter cannot separate
 * int/u32/u16/s16 (see the setter table in docs/agbcc-codegen.md), so only
 * unk28's signedness is actually established, and that from the call site.
 * Whether this is the same type as struct Unk08580934_Sub is UNPROVED -- their
 * offsets do not conflict, so they could be merged, but nothing seen so far
 * puts one object into both unk44[] and unk74[].
 */
/* Wave 17 signs unk24/unk26 and narrows unk2a out of filler_2a, all from the
 * F092 tick handlers (sub_080646D4, sub_08064FC8, sub_08065118) and the two
 * emitters they call:
 *   unk24  SIGNED -- the handlers test it `movs r2,#0x24; ldrsh r0,[r4,r2];
 *          cmp r0,#0`, which is the s16-OBJECT tell, not a cast: reading a u16
 *          member through `(s16)` costs `ldrh; lsl #16; asr #16` instead. Its
 *          `--` in the same function still emits `ldrh`, because the result is
 *          only ever stored back with `strh` and the sign bits cannot survive.
 *   unk26  SIGNED, the same `ldrsh` at the table index, and confirmed
 *          independently by `--unk26 < 0` compiling to `lsl #0x10; cmp #0;
 *          bge` -- a sign test of the low half, which a u16 member cannot
 *          produce.
 *   unk2a  a y coordinate, and SIGNED on the consumer's evidence rather than
 *          the producer's: the handlers only `strh` into it (byte-identical
 *          for int/u32/u16/s16), but sub_08064E5C reads it `movs r2,#0x2a;
 *          ldrsh r1,[r6,r2]` and passes it beside the s16 unk28.
 * The three `u16 -> s16` changes are byte-neutral for the nine already-matched
 * setters in src/decomp/c_080646BC.c and its neighbours -- re-verified with
 * trymatch after the edit. */
struct Unk08580934_Obj /* >= 0x3e */
{
    /* 0x00 */ u8 filler_00[0x1c];
    /* 0x1c */ u16 unk1c;
    /* 0x1e */ u8 filler_1e[0x06];
    /* 0x24 */ s16 unk24;
    /* 0x26 */ s16 unk26;
    /* 0x28 */ s16 unk28;
    /* 0x2a */ s16 unk2a;
    /* 0x2c */ u8 filler_2c[0x0c];
    /* 0x38 */ u16 unk38;
    /* 0x3a */ u16 unk3a;
    /* 0x3c */ u16 unk3c;
    /* 0x3e */ u8 filler_3e[0x08];
    /* 0x46 */ u8 unk46; /* a flag: sub_0806DDF4 clears it across all seven
                          * unk54[] entries and then sets it on the one unk33
                          * selects -- a "which of the seven is current" mark.
                          * That this is the same element type as unk44[] is an
                          * assumption of the array declaration, not proved. */
};

/* unk2d is a plain post-incremented counter: sub_0806D188, sub_0806D1F0,
 * sub_0806D458 and sub_0806D4C0 all open with `gUnknown_08580934->unk2d++`
 * (`ldr; ldr; adds #0x2d; ldrb; adds #1; strb`). u8 and NOT volatile -- there
 * is no dead reload of the store's own address, which a volatile aggregate
 * member of QImode would have (see "Aliasing and volatile").
 *
 * unk44 is a slot table indexed by the object's own unk1c: sub_08064BC8 and
 * sub_08064D44 do `lsls #2` then `str` at base+0x44. The 0xc extent is
 * inferred from the gap up to unk74 and is NOT proved -- no bound check on
 * the index has been seen anywhere.
 *
 * gUnknown_08580934 is NOT const, and does not need to be. sub_08064BC8 keeps
 * the deref live across the `str` into unk44[] and reuses it for unk2d, which
 * looks like the `const` tell in docs/agbcc-codegen.md ("a global loaded once
 * and kept live across stores wants const"). It is not: probed both ways in
 * one call, `g->unk44[i] = obj; g->unk2d++;` spelled with the global reached
 * by name twice and with a bound local pointer compile to the SAME bytes, and
 * both reuse the deref. The tell applies to a re-read of the global's own
 * word, not to a deref result already sitting in a register -- same
 * distinction sub_08044178 draws for computed addresses.
 */
/* unk44's extent was 0xc, "inferred from the gap up to unk74 and NOT proved".
 * sub_0806DDF4 disproves it: there is a SECOND pointer array based at +0x54,
 * and the evidence is a codegen split rather than an offset. It walks seven
 * entries from +0x54 with `lsls rI,rN,#2; adds rB,#0x54; adds rB,rB,rI` and a
 * counter that survives to `cmp #6; ble`. Spelled as unk44[i + 4] -- the same
 * addresses, one array -- agbcc folds the +4 into a derived induction variable
 * instead: `mov r2,#0x10; ... adds r2,#4` with a separate REVERSED counter
 * `mov r1,#6; subs r1,#1; bge`. Different instructions, not a permutation, so
 * the source cannot have written a biased index into unk44. Probed in one call
 * against the unk54[i] spelling, which reproduces the ROM exactly.
 * Byte-neutral: 0x44 + 4*4 == 0x54 and 0x54 + 7*4 == 0x70, so unk74 stays at
 * +0x74 and sizeof is unchanged. Both existing users (c_08064BC8.c and
 * c_08064D44.c) index unk44 with a variable, so the extent never reached their
 * codegen; both re-verified byte-exact after the change.
 * The 4 on unk44 is now the same kind of guess the 0xc was -- it is whatever
 * fits below unk54, not a proved bound.
 */
struct Unk08580934
{
    /* 0x00 */ u8 filler_00[0x2a];
    /* 0x2a */ u16 unk2a; /* Cleared with `strh 0` by sub_08066BF4 / sub_0806DCB8
                           * on the frame the unk33 cursor actually moves, in
                           * the same statement pair that plays sound 0x64 --
                           * an animation/scroll counter for the menu the
                           * cursor drives. Width is a floor, not a proof: a
                           * bare `strh` of 0 cannot separate u16 from s16 or
                           * from a wider field's low half (wave 21, W21-A). */
    /* 0x2c */ u8 filler_2c[0x01];
    /* 0x2d */ u8 unk2d;
    /* 0x2e */ u8 filler_2e[0x02];
    /* 0x30 */ u8 unk30; /* A byte flag bracketing a blocking sub-routine:
                          * sub_08065990 clears it, calls sub_08065238, then
                          * sets it to 1; sub_0806D944 only clears it, as its
                          * last statement. `adds rN, #0x30; strb` rather than
                          * `strb [rN, #0x30]` because THUMB's strb immediate
                          * stops at 31 -- the split is the addressing mode,
                          * not a separate object. */
    /* 0x31 */ u8 filler_31[0x02];
    /* 0x33 */ s8 unk33; /* SIGNED, and proved twice: sub_0806DDF4 reads it
                          * `ldrb; lsls #24; asrs #24` and sub_0806DCB8 reads
                          * the same byte with `ldrsb`. It selects one of the
                          * seven unk54[] entries, so 0..6. */
    /* 0x34 */ u8 filler_34[0x10];
    /* 0x44 */ struct Unk08580934_Obj *unk44[4];
    /* 0x54 */ struct Unk08580934_Obj *unk54[7];
    /* 0x70 */ u8 unk70[4];  /* wave 18 (W18-C): a per-slot byte flag indexed by
                              * the SAME `obj->unk1c` that indexes unk44[],
                              * which is what fixes the extent at 4 -- it is the
                              * first bound on anything in this run that is not
                              * "whatever fits below the next member".
                              * sub_08066470 sets its slot to 0xff every frame
                              * and clears it on the last one, so it is a
                              * "this slot is drawing" mark. `adds rB, #0x70`
                              * before the index add is the strb displacement
                              * limit of 31, not an address being taken. */
    /* 0x74 */ struct Unk08580934_Sub *unk74[1];
};

/* 0x0816E1B8 -- a ROM word holding &gUnknown_08580934, i.e. one more level of
 * indirection in front of a global that is itself a pointer. Modelled the same
 * way as gUnknown_08090CD8: a `const` pointer to a one-member wrapper, with the
 * extra deref written out as `->unk00`.
 *
 * It is one slot of a block of such words at 0x0816E180-0x0816E1CC, and the
 * block is what identifies them: SEVEN of those slots hold the identical value
 * 0x08580934 and three more hold 0x03002EE0. A table of distinct globals does
 * not repeat a value seven times at consecutive addresses; one word per
 * (function, symbol) pair does. The same shape sits at 0x08090CC4-0x08090CEC,
 * where ten consecutive slots hold 0x0849B018 and gUnknown_08090CD8 is already
 * declared and matched this way.
 *
 * WHAT those words actually are was settled at 0x0816D9E0 (wave 12): they are
 * agbcc's own .rodata address-constant pool, emitted one word per (function,
 * symbol) reference when -fforce-addr needs a symbol's address to live across a
 * LOOP. The original source names the pointed-to global directly and never
 * mentions the ROM word. So this declaration and the `pp = &sym` idiom are a
 * WORKAROUND that reaches the same bytes with a relocation the harness can
 * check, not a model of the source -- keep it, it matches, but do not read it
 * as evidence that a global lives at 0x0816E1B8. See "The .rodata
 * address-constant reroute" in docs/agbcc-codegen.md; at 0x0805CA60 the
 * workaround falls 8 bytes short and only the direct spelling reaches the ROM.
 *
 * `const` is load-bearing and is what the ROM's shape proves: sub_0806DDF4
 * hoists the load of this word into its loop preheader and re-reads it after
 * the loop. An unqualified global gets neither -- the load stays in the loop
 * body. See "-fforce-addr" in docs/agbcc-codegen.md; the address still has to
 * be taken into a local (`pp = &gUnknown_0816E1B8`) for the reference after
 * the loop, or GCC routes the symbol through a synthesised .rodata word and
 * the pool relocation stops matching.
 */
struct Unk0816E1B8
{
    /* 0x00 */ struct Unk08580934 *unk00;
};

/* 0x085C77A0 -- ROM table, stride 0x5c, at least 0xc0 entries (the bound
 * `cmp r1,#0xbf; bhi` in sub_080206B0). The symbol address is added directly,
 * so this is the array itself and not a pointer to it.
 *   unk28    bit 0 tested by sub_080587FC
 *   unk2c    u32 compared against a caller's value (sub_080206B0 scans it)
 *   unk3c[]  4 bytes, 0xff = empty (sub_0803BD14 counts the leading non-0xff)
 */
/* A gfx/palette pointer pair; sub_08043A80 fetches unk00 and sub_08043A90
 * unk04, and sub_08044AB8 feeds both to sub_08039A5C (Decompress +
 * ApplyPaletteExt).
 */
struct Unk084A06F0 /* 0x08 */
{
    /* 0x00 */ void *unk00;
    /* 0x04 */ void *unk04;
};

/* 0x084C1430 -- ROM pointer to a RAM record, reloaded at every use (so not
 * const). unk28 is a 5-element word array summed into unk24 by sub_08046218.
 * unk58/unk59 are a counter and its delay, stepped by sub_080466A4.
 */
struct Unk084C1430 /* >= 0x5f */
{
    /* 0x00 */ u8 filler_00[0x24];
    /* 0x24 */ u32 unk24;
    /* 0x28 */ u32 unk28[5];
    /* 0x3c */ u32 unk3c;
    /* 0x40 */ u8 filler_40[0x10];
    /* 0x50 */ u8 unk50;
    /* 0x51 */ u8 filler_51[0x02];
    /* 0x53 */ u8 unk53;
    /* 0x54 */ u8 unk54;
    /* 0x55 */ u8 filler_55[0x03];
    /* 0x58 */ u8 unk58;
    /* 0x59 */ u8 unk59;
    /* 0x5a */ u8 filler_5a[0x04];
    /* 0x5e */ u8 unk5e;
};

/* 0x084C3240 -- ROM pointer to a RAM record. unk2c is a frame counter compared
 * against 0xdc by sub_08049E38's neighbour at 0x08049E5C.
 */
struct Unk084C3240 /* >= 0x2f */
{
    /* 0x00 */ u8 filler_00[0x20];
    /* 0x20 */ u16 unk20;
    /* 0x22 */ u8 filler_22[0x0a];
    /* 0x2c */ u16 unk2c;
    /* 0x2e */ u8 unk2e;
};

struct Unk085C77A0 /* 0x5c */
{
    /* 0x00 */ u8 filler_00[0x08];
    /* 0x08 */ const u8 *unk08; /* A POINTER, settled in wave 24: sub_0802C7B4
                           * hands this word straight to sub_080193B0, whose
                           * declared parameter is `const u8 *` (the proc-list
                           * script blobs). The old `u32` reading came from
                           * sub_0802C7FC's bare null test, which cannot tell
                           * the two apart; retyping is byte-neutral there and
                           * c_0802C7FC.c was re-verified after the change. The
                           * `adds rB, #8` onto the BASE is the word-member
                           * hoist an array global's `g[i].member` always
                           * produces -- see the displacement-overflow rules --
                           * not evidence of anything else. */
    /* 0x0c */ u8 filler_0c[0x0a];
    /* 0x16 */ u8 unk16; /* wave 24: sub_08078E48 reads it `ldrb` off the
                          * `muls #0x5c` element address and hands it to
                          * sub_0807A99C's first parameter, which is wide -- so
                          * the field's width comes from the `ldrb` here and
                          * nothing narrows it at the callee. */
    /* 0x17 */ u8 filler_17[0x03];
    /* 0x1a */ u16 unk1a; /* ldrh, tested against 0 by sub_0802C660 */
    /* 0x1c */ u8 filler_1c[0x0c];
    /* 0x28 */ u8 unk28;
    /* 0x29 */ u8 filler_29[0x03];
    /* 0x2c */ u32 unk2c;
    /* 0x30 */ u8 filler_30[0x0c];
    /* 0x3c */ u8 unk3c[4]; /* 0xff means "empty". The extent 4 is proved:
                             * sub_0803BD14 scans for the first entry that is
                             * not 0xff with a literal `i < 4` bound and
                             * returns the index, i.e. a count of leading
                             * occupied slots. */
    /* 0x40 */ u8 filler_40[0x1c];
};

/* Stride 0x104; sub_08042E18 reads unk16. */
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
    /* 0x00 */ u32 unk00; /* indexes gUnknown_08610A38 (sub_08039F18) */
    /* 0x04 */ u8 filler_04[0x04];
    /* 0x08 */ u32 unk08;
    /* 0x0c */ s16 unk0c; /* `ldrsh`, sub_080432A8 (K = 0x44 = 0x38 + 0x0c) */
    /* 0x0e */ s16 unk0e;
    /* 0x10 */ s16 unk10;
    /* 0x12 */ s16 unk12;
    /* 0x14 */ s16 unk14; /* `ldrsh`, sub_08043270 (K = 0x4c = 0x38 + 0x14) */
    /* 0x16 */ s16 unk16;
    /* 0x18 */ u8 filler_18[0x0c];
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

struct Unk085D3DD0 /* 0x104 */
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ u16 unk04;
    /* 0x06 */ s16 unk06; /* both `ldrsh`, sub_08042F7C and sub_08042F34 */
    /* 0x08 */ s16 unk08;
    /* 0x0a */ u8 filler_0a[0x0b];
    /* 0x15 */ u8 unk15;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ u8 filler_17[0x21];
    /* 0x38 */ struct Unk085D3DD0Entry unk38[3];
};

struct Unk085D5ABC /* 0x5c */
{
    /* 0x00 */ u8 filler_00[0x06];
    /* 0x06 */ u16 unk06;
    /* 0x08 */ u8 filler_08[0x02];
    /* 0x0a */ u8 unk0a;
    /* 0x0b */ u8 unk0b; /* wave 15 (C): a CAP, compared `bls` against a sum of
                          * two 4-bit fields of struct Unk08499594's unk04
                          * container (sub_08022618, sub_08042998), and the
                          * clamp value when the sum exceeds it. Same role as
                          * unk10 one field over, which caps the 5-bit unk06
                          * pair the same way. Plain `ldrb`. */
    /* 0x0c */ u8 unk0c;
    /* 0x0d */ u8 filler_0d[0x01];
    /* 0x0e */ u8 unk0e; /* a 3-valued mode tag: sub_080432E0 maps 0 -> 7,
                          * 1 -> 5 and everything else -> 6, which its callers
                          * use as a column index into gUnknown_085D3E2C. */
    /* 0x0f */ u8 unk0f;
    /* 0x10 */ u8 unk10; /* sub_08061E54 compares `unk10 - 5` against a 7-bit
                          * field of its pointer parameter; plain `ldrb`. */
    /* 0x11 */ u8 filler_11[0x07];
    /* 0x18 */ u8 unk18; /* plain `ldrb`, used by family F049 as an index into
                          * struct Unk085D3DD0Entry.unk24[] and separately
                          * tested against 0. Signedness unproved: both uses
                          * are u8-context (a subscript and a `cmp #0`), so a
                          * signed object would be byte-identical here. */
    /* 0x19 */ u8 filler_19[0x02];
    /* 0x1b */ u8 unk1b; /* a small class tag, 1..6: the 0x0805Cxxx list
                          * builders each keep the units whose type's unk1b
                          * equals one fixed constant (`ldrb [.,#0x1b];
                          * cmp #N`). Wave 19 closed the last three builders
                          * and widens the observed range from 1..5 to 1..6 --
                          * the twelve that use this test span
                          * {1,1,2,2,2,3,4,4,5,6}, so 6 is real and the range
                          * is still a floor, not an extent. */
    /* 0x1c */ u8 filler_1c[0x02];
    /* 0x1e */ u8 unk1e[2][0x1a];
    /* 0x52 */ u8 filler_52[0x0a];
};

/* Stride 0x30, proved by `lsls #1; adds rI,rI,r0; lsls #4` (x*3*16) in
 * sub_0807821C. 16 users across 0x08074xxx-0x08077xxx; only unk02 is named so
 * far, a flag byte whose bit 4 sub_0807821C reports as a bool. */
struct Unk08615194 /* 0x30 */
{
    /* 0x00 */ u8 filler_00[0x02];
    /* 0x02 */ u8 unk02;
    /* 0x03 */ u8 filler_03[0x2d];
};

/* ------------------------------------------------------- m4a / MP2K -- */

/* The Nintendo MusicPlayer2000 sound driver, 0x0806F734-0x080718E4. Its ARM
 * half and the ply_* command handlers are hand-written (see
 * data/asm-resident.json); the THUMB entry points around 0x080703B8-0x08070660
 * are ordinary compiler output and correspond to m4a.c in the public GBA
 * decomps. These two layouts are the canonical MP2K ones, and this ROM does not
 * merely fit them -- it PINS them, at eleven independent offsets:
 *
 *   MusicPlayerInfo
 *     +0x04 status   sub_080703B8 clears bit 31 with a 0x7FFFFFFF mask, i.e.
 *                    MUSICPLAYER_STATUS_PAUSE
 *     +0x24 fadeOI   sub_080703D4 and sub_08070620 write all three together
 *     +0x26 fadeOC   with 0x100 and 0x101 -- (64 << FADE_VOL_SHIFT) and the
 *     +0x28 fadeOV   same OR'd with TEMPORARY_FADE
 *     +0x34 ident    compared against 0x68736D53 ("Smsh") by every entry point,
 *                    and by the hand-written sub_0806F744 on SOUND_INFO_PTR
 *
 *   MusicPlayerTrack -- the nine ply_* handlers in asm-resident.json write
 *     exactly the byte offsets 0x1e, 0x1f, 0x24, 0x26, 0x27, 0x2c, 0x2d, 0x2e,
 *     0x2f. Those are echoVolume, echoLength and then tone.type, tone.length,
 *     tone.pan_sweep, tone.attack, tone.decay, tone.sustain, tone.release with
 *     a 12-byte struct ToneData at +0x24. Nine offsets landing on nine named
 *     fields is not a coincidence; the stride and the ToneData placement are
 *     settled. sub_0806FC50 independently gives patternLevel at +0x02,
 *     cmdPtr at +0x40 and patternStack[] at +0x44 (it is ply_pend), and
 *     sub_0806FC34 (ply_patt) repeats all three. sub_080717F8 (ply_xwave) adds
 *     the one word member of the block: it assembles four unaligned command
 *     bytes into a u32 and stores it at +0x28, which is tone.wav at +0x04 of a
 *     ToneData based at +0x24 -- a fourth, independent confirmation of that
 *     base, and the only one that lands on a non-byte field.
 *
 * Wave 9 added the tempo block and the modulation block, and the second of them
 * says this ROM's MusicPlayerTrack is NOT byte-for-byte the pokeemerald one:
 *
 *   MusicPlayerInfo -- sub_080713F8 (MPlayTempoControl) is
 *     `tempoU = tempo; tempoI = (tempoD * tempoU) >> 8`, which names three
 *     consecutive halfwords at once and fixes them against the public layout:
 *     +0x1c tempoD (the multiplier, read), +0x1e tempoU (written from the
 *     parameter), +0x20 tempoI (the product). tempoC at +0x22 follows from the
 *     public layout and from fadeOI already being pinned at +0x24; it is the
 *     only unproved member of the block, so it stays `filler`.
 *
 *   MusicPlayerTrack -- the whole modulation/LFO block is now named, and it is
 *     the CANONICAL MP2K one with nothing inserted or moved. Read the tell
 *     first, because it is easy to talk yourself into a shifted layout here:
 *     the block runs modM, mod, modT, and a public layout quoted from memory
 *     that omits `mod` makes every field from +0x17 up look like it is +1.
 *     It is not. The proof is one basic block, the LFO update inside the
 *     hand-written MPlayMain at 0x0806FEF8-0x0806FF54, which names six fields
 *     in twenty instructions and leaves no room to slide any of them:
 *
 *       if (track->lfoSpeed && track->mod)          ldrb +0x19 ; ldrb +0x17
 *         if (track->lfoDelayC) track->lfoDelayC--; ldrb/strb  +0x1c
 *         else {
 *           track->lfoSpeedC += track->lfoSpeed;    ldrb/strb  +0x1a, += +0x19
 *           v = (lfoSpeedC >= 0x40) ? 0x80 - lfoSpeedC : (s8)lfoSpeedC;
 *           v = v * track->mod >> 6;                ldrb +0x17 ; muls ; asrs #6
 *           if (v != track->modM) {                 ldrb +0x16 ; eors ; lsls #24
 *             track->modM = v;                      strb +0x16
 *             ... test track->modT, OR the flags    ldrb +0x18 ; ldrb +0x00
 *
 *     +0x17 is therefore `mod`, the modulation depth: read twice, multiplied
 *     into the LFO value, never written here. +0x16 is `modM`, the applied
 *     depth. That tail is ClearModM inlined, which is what sub_08071564 is.
 *
 *     Three more offsets from the hand-written half, all consistent with it:
 *       +0x19 lfoSpeed   sub_08070328 (ply_lfos) stores its argument there
 *       +0x1b lfoDelay   sub_080700C0 (ply_note) does
 *       +0x1c lfoDelayC  `ldrb [r5,#0x1b]; strb [r5,#0x1c]`, then calls
 *                        ClearModM when the value is non-zero
 *       +0x1d priority   sub_080700C0 adds it to MusicPlayerInfo +0x09 and
 *                        clamps the sum to 0xff, which also pins that +0x09
 *
 *     So the public MusicPlayerTrack IS safe to lift here. Note the general
 *     point: the hand-written half will never match, but it is first-class
 *     evidence about the layout, and it is where most of these came from.
 *
 *
 * Fields marked `filler` are the canonical names carried over from the public
 * layout but unproved HERE; narrow one when a function needs it, do not move
 * anything.
 */
#define MPLAY_ID_NUMBER 0x68736D53 /* 'Smsh' */
#define MUSICPLAYER_STATUS_PAUSE 0x80000000
#define FADE_VOL_SHIFT 2
#define TEMPORARY_FADE 0x0001
#define FADE_IN 0x0002 /* sub_08070640 stores a bare 2 into fadeOV */

/* MusicPlayerTrack::flags. Only these two are reached from matched code:
 * sub_08071564 ORs 0x0c when modT is zero and 0x03 otherwise, which is
 * PITCHG/VOLCHG in the public layout and the only place either value occurs. */
#define MPT_FLG_VOLCHG 0x03
#define MPT_FLG_PITCHG 0x0C

struct ToneData /* 0x0c */
{
    /* 0x00 */ u8 type;
    /* 0x01 */ u8 key;
    /* 0x02 */ u8 length;
    /* 0x03 */ u8 pan_sweep;
    /* 0x04 */ u32 wav;
    /* 0x08 */ u8 attack;
    /* 0x09 */ u8 decay;
    /* 0x0a */ u8 sustain;
    /* 0x0b */ u8 release;
};

/* The MP2K hardware/software mixer channel -- MusicPlayerTrack::chan points at
 * one. Four offsets are pinned by sub_08070090 (ChnVolSet, hand-written and in
 * asm-resident.json; the hand-written half is still first-class evidence about
 * layout). It takes the channel in r4 and the track in r5 and computes the
 * stereo pair, which fixes rightVolume/leftVolume at +0x02/+0x03 and reads
 * `ve` at +0x12 and `rp` at +0x14. `rp` is SIGNED and that is not lifted --
 * the ROM reads it `movs r0,#0x14; ldrsb r2,[r4,r0]`, and it is used as both
 * `0x80 + rp` and `0x7f - rp`. All four land exactly on the canonical MP2K
 * SoundChannel, so the rest of that layout is safe to narrow into as functions
 * reach it; nothing between +0x04 and +0x11 is reached yet.
 */
struct SoundChannel /* >= 0x15 */
{
    /* 0x00 */ u8 filler_00[0x02];
    /* 0x02 */ u8 rightVolume;
    /* 0x03 */ u8 leftVolume;
    /* 0x04 */ u8 filler_04[0x0e]; /* attack decay sustain release ky
                                    * envelopeVolume envelopeVolumeRight
                                    * envelopeVolumeLeft echoVolume echoLength
                                    * d1 d2 gt mk */
    /* 0x12 */ u8 ve;
    /* 0x13 */ u8 filler_13[0x01]; /* pr */
    /* 0x14 */ s8 rp;
};

struct MusicPlayerTrack /* 0x50 */
{
    /* 0x00 */ u8 flags;
    /* 0x01 */ u8 wait;
    /* 0x02 */ u8 patternLevel;
    /* 0x03 */ u8 repN;
    /* 0x04 */ u8 filler_04[0x0c]; /* the canonical MP2K names, none of them
                                    * reached from C yet: gateTime key velocity
                                    * runningStatus keyM pitM keyShift keyShiftX
                                    * tune pitX bend bendRange. sub_080700C0
                                    * uses +0x05 as key and +0x06 as velocity,
                                    * which agrees. */
    /* 0x10 */ u8 volMR;           /* the stereo volume pair, proved together by
                                    * sub_08070090 (ChnVolSet, hand-written):
                                    * `chan->rightVolume = (chan->ve *
                                    * (0x80 + chan->rp) * track->volMR) >> 14`
                                    * clamped to 0xff, then the mirrored
                                    * `0x7f - rp` / volML for leftVolume. Only
                                    * these two of the six bytes at +0x10..+0x15
                                    * are reached, so vol/volX/pan/panX stay
                                    * filler. */
    /* 0x11 */ u8 volML;
    /* 0x12 */ u8 filler_12[0x04]; /* vol volX pan panX */
    /* 0x16 */ u8 modM;
    /* 0x17 */ u8 mod;
    /* 0x18 */ u8 modT;
    /* 0x19 */ u8 lfoSpeed;
    /* 0x1a */ u8 lfoSpeedC;
    /* 0x1b */ u8 lfoDelay;
    /* 0x1c */ u8 lfoDelayC;
    /* 0x1d */ u8 priority;
    /* 0x1e */ u8 echoVolume;
    /* 0x1f */ u8 echoLength;
    /* 0x20 */ void *chan;
    /* 0x24 */ struct ToneData tone;
    /* 0x30 */ u8 filler_30[0x10];
    /* 0x40 */ u8 *cmdPtr;
    /* 0x44 */ u8 *patternStack[3];
};

/* The MP2K SOUND_INFO block, reached only through gUnknown_03007FF0 -- the
 * canonical SOUND_INFO_PTR, and this ROM keeps it at the canonical 0x03007FF0.
 * `ident` carries the same 'Smsh' MPLAY_ID_NUMBER as MusicPlayerInfo::ident and
 * the driver offsets it by +-10 to record that the vsync DMA is disarmed:
 * sub_08070A7C (SoundVSyncOff) adds 10 after `ident - ID_NUMBER <= 1`, and
 * sub_08070AF8 (SoundVSyncOn, matched) subtracts it again.
 *
 * pcmDmaCounter is `volatile`, and that is proved rather than lifted:
 * sub_08070AF8 emits a dead `ldrb r0,[r2,#4]` immediately ahead of the
 * `movs r0,#0; strb r0,[r2,#4]` that overwrites the register. A load into a
 * register nothing reads, on a QImode aggregate member, is the volatile tell --
 * see "A load of the store's own address whose destination is never read" in
 * docs/agbcc-codegen.md. Without the qualifier the function is 4 bytes short.
 */
struct SoundInfo
{
    /* 0x00 */ vu32 ident;
    /* 0x04 */ vu8 pcmDmaCounter;
    /* 0x05 */ u8 filler_05[0x34b]; /* +0x350 is where sub_08070A7C's CpuSet
                                     * starts clearing 0x318 words, so the block
                                     * runs to at least 0xfb0 bytes. Nothing
                                     * between +0x05 and +0x350 is reached from
                                     * C yet. */
};

struct MusicPlayerInfo /* 0x40 */
{
    /* 0x00 */ void *songHeader;
    /* 0x04 */ u32 status;
    /* 0x08 */ u8 filler_08[0x01]; /* trackCount */
    /* 0x09 */ u8 priority;        /* sub_080700C0 adds it to the track's own
                                    * priority at +0x1d and clamps to 0xff */
    /* 0x0a */ u8 filler_0a[0x12]; /* cmd unk_0b clock gap[8] memAccArea */
    /* 0x1c */ u16 tempoD;
    /* 0x1e */ u16 tempoU;
    /* 0x20 */ u16 tempoI;
    /* 0x22 */ u8 filler_22[0x02]; /* tempoC */
    /* 0x24 */ u16 fadeOI;
    /* 0x26 */ u16 fadeOC;
    /* 0x28 */ u16 fadeOV;
    /* 0x2a */ u8 filler_2a[0x02];
    /* 0x2c */ struct MusicPlayerTrack *tracks;
    /* 0x30 */ struct ToneData *tone;
    /* 0x34 */ u32 ident;
    /* 0x38 */ u8 filler_38[0x08];
};

/* -------------------------------------------------------------- EWRAM -- */

extern struct Unk0200B0B0 *gUnknown_0200B0B0;
extern struct Unk0200B224 gUnknown_0200B224[];
/* Exactly 48 entries: sub_08011C18 clears 0..0x2f (`cmp #0x2f; bls`) at stride
 * 0x0c, and 0x0200B3B4 + 48*0x0c == 0x0200B5F4, the next symbol. */
extern struct Unk0200B3B4 gUnknown_0200B3B4[];
/* Exactly 0x20 bytes -- gUnknown_0200B614 is the next symbol, and every user
 * indexes 0..0x1f. SIGNED: the ARM routine sub_08000234 reads it with `ldrsb`
 * and adds the value to a palette component. sub_080136C4 clears all 32. */
extern s8 gUnknown_0200B5F4[0x20];
/* Hoisted out of src/decomp/c_08014074.c in wave 21 (W21-A) so that
 * gUnknown_0200C020 and sub_080147B4 can name the same type. The two members
 * are sub_08014074's only accesses; sub_080147B4 writes +0x20/+0x24/+0x28 as
 * words, +0x2c/+0x2e/+0x34/+0x36 as halfwords and +0x31..+0x38 as bytes, so
 * everything below 0x39 is genuinely occupied and the filler is a floor. The
 * OBJECT is 0x58 bytes (aw2bhr.lds puts the next symbol at 0x0200C078); the
 * struct is not grown to match because nothing indexes it. */
struct Unk08014074
{
    /* 0x00 */ u8 filler_00[0x39];
    /* 0x39 */ s8 unk39;
    /* 0x3a */ s8 unk3a;
};
/* The single instance of the above -- sub_08014614, sub_08014668 and
 * sub_080146D4 each hand `&gUnknown_0200C020` to sub_080147B4 and then to
 * sub_08014074, and no other code in asm/ names the address. */
extern struct Unk08014074 gUnknown_0200C020;
extern struct Unk0200C420 gUnknown_0200C420;
extern u32 gUnknown_0200C500[2];
extern struct Unk0200C528 gUnknown_0200C528[];
/* The sprite-entry pool the bump allocator hands out; gUnknown_03002B24 is
 * reset to it by sub_0801BE78. 0x0200D510 - 0x0200CD10 == 0x800, i.e. exactly
 * 128 entries before the layer-head array. */
extern struct SpriteEntry gUnknown_0200CD10[];
extern struct SpriteEntry gUnknown_0200D510[];
extern struct Unk0200E438 gUnknown_0200E438[];
extern struct Unk0200F720 gUnknown_0200F720[];
extern struct Unk0200F920 gUnknown_0200F920[];
/* A 0x800-byte staging buffer: sub_0803A174 blits it to VRAM 0x06015D00 with
 * sub_08011C68, and the caller two instructions above that registration fills
 * it with Decompress(<ROM blob>, gUnknown_0200FD50). Non-const and `u8 []`
 * because Decompress's second parameter is `void *`. The size is the copy
 * length, not a proved extent. */
extern u8 gUnknown_0200FD50[];
extern struct Unk02027F74 gUnknown_02027F74;
/* A candidate list filled from index 0 and consumed through the
 * gUnknown_02027F74.unk36 / .unk37 cursor pair. u8: every write is a `strb`
 * through a variable index (sub_08037448 stores a 0..0xbf id, sub_08037508
 * fills 0x2a entries with i + 0x6c, sub_0803753C and sub_08037570 fill 0x6b
 * entries with i + 1). Signedness unproved -- no reader has been matched.
 *
 * NOTE the two symbols OVERLAP and the ROM names both: 0x02027F78 is
 * gUnknown_02027F74 + 4, and .unk36/.unk37 sit at array indices 0x32/0x33.
 * sub_08037448 caps its fill at 0x32 entries, which is exactly consistent, but
 * sub_0803753C/sub_08037570 write 0x6b entries straight over the cursor pair
 * before resetting it. Kept as two separate externs because that is what the
 * original source did -- both pool words are CLEAN (`.4byte gUnknown_02027F78`
 * with no addend, `.4byte gUnknown_02027F74` with the 0x36/0x37 as runtime
 * adds), which a single-object spelling cannot produce. */
extern u8 gUnknown_02027F78[];
extern struct Unk02028030 gUnknown_02028030;
/* The shadow copy of gUnknown_02028030, and it is the SAME type: the two
 * symbols are adjacent (0x02028030 + 0x48 == 0x02028078) and sub_0803BCA0 /
 * sub_0803BCB8 are a save/restore pair that memcpy 0x48 bytes between them in
 * both directions -- one length, one struct, both sizeof(struct Unk02028030).
 * Nothing else in the ROM touches it, so the field layout is inherited rather
 * than independently proved. */
extern struct Unk02028030 gUnknown_02028078;
extern struct Unk020280C0 gUnknown_020280C0[];
extern struct Unk02028360 gUnknown_02028360[];
/* 0xff-terminated byte list scanned by sub_0803BFBC; sub_08043C98 hands
 * out its address.
 */
extern u8 gUnknown_020288A0[];
/* Scratch byte; sub_0803BFA4 loads it with gUnknown_0849ECDC->unk01 + 1 and
 * sub_08043D5C zeroes it. sub_0803BF10 copies it into gUnknown_03003FC0.
 */
extern u8 gUnknown_020288B0;
extern u8 gUnknown_02028E3C;
extern u8 gUnknown_02028E40;
extern u8 gUnknown_02028E41[];
/* Two-halfword rows, indexed by gUnknown_0300453C. The 4-byte stride is
 * `lsls #2` at all fourteen sites; [i][0] is a small state flag (sub_0804B3E0
 * compares it against 1 and clears both halves together) and [i][1] indexes
 * gUnknown_085644D4/gUnknown_085644C8 in sub_0804F0D8 and sub_080501DC.
 * sub_08051F4C sets [i][0] to 1. Unsigned is not proved -- every access is a
 * bare `ldrh`/`strh` -- and the row length is the stride, not an extent. */
extern u16 gUnknown_02028E5C[][2];
extern struct Unk02029A10Group gUnknown_02029A10[];
/* One byte per gUnknown_02029A10 slot, five per side -- sub_08051BEC indexes
 * it `a * 5 + j` (the `a * 5` is CSEd with gUnknown_08552178's row scaling in
 * the same function) and reads it with `ldrb`, testing == 1 as a "skip"
 * guard. The [5] is the stride; nothing bounds the outer dimension. */
extern u8 gUnknown_02029C14[][5];
extern struct Unk02029BA8 gUnknown_02029BA8[];
/* A double-buffer pointer pair, swapped whole by sub_08073AE8. Both hold
 * addresses: sub_08073C1E feeds gUnknown_0202FDE0 straight to REG_DMA0SAD, and
 * sub_08073930 stores gUnknown_0202FDDC through a pointer read out of ROM.
 * gUnknown_0202FDE4 is a third slot filled from the same source by sub_08073A80
 * and is not declared yet -- nothing matched reaches it. */
extern void *gUnknown_0202FDDC;
extern void *gUnknown_0202FDE0;
/* The third slot of that group, now reached: sub_080737EC sets it to
 * &gUnknown_0202F8DC and then feeds it straight to REG_DMA0SAD, so it holds an
 * address exactly as its two neighbours do. gUnknown_0202F8DC is the HBlank
 * scanline table that DMA copies into REG_WIN1H -- one halfword per line, and
 * the transfer is 1 unit wide with the source auto-incrementing, so the extent
 * is the screen height and is not otherwise pinned. */
extern void *gUnknown_0202FDE4;
extern u16 gUnknown_0202F8DC[];
/* A u16 pair handed out together by sub_08073F90(u16 *x, u16 *y). Two separate
 * pool words with zero displacement, so two scalars rather than one aggregate
 * -- the same reading as gUnknown_03000044 / gUnknown_03000046. */
extern u16 gUnknown_0202FDE8;
extern u16 gUnknown_0202FDEA;
extern struct Unk0202FDFC gUnknown_0202FDFC;

/* -------------------------------------------------------------- IWRAM -- */

/* 16 entries: sub_08011B18 clears indices 0..15 and sub_08011B34 stops
 * scanning at gUnknown_03000040, the next symbol in the linker script. */
extern void *gUnknown_03000000[];
extern u16 gUnknown_03000040;
/* A u16 pair set together by sub_0801224C. Two separate pool words in that
 * function, so they are two scalars rather than one aggregate. */
extern u16 gUnknown_03000044;
extern u16 gUnknown_03000046;
/* The second of the two DMA/CpuFastSet descriptors -- sub_0801BB88 fills both
 * in one go, splitting the OAM shadow at object `a`: 03000278 gets
 * (shadow, OAM, 0, a) and 03000268 gets (shadow + a*8, OAM + a*8, a*8, 0x80-a).
 * Same shape as struct Unk03000278, hence the shared type. */
extern struct Unk03000278 gUnknown_03000268;
extern struct Unk03000278 gUnknown_03000278;
extern struct Unk03000288 gUnknown_03000288[];
/* Serial/link block, all four plain 32-bit words -- every access in the ROM is
 * `ldr`/`str`, and none of them is a bitfield: sub_0802EAFC clears the low two
 * bits of 0x03000564 with `movs #4; rsbs` (= ~3), which is only the bitfield
 * tell where a bare `movs` would have sufficed, and it would not here because
 * 0xfffffffc is not an 8-bit immediate. sub_0802ED00 reads those same two bits
 * as a plain `& 3` compared against 2, which settles it as a 2-bit enum living
 * in an ordinary word. Not const: sub_0802EAFC re-loads 0x03000564 for its
 * read-modify-write and 0x03000570 is stored through its own pool word.
 * Not volatile either: no dead load precedes any of the stores.
 *
 * CORRECTED, wave 13 (A2): 0x03000564 IS volatile. sub_0802EAFC could not see
 * it -- a lone read-modify-write is byte-identical either way -- but
 * sub_0802EB28 runs three of them back to back
 * (`&= ~3`, `|= 2`, then `& 0xC000`) and re-`ldr`s the word after every `str`.
 * A plain u32 folds all three into one load and one store and comes out eight
 * bytes shorter. c_0802EAFC.c is unaffected and still matches.
 */
/* A one-byte mode flag: sub_08022A08 clears it with `strb`, and the four
 * redraw wrappers at 0x08023DCC-0x08023EA4 read it back with `ldrb` and
 * compare against 1 to decide whether to run a third pass. Byte-wide in every
 * access in the ROM. */
extern u8 gUnknown_03000559;
extern u32 gUnknown_03000560;
extern volatile u32 gUnknown_03000564;
extern u32 gUnknown_03000568;
extern u32 gUnknown_03000570;
extern u32 gUnknown_03000574;
/* A cursor into gUnknown_08090C44, zeroed by sub_0802EA5C. VOLATILE: in
 * sub_0802EC64 the `++` stores the incremented word and then re-`ldr`s the very
 * same address to index the table, which a plain word cell CSEs away (two
 * instructions shorter). Word-wide: every access is `ldr`/`str`. */
extern volatile u32 gUnknown_03000578;
/* A pair of "current"/"requested" ids, both u16 and both compared against the
 * sentinel 0xFFFF (sub_0803B524, sub_0803B640, sub_0803B660). sub_0803B37C
 * resets both to 0xFFFF; sub_0803B5F4 resets only 0x030005CA.
 * Unsigned despite the `ldrsh` at the call sites -- those come from an (s16)
 * cast on the argument, and both are read `ldrh` for the 0xFFFF compare. */
extern u16 gUnknown_030005C8;
extern u16 gUnknown_030005CA;
/* Neighbours 0x030005C8 and 0x030005CA, all three u16 (ldrh). sub_0803B350
 * sets this one; sub_0803B37C sets it to 0x100 and the other two to 0xFFFF.
 * sub_0803B414 passes it as the third argument of sub_08071420 seven times. */
extern u16 gUnknown_030005CC;
/* Fourth of the run, and u16 like the other three: sub_0803B35C is the whole
 * of its evidence -- `strh r0, [=030005CE]` then an immediate `ldrh r2, [r2]`
 * of the same address to pass as sub_08071420's (MPlayVolumeControl) third
 * argument. The re-read is NOT a volatile tell: it is the ordinary reload of a
 * non-register global across a statement boundary, and the store is
 * byte-identical for int/u32/u16/s16. Wave 24. */
extern u16 gUnknown_030005CE;
/* SIGNED: sub_08057CA4 reads it back with `ldrsh`. Written 0 and 1 as flags
 * by sub_08057B2E and sub_08057BCC. */
extern s16 gUnknown_030005E8[];
extern u8 gUnknown_03000650[];
/* A relocated-code trampoline slot. sub_0808AD6C copies the 4-byte body of
 * sub_0808AD68 (`ldrb r0,[r0]; bx lr`) into a caller-supplied buffer and stores
 * `buffer + 1` here -- the +1 is the THUMB bit, so this is a function pointer,
 * not a data pointer. The signature is proved at the call site, not the setter:
 * sub_0808ADA4 does `ldr r1,[gUnknown_03000F6C]; bl _call_via_r1` with one
 * pointer argument in r0 and narrows the result with `lsls #24; lsrs #24`,
 * i.e. `u8 (*)(u8 *)`. (Per docs/agbcc-codegen.md a `str` setter is
 * byte-identical for a function pointer, a `void *` and a `u32`, so the
 * evidence is only ever at the reader.)
 */
extern u8 (*gUnknown_03000F6C)(u8 *);
/* 0x03000F68-0x03000F7C is ONE module: a driver for a single hardware timer,
 * chosen at registration time out of the four. Reading the four globals
 * together is what makes each of them obvious, so they are documented as a
 * set. sub_0808AC44 registers, sub_0808AC7C arms, sub_0808AC20 is the tick
 * and sub_0808AD24 disarms.
 *
 *   sub_0808AC44(u8 id, ...)  rejects id > 3, stores it in gUnknown_03000F70,
 *                             and computes gUnknown_03000F78 as
 *                             0x04000100 + id * 4 -- i.e. &REG_TMnCNT_L. It
 *                             also hands the caller &sub_0808AC20 as the tick.
 *   sub_0808AC7C(u8 slot)     saves REG_IME into gUnknown_03000F7C, masks
 *                             interrupts, stops the timer, loads the record at
 *                             gUnknown_03000F68[slot] into the countdown and
 *                             the two timer registers, sets REG_IE's timer bit
 *                             and acknowledges it in REG_IF (0x04000202).
 *   sub_0808AD24()            stops the timer, clears the same REG_IE bit and
 *                             restores REG_IME.
 */
/* A pointer to a table of SIX-byte records, indexed by a u8 slot id --
 * sub_0808AC7C computes the offset as `((id << 1) + id) << 1`, which is id*6
 * and nothing else. The record is exactly the three halfwords the arm routine
 * consumes, in order: +0x00 the frame countdown copied into
 * gUnknown_03000F72, +0x02 the TMnCNT_L reload, +0x04 the TMnCNT_H control
 * word. Not yet modelled as a struct because only one function reads it. */
extern u16 *gUnknown_03000F68;
/* The hardware timer index, 0-3, used both to scale the register address and
 * as the shift count for the timer's IRQ bit
 * (`REG_IE &= ~(INTR_FLAG_TIMER0 << gUnknown_03000F70)` in sub_0808AD24).
 *
 * VOLATILE, proved twice and independently:
 *   1. sub_0808AC44 does `strb r1,[r0]` and then `ldrb r0,[r0]` on the same
 *      address with nothing in between -- a read of a scalar global right
 *      after a store to it only reloads when the global is volatile, which is
 *      the store-forwarding rule in docs/agbcc-codegen.md. This one is
 *      conclusive on its own.
 *   2. In sub_0808AD24 the qualifier decides one instruction's position: a
 *      plain u8 emits `movs r1, #8` BEFORE the `ldrb`, because expand_binop
 *      force_reg's the shift's constant operand first and a non-volatile MEM
 *      is content to be sunk into the other operand slot. A volatile MEM
 *      cannot be, so its load lands at the read point and the ROM's
 *      `ldrb; movs #8; lsls` order falls out. No size change; see the
 *      "a volatile shift COUNT is loaded before the shifted constant" note in
 *      docs/agbcc-codegen.md, which lists the seven spellings ruled out.
 */
extern volatile u8 gUnknown_03000F70;
/* The frame countdown, loaded from gUnknown_03000F68[slot] by sub_0808AC7C and
 * ticked down by sub_0808AC20. VOLATILE: sub_0808AC20 reads it twice, once to
 * test `!= 0` and once to decrement, and agbcc CSEs the pair into a single
 * `ldrh` without the qualifier. */
extern volatile u16 gUnknown_03000F72;
/* The expiry flag: cleared by sub_0808AC7C when the timer is armed, set to 1
 * by sub_0808AC20 when gUnknown_03000F72 reaches zero. Both accesses are
 * `strb`, which per docs/agbcc-codegen.md constrains nothing, so u8 is the
 * weakest model rather than a proved width. */
extern u8 gUnknown_03000F74;
/* &REG_TMnCNT_L for the selected timer -- sub_0808AC44 builds it as
 * `0x04000100 + gUnknown_03000F70 * 4`, so it points into MMIO and the
 * elements are the two timer registers: [0] is TMnCNT_L, [1] is TMnCNT_H.
 *
 * Both users step the global itself rather than a local, which is what
 * produces the `str` write-backs around the stores: sub_0808AD24 disarms with
 * `*g++ = 0; *g-- = 0;` and sub_0808AC7C reloads with the same idiom. The
 * +/-2 step fixes the element width at 16 bits.
 *
 * `vu16 *` rather than `u16 *` because the target really is hardware; probed,
 * and it is byte-neutral in sub_0808AD24, so this is honesty rather than
 * evidence. */
extern vu16 *gUnknown_03000F78;
/* The saved REG_IME value: sub_0808AC7C stashes it before masking interrupts
 * and sub_0808AD24 restores it after clearing the timer's REG_IE bit.
 * `ldrh` at both ends, straight to and from REG_IME. */
extern u16 gUnknown_03000F7C;
/* A callback slot: sub_0801F4A4 stores &sub_0801F4B4 into it and nothing else
 * touches it yet, so the pointed-to signature is only as good as sub_0801F4B4's
 * own prototype in unknown-functions.h. Declared unprototyped on purpose.
 */
/* An IWRAM record whose ADDRESS is what gets passed around -- eleven functions
 * name it and every one of them loads a clean `.4byte gUnknown_030013D0` and
 * either hands it to a routine or reads a fixed offset off it. Offsets seen:
 *
 *   +0x00  a pointer (`ldr r0,[r5]`, then `ldrb [r0,#4]` / `strh [r0,#4]`)
 *   +0x08  read BOTH as s16 (`movs r1,#8; ldrsh r0,[r5,r1]`, sub_0802505C and
 *          sub_080250E8) and as a byte masked with 0x7f (`ldrb r1,[r5,#8]`)
 *   +0x0a  u16   +0x14  u16   +0x18  s16
 *
 * so at least 0x1a bytes are in use. NOT a scalar and not const (it is RAM and
 * sub_0802505C writes through +0x00). Two independent hints at the extent, and
 * they disagree, which is why nothing stronger is declared here:
 * sub_080252EC hands gUnknown_030013D0 and gUnknown_030013B0 to the same stub
 * one after the other, a 0x20 delta suggesting a 0x20-byte record; but
 * gUnknown_030013EC is a separate symbol only 0x1c in. sub_080250E8 calls
 * sub_0802505C twice, on this and on `*gUnknown_08090A40`, so whatever the
 * record is, there is more than one of them and one is reached by pointer.
 * `u8 []` is the weakest model that reproduces the clean pool word; widen it to
 * a struct when sub_0802505C or sub_080250E8 is matched. */
extern u8 gUnknown_030013D0[];
/* The second record of that same type, and the one that pins them as two
 * instances rather than one object: sub_08041B98 reads +0x18 as `ldrsh` and
 * +0x04 as `ldrh` through BOTH symbols, four instructions apart, with the same
 * displacements. sub_080252EC (wave 12) hands each of them in turn to the
 * sub_080252E8 stub -- gUnknown_030013D0 first, then this one, which is source
 * order and not address order. Same `u8 []` model and the same reason. */
extern u8 gUnknown_030013B0[];
/* Not a global: the `-fforce-addr` address-constant word for the symbol above,
 * and evidence that code-0801D390.s has a SECOND pool block besides the
 * documented 0x0809092C-0x08090C2x one. 0x0816D938-0x0816D9BC is 35 consecutive
 * fan-in-1 address words -- 0x08499590 appears nine times in it, alongside
 * 0x030040D8, 0x03004784 and 0x03003F2C -- bracketed by ordinary data
 * (0x04F504F8 above, 0x01010100 below). Declared as a pointer to the array's
 * element type so that `pp = &gUnknown_0816D948` supplies in the source the
 * extra level force-addr invented; sub_08058A2C reads +0x00 as a
 * `struct Unk08499594 *` and +0x08/+0x12 as s16 through it. */
extern u8 *const gUnknown_0816D948;
extern void (*gUnknown_030013EC)();
extern u16 gUnknown_03001400;
extern u16 gUnknown_03001404;
/* A byte buffer whose ADDRESS is what gets passed: family F059 hands it to
 * sub_0803CCB8, which forwards it to sub_0803CC84 as the destination of a
 * NUL-terminated copy out of gUnknown_020280C0[i].unk02 (0x11 bytes). Extent
 * unproved -- 0x11 is the most the one writer can produce, not a bound. */
extern u8 gUnknown_0200B204[];
extern u16 gUnknown_03001418;
/* VOLATILE: sub_08017EEC reads it twice -- once into gUnknown_030030A8 and once
 * for gUnknown_03001FF4 = it + 0x6f -- and the two named globals in between
 * cannot alias it, so plain agbcc CSEs the pair into one `ldrh`. The qualifier
 * keeps both loads and still emits `ldrh` rather than the `ldrsh` an s16 would.
 */
extern volatile u16 gUnknown_03001420;
/* At least 0x20 halfwords: sub_0801DA94 clears [0..0x1f] through a variable
 * index. SIGNED elements -- sub_0801DAB0 scans the same 0x20 with
 * `movs r5,#0; ldrsh r0,[r2,r5]`, which is the s16-object tell; the plain
 * `strh 0` writers (sub_0801DA94, sub_0801DAE8) cannot see the difference.
 * sub_0801DAE8 takes an s16 index and skips -1, so -1 is "no slot". */
extern s16 gUnknown_03001430[];
extern struct Unk03001470 gUnknown_03001470[];
extern s16 gUnknown_03001FBC;
/* A bare u16 counter, incremented (`ldrh; adds #1; strh`) by sub_080501DC on
 * one branch of a state test and never read there -- so its width is the load,
 * its signedness is unconstrained, and u16 is the weakest fit. */
extern u16 gUnknown_03004544;
/* An s16 counter reached only at +4, by the two functions of the 0x08063Bxx
 * pair: sub_08063BBC steps it with `ldrh; subs #1; strh` and sub_08063BE0 tests
 * it with `movs r1,#4; ldrsh r0,[r0,r1]` against 0. SIGNED on that `ldrsh`
 * (the register offset is ldrsh having no immediate form, not an address being
 * taken), and an ARRAY rather than a struct because +4 is the only offset any
 * reader touches -- `gUnknown_0202F0E8[2]` is the weakest spelling that fits and
 * it produces both forms. Nothing bounds the extent. */
extern s16 gUnknown_0202F0E8[];
extern u32 gUnknown_03001FD4;
extern u32 gUnknown_03001FE0;
/* A word, written with `str` and never read by anything matched. Two writers,
 * both in the sub_08036C4C screen-setup family and both storing a constant --
 * 0xE28 here and 0xE29 in sub_08036C80, its byte-identical twin's neighbour.
 * `u32` on the store width alone (wave 20, W20-C). */
extern u32 gUnknown_030032CC;
/* A sprite/animation descriptor blob: sub_080272C4 and sub_08027428 pass its
 * ADDRESS as sub_0801C210's first argument and nothing else names it. `u8 []`
 * for the same reason as the gUnknown_085533E4 family -- only the address is
 * used (wave 20, W20-C). */
extern u8 gUnknown_08112614[];
/* An OAM object counter. Every access in the ROM is 16-bit and there are only
 * four: sub_0801DF94 and sub_0801EFA8 zero it with `strh`, sub_0801EF6C zeroes
 * it alongside gUnknown_03002B54 = 0x10, and sub_0801EEnn bumps it with
 * `ldrh; adds #1; strh` inside the sprite-emit loop -- the read is the one that
 * fixes the width at 16 rather than merely "at least 16". Unsigned is not
 * proved: nothing sign-extends it, but nothing needs to, and it only ever
 * counts up from 0. */
extern u16 gUnknown_03001FE4;
/* A callback, not a data word: sub_080198F0 does `ldr r0,[r0]; cmp r0,#0;
 * beq; bl _call_via_r0` and then tests the result with `lsls #24`. Cleared by
 * sub_080198C4 and sub_08017F0C; saved/restored alongside gUnknown_03002F20
 * by sub_080171B4 / sub_08017540. */
extern bool8 (*gUnknown_03001FF0)(void);
extern u16 gUnknown_03001FF4;
/* The BG0 x scroll shadow. VOLATILE, proved in sub_0801258C (wave 13): that
 * function packs it with the BG0 y shadow as `x | (y << 16)` into one word, and
 * the ROM accumulates the OR into the SHIFTED operand (`orrs r0, r1`) while a
 * plain read accumulates into the unshifted one (`orr r1, r1, r0`). combine
 * cannot fold a volatile MEM into the ior, so the commutative canonicalisation
 * that picks the destination goes the other way -- the same mechanism as the
 * REG_DISPSTAT_LO note in hardware.h, and the discriminator is free because it
 * costs no bytes. Every other promoted user is a single read or a bare
 * read-modify-write (sub_080122EC, sub_08012420, sub_080338C0, sub_080399D8,
 * sub_080453B0, sub_0804542C, sub_08084544, sub_0808A3A0) and is byte-identical
 * either way. */
extern volatile u16 gUnknown_03001FF8;
extern u16 gUnknown_03002000;
extern u16 gUnknown_0300200C;
extern struct Unk03002040 gUnknown_03002040;
extern struct Unk030020A8 gUnknown_030020A8;
/* gUnknown_030020B4 is the REG_DISPSTAT shadow -- declared in hardware.h */
extern u8 gUnknown_030020B8;
extern u8 gUnknown_030024E4;
/* 32 slot-in-use flags. VOLATILE: sub_0801DF94, sub_0801E13C and sub_0801E17C
 * all emit a dead `ldrb` of the element's own address immediately around the
 * `strb` -- the aggregate-element volatile tell in docs/agbcc-codegen.md. */
extern volatile u8 gUnknown_030024F0[];
/* A small mode enum, 0/1/2. sub_08013D40 and sub_08014BB4 clear it,
 * sub_08014468 sets it to 1, sub_080145BC resets 2 -> 0. */
extern u8 gUnknown_03002514;
/* gUnknown_0300251C is the fourth BG-control shadow (REG_BG3CNT) and is
 * declared in hardware.h with the other three -- it needs union BgCntBuf.
 * It was a bare u16 until wave 13: sub_08065990 and sub_0806D944 both read
 * `gUnknown_0300251C.bits.chr_block` to build a BG char base address, with the
 * `ldr` + `lsls #0x1c; lsrs #0x1e` pair that a bitfield read gives whatever
 * the container -- and they do the identical thing to gUnknown_030030B4, which
 * was already a union, three instructions later. The three scalar writers keep
 * their bytes exactly because they now spell it `*(u16 *)&gUnknown_0300251C`,
 * which is what c_080122EC.c and c_080573F0.c already did for the other
 * three shadows on the lines immediately above. */
extern u16 gUnknown_03002520[];
/* An OAM shadow: sub_0801EFD8 CpuFastSets 0x380 bytes of it to 0x07000080
 * through sub_08011C90, i.e. OAM entries 4..127 (0x400 - 0x80 == 0x380). The
 * 0x380 is the copy length and not a proved extent, and nothing dereferences
 * an entry yet, so `u8 []` is the weakest model that gives the clean pool
 * word. */
extern u8 gUnknown_030025A0[];
/* Paired with gUnknown_030030D0 -- an x/y scroll origin subtracted from
 * gUnknown_03001418 / gUnknown_03001FF8 when sub_08012420 writes BGxHOFS.
 * Always ldrh/strh. Cleared together by sub_08013324/sub_08013388/sub_0801339C.
 *
 * VOLATILE, and this pair is where it is proved: sub_08012420 subtracts each
 * of them from four different globals in eight consecutive straight-line
 * statements, and RELOADS the subtrahend every time while keeping its address
 * in a callee-saved register. Nothing between the reads writes IWRAM, and
 * agbcc's alias analysis proves a `strh` to an absolute 0x040000xx address
 * cannot touch a symbol, so a non-volatile read is CSEd to one `ldrh` and the
 * function is eight instructions short. The three promoted clearers store a
 * bare constant and are byte-identical either way (re-verified). */
extern volatile u16 gUnknown_03002B20;
extern struct SpriteEntry *gUnknown_03002B24;
/* A 0/1 toggle: sub_080129B4 flips it with `1 - x` and pushes the result into
 * REG_BLDCNT's effect field. volatile because that function re-reads it after
 * the store instead of reusing the value it just computed -- GCC is otherwise
 * free to forward the untruncated `1 - x`, since every consumer is a 16-bit
 * store, and the reload disappears. */
extern volatile u16 gUnknown_03002B2C;
extern u8 gUnknown_03002B30;
/* The BG1 x scroll shadow, and the twin of gUnknown_03001FF8 above -- volatile
 * for the same reason and proved the same way, by the `orrs r0, r1` in
 * sub_0801258C's `gUnknown_03002B3C = gUnknown_03002B34 |
 * (gUnknown_03002F18 << 16)`. Its y partner gUnknown_03002F18 was already
 * volatile on independent evidence. */
extern volatile u16 gUnknown_03002B34;
/* SIGNED: the getter sub_08017988 reads it with `ldrsh`. Set to 1 by
 * sub_08017970 and to 0 by sub_0801797C. */
extern s16 gUnknown_03002B38;
extern u8 gUnknown_03002B40;
extern u8 gUnknown_03002B44;
extern u8 gUnknown_03002B4C;
/* Always ldrh/strh. sub_0801DF94 sets it to 0x10, sub_0801E0F0 clears it,
 * sub_0801E0BC returns it -- an OAM-shadow write cursor. */
extern u16 gUnknown_03002B54;
/* A 0/1 phase flag, always ldrh/strh. Six users test it and then write the
 * value they did not see (sub_08011050, sub_080110E8, sub_08011290 and
 * friends): a "switch to state N, or bail out if already there" guard. */
extern u16 gUnknown_03002B5C;
extern u8 gUnknown_03002B68;
extern struct Unk03002B80 gUnknown_03002B80;
/* Always ldrh/strh, compared against 0 and 1. sub_080199C4 clears it,
 * sub_080199D0 sets it from a u8 argument, sub_08019674 copies a u16 into it. */
extern u16 gUnknown_03002EE4;
extern u8 gUnknown_03002EFC;
extern u16 gUnknown_03002F00;
/* volatile is load-bearing: sub_0804BA4C ends with a self-assignment
 * (`ldrh r0,[r1]; strh r0,[r1]` on one address, nothing else), and agbcc drops
 * `g = g` entirely on a plain object -- the whole store disappears from the
 * emitted code. Only a volatile lvalue keeps both halves. The other user,
 * sub_080122EC's `gUnknown_03002F18 = 0`, is a bare scalar store and is
 * byte-identical either way (verified with trymatch after the change). */
extern volatile u16 gUnknown_03002F18;
extern struct Unk03002F08 gUnknown_03002F08;
/* A 0/1 flag, always ldrh/strh. sub_08013028, sub_080160DC and sub_0803BF70
 * set it, sub_08016094 tests it and clears it.
 * What it selects, now that sub_08016094 is matched: it is a ONE-SHOT
 * "the next command is a jump" flag on the gUnknown_03001470 script
 * interpreter. sub_08016094 is byte-for-byte sub_080160DC (which sets the flag
 * and steps the cursor 8 bytes on) with an `if` wrapped round it -- flag clear,
 * step 8; flag set, clear the flag and load the cursor from the word the
 * current command points at. Plain `u16`, not volatile: nothing between the
 * `ldrh` and the `strh` could alias it and the ROM does not reload it. */
extern u16 gUnknown_03002F1C;
/* A callback like gUnknown_03001FF0: sub_080183C0 null-checks it and calls it
 * through `bl _call_via_r0`, discarding the result. Set by sub_080198A0 and by
 * sub_08018B18 (from a list node), cleared by sub_080198AC. */
extern void (*gUnknown_03002F20)(void);
/* The stack cursor for gUnknown_03002F50 below. */
extern struct Unk03002F50 *gUnknown_03002F24;
/* u16 object, read back as s16: sub_08011BC4 is `ldrh; lsls #16; asrs #16`.
 * volatile is load-bearing -- without it agbcc folds the load and the
 * sign-extension into one `ldrsh`, and an `s16` declaration gives the same
 * `ldrsh`. Only a volatile u16 keeps the plain `ldrh` plus the shift pair. */
extern volatile u16 gUnknown_03002F30;
extern struct Unk03002F50 gUnknown_03002F50[];
extern void *gUnknown_03002FA0[];
/* 0x40 bytes = 16 entries. The IRQ handler table: crt0.s indexes it by the
 * interrupt's word offset and `bx`es to the entry; sub_0801BAE0 fills entries
 * 0..14 with sub_0801BAB8. sub_0801BB00(index, handler) is the setter. */
extern void *gUnknown_03002FE0[];
/* Word-element array indexed by a u16 argument (sub_08010EE8 does
 * `lsls #16; lsrs #14`, i.e. (u16)i * 4). */
extern void *gUnknown_03003050[];
extern u16 gUnknown_030030A0;
extern u16 gUnknown_030030A8;
extern u16 gUnknown_030030C4;
/* The y half of the scroll origin pair whose x half is gUnknown_03002B20 --
 * volatile for the reason recorded there. */
extern volatile u16 gUnknown_030030D0;
extern volatile u16 gUnknown_030030E8;
extern struct Unk030030F0 gUnknown_030030F0;
extern union Unk802C57CBuf gUnknown_03003100;
/* At least 3 bytes: sub_08035568 clears [0..2] through a variable u16 index
 * (`cmp #2; bls`), so this is an array rather than a struct. `strb`, so the
 * element is byte-sized; nothing has read one yet, so the signedness is open. */
extern u8 gUnknown_03003124[];
extern struct Unk03003130 gUnknown_03003130;
extern u16 gUnknown_030032C0;
extern struct Unk802C57C gUnknown_030032C4;
extern u16 gUnknown_030032D8;
/* Halfword; sub_0802C480 zeroes it with `strh` on every call, unconditionally
 * after its guarded coordinate update. */
extern u16 gUnknown_03003334;
extern struct Unk03003338 *gUnknown_03003338;
/* A row-pointer table for the gUnknown_08499590 screen: sub_0801F838 fills
 * gUnknown_03003340[y][x] for y < height (+2) and x < width (+0) with a u8.
 * Word elements (`lsls #2` on the index) each holding a byte pointer, and the
 * symbol address is added directly, so this is an array and not a pointer. */
extern u8 *gUnknown_03003340[];
extern struct Unk802C57C gUnknown_030033E0;
extern struct Unk802C57C gUnknown_030033E4;
/* Read `ldrh` in a dozen places across code.s and code-0806CFC8.s and stored
 * `strh`, so at least 16 bits; the bare `ldrb` readers (sub_08017658,
 * sub_0807A934) are u8-context reads of the same halfword.
 */
extern u16 gUnknown_030033EC;
/* At least 4 bytes: sub_0803CB8C clears [0..3] and sub_0803CB74 tests bit
 * `id & 7` of byte `id >> 3` with a SIGNED shift, i.e. an int index.
 */
extern u8 gUnknown_030033F4[];
/* A word-sized state id. sub_08080FB8 tests it `== 6` with `ldr` and advances
 * it to 0xc, so it is a small enum held in a whole word rather than a flag. */
extern u32 gUnknown_030033FC;
extern union Unk802C57CBuf gUnknown_03003F24;
/* The base of the 0x40-wide unit-id window the 0x0805Cxxx list builders scan:
 * every one of them runs `for (i = g + 1; i < g + 0x40; i++)` over
 * gUnknown_08499594[i]. `ldrh` with no sign extension anywhere, and the `+ 1`
 * is the usual 1-based unit-id convention. */
extern u16 gUnknown_03003F2C;
/* At least 7 bytes: sub_0803BBD4 clears [0..6] through a variable index, so
 * this really is an array and not a struct. Elements are SIGNED --
 * sub_0803BB44/BB5C/BB74 and sub_0803B8E0/B904 all read one with
 * `ldrb; lsl #24; asr #24`. The getters at 0803BC7C/BC88/BC94 return the same
 * bytes zero-extended, i.e. as u8.
 * sub_0803BB44/BB5C/BB74 map elements 1/2/3 to 1 when zero and 2 otherwise,
 * and they return u8: sub_0803BB14 narrows sub_0803BB44's result with
 * `lsls #24; lsrs #24` before comparing it, which an int return would not
 * emit. Their own bodies cannot say so -- both return types are byte-identical
 * there, so the call site is the only evidence.
 */
extern s8 gUnknown_03003F30[];
extern int gUnknown_03003F40;
extern void *gUnknown_03003F68;
extern struct Unk03003FC0 gUnknown_03003FC0;
/* At least 5 bytes. sub_08026340 counts the non-zero entries of [1..4] with a
 * u8 index, reaching them as `adds rI, rI, rBase` off the symbol address, so
 * this is an array and not a pointer. Index 0 is never touched -- the same
 * 1-based player-slot convention gUnknown_0810E6E0 uses. */
extern u8 gUnknown_03003FF8[];
extern u16 gUnknown_03004080;
extern struct Unk802C57C gUnknown_03004090;
extern struct Unk802C57C gUnknown_030040A4;
/* Word cell; sub_0804138C clears it, sub_08041398 reads it. Callers keep
 * only the low halfword (sub_08029234 stores it with strh).
 */
extern u32 gUnknown_030040A8;
/* Two callback slots installed by sub_0803662C. sub_080366F4 calls
 * gUnknown_030040D0 with no arguments after a NULL test.
 */
extern void (*gUnknown_030040D0)(void);
/* Written once, in sub_0803C52C, with sub_08037DA4's 2..5 band result, by a
 * plain `str` -- so 32 bits wide, and nothing else in the ROM touches it, which
 * leaves it looking like a debug/cache cell rather than state anyone reads.
 * `int` rather than `u32` to agree with sub_08037DA4's signed return; the store
 * is byte-identical either way, so the signedness is inherited and not proved
 * here. */
extern int gUnknown_030040D4;
extern struct Unk030040D8 *gUnknown_030040D8;
/* A one-shot argument slot: sub_08042998 passes it to sub_08025B80 and clears
 * it in the same breath, reusing the zero it had just loaded from
 * gUnknown_03003FC0.unk0d. Plain `ldrb` / `strb`. */
extern u8 gUnknown_03004074;
/* A mode flag compared against 1. sub_0805C974 is the whole of
 * `if (gUnknown_030040DC == 1) return 1; return 0;` and is its only reader, so
 * the width rests on a single `ldrb` -- narrow by the "a lone ldrb constrains
 * the accessor, not the object" rule, and nothing else in the ROM touches it.
 * Signedness unproved. */
extern u8 gUnknown_030040DC;
/* A halfword flag. Every access found is a bare `strh` of 0 or 1
 * (sub_08035760 sets 1, sub_08035828 and sub_0803647C clear it), so the width
 * is proved to be at least 16 bits and u16 is the weakest model; nothing reads
 * it yet, so neither the signedness nor a wider type is settled.
 *
 * SETTLED, wave 13 (A2): the reader is sub_080345C8, and it is
 * `movs r1, #0; ldrsh r0, [r0, r1]` -- a SIGNED halfword load, which is what
 * s16 emits and what u16 (`ldrh`) does not. The three writers are unaffected;
 * a bare `strh` of 0 or 1 is identical either way. */
extern s16 gUnknown_030040E4;
/* SIGNED: sub_08034FC0 reads it back with `ldrsh` for its `!= 0` guard before
 * decrementing. sub_08034FB0 increments it. */
extern s16 gUnknown_030040E8;
extern void (*gUnknown_030040EC)(void);
/* Five bytes, one per player slot. sub_0803D6B8 fills [0..4] with the identity
 * permutation 0..4 (descending index loop); sub_0803D6D0 refills it from
 * gUnknown_08499598[i].unk1a and sub_0803D6FC from a caller-supplied buffer at
 * +0x4C4. All three write with `strb` through a variable index, so this is a
 * u8 array; no reader has settled the signedness. */
extern u8 gUnknown_030040F8[];
/* A word-wide flag set, tested a bit at a time. `s32` and not `u32` only
 * because src/title-screen.c already carries that spelling for it; every
 * access so far is `ldr` + a mask, so the signedness is not settled by
 * anything. sub_080338DC tests bit 0, sub_080369BC ANDs it with
 * gUnknown_030043F4, and title-screen.c tests bits 0 and 1. */
extern s32 gUnknown_03004008;
/* A bitmask, ANDed against gUnknown_03004008 in sub_080369BC to gate a frame.
 * u16 (ldrh); cleared by sub_08036B28 and sub_08036B34. */
extern u16 gUnknown_030043F4;
extern struct Unk802C57C gUnknown_030044A4;
/* A whole word (ldr/str), set by sub_0803FF48 from its third argument and
 * stashed in the same breath at +0x54 of the proc it starts. sub_0803FF2C is
 * the Proc_ForEach filter that reads it back: it ends every 0849FB04 proc whose
 * own +0x54 does not equal this. So it is the "currently active" handle for
 * that proc family; nothing dereferences it, so int rather than a pointer. */
extern int gUnknown_030044D4;
/* A parking slot for gUnknown_030032D8: sub_08028CD8 moves 030032D8 here and
 * writes 0x10 in its place, sub_08034ED0 moves it back and zeroes this one.
 * ldrh/strh throughout, and sub_080346BC compares it against 0xe. */
extern u16 gUnknown_030044DC;
extern struct Unk030044E0 *gUnknown_030044E0;
extern struct Unk03004504 gUnknown_03004504;
/* Three u16s in the sprite-attribute block that sub_0804D928 / sub_0804E3B4
 * (and ~40 siblings between 0x0804B180 and 0x08053614) read with `ldrh`.
 * 0300453C is the one everything hangs off: it selects a row of
 * gUnknown_08551D0C, is XORed with 1 into OamData.hFlip, is XORed with
 * gUnknown_0300450C to index gUnknown_085523A4, and supplies the high byte of
 * the tile number. Small -- the hFlip use only reads bit 0. NOT volatile: the
 * pair keeps one loaded value live across three stores while reloading for
 * two others, which a volatile read could not do. 0300451C is copied straight
 * into gUnknown_03001470[i].unk34 and never inspected. */
extern u16 gUnknown_0300450C;
extern u16 gUnknown_0300451C;
extern u16 gUnknown_0300453C;
/* A function-pointer global, and the only evidence for its shape is
 * sub_0807166C's one call site: `ldr r2,[r0]; adds r0,r4,#0; adds r1,r6,#0;
 * bl _call_via_r2` -- the r2 index counts TWO arguments, and both are the
 * function's own pointer parameters passed straight through. Nothing writes it
 * in `asm/`, so the parameter types are the caller's and are spelled `void *`
 * here; sub_0807166C is a bytecode opcode handler and this is the "the
 * predicate held, run the branch" continuation it hands its two contexts to.
 * (wave 18) */
extern void (*gUnknown_03005744)(void *, void *);
extern u16 gUnknown_03004518;
extern u16 gUnknown_03004538;
/* One 16-byte-stride RAM record per gUnknown_0300453C, viewed through TWO
 * linker symbols. sub_0804C098 reaches +2 as `gUnknown_03004580` with an
 * `adds #2`, but sub_0804D290/sub_0804DCA8 hold a pool word for 0x03004582
 * itself WHILE also holding one for 0x03004580 (both are defined in
 * aw2bhr.lds), which only a second named symbol can produce. So the source
 * really does have two overlapping declarations of the same memory and the
 * halfwords at +4 and +6 belong to the 03004580 view.
 *   [i][0] off 03004582  a small index into gUnknown_085D6A48 and the outer
 *                        index of gUnknown_08552FB8
 *   [i][2] off 03004580  the middle index of gUnknown_08552FB8
 *   [i][3] off 03004580  the second argument of sub_08057D44
 *   [i][5] off 03004580  the ROW index into the halfword-pair table that
 *                        sub_08057D44 returns -- sub_0804FA2C scales it by 40
 *                        (ten pairs) before adding the element index, so that
 *                        table is 2-D there and flat in sub_0804D290
 * The `[8]` row length is the 16-byte stride, not a proved extent.
 *   The ROWS ARE AN ARRAY, not a struct: every column read in sub_0804FA2C
 * ([3], [5], [2]) is emitted as `base + C` first and then `+ i*16`, which is
 * the reassociated array form, while gUnknown_085D6A48's column 9 in the SAME
 * function keeps its offset in the `ldrh` displacement. See the
 * "column-offset fold" section of docs/agbcc-codegen.md -- the two spellings
 * are distinguishable and this one is settled. */
extern u16 gUnknown_03004580[][8];
extern u16 gUnknown_03004582[][8];
/* A u16 lookup table, not a pointer: sub_0804B830 adds the symbol address to
 * `index * 2` directly and reads it with `ldrh`. Extent unproved -- its one
 * reader indexes it with an unchecked u16 argument. */
extern u16 gUnknown_030045A8[];
extern u16 gUnknown_030045D4;
/* A zero-terminated list of small ids. sub_0805D344 walks it with
 * `while (gUnknown_030045F0[i] != 0)`, sub_0805CDF0/sub_0805CE20 seed it with
 * {0x40, 0} and point gUnknown_030046B0 at it. Byte array, not a struct:
 * sub_0805D344 indexes it with a variable. */
extern u8 gUnknown_030045F0[];
/* Read cursor into gUnknown_030045F0 -- sub_0805D438 dereferences it with
 * `ldrb`, compares against the 0x40 sentinel and bumps it by 1. */
extern u8 *gUnknown_030046B0;
/* 64 bytes, indexed `& 0x3f`. VOLATILE: sub_0805AC88 (`= 0`) and the
 * increment at 0x0805AC28 (`ldrb; adds #1; ldrb; strb`) both emit a dead
 * `ldrb` of the element's own address around the `strb` -- the
 * aggregate-element volatile tell in docs/agbcc-codegen.md. */
extern volatile u8 gUnknown_03004730[];
/* A per-mode step callback: sub_0805D438 loads it and does `bl _call_via_r0`
 * with the result discarded, and sub_0805CDF0/sub_0805CE20 store
 * sub_0805DB64/sub_0805DB70 into it -- both `void f(void)`. */
/* A word-sized cursor into the two 0x08576xxx function-pointer tables:
 * sub_08061B00 reads it, indexes `tbl[g]` with `lsls #2`, and post-increments
 * it; sub_08061908 resets it to 0. UNSIGNED -- sub_0805C1C4 and sub_0805C208
 * both guard on it with `cmp #1; bls`, and a signed `< 2` would have been
 * `blt`. */
extern u32 gUnknown_03004770;
extern void (*gUnknown_03004778)(void);
/* 16-bit, and every writer agrees: `strh` in sub_0805D338 (writes 5) and in
 * sub_0805FFA0's shared epilogue (writes 2). No reader narrows it further and
 * no writer signs it, so `u16` is the weakest model and the signedness is
 * unproved. */
extern u16 gUnknown_03004780;
/* A whole-word flag: sub_0802F3D8 stores a register into it with `str`, and
 * the 0x0805Cxxx list builders pass it straight to sub_0805D344, which spills
 * it and tests it `!= 0`. Nothing narrows it, so u32 is the weakest model. */
extern u32 gUnknown_0300477C;
/* The record payload array the gUnknown_03005944 cursor family writes into.
 * u8 elements: every access in the ROM is `ldrb`/`strb` through the symbol
 * address plus a variable index (sub_08078608/58/A4/sub_080786F0 write three
 * bytes per record, sub_08044C10 and the 0x0807Cxxx readers read them back).
 * Indexed by a caller-supplied cursor, not by gUnknown_03005944.
 */
extern u8 gUnknown_030058E0[];
/* A word counter read whole with `ldr`. sub_08087298 returns
 * `gUnknown_030058F4 * 2 - K` as a u16, with K picked by
 * gUnknown_03003FC0.unk01 -- a scroll or column offset derived from a turn or
 * frame count. */
extern u32 gUnknown_030058F4;
/* Word flag guarding an optional sub-proc; set/cleared by sub_08080F3C and
 * sub_08080F90, tested `!= 0` as a whole word by sub_08081290 and 0x080814E0.
 */
extern u32 gUnknown_030058FC;
/* Zeroed by sub_08085AF4's reset alongside gUnknown_0300596C/80/90 and
 * gUnknown_03005930, and read `ldrb` into an int by sub_08085F94 and
 * sub_08085C10. Unsigned: no access sign-extends. It pairs with
 * gUnknown_03005930 exactly as gUnknown_03005990[gUnknown_0300596C] pairs
 * with gUnknown_03005980 -- sub_08085F94 picks one pair or the other on
 * `gUnknown_081D940C->unk01 == 2` and sums it into a proc field at +0x58. */
extern u8 gUnknown_03005900;
/* Word cell, `ldr`/`str` everywhere (sub_08080FB8 tests it `!= 0`,
 * sub_08081E54 stores into it). */
extern u32 gUnknown_03005920;
/* 0x03002EE0 is `gpKeySt` (include/hardware.h), NOT an unnamed global. Wave 20
 * invented a `gUnknown_03002EE0` for it and the SPLIT build caught it as an
 * undefined reference: upstream's linker script already binds that address, so
 * no `gUnknown_` symbol exists there and none can be created. The reason it was
 * missed is worth keeping -- there is no direct `ldr rN, =gpKeySt` in asm/ at
 * all; every reader spells it `ldr rN, =<pool>; ldr rM, [rN]; ldr rM, [rM]`, a
 * -fforce-addr reroute plus the pointer's own deref, so the address only ever
 * appears as pool-word CONTENT. Three words of the 0x0816E180-0x0816E1CC run
 * hold it (0x0816E1B0, 0x0816E1B4, 0x0816E1C8) and so does 0x081D93B8,
 * sub_08082660's slot.
 *   The type analysis behind the wrong name was right and is now redundant:
 * `struct KeySt` already declares the u16 at +0x02, and sub_08082660 testing
 * bits 0x40 / 0x80 of it is the same D-pad idiom c_0802966C.c uses at 0x50 /
 * 0xa0. RULE: before declaring a `gUnknown_<addr>` for an address reached only
 * through a pool word, grep aw2bhr.lds for that offset -- a named symbol there
 * is invisible to every asm-side screen this project runs. */
/* Word cell holding a small state id -- sub_08080F3C and sub_08080F90 both set
 * it to 6. Read whole with `ldr` and stored into a u16 proc field at +0x66 by
 * 0x0808151C, which is where the `ldr; strh` pairing in sub_0807BE24 comes
 * from too. */
extern u32 gUnknown_03005924;
/* Word cell; the only reference in the ROM is sub_0807BE24, which reads it
 * `ldr` and stores it into a u16 proc field at +0x4c. `ldr` rather than `ldrh`
 * is what fixes it at 32 bits -- a u16 global would have loaded `ldrh`. */
extern u32 gUnknown_0300592C;
/* Halfword zeroed by sub_08085AF4's reset; sub_08085F94 reads it `ldrh` and
 * adds it to gUnknown_03005900. The unsigned `ldrh` in an int context keeps
 * it u16 rather than s16. */
extern u16 gUnknown_03005930;
/* Write cursor into the gUnknown_03005948/58 byte arrays, post-incremented
 * per record by sub_08078608 and its siblings.
 */
extern u32 gUnknown_03005944;
/* Two parallel u8 record arrays indexed by the gUnknown_03005944 cursor, both
 * `ldrb`/`strb` throughout. sub_08078608 and its siblings write one byte of
 * each per record; sub_0807C844 and sub_0807CF50 read them back. */
extern u8 gUnknown_03005948[];
extern u8 gUnknown_03005958[];
/* A word-sized 0/1 flag: sub_08082412 toggles it with `~g & 1`, five sites
 * test the whole word, and sub_080846F4 returns just its low byte. */
extern u32 gUnknown_03005968;
/* A 0..7 selector, read `ldrb` at all six sites in code-0806CFC8.s and always
 * compared unsigned (`cmp #3; bhi`, `cmp #1; bhi`, `cmp #5; bhi`) -- u8. It
 * splits a menu/portrait layout into a low half (0..3) and a high half (4..7,
 * used as `g - 4`), and sub_080895E4 reads it FIVE times in a row across four
 * `bl`s while holding only its ADDRESS in r4, which per the const rule in
 * docs/agbcc-codegen.md means the declaration is NOT const. */
extern u8 gUnknown_03005964;
/* The cursor into gUnknown_03005990[], set to 2 by sub_08085AF4's reset.
 * SIGNED, and that is not negotiable: sub_08085F94 and sub_080860DC both read
 * it with `movs rN, #0; ldrsh r0, [r2, rN]` before adding it to the array
 * base, which per docs/agbcc-codegen.md is an s16 OBJECT rather than a cast.
 * (The stray `movs #0` alongside is just `ldrsh` having no immediate-offset
 * form, not an operand of anything.) sub_08085AF4 stores the literal 2 with a
 * plain `strh` and is byte-identical either way, so the reset could not have
 * said so -- this is the widest-access rule doing its job. */
extern s16 gUnknown_0300596C;
/* Halfword zeroed by sub_08085AF4's reset; sub_08085F94 reads it `ldrh` and
 * adds it to gUnknown_03005990[gUnknown_0300596C]. The unsigned `ldrh` in an
 * int context is what keeps it u16 rather than s16. Its opposite number on
 * the other arm of that branch is gUnknown_03005930. */
extern u16 gUnknown_03005980;
/* Exactly 9 bytes, and the extent is proved rather than guessed:
 * sub_08085AF4 clears it with the house reverse-fill idiom
 * (`p = base + 8; do { *p = 0; p--; } while ((int)p >= (int)base);`), so the
 * cursor starts at +8 and the loop's terminating compare is against the array
 * base itself. Really an array and not a struct -- sub_08085F94 and
 * sub_080860DC index it with the variable gUnknown_0300596C, `ldrb` to read
 * and `strb` to write. */
extern u8 gUnknown_03005990[];
/* Five words, cleared/filled as a unit by sub_08078740 and sub_08078758. */
extern u32 gUnknown_030059C0[];
/* The m4a MusicPlayerInfo for the BGM player: it is the first argument of every
 * m4a MPlay* entry point in this tree -- sub_08071420 (MPlayVolumeControl) from
 * sub_0803B35C, sub_08070610 (m4aMPlayFadeOut) from sub_0803B5A4, and four more
 * sites in asm/code-0801D390.s -- and is only ever passed by address, never
 * dereferenced from C. `u8 []` is the weakest model that reproduces the bare
 * `ldr rN, =gUnknown_03005AE0` with no extra instruction; the real struct is
 * m4a's MusicPlayerInfo and nothing in this tree has needed a member of it yet.
 * Wave 24. */
extern u8 gUnknown_03005AE0[];
/* SOUND_INFO_PTR. The AGB BIOS/driver convention puts it at exactly 0x03007FF0
 * and this ROM follows it: sub_0806F744 (SoundMain) loads it and compares
 * `[r0]` against 0x68736D53. NOT const -- sub_08070AF8 re-`ldr`s nothing, but
 * the driver installs the pointer at init, so nothing here justifies const. */
extern struct SoundInfo *gUnknown_03007FF0;

/* ---------------------------------------------------------------- ROM -- */

/* A ROM word holding the address of a RAM array of 0x0c-byte records; see
 * struct Unk0808E5C8. Non-const, but for the usual -Werror reason and NOT
 * because sub_0801A6C0 re-`ldr`s the deref after its `strh` to
 * gUnknown_030020A8 -- that reload is not evidence either way. Probed: under
 * `-fforce-addr` even the `.rodata` word GCC synthesises for a const-qualified
 * pointer is re-read across an intervening HImode store, so a const
 * declaration reloads exactly the same way. The const tell in
 * docs/agbcc-codegen.md is about a re-read surviving a store, and nothing here
 * survives one. */
extern struct Unk0808E5C8 *gUnknown_0808E5C8;
/* A byte-stream script walked by sub_0801B8A8, which is a
 * `while (*p != 1)` loop doing `sub_0801B7C0(p, arg); p += sub_0808B6B0(p) + 1`
 * -- a variable-length opcode stream, hence `const u8 []` and not a record
 * array. sub_0801B750 is its only starter. Wave 14. */
extern const u8 gUnknown_0808EF64[];
/* 0x40 bytes of uncompressed 4bpp tile data (two tiles): sub_080059E4 queues
 * it for VRAM 0x060158C0 with sub_08011E54. Non-const because sub_08011E54's
 * first parameter is a plain `void *` -- the usual -Werror reason, not
 * evidence about the original declaration. */
extern u8 gUnknown_0808DF4C[];
/* ROM table of word-sized entries walked by the gUnknown_03000578 cursor;
 * sub_0802EC64 wraps the cursor back to 0 when the entry is 0, so the table is
 * NULL-terminated. Nothing has dereferenced an entry yet, so `void *[]` is the
 * weakest model that reproduces the clean pool word and the `ldr`/`cmp #0`. */
extern void *gUnknown_08090C44[];
extern struct Unk08090CD8 *const gUnknown_08090CD8;
extern const s16 gUnknown_08090EAC[];
/* 0x30 bytes = twelve words, and word-sized is measured rather than assumed:
 * sub_0803B3B0 indexes it `lsls r0,r0,#2; adds r0,r0,r1; ldr r0,[r0]` and hands
 * the entry straight to sub_08070990 (m4aSoundMode), whose parameter is `u32`.
 * So this is the ROM's table of twelve m4a sound-mode words, selected by a
 * small index. `const`: it is in .rodata and sub_08070990 takes it by value.
 * Wave 24. */
extern const u32 gUnknown_080910FC[];
/* 0x280 bytes = 20 uncompressed 4bpp tiles; sub_08037258 returns its address.
 * Non-const because nothing constrains it yet and const is the direction that
 * breaks under -Werror. */
extern u8 gUnknown_080913BC[];
/* 0x800 bytes of uncompressed ROM data blitted to VRAM 0x06017800 by
 * sub_080116E8 through sub_08011C68. Non-const for the same -Werror reason as
 * its neighbours above; sub_08011C68 takes `const void *`, so const would
 * compile here, but nothing else constrains the symbol and non-const is the
 * direction that stays safe. */
extern u8 gUnknown_080A1424[];
/* 0x400 bytes of uncompressed ROM data, copied verbatim over the buffer
 * gUnknown_0849959C points at by sub_080215D0 (`for (i = 0; i <= 0x3ff; i++)`,
 * one `ldrb`/`strb` per byte). Non-const for the usual -Werror reason. */
extern u8 gUnknown_080C1BC4[];
/* A ROM word holding 0x0200D510, i.e. &gUnknown_0200D510 -- the sprite-list
 * layer-head array. Its only user is sub_0801BE78, which derefs it twice with
 * `ldr rN,[r4]` on one pool word and gets no `.rodata` indirection despite the
 * two uses straddling a loop, so the address is NOT force-addr'd here. */
extern struct SpriteEntry *gUnknown_0808F090;
/* 0x1a4-byte compressed blob, handed to Decompress(u8 *, void *) by
 * sub_0802D5B8 via the accessor sub_08037250 -- hence u8 *, not const. */
extern u8 gUnknown_080D3FE4[];
extern const struct ProcCmd gUnknown_086140D4[];
/* The sprite/animation table sub_08043418 hands to sub_0801C7DC as its first
 * argument. u16 because that is how sub_0801C7DC reads it -- `ldrh [r0]` and
 * `ldrh [r0,#2]` are two halfword offsets into the table itself, and the
 * element it finally reaches is handed to PutSpriteExt's `u16 *` parameter.
 * const because it is ROM and nothing writes it; the one consequence is that
 * sub_0801C7DC's first parameter is declared `const u16 *`, which will need
 * revisiting if that function turns out to launder it into PutSpriteExt
 * without a cast. */
extern const u16 gUnknown_08101EC0[];
/* Two ROM blobs that sub_0803F128 selects between on a mode id and hands to
 * sub_0801C70C as its first argument. Nothing matched dereferences either, so
 * the element type is a guess -- only the symbol address is ever used. Their
 * siblings one function up (sub_0803F110 -> gUnknown_081095A4 /
 * gUnknown_0810A6F0) go to Decompress instead, so the two halves of that pair
 * of accessors are NOT the same kind of data. */
/* The Decompress half of the accessor pair the note above describes:
 * sub_0803F110 selects between these two on the same mode id sub_0803F128 uses
 * and hands the result to Decompress, so `u8 []` rather than the
 * `const u16 []` of its twin (wave 20, W20-C). Only the address is ever used;
 * nothing dereferences either. */
extern u8 gUnknown_081095A4[];
extern u8 gUnknown_0810A6F0[];
extern const u16 gUnknown_0810A3E8[];
extern const u16 gUnknown_0810AFC8[];
extern u8 gUnknown_0810BE60[];
extern u8 gUnknown_0810E6E0[];
extern u8 gUnknown_0810E820[];
/* Two more 32-byte-tile banks in the same family as gUnknown_08106A64 and
 * gUnknown_08108264 below, reached by sub_0802A880 and sub_0802A8AC. The
 * `[][32]` shape is what turns the `lsls #5` into a subscript rather than an
 * open-coded byte offset; 08104464 keeps the family's `& 0x3ff` tile-index
 * mask, 08106864 has none. */
extern const u8 gUnknown_08104464[][32];
extern const u8 gUnknown_08106864[][32];
extern const u8 gUnknown_08106A64[][32];
extern const u8 gUnknown_08108264[][32];
/* Three LZ77 blobs and two 16-colour palettes, paired up by the five
 * sub_08044D70 wrappers at 0x08044C44-0x08044D34: each one hands a blob and a
 * palette to the same starter, which stashes them at +0x4c/+0x50 of the new
 * proc. Sizes from the map: 0x25c/0x274/0x7d0 for the blobs, 0x20 each for the
 * palettes, and 08112F00 opens with the LZ77 header 0x10 / 0x000800.
 * Non-const on both counts -- sub_080453CC hands 0811315C to
 * Decompress(u8 *, void *) and 08113BA0 to ApplyPaletteExt(u16 *, u32, u32),
 * and a const qualifier would break both prototypes under -Werror. */
extern u8 gUnknown_08112F00[];
extern u8 gUnknown_0811315C[];
extern u8 gUnknown_081133D0[];
extern u16 gUnknown_08113BA0[];
extern u16 gUnknown_08113BC0[];
/* Compressed blobs, 0x2f8 and 0x37c bytes. Non-const because both are only
 * ever handed to Decompress(u8 *, void *), whose prototype takes u8 *. */
extern u8 gUnknown_08126244[];
extern u8 gUnknown_0812653C[];
extern u8 gUnknown_081268F8[]; /* handed out by sub_0801F49C */
/* Two ROM tables in the same slot as gUnknown_0849A0F0 -- blobs handed to
 * sub_080152EC / sub_080193B0 by the wrapper family at 0x08004AA0-0x08004B6C.
 * Both are genuine fixed-stride TABLES, not a run of unrelated blobs, and the
 * stride is readable off the addresses without dereferencing anything:
 *
 *   084873BC 08487404 0848744C 08487494 084874DC   stride 0x48, five entries
 *   08487754 084877F4 08487894 08487934 084879D4   stride 0xA0, five entries
 *
 * Corroborated in the ROM image rather than inferred from the deltas alone.
 * Each 0x48 entry holds a THUMB function pointer at +0x10 and the five of them
 * step in lockstep with the 12-byte leaves next door -- +0x10 is 08004A61,
 * 08004A6D, 08004A79, 08004A85, 08004A91, i.e. &sub_08004A60 + 0x0C*n with the
 * THUMB bit set. Every entry also shares the same tail (+0x38 = 08004819,
 * +0x40 = 00000000, +0x44 = 00070000), and the word at 0x08487524 (the sixth
 * 0x48 slot) does not, which is what caps the table at five. The five 0xA0
 * entries likewise share a byte-identical 0x20-byte header (00000013 0 0 0 0
 * 08034F7D 0 0), so the stride is real there too.
 *
 * Declared `const u8 []` anyway, on the same reasoning as gUnknown_0849A0F0:
 * that is the weakest model that reproduces the clean pool word, no matched
 * function indexes or dereferences either table, and both consumers
 * (sub_080152EC's `const void *`, sub_080193B0's `const u8 *`) take them as
 * opaque pointers. Widen them to real struct arrays when a consumer is matched
 * -- the strides above are what the element size will have to be. */
extern const u8 gUnknown_084873BC[];
extern const u8 gUnknown_08487404[];
extern const u8 gUnknown_0848744C[];
extern const u8 gUnknown_08487494[];
extern const u8 gUnknown_084874DC[];
extern const u8 gUnknown_08487754[];
extern const u8 gUnknown_084877F4[];
extern const u8 gUnknown_08487894[];
extern const u8 gUnknown_08487934[];
extern const u8 gUnknown_084879D4[];
/* A gUnknown_03001470 list blob, not a proc script: family F057
 * (sub_08004EDC/08004F1C/08004F5C) hands it to sub_080152EC(script, 0), the
 * same pairing gUnknown_08580C7C and gUnknown_08581F7C document. `const u8 []`
 * is what sub_080152EC's `const void *` first parameter takes. */
extern const u8 gUnknown_08487E14[];
/* A gUnknown_03001470 script blob: sub_08004958 hands it to
 * sub_080152EC(script, 0). Same `const u8 []` reasoning as gUnknown_084873BC
 * above -- the ROM shows 8-byte records of {THUMB fn ptr, u32 flags}
 * (0848721C = {0800494D, 00020000}, {08034F7D, 00020000}, {0, 001E0019},
 * {080116A1, 00180000}), which is the same record shape as the 0858xxxx blobs
 * below, but nothing matched indexes it yet. Wave 14. */
extern const u8 gUnknown_0848721C[];
/* Two proc scripts started as a pair -- sub_08011550/sub_080115E0 run 0848923C
 * and sub_0801156C/sub_080115F8 run 0848925C, in both cases stashing a u16 at
 * +0x64 of the new proc. Three more pairs do the same thing and additionally
 * set gUnknown_030030E0.bits.effect: sub_08011588/sub_080115B4 (Proc_Start on
 * tree 3) and sub_08011610/sub_0801163C (Proc_StartBlocking). */
extern const struct ProcCmd gUnknown_0848923C[];
extern const struct ProcCmd gUnknown_0848925C[];
/* A proc script with the ordinary start/stop pair: sub_080111C8 hands it to
 * Proc_Start and sub_08011218 to Proc_EndEach. 0x20 bytes in the split, i.e.
 * four ProcCmds. */
extern const struct ProcCmd gUnknown_0848927C[];
/* A second such pair, with four starters between them. Started on tree 3
 * without the blend write by sub_08011668 (0848929C) and sub_08011684
 * (084892C4), and via Proc_StartBlocking by sub_08013098 (0848929C) and
 * sub_080130B0 (084892C4); all four stash a u16 at +0x64 of the new proc,
 * exactly as 0848923C/0848925C do. */
extern const struct ProcCmd gUnknown_0848929C[];
extern const struct ProcCmd gUnknown_084892C4[];
/* The proc script sub_08013338 runs -- Proc_StartBlocking when its ProcPtr
 * argument is non-NULL and Proc_Start on tree 3 otherwise, per the
 * sub_08013338 note in unknown-functions.h -- and sub_08013378 stops with
 * Proc_EndEach. 0x160 bytes, i.e. 44 ProcCmds. */
extern const struct ProcCmd gUnknown_084893AC[];
/* A proc script: sub_08014BC0 and sub_08014C74 both hand it to Proc_Start. */
/* Two more gUnknown_03001470 script blobs of the gUnknown_0849A108 shape --
 * 8-byte records of (odd THUMB function pointer, u16, u16), NOT the
 * {opcode, dataImm, dataPtr} of struct ProcCmd, whose blobs put the small
 * opcode word FIRST (compare 0x086140D4). `const u8 []` on the same reasoning
 * as gUnknown_0849A108: sub_080152EC takes `const void *` and nothing in the
 * tree dereferences either symbol. 0x20 and 0xbb8 bytes; sub_08014668 starts
 * the first and its byte-identical twin sub_080146D4 the second, which is the
 * only thing that tells the two apart (wave 21, W21-A). */
extern const u8 gUnknown_08489548[];
extern const u8 gUnknown_08489568[];
extern const struct ProcCmd gUnknown_0848A140[];
/* A proc script: sub_08045F80 hands it to Proc_Start on tree 3. */
extern const struct ProcCmd gUnknown_0848A150[];
/* A gUnknown_0200C528 list script, same shape as gUnknown_0849A8F0: its two
 * users hand its ADDRESS around -- sub_08019818 to sub_080193B0 (which stores
 * it into the slot's .unk00/.unk04) and sub_08019850 to sub_08019290, the
 * lookup that reports -1 when no slot holds it. Nothing indexes or
 * dereferences it, so `const u8 []` is the weakest model that gives the clean
 * pool word and it agrees with both consumers' `const u8 *` parameter. */
extern const u8 gUnknown_0848A3EC[];
/* A gUnknown_03001470 slot script, 0x20 bytes. Same start/stop pairing that
 * types gUnknown_0849D41C and gUnknown_08580C7C: sub_08019F90 is
 * `sub_080152EC(0848A42C, 0)` and sub_0801A168 is `sub_0801537C(0848A42C)`.
 * The other four references are sub_08019D0C (sub_08015BD0), sub_08019E68 and
 * sub_0801A614 and sub_0802D33C (all sub_080637AC) -- six in all, every one of
 * them handing the ADDRESS to a consumer that takes
 * it as an opaque pointer; nothing indexes or dereferences it, so `const u8 []`
 * is the weakest model that reproduces the clean pool word. */
extern const u8 gUnknown_0848A42C[];
/* A proc script found rather than started: sub_0801BFFC falls back to
 * Proc_Find(0848B418) when handed a NULL proc, then stores two words at
 * +0x2c/+0x30 of it. */
extern const struct ProcCmd gUnknown_0848B418[];
/* A proc script; sub_0801C7B4 is the predicate "is it running", i.e.
 * Proc_Find(0848B5AC) != NULL. */
extern const struct ProcCmd gUnknown_0848B5AC[];
extern u16 *gUnknown_08499578;
extern u16 *gUnknown_0849957C;
/* A 0/1 mode flag for the gUnknown_08580DD8 slot script, and the exact twin of
 * gUnknown_0202F2C8 below (same flag, same script pairing, different
 * subsystem). Every one of its six accesses in the whole ROM is a bare
 * `ldrb`/`strb` at displacement ZERO -- so this is a scalar and not an
 * aggregate, by the clean-pool-word rule in docs/agbcc-codegen.md, and the
 * neighbouring gUnknown_0202F204 is a separate object rather than a member.
 * Only 0 and 1 are ever stored (sub_080670A0 and sub_080670BC respectively,
 * each immediately before `sub_080152EC(gUnknown_08580DD8, 2)`), and readers
 * test it `== 0` / `== 1`. Nothing sign-extends it, so `u8` is the weakest
 * model and the signedness is unproved. */
extern u8 gUnknown_0202F200;
/* A u8 ticket counter: sub_0806A054 post-increments it and feeds the OLD value
 * to sub_080674F4. `ldrb`/`strb` and nothing wider. */
extern u8 gUnknown_0202F204;
/* Another blob reached only by address, handed to sub_080670F8 by
 * sub_0806A054. `const u8 []` is the weakest model that gives the clean pool
 * word, as for the gUnknown_0849A8F0 family. */
extern const u8 gUnknown_085814A8[];
extern u16 *gUnknown_08499580;
/* Not globals: two `-fforce-addr` address-constant words in code-0801D390.s's
 * pool block, holding &gUnknown_08499580 and &gUnknown_085D5ABC. The block
 * 0x0809099C-0x080909B4 is seven consecutive fan-in-1 address words with
 * &gUnknown_08499590 in four of them, bracketed by ordinary data -- the case
 * already worked in docs/agbcc-codegen.md, and the reason the screen for this
 * class must say "a value that looks like an address" rather than "a RAM
 * value". Declared as pointers to what they point AT so that
 * `pp = &gUnknown_080909A8` supplies the level force-addr invented;
 * sub_08022618 needs `**pp` at all four of its read sites and `(*pp2)[i]` at
 * both of its. */
extern u16 **const gUnknown_080909A8;
extern const struct Unk085D5ABC *const gUnknown_080909AC;
/* Two more of the same class, from the 0x08091350-0x0809138C block (fifteen
 * consecutive fan-in-1 address words: 0x03003FC0, 0x030040D8 x4, 0x03003100,
 * 0x085D5ABC, 0x08499598 x2 ...). gUnknown_08091364 holds &gUnknown_030040D8
 * and gUnknown_08091368 holds &gUnknown_085D5ABC. The first is typed
 * `struct Unk08499594 **` rather than `struct Unk030040D8 **` because
 * sub_08042998 reads the SAME three bitfield offsets (unk04/unk05/unk06)
 * off both it and gUnknown_08499594[i] -- the merge that the note on
 * struct Unk030040D8 says is blocked only by c_080424BC.c's spelling of the
 * global itself, which this separate symbol does not touch. */
extern struct Unk08499594 **const gUnknown_08091364;
extern const struct Unk085D5ABC *const gUnknown_08091368;
/* A fourth 0x400-entry tilemap buffer alongside 08499578/7C/80. NOT const:
 * sub_080616F0 re-`ldr`s it on every iteration of its clear loop. */
extern u16 *gUnknown_08499584;
/* The 0x08068AC4 / 0x080688E4 screen-setup blobs. 0817DA18 is a u16 palette
 * (two ApplyPaletteExt calls, BG palette 1 and OBJ palette 0, 0x20 bytes
 * each); 0817C408 and 0817DA38/0817E208 are Decompress sources; 0817D874 is
 * handed to sub_080718F8 as its second argument; 085813D4 goes to
 * sub_08012C58(void *). Non-const throughout because Decompress takes a plain
 * `u8 *`. */
extern u16 gUnknown_0817DA18[];
extern u8 gUnknown_0817C408[];
extern u8 gUnknown_0817D874[];
extern u8 gUnknown_0817DA38[];
extern u8 gUnknown_0817E208[];
extern u8 gUnknown_085813D4[];
/* +0x04 and +0x06 are a SIGNED coordinate pair, and they are reached both ways:
 * sub_0802723C and sub_08027278 read each half as an s16 OBJECT
 * (`movs r3,#4; ldrsh r1,[r2,r3]` -- ldrsh has no immediate-offset form, hence
 * the scratch), while sub_0802C480 compares +0x04 as a whole WORD against a
 * snapshot and then re-reads the same two halves as u16 with an (s16) cast
 * (`ldrh; lsls #16; asrs #16`). That is the same word/halfword duality
 * union Unk802C57CBuf models elsewhere; nothing needs the union here because
 * every access goes through a cast off the u8 * base. */
/* Two ROM slots that both hold &gUnknown_08499590 -- checked against the ROM
 * image. sub_080081E0 and its twin sub_080083E0 are the same 512 bytes apart
 * from which of the two they name, and wave 18 (W18-B) upgraded that from a
 * resemblance to a proof: the two functions' normalised assembly differs in
 * EXACTLY ONE slot, the pool symbol, and a single generated draft compiled
 * against either word scores identically at every one of ~20 spellings.  The
 * source is the same source.
 *
 * CORRECTION (wave 18): the note that used to sit here read 0x0808D800 and
 * 0x0808D804 holding &gUnknown_0200B0B0 as showing "a table of screen handles
 * and not one object".  That is wrong.  Those two are pool words like these,
 * belonging to sub_080085E0 and sub_08008928, which force-addr a different
 * symbol -- the whole 0x0808D6DC..0x0808D8A8 block is one unit's `.LC` pool
 * with one word per (function, symbol) pair, so neighbouring words holding
 * different addresses is the NORMAL case and says nothing about a table.  See
 * the block note below.
 *
 * `u8 **const`, and the const is PROVED rather than assumed: sub_080081E0
 * keeps the outer value in r8 across a `bl sub_080015E4` and re-derefs it
 * afterwards, which a non-const global could not survive -- while the INNER
 * read (gUnknown_08499590 itself) is reloaded after every call, which is why
 * the const sits on the outer pointer only. */
extern u8 **const gUnknown_0808D7F8;
extern u8 **const gUnknown_0808D7FC;
/* NOT globals -- these four are agbcc's own `-fforce-addr` address-constant
 * words (`.LC` pool), and the ROM image proves it: 0x0808D7EC..0x0808D874 is a
 * run of THIRTY consecutive 4-byte symbols, every one holding the identical
 * value 0x08499590, i.e. &gUnknown_08499590.  One word per (function, symbol)
 * pair is exactly what GCC emits; a table of distinct globals is not.  They are
 * declared here only so a matching source can name the word whose relocation
 * the ROM carries -- see the `.rodata` reroute section of docs/agbcc-codegen.md
 * and the c_local recipe, which is what every user below writes.
 *
 * Wave 18 (W18-B) measured the whole block rather than this sub-run, and it is
 * bigger and more regular than the paragraph above implies.  The pool is
 * 0x0808D6DC..0x0808D8A8, 116 slots, ONE translation unit's; 103 of them are
 * referenced from asm/, NO slot is referenced by two functions, and the map
 * from slot to owning function is STRICTLY MONOTONIC in function address with
 * zero inversions, from sub_08000694 through sub_08010DD4.  A function with N
 * distinct force-addr'd symbols owns N CONSECUTIVE slots.  0x0808D8AC is
 * referenced by three functions, so it is a real global and marks the end --
 * shared ownership is the boundary test, because a `.LC` word is never shared.
 * The practical consequence: the pool word belonging to any unmatched function
 * in code.s can be read off by interpolating between its address-order
 * neighbours, before any C is written.  The thirty-slot run named above is just
 * the stretch whose functions all touch the map descriptor.
 *
 * `u8 **const` on the same evidence as gUnknown_0808D7F8: the OUTER value
 * survives a `bl` (sub_0800AA30's case 1 keeps it in r8 across two calls) while
 * the inner read of gUnknown_08499590 is reloaded after every call. */
extern u8 **const gUnknown_0808D81C;   /* sub_0800977C */
extern u8 **const gUnknown_0808D83C;   /* sub_0800A3D4 */
extern u8 **const gUnknown_0808D854;   /* sub_0800AA30 */
extern u8 **const gUnknown_0808D86C;   /* sub_0800BF78 */
/* Three more owners of the same block, identified in wave 20 (W20-B) by the
 * address-order interpolation the note above describes: 0x0808D88C is
 * sub_0800CFDC's, 0x0808D890 sub_0800E8CC's, 0x0808D898 sub_0800F8D4's, and all
 * three hold 0x08499590. They are NOT declared here, and that is the finding:
 * writing `gUnknown_08499590` honestly reproduces the ROM's three-level
 * `ldr rN,=<word>; ldr r0,[rN]; ldr r1,[r0]` exactly -- agbcc's own
 * -fforce-addr copy supplies the middle level. Declaring the pool word as
 * `u8 **const` and dereferencing it instead adds a FOURTH level and is wrong.
 * Measured on sub_0800F8D4, wave 20; see docs/agbcc-codegen.md. */
/* A THIRD array besides the +0x0A22 u16 tiles and the +0x417A u16 rowOffset[]:
 * a plain BYTE array reached as `*(base + rowOffset[y] + K)`, with the row
 * offset used unscaled rather than doubled the way sub_08001158 scales it for
 * the tiles. The five predicates at 0x08045848-0x080458F8 read it at
 * K = 0x1432/0x1435/0x1438/0x143f/0x1441 off rowOffset[2], [5], [8] and [9]
 * (+0x417e/+0x4184/+0x418a/+0x418c), and each tests the top three bits of the
 * byte (`ldrb; lsrs #5`) for the value 1 -- so the array holds a small
 * per-cell field packed at bits 5-7. Base and extent are not pinned: nothing
 * yet indexes it with a variable column, so only these five constants are
 * evidence and the K values are absolute byte offsets, not an array base plus
 * a column. */
/* Wave 15 (C) adds four more parallel per-cell arrays, all indexed by exactly
 * the same `rowOffset[y] + x` the c_08001158.c idiom builds, which is what
 * fixes them as views of one grid rather than unrelated blobs:
 *   +0x0012  u8   sub_08058A2C hands it to sub_08026FD0 alongside the +0x1432
 *                 terrain byte, so it is the other half of that predicate's key
 *   +0x051A  u8   a unit id, 1-based: sub_08022618 and sub_08042998 both use it
 *                 to index gUnknown_08499594[] and both treat 0 as "empty"
 *   +0x193A  s8   `ldrsb`, and -1 is the sentinel (sub_08058A2C)
 *   +0x234A  u8   a second flag plane beside +0x051A; sub_08022618 requires
 *                 BOTH non-zero before it will draw the cell
 * and two viewport members that are not per-cell:
 *   +0x000C  u16  camera column, subtracted from x before `& 0xF`
 *   +0x000E  u16  camera row, likewise (sub_08022618)
 * The +0x02 height is now corroborated a second way: sub_08022618 rejects
 * `y >= *(u16 *)(p + 2)` with an UNSIGNED `blo`. */
extern u8 *gUnknown_08499590;
/* Grouped 64 entries to a group and 1-based within the group: sub_08025308
 * counts the live `unk00` of `g[(a - 1) * 64 + i]` for i = 1..50, so a group is
 * 64 * 0x0c = 768 bytes (the `(a*2 + a) << 8` in the prologue) and 50 of the 64
 * slots are in use. */
extern struct Unk08499594 *gUnknown_08499594;
extern struct Unk08499598 *gUnknown_08499598;
/* Pointer to a 0x400-byte RAM buffer; sub_080215D0 copies gUnknown_080C1BC4
 * over all of it byte by byte. The deref is hoisted out of that loop despite
 * the `strb`, so the source bound it to a local. */
extern u8 *gUnknown_0849959C;
extern struct Unk084995A0 *gUnknown_084995A0;
/* ROM byte table indexed by a u8 read out of a caller-supplied pointer;
 * sub_08042084 returns whether the entry is non-zero. The address is odd, so
 * this is a plain byte array and not an aggregate. const is safe here: no
 * prototype in unknown-functions.h takes it. */
extern const u8 gUnknown_084995C1[];
/* The per-army base UNIT ID, indexed by the 1-based army number in
 * gUnknown_030033EC. sub_080257C0's only reader hands the element straight to
 * sub_08026FD0, whose first parameter is s16 and whose body is `a >> 6` -- and
 * gUnknown_08499594 is grouped 64 entries to an army, so `>> 6` recovers the
 * army from the id. The ROM bears that out: the first five halfwords are
 * 0x0000, 0x0000, 0x0040, 0x0080, 0x00C0, i.e. slot 0 unused and slots 1..4
 * holding 0, 64, 128, 192.
 * The element type is READ as s16 (`movs r1,#0; ldrsh r0,[r0,r1]`), but that
 * is forced by sub_08026FD0's s16 parameter and would be the same bytes for a
 * u16 array, so the signedness is not pinned; every stored value is positive.
 * `const` is safe -- the one consumer takes it by value. */
extern const s16 gUnknown_084995FE[];
/* A tree-3 proc script pair: sub_08027278 starts 08499CFC and sub_0802723C
 * starts 08499D2C, with identical bodies that differ only in the script and in
 * the constant stashed at +0x54 (0 and 2). sub_0802759C reports whether an
 * 08499CFC proc is live. */
extern const struct ProcCmd gUnknown_08499CFC[];
extern const struct ProcCmd gUnknown_08499D2C[];
extern void *gUnknown_08499E38[];
/* A proc script: sub_08028848 hands it to Proc_Start on tree 3 and stashes two
 * u16 arguments at +0x64 and +0x66 of the new proc. */
extern const struct ProcCmd gUnknown_08499FAC[];
/* A proc script: sub_08028ED0 is its sole user and hands it to
 * Proc_StartBlocking. */
extern const struct ProcCmd gUnknown_08499FEC[];
/* ROM blob handed to sub_080152EC by sub_08042B70 and sub_08042B84, which is
 * the same slot the routine stores in gUnknown_03001470[i].unk04 (a
 * `const void *`). Nothing indexes it, so `const u8 []` is the weakest model
 * that reproduces the clean pool word; widen it when the consumer is matched. */
extern const u8 gUnknown_0849A0F0[];
/* The same slot as gUnknown_0849A0F0, and the pairing is what proves it: every
 * one of these is named exactly twice in the ROM, once by a wrapper that hands
 * its ADDRESS to sub_080152C0/sub_080152EC and once by a wrapper that hands the
 * same address to sub_0801537C, which scans gUnknown_03001470[] for the slot
 * whose .unk00 equals it and stops that slot. Start/stop pairs:
 *
 *   0849A108  sub_0802A514 (sub_080152C0, arg 1) <-> sub_0802A528
 *   0849D41C  sub_08037610 (sub_080152EC, arg 0) <-> sub_08037628
 *   0849D55C  sub_08037F58 (sub_080152C0, arg 0) <-> sub_08037F70
 *   0849E6D4  sub_0803B240 (sub_080152C0)        <-> sub_0803B254
 *   084C2198  sub_080470F8 (sub_080152EC)        <-> sub_080470E8
 *   0849E670  sub_0803B16C (sub_08015BD0 slot)   <-> sub_0803B15C
 *   0849E700  sub_0803B2BC (a long builder)      <-> sub_0803B33C
 *
 * Sizes from the split: 0x20, 0x18, 0x10, 0x24, 0x30, 0x34, 0x10 -- all word
 * multiples but NOT a common stride, so these are individual blobs and not
 * entries of one table. `const u8 []` for the same reason gUnknown_0849A0F0 is:
 * it is the weakest model that reproduces the clean pool word, nothing matched
 * indexes or dereferences any of them, and both consumers take them as opaque
 * pointers (sub_080152EC and sub_0801537C are both `const void *`). Widen when
 * a consumer is matched. */
extern const u8 gUnknown_0849A108[];
extern const struct Unk0849A2C8 gUnknown_0849A2C8[];
extern const struct Unk0849A354 gUnknown_0849A354[];
/* More ROM blobs handed to sub_080152EC with a 0 second argument, the same slot
 * as gUnknown_0849A0F0 -- one trivial wrapper each (sub_0802BF80, sub_0802BF94,
 * sub_0802BFA8, sub_0802BFBC, sub_0802C130). `const` because sub_080152EC's
 * prototype takes `const void *`; `u8 []` because nothing indexes or
 * dereferences them, so it is the weakest model that gives the clean pool word.
 */
extern const u8 gUnknown_0849A3C0[];
extern const u8 gUnknown_0849A3F0[];
extern const u8 gUnknown_0849A428[];
extern const u8 gUnknown_0849A450[];
extern const u8 gUnknown_0849A4A0[];
/* Three more scripts for the gUnknown_0200C528 list system, exactly the
 * gUnknown_0849A8F0 shape below: each has a one-line wrapper handing its
 * ADDRESS to sub_080193B0 (0849A520 -> sub_0802C144, 0849A5E0 -> sub_0802C1B0,
 * 0849A6B0 -> sub_0802C1C0). Same `const u8 []` reasoning. */
extern const u8 gUnknown_0849A520[];
extern const u8 gUnknown_0849A5E0[];
extern const u8 gUnknown_0849A6B0[];
/* A script for the gUnknown_0200C528 list system, not a proc script: its three
 * users hand its ADDRESS around (sub_0802C280 -> sub_080193B0, which stores it
 * into gUnknown_0200C528[i].unk00 and .unk04; sub_0802C290 -> sub_0801930C),
 * and sub_0802C2A0 returns whether its pointer argument equals it. Nothing has
 * indexed or dereferenced it, so `const u8 []` is the weakest model that gives
 * the clean pool word; widen it when sub_080193B0 is matched. */
extern const u8 gUnknown_0849A8F0[];
/* A ROM blob handed to sub_080152EC as its `const void *` first argument by
 * sub_0802C2B4, which does nothing else with it -- exactly the
 * gUnknown_0849A4A0 / gUnknown_0849A0F0 slot. `const u8 []` is the weakest
 * model that gives the clean pool word. */
extern const u8 gUnknown_0849A990[];
/* Four ROM blobs in the same slot, each named by exactly ONE function in asm/
 * and each handed straight to sub_08019F2C or sub_0801A104 as a `const void *`
 * that neither dereferences. `const u8 []` on the gUnknown_0849A0F0 reasoning.
 * They pair off by caller: sub_0802D458/sub_0802D558 take AAC0/AE28 through
 * sub_0801A104, sub_0802D4B0/sub_0802D504 take AC60/ABC0 through sub_08019F2C,
 * and each pair is a byte-identical duplicate whose ONLY difference is which
 * of the two it names (wave 21, W21-A). */
/* A proc script: sub_0802CD28 hands it to Proc_Start on tree 3 and writes no
 * field of the proc it returns. `const struct ProcCmd []` is what proc.h's
 * Proc_Start takes. */
extern const struct ProcCmd gUnknown_0849AA68[];
extern const u8 gUnknown_0849AAC0[];
extern const u8 gUnknown_0849ABC0[];
extern const u8 gUnknown_0849AC60[];
/* A ROM blob handed to sub_080152EC with the literal 0 second argument by
 * sub_0802CD78, which does nothing else with it -- the gUnknown_0849A0F0 slot.
 * `const u8 []` is the weakest model that gives the clean pool word. */
extern const u8 gUnknown_0849ADD0[];
extern const u8 gUnknown_0849AE28[];
extern struct Unk0849B018 *gUnknown_0849B018;
extern struct Unk0849B01C *gUnknown_0849B01C;
extern struct Unk0849B060 *gUnknown_0849B060;
/* Proc scripts, all only ever handed to Proc_Start/Proc_StartBlocking:
 *   0849B3CC  sub_080342DC, blocking, parent forwarded
 *   0849B8B8  sub_08034308, blocking, parent forwarded
 *   0849BB50  sub_080338C0, Proc_Find, stashes a word at +0x38
 *   0849BC98  sub_0803433C, parent forwarded
 *   0849D56C  sub_08037F80, tree 3
 *   0849D77C  sub_08039634, tree 3, stashes words at +0x54/+0x58
 *   0849D7FC  sub_08039930, parent forwarded, stashes a word at +0x54
 *   0849D82C  sub_08039BB4, tree 3, stashes bytes at +0x29/+0x2a and a
 *             halfword at +0x2c
 *   0849E728  sub_0803B55C, tree 3, stashes a HALFWORD at +0x64
 *   0849E778  sub_0803B6E8, tree 3, stashes a word at +0x54
 *   0849E7A0  sub_0803B774, tree 3
 *   0849E7B8  sub_0803B788, tree 3
 *   0849EAAC  sub_0803B9EC, tree 3
 *   0849EBBC  sub_0803BADC, tree 3, after gUnknown_03003FC0.unk01 = 1
 *   0849EC1C  sub_0803BA00, tree 3, after gUnknown_03003FC0.unk01 = 2
 *   0849ECE0  sub_0803B8C4, tree 3, after gUnknown_03003FC0.unk01 = 3
 *   0849F5D0  sub_0803D960, blocking, stashes 6 at +0x64
 *   0849F888  sub_0803F2B8, blocking, parent forwarded (4th param), stashes
 *             words at +0x2c/+0x30/+0x4c
 *   0849F918  sub_0803F3E4, parent forwarded (3rd param), stashes words at
 *             +0x2c/+0x30 */
extern const struct ProcCmd gUnknown_0849B3CC[];
/*   0849B284  sub_08031418, parent forwarded, stashes 0 at +0x58
 *   0849B2A4  sub_08031E44, parent forwarded, stashes 100/100/72 at
 *             +0x68/+0x64/+0x66
 *   0849B62C  sub_08032454 starts it (parent forwarded) and sub_08032468
 *             Proc_EndEach's it
 *   0849B6B0  sub_08032D4C, parent forwarded, no payload
 *   0849BB28  sub_080337D8, blocking, parent forwarded (3rd param), stashes
 *             words at +0x20/+0x24 -- see c_080337D8.c, the object is NOT a
 *             Proc */
extern const struct ProcCmd gUnknown_0849B284[];
/*   0849B294  and 0849B304 are the odd two out of this group: each is named
 *             exactly ONCE in the whole ROM, by its Proc_EndEach wrapper
 *             (sub_08031CE4 and sub_080320F4). Nothing starts them, so
 *             `const struct ProcCmd []` here comes from Proc_EndEach's
 *             prototype and from the sizes being ProcCmd multiples (0x10 = 2
 *             cmds, 0xC8 = 25 cmds), not from a matching Proc_Start. */
extern const struct ProcCmd gUnknown_0849B294[];
extern const struct ProcCmd gUnknown_0849B2A4[];
extern const struct ProcCmd gUnknown_0849B304[];
extern const struct ProcCmd gUnknown_0849B62C[];
extern const struct ProcCmd gUnknown_0849B6B0[];
extern const struct ProcCmd gUnknown_0849B8B8[];
extern const struct ProcCmd gUnknown_0849BB28[];
extern const struct ProcCmd gUnknown_0849BB50[];
extern const struct ProcCmd gUnknown_0849BC98[];
extern const struct Unk0849CD88 gUnknown_0849CD88[];
/* A proc script, only ever handed to Proc_Find: sub_0803710C is the whole of
 * `return Proc_Find(gUnknown_0849D3BC) != 0;`. */
extern const struct ProcCmd gUnknown_0849D3BC[];
/* Two more gUnknown_03001470 script blobs -- see the gUnknown_0849A108 comment
 * above for the start/stop pairing that types them. */
extern const u8 gUnknown_0849D41C[];
extern const u8 gUnknown_0849D55C[];
extern const struct ProcCmd gUnknown_0849D56C[];
extern struct Unk0849D5F8 *gUnknown_0849D5F8;
/* A proc script: sub_08039674 hands it to Proc_Start, and it is stopped rather
 * than ended -- sub_080396F4 and sub_08039750 both Proc_BreakEach it, so the
 * script blocks somewhere and the pair is break/resume rather than start/end.
 * 0x5C bytes, i.e. 11 ProcCmds. */
extern const struct ProcCmd gUnknown_0849D6D4[];
extern const struct ProcCmd gUnknown_0849D77C[];
extern const struct ProcCmd gUnknown_0849D7FC[];
extern const struct ProcCmd gUnknown_0849D82C[];
/* Another gUnknown_03001470 script blob: sub_0803ACB8 hands it to
 * sub_080152EC(script, 0) and sub_0803ACD0 is the matching
 * `sub_08015BD0(script) != -1` liveness predicate. */
extern const u8 gUnknown_0849E600[];
/* A proc script -- sub_0803B9D4 hands it to Proc_Start(script, PROC_TREE_3)
 * after sub_08044BB0. ProcCmd shape is visible in the ROM: the first word is
 * 0x00010006 (opcode 6 = PROC_CMD_START_CHILD_BLOCKING, imm 1) with
 * 0x08616DFC as its dataPtr, so this really is `struct ProcCmd []` and not one
 * of the 03001470 blobs either side of it. Wave 14. */
extern const struct ProcCmd gUnknown_0849EA94[];
/* Three more gUnknown_03001470 script blobs -- see the gUnknown_0849A108
 * comment above. Note 0849E670/0849E6D4/0849E700 sit interleaved with the
 * PROC scripts either side of them (0849E728 below is a real proc script), so
 * address adjacency is not evidence of kind here; the consumer is. */
extern const u8 gUnknown_0849E670[];
extern const u8 gUnknown_0849E6D4[];
extern const u8 gUnknown_0849E700[];
/* A gUnknown_03001470 script blob, not a proc script, and the consumer is what
 * says so: sub_0803B83C hands it to sub_0801537C, whose parameter is already
 * `const void *` -- the same reader as the three blobs above. 0x18 bytes. Its
 * only other reference is sub_08031480. `const u8 []` takes the `const void *`
 * with no cast; a plain `void *` would discard the const and -Werror turns that
 * into an error. Wave 24. */
extern const u8 gUnknown_0849B048[];
/* Two proc scripts, both handed straight to Proc_Start on tree 3 and nothing
 * else -- gUnknown_0849E7F8 by sub_0803B83C (right after the blob above) and
 * gUnknown_0849EC8C by sub_0803B858. 0x20 and 0x50 bytes, i.e. four and ten
 * ProcCmd entries at the 8-byte stride. Wave 24. */
extern const struct ProcCmd gUnknown_0849E7F8[];
extern const struct ProcCmd gUnknown_0849EC8C[];
extern const struct ProcCmd gUnknown_0849E728[];
/* A proc script, only ever handed to Proc_Find: sub_0803B628 is the whole of
 * `return Proc_Find(gUnknown_0849E750) != 0;`. */
extern const struct ProcCmd gUnknown_0849E750[];
extern const struct ProcCmd gUnknown_0849E778[];
extern const struct ProcCmd gUnknown_0849E7A0[];
extern const struct ProcCmd gUnknown_0849E7B8[];
/* A proc script: sub_0803B7B4 hands it to Proc_Start on tree 3, but only when
 * gUnknown_030005CA still holds its 0xFFFF "unset" value. */
extern const struct ProcCmd gUnknown_0849E7D8[];
extern const struct ProcCmd gUnknown_0849EAAC[];
extern const struct ProcCmd gUnknown_0849EBBC[];
extern const struct ProcCmd gUnknown_0849EC1C[];
extern struct Unk0849ECDC *gUnknown_0849ECDC;
extern const struct ProcCmd gUnknown_0849ECE0[];
/* The fallback name string sub_0803CCEC hands out in place of
 * &gUnknown_020280C0[i].unk02 when that slot's unk13 is 0xff (empty). Same
 * shape as the array member it substitutes for, hence u8 [] and not const --
 * one function returns either of the two through one return type. */
extern u8 gUnknown_0849F320[];
/* A proc script: sub_0803D75C hands it to Proc_Start on tree 3 (writing +0x64
 * u16 and +0x4c word of the new proc) and sub_0803D770 is the matching
 * `return Proc_Find(script) != 0;` existence predicate. */
extern const struct ProcCmd gUnknown_0849F330[];
extern const struct ProcCmd gUnknown_0849F5D0[];
extern const struct ProcCmd gUnknown_0849F888[];
extern const struct ProcCmd gUnknown_0849F918[];
extern const struct ProcCmd gUnknown_0849FB44[];
/* A proc script: sub_08042C10 hands it to Proc_Start on tree 3. */
extern const struct ProcCmd gUnknown_0849FC0C[];
/* A proc script: sub_08041180 hands it to Proc_Find and writes +0x40 (u16) of
 * the proc it returns. */
extern const struct ProcCmd gUnknown_0849FD44[];
/* A proc script: sub_080411D0 hands it to Proc_StartBlocking under its own
 * parameter as parent, then widens two of that parameter's bytes (+0x48/+0x49)
 * into halfwords at +0x4c/+0x4e of the new proc. */
extern const struct ProcCmd gUnknown_0849FE34[];
/* Two proc scripts, each only ever handed to Proc_Find: sub_0802C550 is
 * `Proc_Find(FEF8) || Proc_Find(FFB0)`, the two-script variant of the bare
 * existence predicate gUnknown_0849D3BC and gUnknown_0849E750 carry. `const
 * struct ProcCmd []` is what proc.h's Proc_Find takes. */
extern const struct ProcCmd gUnknown_0849FEF8[];
extern const struct ProcCmd gUnknown_0849FFB0[];
/* Named proc scripts reached from this file. Declared non-const to agree with
 * the existing declaration in src/title-screen.c. */
extern struct ProcCmd ProcScr_MainMenu[];
extern const struct Unk084A06F0 gUnknown_084A06F0[];
extern const struct ProcCmd gUnknown_084A07E8[];
/* A proc script: sub_080443D8 hands it to Proc_StartBlocking. */
extern const struct ProcCmd gUnknown_084A0818[];
/* A proc script started blocking by sub_08044A88 and sub_08044AA0, which
 * then write 0x50 and 0x28 to a halfword at +0x64 of the new proc. */
extern const struct ProcCmd gUnknown_084A0858[];
/* A proc script: sub_08045F40 hands it to Proc_Start on tree 3. */
extern const struct ProcCmd gUnknown_084B7628[];
/* A proc script started blocking by sub_08045448 and sub_08045460, which then
 * write 1 and 2 respectively to a word at +0x54 of the new proc. */
extern const struct ProcCmd gUnknown_084A09CC[];
/* A proc script started on tree 3 by sub_080452C0, which then stashes two
 * words at +0x3c/+0x40 and a byte at +0x2c of the new proc. */
extern const struct ProcCmd gUnknown_084A096C[];
/* The script sub_08044D70 forwards to Proc_Start; all five of its wrappers at
 * 0x08044C44-0x08044D34 pass this one and differ only in the blob, the palette
 * and four small integers. Confirmed a script by its ROM bytes: opcode 0x0e
 * (SLEEP) then CALL/REPEAT pairs pointing at 0x08045359/0x080453B1/0x080453CD/
 * 0x0804542D. */
extern const struct ProcCmd gUnknown_084A0994[];
/* A proc script: sub_08045790 hands it to Proc_Start on tree 3. */
extern const struct ProcCmd gUnknown_084A0A3C[];
extern struct Unk084C1430 *gUnknown_084C1430;
/* ROM blobs handed to sub_080152EC, the same slot as gUnknown_0849A0F0.
 * 084C3D6C is the only one started on tree 1 rather than 0. */
extern const u8 gUnknown_084C1824[];
/* Another gUnknown_03001470 script blob, and the neatest instance of the
 * pairing: sub_080470F8 hands it to sub_080152EC and sub_080470E8 hands the
 * same address to sub_0801537C. See the gUnknown_0849A108 comment. */
extern const u8 gUnknown_084C2198[];
extern const u8 gUnknown_084C21C8[];
/* A proc script: sub_08049BD8 hands it to Proc_Start on tree 3. */
extern const struct ProcCmd gUnknown_084C3138[];
extern struct Unk084C3240 *gUnknown_084C3240;
extern const u8 gUnknown_084C325C[];
/* A proc script started blocking by sub_08049F08, which forwards its own
 * second argument as the parent. */
extern const struct ProcCmd gUnknown_084C327C[];
extern const u8 gUnknown_084C3824[];
extern const u8 gUnknown_084C3D6C[];
/* Another gUnknown_03001470 script blob: sub_0804B0CC/sub_0804B10C hand it to
 * sub_080152EC(script, 0) and sub_0804B160 is the matching
 * `sub_08015BD0(script) != -1` liveness predicate. */
extern const u8 gUnknown_084C3D9C[];
/* A gUnknown_0200C528 list script, same shape as gUnknown_0849A8F0: its sole
 * reference in the ROM is sub_0804AE10 handing its ADDRESS to
 * sub_080193B0(const u8 *), whose result that wrapper discards. `const u8 []`
 * is the weakest model that gives the clean pool word. */
extern const u8 gUnknown_084C38BC[];
/* Two ROM pointer pairs indexed by gUnknown_0300453C (0 or 1), each holding
 * the address of a u16 that sub_0804D290/sub_0804DCA8 subtract from an
 * entry's x and y before calling sub_080155C0 -- i.e. the camera/scroll
 * origin for that side. Two entries each and no more: the words are
 * 0x030030A0, 0x0300200C / 0x03001400, 0x03002000, and the next word after
 * 084C3F78's pair is 0x00400010, which is not an address.
 *   Both pointers are read into `u16 *` LOCALS before the call in the source:
 * the ROM materialises both table entries -- one of them into `ip` -- before
 * it computes even the first argument, and only a pair of locals forces that
 * order. Worth 8 bytes and 55 points on sub_0804D290 in combination with the
 * zero-trip loop; see docs/agbcc-codegen.md. */
extern u16 *gUnknown_084C3F70[];
extern u16 *gUnknown_084C3F78[];
/* Two more 0x400-entry u16 tilemap buffers. sub_08054C04 CpuFastSets 0x200
 * words out of gUnknown_08551A04 to 0x06002800, which fixes the extent; the
 * writers sub_0805701C/sub_08057110 store TILEREF-shaped halfwords. */
extern u16 *gUnknown_08551A00;
extern u16 *gUnknown_08551A04;
/* A ROM table of three-halfword rows indexed by gUnknown_0300453C -- the
 * address arithmetic in sub_0804D928/sub_0804E3B4 is `((i*2)+i)*2`, i.e. a
 * stride of exactly 6, and column 0 is read with `ldrh` into
 * OamData.paletteNum. Six is not reachable with a struct: agbcc's
 * STRUCTURE_SIZE_BOUNDARY is 32 bits, so `struct { u16 a, b, c; }` rounds up
 * to 8 and emits `lsl #3`. `u16 t[][3]` and `u16 t[]` indexed `[i*3]` are
 * byte-identical, so the row/flat split is not settled; the row form is used
 * because the two neighbouring columns are clearly part of the same record.
 * Only column 0 has a reader so far. */
extern u16 gUnknown_08551D0C[][3];
/* Two ROM u16 tables indexed by the same 10-bit `(dst->unk04 - oam.tileNum) &
 * 0x3FF` tile delta that sub_0804E8F0/sub_0804FE10 compute. 08552A40 is the
 * guard/selector -- 0xFFFF means "no entry", and the two live values seen so
 * far are 0 and 0x28, each selecting one of the two branches -- and 08552700
 * is the payload handed to sub_0804EA54/sub_0804EAEC as a u16. Extents
 * unproved: the index is masked to 0x3FF but nothing bounds the tables. */
extern u16 gUnknown_08552700[];
extern u16 gUnknown_08552A40[];
/* Six-halfword ROM rows, the row indexed by gUnknown_03001470[i].unk30 (the
 * side) and the column by sub_0804BDD8's u16 result -- `(side*2 + side)*4` for
 * the row and `col*2` for the column, in sub_0804E7A8 and sub_0804FCA4. The
 * value is ADDED to gUnknown_02029A10[side].entries[slot].x, so it is a signed
 * pixel step read through a `ldrh`; nothing sign-extends it, so unsigned is not
 * proved, only that the addition truncates back to 16 bits at the `strh`. */
extern u16 gUnknown_08553B28[][6];
/* Six-halfword ROM rows indexed [side][t], the row scaled `(s*2+s)*4` == 12
 * bytes and the column by a SIGNED 16-bit sum (`lsls #0x10; asrs #0xf`, i.e.
 * `(s16)t * 2` -- one shift pair doing the truncation and the element scale at
 * once). sub_0804C828 / sub_0804CD84 read one element and assign it straight
 * into struct OamData's 4-bit paletteNum, so it is a palette index table
 * (wave 20, W20-C). Read `ldrh`, nothing sign-extends the VALUE, so the table
 * is unsigned; only the index is signed. */
extern u16 gUnknown_08553B40[][6];
/* A ROM table of 28-byte rows, indexed by gUnknown_02029808[i].unk30[j] (wave
 * 17). The stride is `((n*8)-n)*4` in sub_08051DE0/sub_080524C0/sub_0805297C
 * and again in sub_08055058, i.e. exactly 28.
 *   unk00  a byte length: sub_08055058 gates the row on it and passes
 *          `unk00 >> 2` to CpuFastSet as the word count.
 *   unk02  an x offset per gUnknown_0300453C side, and unk06 the matching y --
 *          both are added to gUnknown_02029A10[..].entries[..].x / .y.
 *   unk08  the CpuFastSet SOURCE in sub_08055058 (`ldr` at +8), so a pointer.
 * A STRUCT and not a `u16 [][14]`: unk06 and unk08 are reached with the offset
 * in the load's immediate off `base + n*28`, where the two-dimensional
 * spelling folds the constant into the symbol's own address instead (probed
 * both ways -- two bytes each). Everything past unk08 is unread. */
struct Unk08552D80 /* 0x1c */
{
    /* 0x00 */ u16 unk00;
    /* 0x02 */ u16 unk02[2];
    /* 0x06 */ u16 unk06;
    /* 0x08 */ const void *unk08;
    /* 0x0c */ u8 filler_0c[0x10];
};
extern struct Unk08552D80 gUnknown_08552D80[];
/* NOT globals in the source -- two slots of agbcc's own `-fforce-addr`
 * `.rodata` address-constant pool, both holding &gUnknown_03001470, one per
 * function. The surrounding words are 0x03001FBC, 0x0300453C, 0x0300451C,
 * 0x03004580, 0x02029A10 ... in function address order, which is a `.LC` block
 * by the test in docs/agbcc-codegen.md and not a table of distinct globals.
 * Declared anyway because that is the only spelling that reproduces the ROM's
 * extra `ldr` with a resolvable relocation -- the same workaround
 * gUnknown_08090CD8 already uses. The consequence worth recording: the two
 * functions that name them have IDENTICAL source, and the "twin discriminator"
 * between them is a compiler artefact, not a difference in the C.
 *   The WRAPPER STRUCT is load-bearing and is new in wave 18. docs/agbcc-
 * codegen.md had these two parked on the grounds that the ROM's HOISTED member
 * offset (`adds rB,#0x30; adds rB,rI,rB`) belongs to an array-global subscript
 * and that "a pointer global never hoists, structurally". Both halves are true
 * and the conclusion is not: a pointer to a struct whose MEMBER is the array
 * hoists exactly like an array global, because `p->arr[i].m` is the
 * `gStruct.unk20[i]` row of the fold table -- an aggregate member reached
 * through a pointer, not a plain subscript on one. `struct Unk03001470 *const`
 * with `g[i].m` folds the offset into the load's displacement and cannot reach
 * the ROM; `struct Unk08136090 *const` with `g->unk00[i].m` reproduces it
 * instruction for instruction. Probed side by side against sub_0804E8F0 --
 * six spellings, and this is the only one. */
struct Unk08136090 /* not a real object: see above */
{
    /* 0x00 */ struct Unk03001470 unk00[30];
};
extern struct Unk08136090 *const gUnknown_08136090;
extern struct Unk08136090 *const gUnknown_081360C8;
/* A ROM u16 table of small values (0..3), indexed by
 * `gUnknown_0300453C ^ gUnknown_0300450C` and masked with 3 into
 * OamData.priority -- so it is an OBJ-priority lookup. The first eight entries
 * are 3,2,2,3,3,2,0,0; what follows is signed pixel offsets, so the extent is
 * at most 8 and the array is probably longer than its priority use. */
extern u16 gUnknown_085523A4[];
/* The SAME priority table two rows earlier, and reached through its own linker
 * symbol: sub_0804DCA8 holds a pool word for 0x0855239C and indexes it
 * `(gUnknown_0300453C * 2 + gUnknown_0300450C) * 2`, i.e. a [2]-wide row, where
 * its twin sub_0804D290 uses gUnknown_085523A4 (== 0855239C + 8) with an XOR
 * index. Same eight halfwords 3,2,2,3,3,2,2,3 read two different ways.
 * FLAT, not `[][2]`: the ROM computes `(a * 2 + b) * 2` as one chain, and the
 * two-dimensional spelling scales each index separately (`b*2` then `a*4`),
 * which is four bytes of different code at the same size.
 *   CONFIRMED in wave 17: `gUnknown_0855239C[gUnknown_0300453C * 2 +
 * gUnknown_0300450C]` on the flat declaration is byte-exact in both
 * sub_0804DCA8 and sub_0804FA2C -- neither has any diff in that region. The
 * matching XOR spelling on gUnknown_085523A4 is confirmed the same way by the
 * three F088 members matched in wave 17 (sub_0804D738/sub_0804D818/
 * sub_0804E134), which are byte-for-byte. */
extern u16 gUnknown_0855239C[];
/* A ROM dispatch table of THUMB function pointers, indexed by
 * gUnknown_085D6A48[gUnknown_03004580[i][1]][2]. sub_08050B70 is its only
 * reader and calls the entry through `_call_via_r2` with two arguments in
 * r0/r1 -- and per docs/agbcc-codegen.md the register index on the trampoline
 * IS the arity, so the two-parameter signature is a readout rather than a
 * guess. Both parameters are u16: every reached target (sub_08050D44,
 * sub_08050E08, sub_08051BEC, sub_08052718, sub_08051F4C, sub_08052E04,
 * sub_08052BBC, sub_080523E8) opens `lsls #0x10; lsrs #0x10` on r0 and most on
 * r1 too, and the call site passes two u16 globals with no narrowing.
 * CAVEAT, and it is why the extent is not declared: slots 2 and 3 hold
 * 0x08553648 and 0x08553674, which are EVEN and point back into this same
 * 0x0855xxxx data region, so they are not THUMB code. Either those slots are
 * never reached or the array is heterogeneous; sub_08050B70 cannot tell, and
 * the function-pointer type is right for every slot it does reach. */
extern void (*const gUnknown_085535B0[])(u16, u16);
/* A ROM table of three-word rows, three rows per outer index: sub_0804D290/
 * sub_0804DCA8 compute `(w*9 + q*3 + 2) * 4` off the symbol, which is exactly
 * `[w][q][2]` on a `[][3][3]`. Column 2 holds an odd THUMB function pointer
 * (0x08050365 -> sub_08050364, 0x0804E8F1 -> sub_0804E8F0) that is handed
 * straight to sub_08015928(s16, u32) as a continuation; column 1 is another
 * one and column 0 is a data address, so the row is not uniformly typed and
 * u32 is the honest element type. */
extern u32 gUnknown_08552FB8[][3][3];
/* ROM u16 pair indexed by a 0/1 flag and its complement -- sub_0805741C uses
 * gUnknown_085538AE[a ^ 1] for the BG3 control shadow and [a] for
 * gUnknown_0300251C. The address is halfword- but not word-aligned, so this is
 * a plain u16 array and not an aggregate. */
extern const u16 gUnknown_085538AE[];
/* Two adjacent ROM u16 pairs, each indexed by gUnknown_0300453C: sub_08051BEC
 * uses 08553B10 and sub_08051F4C uses 08553B14, and each binds the element to
 * a local and hands it to sub_080157A4, which takes s16. The value is loaded
 * `ldrh` and sign-extended `lsls #0x10; asrs #0x10` at the call, so the TABLES
 * are unsigned and the conversion belongs to the parameter -- an s16 table
 * read into an s16 local would have been a bare `ldrsh` with no conversion,
 * which is the negative test. The two symbols are 4 bytes apart and are
 * probably one table of pairs; kept separate because that is what the two
 * pool words say. */
extern u16 gUnknown_08553B10[];
extern u16 gUnknown_08553B14[];
extern u32 *gUnknown_08555450[];
extern struct Unk08580934 *gUnknown_08580934;
/* THREE BASES INTO ONE RUN OF ROM HALFWORDS, and they are declared as three
 * arrays because that is what reproduces the ROM. The F092 tick handlers
 * (sub_080646D4, sub_08064FC8, sub_08065118) are byte-identical apart from
 * which of these three symbols they load, and the addresses are contiguous:
 * 0x08580948 + 160*2 == 0x08580A88, and 0x08580A88 + 27*2 == 0x08580ABE. Each
 * is read `t[obj->unk26]` as the vertical offset of a falling/arcing sprite,
 * and the values are plainly SIGNED -- 08580948 runs 0, -4, -6, -7, -7, -5,
 * -1, 3, 10, 18 ... and 08580ABE has -3, -13, -24 -- so `s16` and not the
 * `u16` the `ldrh` suggests. The load is `ldrh` because the sum is stored
 * straight back with `strh` and the sign bits cannot survive the truncation;
 * `s16`, `const s16` and `u16` are byte-identical here, probed all three.
 *
 * NOTE, against the wave-17 brief: 0x08580ABE not being 4-byte aligned does
 * NOT prove these cannot be independent objects. A halfword array needs only
 * 2-byte alignment, so an `s16 []` may legally start there. What the three
 * declarations do buy is the relocation -- each function's pool word names its
 * own symbol -- and that holds whether the source had one table or three. */
extern s16 gUnknown_08580948[];
extern s16 gUnknown_08580A88[];
extern s16 gUnknown_08580ABE[];
/* A gUnknown_03001470 script blob, not a proc script: sub_080670BC hands it to
 * sub_080152EC(script, 2) and sub_080670D8 is the matching
 * `sub_08015BD0(script) != -1` liveness predicate. Same `const u8 []` reasoning
 * as gUnknown_0849A3C0. */
extern const u8 gUnknown_08580DD8[];
/* Four more ROM blobs of the same 8-byte {THUMB fn ptr, u32 flags} record
 * shape, but a DIFFERENT consumer from the 03001470 list: sub_08063A30 stores
 * the pointer at +0x04 of the object in r0 (then zeroes +0x08 and +0x10), and
 * the four wrappers sub_08065F68/sub_08065F78/sub_08066200/sub_08066210 are
 * nothing but that store. So these are NOT proved to be 03001470 blobs --
 * there is no sub_080152EC/sub_0801537C install/remove pair on any of them,
 * which is the only thing that ever proves that, and the wave-13 note on
 * gUnknown_08580C7C is the reason not to assume it from the address. `const
 * u8 []` is the weakest model that gives the clean pool word. Wave 14. */
extern const u8 gUnknown_08580A68[];
extern const u8 gUnknown_08580B18[];
extern const u8 gUnknown_08580C00[];
extern const u8 gUnknown_08580C20[];
/* Proc scripts in the 0x0858xxxx table, each proved by being the sole argument
 * of a Proc_Start/Proc_Find call. `const` because that is what proc.h's
 * prototypes take; they are ROM data and nothing writes them.
 *   08580E94  Proc_Start, sub_080673B0 (fills +0x2c/+0x38/+0x3c)
 *   08580EAC  Proc_Start, sub_080673D0 (fills +0x2c/+0x38/+0x3c)
 *   08580EC4  Proc_Start, sub_080673F0 (fills +0x2c/+0x38/+0x3c)
 *             -- 08580E94/08580EAC/08580EC4 are three consecutive 0x18-byte
 *             scripts with three identical starters, one per variant
 *   08580FE4  Proc_Find,  sub_0806780C (+0x5c)
 *   08580FF4  Proc_Find,  sub_080678BC (+0x60) and sub_080678D4 (+0x3c)
 *   08581014  Proc_Find,  sub_08067A24 (+0x50, u8)
 *   08581068  Proc_Find,  sub_08067C7C (+0x38)
 *   085810E4  Proc_Start, sub_08067DD4 (no fields written)
 *   08581420  Proc_Find,  sub_0806978C/sub_080697A4 (+0x36, u8 = 0/1)
 *   08582AF4  Proc_Start, sub_0806E210 (+0x58) and Proc_Find, sub_0806E228,
 *             both writing +0x58 = arg + 1
 *
 * 08580FE4 is reached twice with different arities: sub_0806780C finds it and
 * writes +0x5c = 1, while sub_080677BC starts it under its own fourth argument
 * and writes +0x2c/+0x30/+0x34/+0x38/+0x58 as well as the same +0x5c = 1.
 */
extern const struct ProcCmd gUnknown_08580E94[];
extern const struct ProcCmd gUnknown_08580EAC[];
extern const struct ProcCmd gUnknown_08580EC4[];
/* ROM table of pointers to SIGNED byte arrays, indexed by a plain int
 * (`lsls #2` on the argument, no `& 0xff`). sub_0806775C stashes one whole
 * element in a proc at +0x2c and its element [0] at +0x30 -- and that read is
 * `movs r1, #0; ldrsb r1, [r2, r1]`, which per docs/agbcc-codegen.md is an s8
 * OBJECT rather than a cast, so the pointee is s8 and not u8. */
extern s8 *gUnknown_08580FC0[];
/* 08580FCC  Proc_Start, sub_0806775C, started under the starter's own second
 *           parameter (r1 is never written before the bl). */
extern const struct ProcCmd gUnknown_08580FCC[];
extern const struct ProcCmd gUnknown_08580FE4[];
extern const struct ProcCmd gUnknown_08580FF4[];
extern const struct ProcCmd gUnknown_08581014[];
extern const struct ProcCmd gUnknown_08581068[];
extern const struct ProcCmd gUnknown_085810E4[];
/* More 0x0858xxxx proc scripts, each the sole script argument of one starter:
 *   08581108  Proc_Find,  sub_0806A4B0 (+0x3d, u8 -- the argument narrows with
 *             `lsl #24; lsr #24` before the bl, which is PROMOTE_MODE on a u8
 *             parameter that has to survive a call, so the parameter really is
 *             u8 here rather than the int a bare strb would leave ambiguous)
 *   08581138  Proc_Start, sub_08068014 (+0x2c/+0x30/+0x34 = args, +0x40 = 0)
 *   08581480  Proc_Start, sub_08069FAC (+0x34/+0x38/+0x3c = args, +0x40 = 0)
 *   08581AC8  Proc_Start(.., PROC_TREE_3), sub_0806C874 (no fields written)
 */
extern const struct ProcCmd gUnknown_08581108[];
/* 0858168C  Proc_Find, sub_0806AAC4 -- the bare existence predicate
 *           `return Proc_Find(script) != 0;`, no proc field touched. */
extern const struct ProcCmd gUnknown_0858168C[];
/* 08581500  the same existence predicate again, sub_0806A474. */
extern const struct ProcCmd gUnknown_08581500[];
extern const struct ProcCmd gUnknown_08581138[];
extern const struct ProcCmd gUnknown_08581420[];
extern const struct ProcCmd gUnknown_08581480[];
extern const struct ProcCmd gUnknown_08581AC8[];
extern const struct ProcCmd gUnknown_08582AF4[];
/* A gUnknown_03001470 script blob, not a proc script: sub_0806E17C hands it to
 * sub_080152EC(script, 2) and sub_0806E198 is the matching
 * `sub_08015BD0(script) != -1` liveness predicate -- the exact pair
 * gUnknown_08580DD8 above forms with sub_080670BC/sub_080670D8. */
extern const u8 gUnknown_08581F7C[];
extern const struct Unk085C77A0 gUnknown_085C77A0[];
extern const s16 gUnknown_08580E64[];
extern const struct Unk085D3DD0 gUnknown_085D3DD0[];
/* NOT const, and this was wrong here until wave 15. Family F049
 * (sub_080430B0/08043120/08043190/08043200) reads `gUnknown_085D5ABC[c].unk18`
 * twice with a `bl sub_080432E0` between the two reads, and the ROM RE-LOADS
 * it: it keeps the element ADDRESS in r6 across the call and does a second
 * `ldrb r0,[r6,#0x18]`. Controlled probe, one body, two declarations of the
 * same 0x5c layout: with `const` the load is CSEd across the call (the value
 * itself lives in r6, `cmp r6,#0`, two bytes short); without it, the reload
 * comes back and the function is instruction-for-instruction the ROM. Same
 * mechanism as the const tell on gUnknown_0849957C in docs/agbcc-codegen.md,
 * seen across a CALL rather than across a loop iteration -- a const global's
 * MEM is RTX_UNCHANGING and survives a call, a plain one is killed by it.
 * Byte-neutral for the four already-promoted users (c_080432E0.c,
 * c_080433B8.c, c_080433F8.c, c_08061E54.c), which read it once each;
 * re-verified with trymatch after the change. */
extern struct Unk085D5ABC gUnknown_085D5ABC[];
/* A ROM byte per unit-type id, indexed by struct Unk08499594's unk00 at an
 * ODD address, so a plain `u8 []` and not an aggregate. sub_08058254 /
 * sub_08058318 keep only the units whose entry reads exactly 2, the same
 * "class tag" role gUnknown_085D5ABC[type].unk1b plays for the 0x0805Cxxx
 * list builders. Extent unproved -- only ids > 2 are ever looked up
 * (wave 20, W20-C). */
extern u8 gUnknown_0857680F[];
/* A ROM table of 24-byte rows indexed by gUnknown_03004582[i][0]. The stride is
 * `((n*2)+n)*8` in sub_0804C098 and sub_0804D290 alike, i.e. exactly 24, which
 * a struct cannot express any more cheaply here than the row form. Column 0
 * (`ldrh`) is the first argument of sub_08057D44; sub_0804C098 tests column 9
 * (+0x12) against zero. Rows 0..3 read 0/1/2/3 in column 0, so column 0 is the
 * row's own id. Left non-const: nothing indexes it inside a loop yet, so const
 * would buy nothing and the `const u8 *` hazard in the brief argues against
 * reflexive qualification.
 *   Wave 17: the ROWS ARE PROBABLY STRUCTS, not `u16 [12]`. sub_0804FA2C reads
 * column 9 as `adds r0, r0, r5; ldrh r1, [r0, #0x12]` -- the column offset in
 * the LOAD DISPLACEMENT. An array row cannot emit that: `fold` pulls the
 * INTEGER_CST out of the address PLUS, so `base + X*24 + 18` reassociates to
 * `(base + 18) + X*24` and costs two extra instructions. A `COMPONENT_REF`
 * applies its offset to the MEM instead and reproduces the ROM exactly
 * (measured: 664 -> 660 bytes on sub_0804FA2C, the only one of six spellings
 * that reaches it). Left as `[][12]` anyway because the change is NOT free at
 * column 0 -- rewriting sub_0804D290's `[X][0]` as `.unk00` moved it from 96.3%
 * to 95.3% at the same size -- and the four already-promoted readers all use
 * column 0 -- and sub_0804D290/sub_0804DCA8 are now MATCHED with the array
 * spelling, which settles column 0 as an array read whatever the row type is.
 * Retyping this is a job for whoever closes sub_0804FA2C; see the
 * "column-offset fold" section in docs/agbcc-codegen.md. The 24-byte row would
 * be `{ u16 unk00; u8 filler_02[0x10]; u16 unk12; u8 filler_14[4]; }`. */
extern u16 gUnknown_085D6A48[][12];
/* A ROM table of five 8-byte records per row, the row indexed by
 * gUnknown_03004580[i][1] and the record by gUnknown_0300451C -- so it is the
 * per-slot pixel offset that goes with gUnknown_02029A10[i].entries[j]. The
 * strides are measured in sub_08051DE0/sub_080524C0/sub_0805297C:
 * `((n*4)+n)*8` = 40 for the row and `j*8` for the record. unk00 is indexed by
 * gUnknown_0300453C (the side) and is added to the x sum; unk04 is NOT
 * side-indexed and is added to the y sum -- the asymmetry is the ROM's, not a
 * guess. Only those two of the four halfwords have a reader. Same struct-vs-
 * `[][5][4]` argument as gUnknown_08552D80: unk04 wants the constant in the
 * `ldrh` immediate, which the array spelling folds into the symbol address. */
struct Unk085D7E28 /* 0x08 */
{
    /* 0x00 */ u16 unk00[2];
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u16 unk06;
};
extern struct Unk085D7E28 gUnknown_085D7E28[][5];
/* A ROM table of SIGNED halfwords -- the only `ldrsh` reader in the family --
 * handed straight to sub_0803B48C, which unknown-functions.h types `s16` and
 * which is the sound-id call. Three sites index it, in sub_0804E7A8 and
 * sub_0804FCA4, and between them they fix the shape:
 *   byte offset = (gUnknown_020296B0[i].unk1a & 1) * 2
 *               + (gUnknown_03004580[i][2] - 1) * 4
 *               + gUnknown_03004580[i][1] * 24
 * so the row is 24 bytes = 6 halfwords = [6][2], the inner pair selected by the
 * alternating phase bit and the middle index by a 1-based count.
 *   TWO SYMBOLS, one table, exactly as gUnknown_0855239C / gUnknown_085523A4
 * already are: sub_0804E7A8 reaches it through 0x085D6C94 with all three
 * indices variable, so the `+0xc` sank into its pool word's relocation, while
 * sub_0804FCA4 has two sites with different constant offsets (+0xc and +0x10),
 * shares one pool word for 0x085D6C88 and adds each constant at run time. The
 * base symbol is therefore 0x085D6C88 and 0x085D6C94 is row [3] of it; only
 * rows 3 and 4 have a reader. Extents unproved in both directions.
 *   The two views are DIFFERENT TYPES and that is load-bearing, not tidiness.
 * sub_0804FCA4 needs the constant offsets to stay as run-time `adds rB,#0x10`
 * / `adds rB,#0xc` off one shared pool word, which only a struct MEMBER array
 * produces; sub_0804E7A8 needs the whole `+0xc` inside the relocation, which
 * only a plain array subscript with no constant index produces. Probed both
 * ways on both functions. */
struct Unk085D6C88 /* 0x18 */
{
    /* 0x00 */ u8 filler_00[0x0c];
    /* 0x0c */ s16 unk0c[2][2];
    /* 0x14 */ u8 filler_14[0x04];
};
extern struct Unk085D6C88 gUnknown_085D6C88[];
extern s16 gUnknown_085D6C94[][6][2];
/* ROM table of string pointers, indexed by a u32 (`lsls #2`; sub_08039F18
 * takes the index out of gUnknown_085D3DD0[..].unk38[..].unk00). The pointed-to
 * bytes are a NUL-terminated string: sub_08039F18's result goes straight into
 * sub_08039544, which copies bytes until the first zero. Left non-const because
 * sub_08039544 is not prototyped yet and takes it as a plain u8 *. */
/* NOT GLOBALS -- 0x0816D9E0-0x0816DA37 is agbcc's own .rodata address-constant
 * pool, ELEVEN consecutive PAIRS, one pair per LOOPING list-builder function at
 * 0x0805CA60-0x0805D1F0, in address order. Every even slot holds 0x030046B0
 * and every odd slot 0x030045F0, i.e. &gUnknown_030046B0 and
 * gUnknown_030045F0 -- checked against the ROM image. Do NOT declare these as
 * globals; the source is the plain
 *     gUnknown_030046B0 = gUnknown_030045F0;
 * and -fforce-addr synthesised the pair because the address is live across the
 * builder's loop. See "The .rodata address-constant reroute" in
 * docs/agbcc-codegen.md; sub_0805CDF0/sub_0805CE20, the two builders with no
 * loop, have no pair, which is what pins the rule.
 *   Wave 19 closed the last four builders (sub_0805CB1C, sub_0805CC88,
 * sub_0805CF0C, sub_0805D1F0) and re-measured the whole block. Two corrections
 * to what this note said before, both from the ROM rather than from inference:
 *   - It is ELEVEN pairs, not thirteen. 0x0816DA38-0x0816D9E0 = 0x58 = 22 words,
 *     and there are thirteen builders of which two do not loop. The old
 *     "thirteen pairs" contradicted this note's own last sentence.
 *   - The pair-to-function mapping was confirmed rather than assumed, by
 *     grepping each builder's body for its own pool symbols. It is strict
 *     address order with the two loopless builders SKIPPED and no hole left
 *     behind: CA60 D9E0, CB1C D9E8, CBCC D9F0, CC88 D9F8, CD34 DA00,
 *     (CDF0 and CE20 none), CE50 DA08, CF0C DA10, CFBC DA18, D078 DA20,
 *     D134 DA28, D1F0 DA30. That is the "slot order IS function order" rule in
 *     docs/agbcc-codegen.md holding across an absent entry, which is the case
 *     that rule had not been tested on.
 * All 22 words re-dereferenced against baserom.gba: 0x030046B0 then 0x030045F0,
 * eleven times, no exception. All thirteen builders are now matched, so the
 * block is fully accounted for and nothing in it is a global. Note that
 * data/families.json's F089 `varies` lists six DIFFERENT pool symbols for three
 * functions reading two globals; that entry is correct about the .text
 * literal-pool contents and misleading about the source, and it is the worked
 * instance of the "several pool words in a run can hold the SAME address"
 * rule. */
/* 0x0816E164 is another slot of the same block and holds the same value,
 * 0x08580934 -- checked against the ROM image, not inferred. sub_08066D30 is
 * sub_0806DDF4's twin over it, down to the loop bound and the +0x46 flag, so
 * it takes the same type and the same `const` + `pp = &sym` treatment. */
extern struct Unk0816E1B8 *const gUnknown_0816E164;
/* See struct Unk0816E1B8 for why this is const and why it is an extra level of
 * indirection in front of gUnknown_08580934 rather than a global of its own. */
extern struct Unk0816E1B8 *const gUnknown_0816E1B8;
extern u8 *gUnknown_08610A38[];
/* A ROM u16 table read as `gUnknown_08616F0C[unk1d * 4 + gUnknown_03005940]` by
 * sub_080852A8 -- FLAT and not `[][4]`: the ROM scales the row index and then
 * adds the column before the single element shift (`lsl #2; add; lsl #1`),
 * where a `u16 [][4]` scales each index separately. Both indices are variables
 * here, which is what makes the two spellings distinguishable at all. */
extern u16 gUnknown_08616F0C[];
/* Proc scripts. sub_0807639C and sub_0807F8D0 hand 08614460 / 08616740 to
 * Proc_Start(script, parent); sub_08078540 hands 08615AAC to
 * Proc_StartBlocking and stashes a pointer at +0x54 of the new proc. */
extern const struct ProcCmd gUnknown_08614460[];
extern const struct ProcCmd gUnknown_08615AAC[];
/* Proc_StartBlocking'd by sub_0807F82C under the proc it just found through
 * gUnknown_086165C0; sub_0807F618 is its existence predicate. */
extern const struct ProcCmd gUnknown_08616710[];
extern const struct ProcCmd gUnknown_08616740[];
/* Proc_Start'd by sub_08087884 under a caller-supplied parent, with one word
 * of payload stashed at +0x54 of the new proc. */
extern const struct ProcCmd gUnknown_08616D94[];
/* A ROM halfword table: every user computes `index * 2 + &g` and reads it with
 * `ldrh` (sub_08074D28, sub_08074EEC, sub_08074FE4, sub_08075008 and four
 * more), so the symbol address is the array base and not a pointer.
 * NOT const, on the same evidence as gUnknown_0849957C: sub_08074EEC reads one
 * element inside a 5-iteration loop and the ROM re-`ldrh`s it every pass. With
 * `const` GCC hoists the load into the preheader and the function is a
 * register permutation away from matching. */
extern u16 gUnknown_0861433C[];
/* The 0x30-byte record array behind struct Unk08615194 above. */
extern const struct Unk08615194 gUnknown_08615194[];
/* More proc scripts, from the 0806Exxx / 08073xxx / 08074xxx starters:
 *   08582BB4  Proc_StartBlocking, sub_0806E6C8 (+0x5c = arg)
 *   08582BE4  Proc_Start,         sub_0806E728 (+0x54 = the parent it was
 *                                 started under, so the field is a ProcPtr)
 *   08582C24  Proc_Start,         sub_0806E8C8 (+0x58/+0x5c = 0, +0x60 = arg)
 *   086141B4  Proc_Start(.., PROC_TREE_VSYNC), sub_08073900 (+0x5c = arg)
 *   086142E4  Proc_StartBlocking, sub_08074AAC (+0x2c = arg, +0x30 = 0)
 *
 * And the same family again:
 *   08582B2C  Proc_Start,         sub_0806E5CC (+0x34 u16 = arg, +0x2c = 0x140,
 *                                 +0x30 = 0xa0 -- 320x160, so the pair is a
 *                                 screen-sized extent rather than two flags)
 *   08582B74  Proc_StartBlocking, sub_0806E698, started under the starter's own
 *                                 first argument, and +0x5c of the new proc is
 *                                 copied from +0x5c of that parent -- so the
 *                                 parent is a proc of this same shape
 *   08582B94  Proc_StartBlocking, sub_0806E6B4 AND sub_0806E6E0, two identical
 *                                 20-byte starters on one script, neither
 *                                 writing a field
 *   08582D74  Proc_StartBlocking, sub_0806F710 (no fields written). This one
 *                                 sits immediately above the m4a/MP2K span, but
 *                                 it takes its parent in r0 like every other
 *                                 member of this family, so it is ordinary
 *                                 compiler output and not m4a_asm.s.
 *   0861418C  Proc_Start(.., PROC_TREE_VSYNC), sub_080736C4 (no fields written)
 *   086141DC  Proc_Start(.., PROC_TREE_VSYNC), sub_08073C88 (+0x5c = arg)
 */
extern const struct ProcCmd gUnknown_08582B2C[];
extern const struct ProcCmd gUnknown_08582B74[];
extern const struct ProcCmd gUnknown_08582B94[];
extern const struct ProcCmd gUnknown_08582BB4[];
extern const struct ProcCmd gUnknown_08582BE4[];
extern const struct ProcCmd gUnknown_08582C24[];
extern const struct ProcCmd gUnknown_08582D74[];
/* Proc scripts from the 0x080719C0-0x0807298C starter family. The +0x64 group
 * is six starters over four scripts, in two shapes that pair off: a tree-3
 * Proc_Start taking only the payload, and a Proc_StartBlocking that forwards
 * its own second parameter as the parent. Both stash one HALFWORD at +0x64
 * (`adds r0,#0x64; strh` -- 0x64 is past the strh displacement limit, so the
 * runtime add is forced and says nothing about the source).
 *   08613E08  Proc_Start tree 3,  sub_080719C0 (no fields written)
 *   08613E64  Proc_Start tree 3,  sub_08071EF0 (+0x64) and
 *             Proc_StartBlocking, sub_08071F28 (+0x64), parent forwarded
 *   08613E84  Proc_Start tree 3,  sub_08071F0C (+0x64) and
 *             Proc_StartBlocking, sub_08071F40 (+0x64), parent forwarded
 *   08613EA4  Proc_StartBlocking, sub_08071F58 (+0x64), parent forwarded
 *   08613EC4  Proc_StartBlocking, sub_08071F70 (+0x64), parent forwarded
 *   08613F0C  Proc_StartBlocking, sub_0807249C (+0x58 word), parent is that
 *             starter's FIRST parameter
 *   08613F34  Proc_Start tree 3,  sub_08072970 (+0x2c/+0x34 words)
 *   08613F44  Proc_Start tree 3,  sub_0807298C (+0x2c/+0x30/+0x34 words) */
extern const struct ProcCmd gUnknown_08613E08[];
extern const struct ProcCmd gUnknown_08613E64[];
extern const struct ProcCmd gUnknown_08613E84[];
extern const struct ProcCmd gUnknown_08613EA4[];
extern const struct ProcCmd gUnknown_08613EC4[];
/* 08613EE4  Proc_Find, sub_080723C0 (+0x4c word = 0). Unlike the rest of this
 *           group the find is NULL-checked before the store, so the poker is
 *           `p = Proc_Find(s); if (p) p->unk4c = 0;` rather than the usual
 *           unchecked cast-and-store. */
extern const struct ProcCmd gUnknown_08613EE4[];
extern const struct ProcCmd gUnknown_08613F0C[];
extern const struct ProcCmd gUnknown_08613F34[];
extern const struct ProcCmd gUnknown_08613F44[];
extern const struct ProcCmd gUnknown_0861418C[];
extern const struct ProcCmd gUnknown_086141B4[];
extern const struct ProcCmd gUnknown_086141DC[];
extern const struct ProcCmd gUnknown_086142E4[];
/* Proc scripts from the 0x08074xxx-0x08078xxx starter family:
 *   086142B4  Proc_Start,         sub_08074714 (+0x58 = 0xc00), and
 *             Proc_Find,          sub_0807472C (+0x58 = arg << 10) -- one
 *             script with a starter and a poker, so +0x58 is one u32 field
 *   08614344  Proc_Start,         sub_08074ED0 (+0x54 = arg, +0x58 = 0), and
 *             Proc_Find,          sub_08074EEC -- which walks +0x40 as an array
 *             of FIVE pointers (`ldm r3!, {r1}` five times off proc+0x40) and
 *             pokes a halfword into +0x22 of each. So this proc owns a
 *             5-element pointer table at +0x40 and runs to at least +0x54
 *   086143E0  Proc_Start,         sub_080758BC (+0x2c/+0x30/+0x38 = args,
 *                                 +0x34 = 0 as a HALFWORD, +0x3c/+0x40 = 0)
 *   086144FC  Proc_Start,         sub_08076770 (+0x2c/+0x30/+0x58 = args,
 *                                 +0x5c = 0, +0x64 = 0 halfword), and
 *             Proc_Find,          sub_080767A8 (+0x64 = 1 halfword)
 *   0861485C  Proc_Start(.., PROC_TREE_3), sub_0807813C (no fields written)
 *   08614894  Proc_Start(.., PROC_TREE_3), sub_080780D0 (no fields written)
 *   0861598C  Proc_StartBlocking, sub_08078480 (+0x54 = arg) -- same shape as
 *                                 08615AAC / sub_08078540
 *   08615A8C  Proc_StartBlocking, sub_080784E4 (+0x58/+0x5c/+0x60 = args)
 */
extern const struct ProcCmd gUnknown_086142B4[];
extern const struct ProcCmd gUnknown_08614344[];
extern const struct ProcCmd gUnknown_086143E0[];
extern const struct ProcCmd gUnknown_086144FC[];
extern const struct ProcCmd gUnknown_0861485C[];
extern const struct ProcCmd gUnknown_08614894[];
extern const struct ProcCmd gUnknown_0861598C[];
extern const struct ProcCmd gUnknown_08615A8C[];
/* The scripts named by the second half of the 16-byte
 * `push {lr}; ldr r0,=g; bl f; pop {r0}; bx r0` forwarder family (family F000
 * in data/families.json). Each is `const struct ProcCmd []` because its
 * consumers are proc.h prototypes that take exactly that, and `const` because
 * they are ROM data nothing writes. Evidence, one line per script -- in every
 * case a Proc_EndEach forwarder from that family plus at least one starter or
 * poker that pins the object as a proc script rather than a bare blob:
 *   08580F24  sub_0806A444 -> sub_08067504, which is Proc_BreakEach open-coded
 *             over sProcArray. Sole reference in the ROM, so nothing here
 *             constrains the proc's fields.
 *   085810B8  Proc_Start,   sub_08067D04 (+0x34/+0x38 = args, +0x3c = 0);
 *             Proc_EndEach, sub_08067D4C
 *   08613E54  Proc_Start,   sub_08071B28 (+0x2c = a gUnknown_0202F2DC record
 *             the starter also fills);  Proc_EndEach, sub_08071B88
 *   08613F2C  Proc_Start,   sub_080725A8 (+0x2c word, then halfwords at
 *             +0x30/+0x32/+0x34/+0x36/+0x38/+0x3a); Proc_EndEach, sub_08072598
 *   08614220  Proc_Start,   sub_08073FF4 (+0x2c word, then 8 halfword pairs
 *             written from +0x30 and +0x40);        Proc_EndEach, sub_08074028
 *   08614390  Proc_Start,   sub_08075298 (+0x2c word, +0x34/+0x36/+0x38
 *             halfwords); Proc_Find, sub_080752D8, which pokes +0x38 and then
 *             walks a TEN-entry pointer table at +0x3c..+0x60 poking +0x30 of
 *             each non-NULL entry;                  Proc_EndEach, sub_08075304
 *   086143B8  Proc_Start,   sub_0807548C (+0x2a..+0x34 halfwords, +0x38/+0x3c
 *             words); Proc_Find, sub_0807553C (same fields);
 *             Proc_EndEach, sub_080755E0
 *   08615CA0  Proc_Start,   sub_08078D80 under the caller's own parent, no
 *             fields written;                       Proc_EndEach, sub_08078E04
 *   08616638  Proc_Start,   sub_0807C978 under the caller's own parent, no
 *             fields written;                       Proc_EndEach, sub_0807F8C0
 *   08616DB4  Proc_Find,    sub_08087974 and sub_08087C14 (+0x54 word);
 *             Proc_Start,   sub_08087974;           Proc_EndEach, sub_080879A0
 */
extern const struct ProcCmd gUnknown_08580F24[];
extern const struct ProcCmd gUnknown_085810B8[];
extern const struct ProcCmd gUnknown_08613E54[];
extern const struct ProcCmd gUnknown_08613F2C[];
extern const struct ProcCmd gUnknown_08614220[];
extern const struct ProcCmd gUnknown_08614390[];
extern const struct ProcCmd gUnknown_086143B8[];
extern const struct ProcCmd gUnknown_08615CA0[];
extern const struct ProcCmd gUnknown_08616638[];
extern const struct ProcCmd gUnknown_08616DB4[];
/* NOT proc scripts, despite sitting inside the same 0x0858xxxx table as the
 * ones above: these two are gUnknown_03001470-list blobs, the same slot as
 * gUnknown_0849A0F0 and gUnknown_0849A3C0. Each has an install/remove pair that
 * repeats verbatim -- sub_080656E0 is `sub_080152EC(08580C7C, 3)` and
 * sub_08065700 is `sub_0806377C(08580C7C)`; sub_0806D820 / sub_0806D840 are the
 * same two lines over 08581F40. `const u8 []` is the weakest model that
 * reproduces the clean pool word: nothing indexes or dereferences either, and
 * both consumers take them as an opaque `const void *`. Widen when
 * sub_080152EC's slot payload is settled. Address proximity to the proc scripts
 * is therefore NOT evidence of what a 0x0858xxxx symbol is -- read the
 * consumer, not the address. */
extern const u8 gUnknown_08580C7C[];
extern const u8 gUnknown_08581F40[];
/* Two 0xFF-terminated u8 id lists handed to sub_08074AAC by sub_08078440 and
 * sub_08078454. The ROM contents are {8, 9, 0xa, 0xff} and {0x10, 0x11, 0x12,
 * 0xff} -- read out of baserom.gba, not inferred.
 *
 * They are TWO symbols and not one array, and the evidence is sub_08078358,
 * which is the third caller of sub_08074AAC: it walks a run of 4-byte records
 * based at gUnknown_08615974 (`adds r4, #4`, i = 0..3, so 0x08615974/78/7c/80)
 * and passes `&record[i][2]` -- i.e. the last two bytes of each record, which
 * are also a 0xFF-terminated list. So the whole 0x08615974-0x0861598B block is
 * a mixture of two unrelated things at 4-byte granularity, and the 0x84/0x88
 * pair is reached only by two separate wrappers naming two separate addends of
 * zero. An `(&g)[1]` spelling of the second would relocate as
 * gUnknown_08615984+4 and still link identically -- so this choice is
 * byte-neutral and could not be proved from the wrappers alone; it is the
 * weakest model that gives the ROM's two clean pool words. */
extern const u8 gUnknown_08615984[];
extern const u8 gUnknown_08615988[];
/* A gUnknown_0200C528 list script, exactly the gUnknown_0849A8F0 shape: its
 * sole reference in the ROM is sub_08078958 handing its ADDRESS to
 * sub_080193B0(const u8 *). `const u8 []` for the same reason -- nothing
 * indexes or dereferences it, so that is the weakest model giving the clean
 * pool word. */
extern const u8 gUnknown_08615B4C[];

/* The start/exists proc-script family, scattered across code-0806CFC8.s from
 * 0x08078150 to 0x0808AA88. Each script below gets exactly two wrappers, and
 * where both exist they are ADJACENT at 0x14 spacing -- a 20-byte starter
 *     void f(void)  { Proc_Start(script, PROC_TREE_3); }
 * followed immediately by a 24-byte existence predicate
 *     int  g(void)  { return Proc_Find(script) != 0; }
 * Ten such pairs plus three predicates whose starters sit up at 0x080780D0 /
 * 0x0807813C. All thirteen scripts take PROC_TREE_3 and neither wrapper reads
 * or writes a single proc field, so these say nothing about the proc layout --
 * unlike the 086142B4 family above, they constrain no struct offsets.
 *
 * Verified uniform across all 23 wrappers: every starter is `movs r1, #3`,
 * every predicate is the same cmp/beq/movs shape. There is no per-member
 * variation in tree number, shift kind or masking.
 *
 *   086147FC  Proc_Find only, sub_08078150   (starter not in this file)
 *   08615CB0  sub_0807A970 / sub_0807A984
 *   08615FB4  sub_0807B790 / sub_0807B7A4
 *   086164A0  sub_0807C55C / sub_0807C570
 *   086165C0  sub_0807F524 / sub_0807F538
 *   086166C8  sub_0807F550 / sub_0807F564
 *   08616990  sub_080846C8 / sub_080846DC
 *   08616B74  sub_08085AC8 / sub_08085ADC
 *   08616C54  sub_08087858 / sub_0808786C
 *   08616DFC  sub_0808A638 / sub_0808A64C
 *   08616FD4  sub_0808AA74 / sub_0808AA88
 * and reusing two scripts already declared above:
 *   0861485C  sub_0807813C  / sub_08078168
 *   08614894  sub_080780D0  / sub_08078180
 *
 * The PREDICATE half of the family is wider than the starter half, and the two
 * do not have to travel together. Three more 24-byte predicates of exactly the
 * shape above sit on scripts whose starters are ordinary payload-writing
 * wrappers rather than the 20-byte PROC_TREE_3 form, and they are nowhere near
 * 0x08078150:
 *   086141B4  sub_08073918  (starter sub_08073900, PROC_TREE_VSYNC, +0x5c = arg)
 *   086141DC  sub_08073CA0  (starter sub_08073C88, PROC_TREE_VSYNC, +0x5c = arg)
 *   08616710  sub_0807F618  (Proc_StartBlocking'd by sub_0807F82C)
 * Each is the immediate neighbour of its own starter, at the same 0x14/0x18
 * spacing. So when scoping a batch: a 24-byte leaf that is `bl Proc_Find`
 * followed by cmp/beq/movs is a member of this family whatever its address, and
 * `return Proc_Find(script) != 0;` matches it first try.
 */
extern const struct ProcCmd gUnknown_086147FC[];
extern const struct ProcCmd gUnknown_08615CB0[];
extern const struct ProcCmd gUnknown_08615FB4[];
extern const struct ProcCmd gUnknown_086164A0[];
extern const struct ProcCmd gUnknown_086165C0[];
extern const struct ProcCmd gUnknown_086166C8[];
extern const struct ProcCmd gUnknown_08616990[];
extern const struct ProcCmd gUnknown_08616B74[];
extern const struct ProcCmd gUnknown_08616C54[];
extern const struct ProcCmd gUnknown_08616DFC[];
extern const struct ProcCmd gUnknown_08616FD4[];

/* ---- wave 12 ----
 * gUnknown_03001470-list script blobs, all reached ONLY as an address handed to
 * sub_080152EC (`const void *`) or sub_080152C0, exactly the slot
 * gUnknown_0849A0F0 / gUnknown_0849A3C0 / gUnknown_0849A108 occupy. `const u8
 * []` is the weakest model that reproduces the clean pool word: nothing indexes
 * or dereferences any of them, and both consumers take an opaque pointer.
 * `const` is safe here for the same reason it is on the other blobs -- neither
 * consumer's declaration is non-const, so there is no -Werror hazard of the kind
 * the Decompress(u8 *, void *) note in docs/agbcc-codegen.md warns about.
 * Extents from data/data*.s, which is where the split drew the symbol
 * boundaries, so they are upper bounds on the record and not proved sizes:
 *   08485D9C 0x18   08485DB4 0x10   08499E4C 0x98   08499EE4 0x68
 *   0849A128 0x70   0849A1C0 0x30   0849D10C 0x60   0849E610 0x38
 *   0849E648 0x28   0849F628 0x30   084C3128 0x10
 * Which consumer each one has, since the two are NOT interchangeable in the
 * source (sub_080152C0's first parameter is declared s32 and needs a cast):
 *   sub_080152EC  08485D9C 08485DB4 08499E4C 08499EE4 0849E610 0849E648 0849F628
 *   sub_080152C0  0849A128 0849A1C0 0849D10C 084C3128 (and 0849A108, 0849E6D4)
 */
extern const u8 gUnknown_08485D9C[];
extern const u8 gUnknown_08485DB4[];
extern const u8 gUnknown_08499E4C[];
extern const u8 gUnknown_08499EE4[];
extern const u8 gUnknown_0849A128[];
extern const u8 gUnknown_0849A1C0[];
extern const u8 gUnknown_0849D10C[];
extern const u8 gUnknown_0849E610[];
extern const u8 gUnknown_0849E648[];
extern const u8 gUnknown_0849F628[];
extern const u8 gUnknown_084C3128[];
/* Two more of the same blobs, but reached from the REMOVER side: sub_0803A59C
 * and sub_08049FF4 stop each of these pairs with two back-to-back
 * sub_0801537C(const void *) calls. 0849E240 also appears at sub_08014C94 and
 * three times around sub_0803A94C, and 084C3814 again at sub_0804A09C, so both
 * have starters elsewhere in the ROM. Same `const u8 []` model; 0849E240 and
 * 0849E280 are 0x40 each, 084C3814 is 0x10 and sits immediately below the
 * already-declared gUnknown_084C3824. */
extern const u8 gUnknown_0849E240[];
extern const u8 gUnknown_0849E280[];
extern const u8 gUnknown_084C3814[];
/* Proc scripts, each named only as a Proc_EndEach argument by a wave-12
 * two-call wrapper. 085815D0/085815E8 are ended together by sub_0806AA64 and
 * are separately started at sub_0806A7AC / sub_0806A938; 08614134, 0861418C
 * (already declared above) and 08614200 are each ended by their own wrapper
 * that then re-registers sub_080735B0 with sub_08011AAC. Sizes 0x18, 0x20,
 * 0x20, 0x20 -- 3 and 4 ProcCmd entries. */
extern const struct ProcCmd gUnknown_085815D0[];
extern const struct ProcCmd gUnknown_085815E8[];
extern const struct ProcCmd gUnknown_08614134[];
extern const struct ProcCmd gUnknown_08614200[];

/* ---- wave 13 (A1) ----
 * Two parallel 11-entry tables at 0x08485C9C and 0x08485CC8, indexed by the
 * same first argument of sub_0800272C. They are word tables -- both are read
 * with a plain `ldr` off `index << 2`, which is what pins the element size --
 * and the pair is exactly 0x2C apart, so the first one ends where the second
 * begins and 11 is the entry count, not a guess.
 *   08485C9C  25a 26a 272 27a 282 28a 292 29a 2a2 2aa 2b2
 *             OBJ tile numbers: sub_0800272C masks with 0x3FF and scales by
 *             32 to reach 0x06010000 + n*0x20, i.e. OBJ VRAM. The mask is in
 *             the source (`ldr =0x3FF; ands`), so the stored words carry more
 *             than the tile number and `u32` is the honest model.
 *   08485CC8  pointers, 0x08485B5A + 8*n for n = 0..10; entry 11 is
 *             0x08485BFA and breaks the stride, which is the second
 *             confirmation of the 11-entry extent. Each element is handed
 *             straight to sub_0801BD00's third parameter, declared `void *`
 *             in this file's counterpart -- so the element type must NOT be
 *             `const void *` or -Werror rejects the call. `void *const []`
 *             keeps the ROM honesty without breaking it. */
extern const u32 gUnknown_08485C9C[];
extern void *const gUnknown_08485CC8[];
/* The same two-table pairing one record further along, read by sub_08002844
 * with the identical `& 0x3FF`, `<< 5`, `+ 0x06010000` idiom. Nine entries
 * each, pinned the same two ways: 0x08485D44 - 0x08485D20 == 0x24 == 9 words,
 * and 08485D44's own stride-8 run of pointers (0x08485BB2 + 8*n) stops after
 * n = 8.
 *   08485D20  25a 268 26c 270 274 278 27c 280 284
 *   08485D44  -> 08485BB2 08485BBA ... 08485BF2
 * Same `void *const []` reasoning as the pair above -- the element goes
 * straight into sub_0801BD00's `void *` third parameter. */
extern const u32 gUnknown_08485D20[];
extern void *const gUnknown_08485D44[];
/* A single 16-colour OBJ palette, applied to slot 30 by sub_08002844 on its
 * 0x19 path. `u16 []` and not the `u8 []` its 0812xxxx neighbours carry,
 * because it is handed to ApplyPaletteExt(u16 *, u32, u32) by name with no
 * arithmetic on it -- the neighbours are indexed as bytes, this one is not.
 * NOT const, for the same -Werror reason: that parameter is a plain `u16 *`. */
extern u16 gUnknown_081268D8[];

/* ---- wave 13 (A4) ----
 * NOT a global. 0x0808D6DC is inside the `.LC` address-constant block that
 * follows code.s's .text, and it holds &gUnknown_0200B0B0 -- see the
 * `-fforce-addr` section of docs/agbcc-codegen.md. The block gives itself away
 * by duplication, which is the documented screen:
 *
 *   0808D6DC 0200B0B0   0808D6E0 0200B0B0   0808D6E4 030033E4
 *   0808D6E8 03002EE0   0808D6EC 0200B0B0   ...   0808D70C..0808D718
 *   0200B0B0 four more times
 *
 * so the original source of sub_08000694 says `gUnknown_0200B0B0->unk02` and
 * the compiler put the word there.
 *
 * The gUnknown_08090CD8 `**const` workaround does NOT work here and the
 * declaration below is kept only so the next reader does not re-derive it: it
 * reproduces the ROM's CSE exactly (the const load is cached in r4 across the
 * whole body) but force-addr then fires on THIS symbol in turn and adds a
 * second `ldr` at every access -- 400 bytes against 392.
 *
 * WHY, measured (work/wave13/probes/fa*.c): force-addr's trigger is NOT "used
 * before and after a loop", it is "referenced on BOTH SIDES OF A CONTROL-FLOW
 * MERGE". `if (a) g->x = 1; g->y = 2;` fires with no loop and no call;
 * `if (a) g->x = 1; else g->y = 2;` does not, because nothing references it
 * after the join; five references in five switch arms do not either. A loop is
 * just the merge everyone happened to notice first. So the workaround can only
 * work for a function whose references are all straight-line or all inside
 * mutually-exclusive arms -- which is not this one, and not most of the 0x0800
 * block. Write the direct spelling and park. Do not add users of this
 * symbol. */
extern struct Unk0200B0B0 **const gUnknown_0808D6DC;

/* Four ROM blobs sub_08023360 loads, each typed from the callee that consumes
 * it and nothing else -- none of them is `const`, because the three consumers
 * (`Decompress(u8 *, void *)`, `sub_08012C58(void *)` and
 * `ApplyPaletteExt(u16 *, u32, u32)`) all take non-const pointers and -Werror
 * rejects the discard. gUnknown_0809175C is reached at +0 and at +0xa0 by the
 * same function, which is why it is an array rather than a scalar. */
/* Five-byte ROM records indexed by struct Unk03001470's unk20, and NOT a
 * struct: agbcc's ARM STRUCTURE_SIZE_BOUNDARY rounds every struct up to a
 * multiple of 4, so a five-member byte struct strides by 8 (`lsls #3`) where
 * the ROM strides by 5 (`lsls #2; adds; adds #k`). It has to be a flat byte
 * array indexed `[i * 5 + k]`.
 * The elements are u8 with the two signed READS spelled as casts: the ROM
 * does `ldrb` followed by `lsls #0x18; asrs #0x18` at +1 and +2, and an s8
 * element would have emitted `ldrsb` with a register offset instead. +3 and +4
 * are only ever copied byte-to-byte. */
extern const u8 gUnknown_0849A06C[];
/* Two OAM sprite blobs handed to PutSprite / PutSpriteExt, whose fourth
 * parameter is `u16 *`. 0x0849B6D6 is halfword- but not word-aligned, which
 * independently fixes the element width. */
extern u16 gUnknown_0849B6C8[];
extern u16 gUnknown_0849B6D6[];
/* Two more OAM sprite blobs on the same `u16 *` PutSpriteExt parameter, used
 * as a pair by sub_08076494 and its twin sub_0807662C. Leading halfword is the
 * OBJ count (3 and 1) followed by that many (y, x, tile) triples, which is the
 * gUnknown_0849B6C8 shape and is why the count is not part of the type. */
extern u16 gUnknown_086144C0[];
extern u16 gUnknown_086144D4[];
/* Two parallel ROM pointer tables selected by sub_0802B91C with a ternary and
 * indexed `[(s16)a4 - 1]`; each element is handed straight to sub_0801BD00's
 * `void *` third parameter, so the element type must not be `const void *`
 * (same reasoning as gUnknown_08485CC8). */
extern void *const gUnknown_0849A218[];
extern void *const gUnknown_0849A22C[];
/* sub_08027DD8's pair: gUnknown_08499E18 is the proc script it hands to
 * Proc_EndEach (and that sub_08027B10 starts), gUnknown_08499D90 is a
 * gUnknown_03001470 script blob passed to sub_0801537C(const void *) -- the
 * same `const u8 []` model as gUnknown_0849A3C0. */
extern const struct ProcCmd gUnknown_08499E18[];
extern const u8 gUnknown_08499D90[];
/* A ROM pointer table indexed by struct Unk08580934_Obj's unk1c -- the same
 * 4-entry slot index that reaches unk44[] and unk70[]. sub_08066470 is its
 * only reader and hands the element straight to sub_0801BD00's third
 * parameter, so the element type must NOT be `const void *` or -Werror
 * rejects the call: exactly the gUnknown_08485CC8 / gUnknown_0849A218 model,
 * and `void *const []` keeps the ROM honesty without breaking it. */
extern void *const gUnknown_08580CFC[];
/* The OAM sprite blob the gUnknown_08499E18 proc's two tick functions
 * (sub_08027B68, sub_08027CC8) hand to PutSpriteExt's `u16 *` fourth
 * parameter -- the same model as gUnknown_0849B6C8. Those are its only two
 * readers, so nothing constrains it beyond that parameter; it is not `const`
 * because PutSpriteExt's parameter is not. It sits 8 bytes below
 * gUnknown_08499E18, so the blob is at most 4 halfwords. */
extern u16 gUnknown_08499E10[];
/* The sub_080339B0 screen-init batch. Each is typed from its one consumer and
 * nothing else: ApplyPaletteExt(u16 *, ...) for the palettes, Decompress and
 * sub_08011C68 for the blobs, sub_08073304's `void *` for the EWRAM buffer.
 * None is `const` -- Decompress, sub_08012C58 and ApplyPaletteExt all take
 * non-const pointers and -Werror rejects the discard.
 * gUnknown_0849BC3E is a u16 lookup indexed by a proc byte field
 * (`ldrb; lsls #1; adds; ldrh`), extent unproved. */
extern u8 gUnknown_02010C50[];
extern u16 gUnknown_0809165C[];
extern u8 gUnknown_0812B49C[];
extern u8 gUnknown_0812B61C[];
extern u8 gUnknown_0812B6FC[];
extern u16 gUnknown_081320AC[];
extern u16 gUnknown_081D3E88[];
extern u8 gUnknown_081D8A54[];
extern u16 gUnknown_081D92B8[];
extern u8 gUnknown_08239FA4[];
extern u8 gUnknown_0823A3D4[];
extern u16 gUnknown_0849BC3E[];
extern u8 gUnknown_085802F0[];
extern const struct ProcCmd gUnknown_0849BB80[];
extern const struct ProcCmd gUnknown_0849BC50[];
extern const struct ProcCmd gUnknown_08616EFC[];
/* 20-byte ROM records; only +0x10 is ever named, and always as `unk10 * 10`
 * (sub_08036F68, sub_080249EC and sub_0802AB70 all do the same `lsls #2;
 * adds; lsls #1` on the loaded word). Word-sized -- the load is `ldr` -- and
 * the index is a plain u8 unit id in every user. */
struct Unk085D583C /* 0x14 */
{
    /* 0x00 */ u8 filler_00[0x0e];
    /* 0x0e */ u16 unk0e; /* wave 13 (A2): sub_08046D30 reads it `ldrh [.,#0xe]`
                           * and passes it as sub_08014668's tile argument */
    /* 0x10 */ int unk10;
};
extern const struct Unk085D583C gUnknown_085D583C[];
/* An EWRAM buffer whose ADDRESS is published: sub_08036F68 clears its byte 1
 * and then stores &gUnknown_02027F68 into both slots of gUnknown_03004528. It
 * is the array spelling and not a scalar because that is what makes the byte
 * write and the address publication share one pool word. */
extern u8 gUnknown_02027F68[];
extern u8 *gUnknown_03004528[];
extern u16 gUnknown_03004520;
extern u8 gUnknown_0809175C[];
extern u16 gUnknown_0809163C[];
extern u8 gUnknown_080BD1EC[];
extern u8 gUnknown_0849D16C[];
/* Three more sub_0806B708 screen-setup blobs: 0822DE80 is a u16 palette
 * (ApplyPaletteExt at 0x200/0x20, i.e. OBJ palette 0), 081918A4 a Decompress
 * source, and 0858193C a proc script handed to Proc_Start with the caller's
 * own proc as parent. */
extern u16 gUnknown_0822DE80[];
extern u8 gUnknown_081918A4[];
extern const struct ProcCmd gUnknown_0858193C[];

/* ---- wave 13 (A2) ---- */
/* The link-session descriptor sub_0802EA5C is handed as its only argument and
 * parks here. Members seen so far: +0x00 a word copied straight into
 * gUnknown_03000564, +0x04 the halfword sub_0802EB28 complements into
 * REG_SIODATA8, +0x06 a halfword timeout defaulted to 10 by sub_0802EA5C,
 * +0x08 whose low two bits become gUnknown_03000560, and +0x0a a halfword
 * sub_0802EF10 tests before arming timer 3. */
struct Unk03003F6C /* 0x0c */
{
    /* 0x00 */ u32 unk00;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u16 unk06;
    /* 0x08 */ u16 unk08;
    /* 0x0a */ u16 unk0a;
};
extern struct Unk03003F6C *gUnknown_03003F6C;
/* The link handshake's result code, and the fifth member of the serial block
 * above. VOLATILE, and this one is proved rather than inferred: sub_0802EB28
 * stores `v & 4` and then re-`ldr`s the very same address for the `!= 0` test
 * with nothing in between. `int` and not u32 because sub_0802EB28 returns it
 * from the same expression that returns -1 elsewhere. Values seen: 0xF0
 * (sub_0802EA5C's initial value), 0, and a 0..3 slot index. */
extern volatile int gUnknown_0300055C;
/* A word flag in EWRAM cleared by sub_0802EA5C and by sub_0802EB28's case 0,
 * and tested `!= 0` by case 1 to decide whether the link is up. */
extern int gUnknown_02023894;
/* NOT a global -- this is agbcc's own `-fforce-addr` address-constant pool
 * word, and the ROM proves it: the word at 0x08090D88 is 0x030032D8, i.e.
 * &gUnknown_030032D8, and 0x08090D84 / 0x08090D8C hold &gUnknown_030044B0 and
 * &gUnknown_03003FC0 beside it -- the duplication-free but obviously-a-pool
 * run the docs describe. sub_080345C8's source says plain `gUnknown_030032D8`;
 * the compiler parked its address here because the address pseudo is live
 * across the switch's calls, and every OTHER function in the ROM that touches
 * 0x030032D8 (sub_08034ED0, sub_08034C90, ...) names the symbol directly
 * because there the address dies inside one statement.
 *
 * Declaring it and reading `**state` off a local `u16 *const *` is the
 * gUnknown_0808D6DC workaround: writing the honest `gUnknown_030032D8` gives
 * byte-identical .text but relocates the pool word against THIS unit's own
 * `.rodata`, which the .text-only split cannot place at 0x08090D88. The local
 * is load-bearing -- taking the address into a local pseudo is what stops
 * -fforce-addr from adding a second .rodata level of its own. */
extern u16 *const gUnknown_08090D88;
/* 0x08090C04 is another word in that same pool run and is NOT a global either:
 * the ROM word there is 0x030033E8, i.e. &gUnknown_030033E8, and its immediate
 * neighbours are &gUnknown_03003FC0 (0x08090C00) and &gUnknown_030033EC
 * (0x08090BFC / 0x08090C0C). Its one referrer, sub_0802CFFC, reads
 * gUnknown_030033E8[0] and [1] on both sides of a branch, so the ADDRESS is
 * live across the merge -- the reference-count-across-a-control-flow-merge
 * trigger, not loop liveness.
 *
 * NO DECLARATION IS NEEDED AND NONE IS ADDED. The paragraph above says the
 * honest spelling "relocates the pool word against THIS unit's own .rodata,
 * which the .text-only split cannot place" -- that wall was removed in wave 18
 * and the sentence is now stale for anything new. Naming gUnknown_030033E8
 * directly reproduces sub_0802CFFC exactly, including the `adds r2, r0, #0` /
 * `ldr r2, [r2]` pair that holds the pool word's address across the branch;
 * trymatch reports `relocs: name different symbols that resolve to the same
 * address` and asks for "rodata": ["0x08090C04"] in the promoted entry. That is
 * a match, not a park. The gUnknown_08090D88 declaration is kept only because a
 * promoted file already uses it -- do not add more of them (wave 21, W21-C). */
/* A proc script; sub_080345C8 asks sub_08015BD0 whether an instance is live
 * with the usual `!= -1` predicate. */
extern const struct ProcCmd gUnknown_0849A00C[];
/* The next two 0x20-byte slots after gUnknown_0849A00C, and proc scripts for
 * the same reason it is -- sub_0802B3AC and sub_0802B4D4 both hand
 * gUnknown_0849A02C straight to Proc_Find, which takes `const struct ProcCmd *`
 * and is not a shape any other blob class reaches. sub_0802C4B8 /
 * sub_0802C4D4 (wave 16, F075) start them with Proc_StartBlocking. */
extern const struct ProcCmd gUnknown_0849A02C[];
extern const struct ProcCmd gUnknown_0849A04C[];
/* The animation handle sub_0801C210 allocates and returns. Only the two words
 * sub_080355CC touches are named; +0x22 is an OAM-shaped `tile | pal << 12`
 * halfword and +0x24 takes the decompression buffer. */
struct Unk0801C210
{
    /* 0x00 */ u8 filler_00[0x22];
    /* 0x22 */ u16 unk22;
    /* 0x24 */ void *unk24;
};
/* A table of 16-colour palettes, indexed by gUnknown_08499598[n].unk1a - 1 in
 * sub_080355CC. `[][16]` and not a flat `u16 []` because the ROM's index math
 * is `(v - 1) << 5` off the bare symbol -- a flat array folds the -1 into the
 * relocation's addend and loses the `subs`. Not const: ApplyPaletteExt takes a
 * plain `u16 *`. */
extern u16 gUnknown_0810EA60[][16];
/* The proc script sub_080355CC starts on PROC_TREE_5. */
extern const struct ProcCmd gUnknown_0849BE38[];
/* NOT a global -- a second `-fforce-addr` address-constant pool word, this one
 * holding &gUnknown_08499590 (the ROM word at 0x08090EA8 is 0x08499590, and
 * 0x08090EA4 beside it is the same address again, which is the duplication
 * screen the docs describe). sub_080359A4 reads the screen pointer three times
 * across two calls, so agbcc kept the address in a callee-saved register and
 * parked it here. Use it exactly like gUnknown_08090D88: bind
 * `&gUnknown_08090EA8` to a local and read `**local`. */
extern u8 **const gUnknown_08090EA8;
/* A ROM blob handed to sub_0801C70C as its first argument by sub_08040640, and
 * never dereferenced by anything matched -- only the symbol address is used.
 * `const u16 []` to match its two siblings gUnknown_0810A3E8 /
 * gUnknown_0810AFC8, which reach the same parameter from sub_0803F128; the
 * element type is a guess for all three. */
extern const u16 gUnknown_08111D94[];
/* A byte flag cleared to 0 by sub_0802E4B4 alongside gUnknown_030040DC and
 * gUnknown_030033E8. Single `strb`, no reader found, so u8 is the weakest
 * model and the signedness is unproved. */
extern u8 gUnknown_03000558;
/* At least two bytes: sub_0802E4B4 clears [0] and [1] with two `strb`s off one
 * pool word (`strb r0,[r1]; strb r0,[r1,#1]`), which is an array or a pair of
 * adjacent byte fields, not a scalar. */
extern u8 gUnknown_030033E8[];
/* A small byte-wide mode id; sub_0802E4B4 sets [0] to 4 with a bare `strb`.
 * At least two bytes and its ADDRESS is taken: sub_0802966C fills [0] and
 * [1] from gUnknown_0849A06C and then hands the symbol itself to
 * sub_0802E7C8 and sub_080357E0 as a pointer. Was a scalar u8. */
extern u8 gUnknown_03003110[];
/* The currently-selected unit id: sub_0802E4B4 fills it from the map cell byte
 * at gUnknown_08499590[0x12 + rowOffset[y] + x] and immediately re-reads it to
 * index gUnknown_08499594, so it is the same 1-based unit id that table is
 * keyed by. UNSIGNED -- the `>> 6` that derives gUnknown_03004480 from it is
 * `lsrs`, and the value doubles as an index. */
extern u8 gUnknown_03003F38;
/* Halfword written twice in a row by sub_0802E4B4 (`(gUnknown_03003F38 >> 6)
 * + 1`, then gUnknown_030033EC), both with `strh`. */
extern u16 gUnknown_03004480;

/* ---- wave 13 (A8) ----
 * sub_0801258C is the SECOND display-state block, and the whole 824-byte
 * function is one straight line of 43 copies out of the shadows that
 * sub_08012420 pushes to the hardware and into a parallel set of symbols. So
 * every symbol below is the snapshot partner of a display-register shadow, and
 * the widths are read straight off the ldr/ldrh/ldrb pairs: nothing here is
 * inferred from address adjacency.
 *
 * Six of them are written as PACKED words rather than as two halfwords --
 * `lo | (hi << 16)` with a single `str` -- which is why some destinations are
 * u32 where their neighbours are u16, and gUnknown_030030B8 is a genuine 64-bit
 * object built with `(u64)a | ((u64)b << 16) | ((u64)c << 32) | ((u64)d << 48)`
 * (the DImode shift sequence `lsrs r5,#0x10 / lsls r4,#0x10 / orrs` is not
 * reachable from any 32-bit spelling). */
extern u16 gUnknown_0300140C;
extern u16 gUnknown_03001410;
extern u16 gUnknown_03001414;
extern u16 gUnknown_03001424;
extern u32 gUnknown_03001FB0;
extern u16 gUnknown_03001FB4;
extern u16 gUnknown_03001FB8;
extern u16 gUnknown_03001FC0;
extern u16 gUnknown_03001FC4;
extern u16 gUnknown_03001FC8;
extern u16 gUnknown_03001FCC;
extern u8 gUnknown_03001FD8;
extern u16 gUnknown_03001FEC;
extern u16 gUnknown_03002004;
extern u16 gUnknown_03002008;
extern u32 gUnknown_03002010;
extern u16 gUnknown_03002014;
extern u16 gUnknown_03002018;
extern u16 gUnknown_0300201C;
extern u32 gUnknown_03002024;
extern u32 gUnknown_03002030;
extern u16 gUnknown_03002034;
extern u8 gUnknown_030020A4;
extern u16 gUnknown_030024C4;
extern u16 gUnknown_030024CC;
extern u16 gUnknown_030024E0;
extern u16 gUnknown_03002518;
extern u32 gUnknown_03002B3C;
extern u16 gUnknown_03002B48;
extern u16 gUnknown_03002B50;
extern u16 gUnknown_03002B58;
extern u16 gUnknown_03002B64;
extern u8 gUnknown_03002B70;
extern u16 gUnknown_03002EDC;
extern u8 gUnknown_03002EE8;
extern u8 gUnknown_03002EEC;
extern u16 gUnknown_03002EF4;
extern u16 gUnknown_03002F10;
extern u16 gUnknown_03002F14;
extern u16 gUnknown_03002F28;
extern u8 gUnknown_03002F34;
extern u16 gUnknown_03002F38;
extern u16 gUnknown_03002F40;
extern u32 gUnknown_03003030;
extern u16 gUnknown_03003038;
extern u16 gUnknown_0300303C;
extern u16 gUnknown_03003044;
extern u16 gUnknown_03003090;
extern u8 gUnknown_03003094;
extern u16 gUnknown_03003098;
extern u8 gUnknown_030030AC;
extern u16 gUnknown_030030C0;
extern u16 gUnknown_030030D8;
extern u16 gUnknown_030030E4;
/* The four window-bound shadows -- the WIN0H / WIN1H / WIN0V / WIN1V halves,
 * in that order. ALL FOUR ARE VOLATILE, and this is the cheapest volatile tell
 * found so far because it costs eight bytes rather than a register: in
 * sub_0801258C they are ORed into one 64-bit value, and a plain read lets
 * combine fold each `ldrh` straight into the DImode lowpart
 * (`ldrh r2, [r0]`), while a volatile read cannot be folded and leaves the
 * copy behind (`ldrh r4, [r0]; adds r0, r4, #0`). Four terms, four extra
 * copies, and the extra pressure spills a fifth address into r8 -- which is
 * also why the function has a three-high-register prologue that a
 * straight-line function has no other reason to want. */
extern volatile u16 gUnknown_030020B0;
extern volatile u16 gUnknown_0300309C;
extern volatile u16 gUnknown_03002B60;
extern volatile u16 gUnknown_03002028;
/* The 8-byte snapshot of those four, written as one 64-bit store pair. */
extern u64 gUnknown_030030B8;

/* sub_08053860 and sub_08053BB8 walk FOUR parallel proc-id tables, five ids at
 * a time, twice each. The two passes are what fixes the shape: every table is
 * touched at a group-0 offset and again one fixed stride higher, and the
 * palette argument switches from `gUnknown_085523A8[gUnknown_0300450C]` to
 * `[gUnknown_0300450C ^ 1]` in lockstep with the group. So each table is a
 * TWO-element array of a record holding five s16 ids, and the strides
 * (0xb4 / 0x0a / 0x6c / 0x28) are measured, not assumed. Only the id members
 * are proved; every filler below is the space between two proved offsets and
 * nothing more. */
/* unk2e/unk30/unk3a added in wave 17 from sub_08051DE0/sub_080524C0/
 * sub_0805297C, which all read the same two expressions:
 *   unk3a[unk2e]  -> OamData.tileNum, so a 10-bit-or-narrower tile index,
 *                    with unk2e its cursor (`ldrh` at +0x2e off the element).
 *   unk30[j]      -> the row index of gUnknown_08552D80, j being
 *                    gUnknown_0300451C, which is what fixes the [5].
 * Both are `ldrh`, so unsigned is not proved -- nothing sign-extends either,
 * and neither is ever cleared, so an s16 object read in a u16 context would
 * look identical. The [5] on unk30 is the same slot count as unk24[5] and as
 * gUnknown_02029A10's entries[5]; the [5] on unk3a is inherited from the
 * layout and only its 0x3a start is read directly. The record now tiles
 * exactly -- 0x24 + 5*2 = 0x2e, +2 = 0x30, +5*2 = 0x3a, +5*2 = 0x44,
 * +5*4 = 0x58, +5*4 = 0x6c -- with the last two arrays added from
 * sub_08051BEC/sub_08051F4C, so every byte from 0x24 to the end of the struct
 * is accounted for by a five-slot array. That is corroboration for the [5]s,
 * not a proof of any one of them. */
struct Unk02029808 /* 0x6c */
{
    /* 0x00 */ u8 filler_00[0x24];
    /* 0x24 */ s16 unk24[5];
    /* 0x2e */ u16 unk2e;
    /* 0x30 */ u16 unk30[5];
    /* 0x3a */ u16 unk3a[5];
    /* 0x44 */ void *unk44[5]; /* two more slot-indexed arrays, this pair of
                                * words rather than halfwords, and they run to
                                * the end of the 0x6c record exactly.
                                * sub_08051F4C reads unk44[unk2e] and
                                * unk58[unk2e] with `ldr` and passes them as
                                * sub_08015410's third and fourth arguments,
                                * which unknown-functions.h already types
                                * `void *` -- the same graphics/palette pair
                                * gUnknown_08557978's columns 1 and 2 supply.
                                * Note the INDEX is unk2e here and the slot
                                * index elsewhere; only unk2e has been seen. */
    /* 0x58 */ void *unk58[5];
};

struct Unk020296B0 /* 0x28 */
{
    /* 0x00 */ u16 unk00; /* wave 18 (W18-C): sub_08050B70 reads it with a bare
                           * `ldrh` off the element base and assigns it to
                           * struct OamData's 10-bit tileNum, so it is the OBJ
                           * tile index for the slot. Halfword from the load;
                           * nothing narrows it, so 16 bits is the widest
                           * evidence and the bitfield does the masking. */
    /* 0x02 */ s16 unk02[5];
    /* 0x0c */ u8 filler_0c[0x0e];
    /* 0x1a */ u8 unk1a; /* a phase counter, post-incremented once per emitted
                          * sound: sub_0804E7A8 and sub_0804FCA4 both do
                          * `sub_0803B48C(tbl[..][g[c].unk1a & 1]);
                          * g[c].unk1a++;` with a bare `ldrb`/`strb` pair, so
                          * only bit 0 is ever consumed. Byte, from the
                          * `ldrb r0,[r4,#0x1a]` / `strb r0,[r4,#0x1a]` pair
                          * off the same element address (wave 18). */
    /* 0x1b */ u8 filler_1b[0x0d];
};

extern s16 gUnknown_02029668[][5];
/* The per-side movement record: 0x58 bytes, indexed by
 * gUnknown_03001470[proc].unk30 (the 0/1 side), holding five parallel slots
 * indexed by gUnknown_03001470[proc].unk34. sub_08050958 is the whole
 * derivation and it steps two 8.8 fixed-point axes per tick:
 *   unk26[j] += unk30[j];   x_sub += x_step
 *   (x whole) += unk26[j] >> 8;
 *   unk44[j] += unk4e[j];   y_sub += y_step
 *   unk3a[j] += unk44[j] >> 8;
 * The `>> 8` is `lsls #0x10; asrs #0x18`, i.e. a SIGNED 16-bit shift, which is
 * what types unk26/unk44 (and by symmetry unk3a and the 0x1c row) as s16
 * rather than u16; the steps unk30/unk4e are only ever added and are left u16.
 * unk16 is a tick threshold compared against gUnknown_03001470[proc].unk2c,
 * and unk18/unk1a are the x/y bounds the same function tests the two whole
 * coordinates against.
 *
 * The 0x1c row is reached through its OWN linker symbol, gUnknown_0202972C
 * (== gUnknown_02029710 + 0x1c), exactly as gUnknown_03004582 overlaps
 * gUnknown_03004580: sub_08050958 holds a pool word for each. The 44-halfword
 * row length IS the 0x58 stride, not a proved extent. Kept as filler here so
 * the two spellings cannot drift apart. */
struct Unk02029710 /* 0x58 */
{
    /* 0x00 */ u8 filler_00[0x16];
    /* 0x16 */ u16 unk16;
    /* 0x18 */ u16 unk18;
    /* 0x1a */ u16 unk1a;
    /* 0x1c */ u8 filler_1c[0x0a]; /* == gUnknown_0202972C[i][0..4] */
    /* 0x26 */ s16 unk26[5];
    /* 0x30 */ u16 unk30[5];
    /* 0x3a */ s16 unk3a[5];
    /* 0x44 */ s16 unk44[5];
    /* 0x4e */ u16 unk4e[5];
};
extern struct Unk02029710 gUnknown_02029710[];
extern s16 gUnknown_0202972C[][44];
extern struct Unk020296B0 gUnknown_020296B0[];
/* A pair of five-per-side u16 counters, read and written only as
 * `[i][j]` with the same (side, slot) index pair every other table in this
 * subsystem uses. sub_080501DC does `B94[i][j] += B80[i][j];` and zeroes BOTH
 * when the sum reaches 6, so B80 is a per-frame step and B94 the accumulator
 * that wraps at six. The [2][5] extent is PROVED by the addresses: 0x02029B94
 * - 0x02029B80 = 20 bytes = 2 * 5 * sizeof(u16), so B80 tiles exactly up to
 * B94 and there is no room for a sixth slot or a third side. Both `ldrh` /
 * `strh` with nothing sign-extending, and both are cleared, so u16 is the
 * weakest fit and the clearing half of the pair rules out a narrower one. */
extern u16 gUnknown_02029B80[2][5];
extern u16 gUnknown_02029B94[2][5];
/* 0x90-byte per-side records -- the stride is `(s*8+s)*16` at all 55 sites in
 * code-0801D390.s. Two five-slot halfword arrays are reached here, at +0x26 and
 * +0x30, indexed by gUnknown_03001470[proc].unk34 (the slot) and summed into a
 * gUnknown_08553B40 column. A STRUCT and not `u16 [][72]`: the ROM adds the
 * member offset to the BASE register (`adds r0,#0x26`) and leaves the `ldrh`
 * displacement at zero, which is what a struct member holding an array gives;
 * the flat spelling folds the same constant into the symbol's relocation.
 * +0x0a, +0x16, +0x18, +0x1a, +0x3a, +0x80, +0x8c and +0x8d are also read
 * elsewhere in the file and are left as filler until something needs them
 * (wave 20, W20-C). */
struct Unk020298E0 /* 0x90 */
{
    /* 0x00 */ u8 filler_00[0x26];
    /* 0x26 */ u16 unk26[5];
    /* 0x30 */ u16 unk30[5];
    /* 0x3a */ s16 unk3a[5]; /* A third five-slot halfword array on the same
                              * [side][slot] index as unk26/unk30 -- a countdown.
                              * SIGNED on the discriminating half: sub_0804BDD8
                              * and sub_0804BECC do `ldrh; subs #1; strh; lsls
                              * #0x10; cmp #0; bgt`, i.e. `--x <= 0` tested on
                              * the sign of the low half, which a u16 member
                              * cannot produce (the same readout that signs
                              * struct Unk08580934_Obj.unk26). The `ldrh` is
                              * forced by the store-back, not by the type.
                              * Extent 5 by analogy with unk26/unk30, which is
                              * what the +0x44 boundary allows (wave 21, W21-A). */
    /* 0x44 */ u8 filler_44[0x4c];
};
extern struct Unk020298E0 gUnknown_020298E0[];
extern struct Unk02029808 gUnknown_02029808[];
/* A halfword cell per gUnknown_0300453C side, read `gUnknown_02029BE8[s ^ 1]`
 * -- the OTHER side's slot -- and tested `!= 0` by sub_0804BDD8/sub_0804BECC
 * before they clear a per-slot counter. Bare `ldrh` off `index * 2`, nothing
 * sign-extends, so a plain u16 array; the extent is unknown (aw2bhr.lds puts
 * the next symbol 4 bytes later, which bounds it at 2 if that symbol is real)
 * (wave 21, W21-A). */
extern u16 gUnknown_02029BE8[];
/* Set to 1 with a bare `strh` by sub_08053BB8 and by nothing else matched. */
extern u16 gUnknown_030045B0;
/* Two ROM u16 tables indexed by gUnknown_0300450C (and, for the second, by its
 * complement): 08551E7C supplies sub_0805741C's argument in sub_08053860,
 * 085523A8 supplies the palette sub_08053614 pushes into bits 10-11 of an OAM
 * word. Both are read with a bare `ldrh` off `index * 2`, so they are plain u16
 * arrays rather than aggregates -- the same reasoning as gUnknown_085538AE. */
/* Two ADJACENT byte tables scoring the 5-bit terrain code that
 * gUnknown_08499590 + 0x1432 holds, read `tbl[cell & 0x1f]` by the twins
 * sub_0804B42C (0x08551CA0) and sub_0804B4C4 (0x08551CBD).
 *
 * The ODD address of the second is real and not a mis-attributed pool word:
 * 0x08551CA0 + 0x1d == 0x08551CBD and 0x08551CBD + 0x1f == 0x08551CDC, so the
 * three symbols tile the region exactly, and the two tables are byte-for-byte
 * the same in ROM apart from element 5 (3 vs 0) -- parallel tables of 29 and
 * 31 explicit initialisers, not one table read at two offsets. A 32-entry
 * reading is what the 0x1f mask suggests and it is WRONG: it would make the
 * two overlap. Values are 0..4, read `ldrb` into an UNSIGNED comparison (the
 * running best is `bhs`, not `bge`), so the running maximum is `u32` in the
 * source while the table itself is only ever zero-extended (wave 21, W21-A). */
extern const u8 gUnknown_08551CA0[];
extern const u8 gUnknown_08551CBD[];
/* The four cardinal neighbour offsets as (dx, dy) word pairs -- (1,0), (-1,0),
 * (0,-1), (0,1) -- walked with `ldr [r1]; ldr [r1,#4]; adds r1,#8` by both
 * twins above and added to signed cell coordinates. Words and signed: the
 * elements ARE -1 in ROM. */
extern const s32 gUnknown_08551CDC[][2];
extern const u16 gUnknown_08551E7C[];
extern const u16 gUnknown_085523A8[];

/* The screen-setup blobs sub_08065990 / sub_0806D944 hand out. Typed from the
 * callee that receives each, which is the discriminating use in every case:
 * the two Decompress sources are `u8 *` because that is Decompress's parameter
 * and const would break it, and 082344CC is `u16 *` because it goes to
 * ApplyPaletteExt. */
/* A u16 palette source: sub_0806A054 hands it to ApplyPaletteExt with
 * (0x20, 0xa0), i.e. ApplyPalettes(src, 1, 5) -- five palettes starting at BG
 * palette 1. */
extern u16 gUnknown_0822FE50[];
extern u8 gUnknown_0822F9AC[];
extern u8 gUnknown_0822FEF0[];
extern u16 gUnknown_082344CC[];
/* A destination buffer in EWRAM, not ROM: sub_08065238 and sub_0806D944 both
 * pass it as sub_08073304's second argument alongside a ROM first argument. */
extern u8 gUnknown_0200FC50[];
/* A small step counter, `ldr`/`cmp` only. SIGNED: sub_080852A8 gates its first
 * block with `cmp r5, #3; bgt`, and it doubles as an array index. */
extern int gUnknown_03005940;
/* The sub_08080498 screen-setup blobs. 082391E8 / 080A36C8 / 08239DE4 are u16
 * palettes (ApplyPaletteExt at 0x00, 0x100 and 0x200 with 0x20 bytes each, i.e.
 * BG palettes 0 and 8 and OBJ palette 0); 08236294 / 08235D30 / 08239228 are
 * Decompress sources; 080A29A4 goes to sub_08011E54 and 080A31A4 to
 * sub_08012B70; 086168BC is a proc script Proc_Start runs under the caller.
 * Non-const on the blobs because Decompress and sub_08011E54 both take plain
 * `u8 *` / `void *`. */
extern u8 gUnknown_08235D30[];
extern u8 gUnknown_08236294[];
extern u8 gUnknown_08239228[];
extern u16 gUnknown_082391E8[];
extern u16 gUnknown_08239DE4[];
extern u8 gUnknown_080A29A4[];
extern u8 gUnknown_080A31A4[];
extern u16 gUnknown_080A36C8[];
extern const struct ProcCmd gUnknown_086168BC[];
/* Read once with `ldr` and handed straight to sub_08043BA4(int, ...) by
 * sub_08080498. `int` is the weakest model that the single use supports -- it
 * is never dereferenced here, so pointer-ness is unproved. */
extern int gUnknown_03005970;
/* Proc scripts handed to sub_080152EC(script, 3). */
extern const u8 gUnknown_08580CB4[];
extern const u8 gUnknown_08580CC4[];
/* sub_08073304's first argument -- the sibling of gUnknown_085802A4, which
 * sub_08065238 passes in the same position with the same 0x230 third argument. */
extern const u8 gUnknown_085802AC[];
/* A word-sized row/line counter. sub_080876B4 is the only reader so far and
 * uses it purely arithmetically -- `gUnknown_03005928 * 16 + 0x28` (or +0x48),
 * stored into the u8 gUnknown_030020B8 -- so the 4-byte `ldr` fixes the width
 * and nothing yet fixes the sign. */
extern u32 gUnknown_03005928;

/* ---- wave 13 (A8), third block ----
 * 0x0808D800 -- one more slot of the `-fforce-addr` .rodata address-constant
 * block described on gUnknown_0808D6DC above, holding &gUnknown_0200B0B0.
 * NOT a global of the original source; the original says gUnknown_0200B0B0 and
 * agbcc parked the address here.
 *
 * NON-const, and that is the whole difference between a match and a near-miss:
 * sub_080085E0 re-reads the ROM word AND the pointer at every use
 * (`ldr r0,[r4]; ldr r0,[r0]`) while keeping only the word's ADDRESS in r4.
 * A `**const` spelling -- the one gUnknown_0808D6DC needs, because that
 * function's reference lives across a loop -- lets agbcc CSE the outer read
 * into a register and drops one `ldr` per use site. Probed both ways in one
 * call against the target listing. */
extern struct Unk0200B0B0 **gUnknown_0808D800;

/* ---- wave 13 (A6) ----
 * The four-direction step tables, read together and indexed by the same 0..3
 * direction in sub_0800F564 (`lsls r3, r6, #1` is CSEd across both):
 *   gUnknown_0848894C = { -1, +1,  0,  0 }   dx
 *   gUnknown_08488954 = {  0,  0, -1, +1 }   dy
 * SIGNED and 16 bits wide -- both are read with `ldrsh rN, [base, rIdx]`, which
 * is the only THUMB form for a signed halfword and needs the scratch zero in a
 * register; the values in the ROM confirm the sign. Extent is 4 from the four
 * `dir` cases the one reader tests; the words after them at 0x08488958 repeat
 * the same two patterns, so this is one row of a longer table and the bound is
 * not proved. */
extern const s16 gUnknown_0848894C[];
extern const s16 gUnknown_08488954[];

/* ---- wave 13 (A7) ----
 * The debug status readout sub_08057464 (matched) paints. Every type below is
 * pinned by that one function and nothing else yet.
 *
 * The 0813617x-0813619C run is ASCII, not a compiler pool: the addresses are
 * handed to sub_080119A0 as its third argument and never dereferenced by the
 * caller, and the bytes read "C", "ATK", "ARMY", "SOLD", "WEP", "TER", "DEF".
 * Contrast the 08136050-081360E0 run just above them in data/data.s, which
 * holds RAM addresses, is loaded THROUGH (`ldr rN, [rM]`) and is agbcc's own
 * -fforce-addr constant pool -- see docs/agbcc-codegen.md.
 *
 * 08551A48/4C/50 are `u16 []`: indexed `* 2` and read with a bare `ldrh` whose
 * result goes straight into a `u16` parameter. The five 08551A60.. tables are
 * indexed `* 2 * 2` and read with `ldr`, and what comes out is sub_080119A0's
 * string argument, so they are pointer tables. 03004550 is `s16 []` -- every
 * one of its sixteen slots is read with `ldrsh`, including the eight that feed
 * sub_08011A20's unnarrowed `int` third parameter. */
extern u16 gUnknown_03004514;
extern u16 gUnknown_03004524;
extern u16 gUnknown_03004540;
extern s16 gUnknown_03004550[];
extern u16 gUnknown_030045AC;
extern const u16 gUnknown_08551A48[];
extern const u16 gUnknown_08551A4C[];
extern const u16 gUnknown_08551A50[];
extern const char *const gUnknown_08551A60[];
extern const char *const gUnknown_08551A74[];
extern const char *const gUnknown_08551AD4[];
extern const char *const gUnknown_08551AE0[];
extern const char *const gUnknown_08551B8C[];
extern const char *const gUnknown_08551B98[];
extern const char gUnknown_08136170[];
extern const char gUnknown_08136174[];
extern const char gUnknown_08136178[];
extern const char gUnknown_08136180[];
extern const char gUnknown_08136188[];
extern const char gUnknown_0813618C[];
extern const char gUnknown_08136190[];
extern const char gUnknown_08136194[];
extern const char gUnknown_08136198[];
extern const char gUnknown_0813619C[];

/* Two free-running frame counters, each bumped once per call by sub_08021DD8
 * and immediately re-read for a `% 0x70` / `% 0x64` phase test. VOLATILE, and
 * that is measured rather than assumed: without it CSE satisfies the modulo's
 * operand from the register the increment just stored and the `ldr rN, [rM]`
 * after the `str` disappears, costing two bytes each. Nothing between the
 * store and the load can alias them, so `volatile` is the only reason agbcc
 * would reload. */
extern volatile u32 gUnknown_03004078;
extern volatile u32 gUnknown_030043F0;
/* WORD-WRITTEN, HALFWORD-READ -- declared u32 because the writers are what is
 * matched, and a u16 declaration would give them `strh`. Every one of the
 * eleven writers is `str` of a value the prologue narrowed with
 * `lsls #24; lsrs #24`, i.e. a u8 parameter widened to a word (family F045:
 * sub_0802C5B8, sub_0802C5D4, sub_0802C7DC, sub_0802CD28, sub_0802CE54,
 * sub_0802CE94 and neighbours), plus one `str r4` zeroing pair in sub_08021554
 * and sub_08034810. The only two READERS, sub_0802D4A0's body at 0x0802D4D8
 * and its twin at 0x0802D52C, do `ldrh` and pass the result as the fifth
 * (stacked) argument of sub_08019F2C(menuDef, ...) -- so whoever matches those
 * two needs a `(u16)` cast or a union here, NOT a narrower declaration.
 * The value is a menu-item selector: the tables handed to sub_08019F2C
 * alongside it are gUnknown_0849AC60 and gUnknown_0849ABC0, 0x20-byte records
 * whose +0x14/+0x18 callback slots hold the F045 functions themselves.
 * Wave 14. */
extern u32 gUnknown_030040F0;
extern u32 gUnknown_030044A0;
/* NOT OBJECTS -- these two are THUMB FUNCTION POINTER VALUES, and they are
 * here only because a `.c` may not declare its own externs.
 *
 * Both appear exactly once, as the pool word of a `ldr r1,=X; bl _call_via_r1`
 * indirect call (sub_0801B6EC and sub_0801B6FC). The addresses are ODD, which
 * is what a stored THUMB entry point looks like, and they are in IWRAM. No
 * object is allocated at either: aw2bhr.lds defines them because the SPLITTER
 * saw the pool word, and aw2bhr.map shows *fill* across the range. So the
 * original source had a constant or a macro, and `&gUnknown_0300619D` is a
 * spelling forced by the relocation the split produces -- see the comment in
 * work/sub_0801B6EC/. Do not read these as evidence that IWRAM holds a
 * variable at an odd address, and do not give them a wider type: the only
 * legal use is taking the address and casting it to a function pointer.
 * The pointee is code copied into IWRAM at run time; nothing in the ROM's
 * .text writes either address, so what lands there is not yet identified.
 * Wave 14. */
extern u8 gUnknown_0300619D;
extern u8 gUnknown_03006511;

/* Three more blobs of the 0817D874 group, all handed to sub_080718F8 as its
 * second argument by sub_08068BE4 (matched) exactly as 0817D874 is by its
 * sibling. Same `u8 []` model and the same reason for not being const --
 * sub_080718F8's declared second parameter is a plain `u8 *`.
 *
 * gUnknown_08581414 is SIGNED bytes and that is proved, not assumed: both
 * elements sub_08068BE4 reads end up in a `u16` argument, and the ROM
 * sign-extends each one to 32 bits first (`ldrb; lsls #24; asrs #24` for the
 * first, a bare `ldrsb` for the second) before re-narrowing to 16. A `u8 []`
 * would have gone straight from `ldrb` to the argument with no extension at
 * all. */
extern u8 gUnknown_0817D6FC[];
extern u8 gUnknown_0817D7B8[];
extern u8 gUnknown_0817D910[];
extern s8 gUnknown_08581414[];

/* Two adjacent halfword tables read by sub_0802216C. gUnknown_0809097C is a
 * base tile id per terrain class, indexed by `(v >> 6) + 1` with slot 0 used
 * for the v == 0x100 case, so at least 5 entries -- which is exactly the 10
 * bytes between it and gUnknown_08090986. gUnknown_08090986 is SIGNED: its
 * only use is `movs r2,#0; ldrsh r0,[r1,r2]; cmp r0,#0; bge`, a sign test that
 * a u16 table could not produce. */
extern const u16 gUnknown_0809097C[];
extern const s16 gUnknown_08090986[];

/* The 0x0804CEF8 unit-graphics loader's tables. Every type here is proved by a
 * candidate that compiles to bytes IDENTICAL to the ROM (see the wave-13 A7
 * report); only the relocation of agbcc's own .rodata pool word blocks that
 * function, so the layouts are as solid as a match.
 *
 * 08552178 is 10-byte rows -- `(i*4 + i) * 2` -- with u16 at +4 and +6, the
 * same shape as the RAM table gUnknown_02029668 declared above, and the two are
 * indexed in lockstep. The three 0855797x tables are 12-byte rows of three
 * words each (`(i*2 + i) * 4`): column 0 is a Decompress source, columns 1 and
 * 2 are sub_08015410's third and fourth arguments. 08552FB0 is a plain word
 * table indexed `i * 4` whose element is Decompress's destination.
 * 085533E4/085533FC/08553414 are 0x18 apart and are only ever named as
 * sub_08015410's first argument.
 *
 * WHAT IS IN THEM, dereferenced in baserom.gba in wave 17, because "opaque
 * blob" was hiding something useful. All five of these (the three above plus
 * gUnknown_085536A4 and gUnknown_085536BC below) are the SAME uniform 0x18-byte
 * record, and it is a table of CALLBACKS:
 *
 *   +0x00  an odd (THUMB) function pointer     +0x04  0x00020000
 *   +0x08  an odd (THUMB) function pointer     +0x0c  0x00010000
 *   +0x10  0x00000000  (a null terminator)     +0x14  0x00040000
 *
 * and the functions named are exactly the sprite setters in the surrounding
 * address range: 085533E4 -> sub_0804D818, 085533FC -> sub_0804D738,
 * 08553414 -> sub_0804D928 (matched), all three sharing sub_0804D8F8 in the
 * second slot; 085536A4 -> sub_08051DE0 (matched) and sub_08051F48;
 * 085536BC -> sub_08052154 and sub_08052270. So sub_08015410's first argument
 * is an animation descriptor, not a graphics blob, and these five records are
 * the reason those setters have no `bl` caller anywhere in `asm/`.
 * Declared `u8 []` anyway -- only the ADDRESS is ever used, the two u32s per
 * entry have no reader, and the record shape above is read off the data rather
 * than off any code. */
extern u16 gUnknown_08552148[];
extern u16 gUnknown_08552178[][5];
extern void *gUnknown_08557978[][3];
extern void *gUnknown_085579B4[][3];
extern void *gUnknown_085579F0[][3];
extern void *gUnknown_08552FB0[];
/* Two more of the `void *[3]` graphics/palette/animation record tables the
 * gUnknown_08557978 family is made of, and ONE table reached through two
 * symbols: 0x08557B94 is 0x08557B58 + 0x3c, i.e. row 5 of the same 12-byte
 * rows. sub_0804DB14 uses both in one function -- gUnknown_08557B58[A] for the
 * first sub_08015410 and gUnknown_08557B94[A] for the second -- and indexes
 * 08557B58 a third time by gUnknown_08562128[..] for a CpuFastSet source, so
 * the low rows and the high rows are genuinely separate records rather than
 * one array read at two biases. Columns: [0] a CpuFastSet/Decompress source,
 * [1] and [2] sub_08015410's third and fourth arguments -- the same
 * graphics/palette pair the 08557978 columns supply. */
extern void *gUnknown_08557B58[][3];
extern void *gUnknown_08557B94[][3];
/* Two more animation descriptors of the gUnknown_085533E4 kind: only the
 * ADDRESS is used, each is sub_08015410's first argument, and sub_0804DB14
 * passes 08553444 with the gUnknown_08557B58 record pair and 08553474 with the
 * gUnknown_08557B94 one. `u8 []` for the same reason as that family. */
extern u8 gUnknown_08553444[];
extern u8 gUnknown_08553474[];
extern u8 gUnknown_08562128[];
extern u8 gUnknown_085533E4[];
extern u8 gUnknown_085533FC[];
extern u8 gUnknown_08553414[];
/* Two more blobs of the same kind and reached the same way: sub_08051BEC names
 * 085536A4 and sub_08051F4C names 085536BC, each as sub_08015410's first
 * argument, and nothing else names either. Same `u8 []` model as the three
 * above, for the same reason -- the address is all that is used. */
extern u8 gUnknown_085536A4[];
extern u8 gUnknown_085536BC[];
/* Three more of the same 0x18-byte animation-descriptor record, each named as
 * sub_08015410's first argument and nothing else, so `u8 []` for the same
 * reason as the family above (wave 20, W20-C).
 *
 * Dereferenced in baserom.gba, the run 085536A4..0855371C is SIX consecutive
 * records and slot 0 / slot 2 of each name a (draw, install) pair of the
 * 0x08052 sprite cluster:
 *
 *   085536A4  sub_08051DE0 (matched) + sub_08051F48   <- sub_08051BEC
 *   085536BC  sub_08052154 (matched) + sub_08052270   <- sub_08051F4C
 *   085536D4  sub_08052154 (matched) + sub_08052358   <- sub_080520B8
 *   085536EC  sub_080524C0 (matched) + sub_08052650
 *   08553704  sub_0805297C (matched) + sub_08052AF4   <- sub_08052718
 *   0855371C  sub_08052CA4 (matched) + sub_08052E00   <- sub_08052BBC
 *
 * sub_08051F48 and sub_08052E00 are 4-byte `bx lr` stubs, so slot 2 is
 * optional; the arrow marks which function passes the descriptor to
 * sub_08015410, read off the assembly. 085536EC has no passer among the
 * matched or wave-20 set.
 *
 * That table IS why sub_08052650 and sub_08052AF4 have zero `bl` callers and
 * why they are byte-identical to each other: one C body, installed from two
 * different descriptors, so the two copies need distinct addresses. A zero
 * fan-in function in a block full of matched siblings is a CALLBACK, not a
 * dead function. */
extern u8 gUnknown_085536D4[];
extern u8 gUnknown_08553704[];
extern u8 gUnknown_0855371C[];

/* sub_0806EB5C's screen-setup blobs. 0823BDE0 goes to ApplyPaletteExt, the
 * five 081Axxxx/08239FA4/0823A3D4 ones to Decompress, and 081A3E3C is
 * sub_080718F8's ROM-blob argument -- all `u8 []` and none const, for the same
 * Decompress(u8 *, void *) reason as the 0817Dxxxx group above. 085826E0 and
 * 08582C7C are opaque script/table addresses handed to sub_08073304 and
 * sub_08073FF4. 02010C50 is the RAM buffer sub_08073304 writes into.
 *
 * gUnknown_08582764 is a table of 8-byte rows with a u16 at +4, and the STRUCT
 * form is load-bearing rather than cosmetic: `u16 t[][4]` indexed `[i][2]`
 * folds the +4 into the symbol address (`add rB, #4` then the index), while a
 * struct member -- or a row pointer bound to a local -- keeps it as the
 * `ldrh rD, [rB, #4]` displacement the ROM has. See the wave-13 A7 report. */
struct Unk08582764 /* 0x08 */
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u8 filler_06[0x02];
};

extern u8 gUnknown_0823BDE0[];
extern u8 gUnknown_081A3E28[];
extern u8 gUnknown_081A3E3C[];
extern u8 gUnknown_081A4000[];
extern u8 gUnknown_081A4450[];
/* The gUnknown_08581F7C twin of gUnknown_0202F200 -- same 0/1 mode flag set by
 * the same wrapper pair shape (sub_0806E160 stores 0, sub_0806E17C stores 1,
 * both immediately before `sub_080152EC(gUnknown_08581F7C, 2)`), and the same
 * evidence: five accesses, all bare `ldrb`/`strb` at displacement zero. */
extern u8 gUnknown_0202F2C8;
extern u16 gUnknown_0202F2D8;
extern u8 gUnknown_085826E0[];
extern u8 gUnknown_08582C7C[];
extern struct Unk08582764 gUnknown_08582764[];

/* The four saved-state words sub_0806ED7C copies into its proc, and the script
 * it starts afterwards. 0806ED7C is the resume twin of 0806EB5C: where EB5C
 * hard-codes `proc->unk30 = 1` and clears the halfword at 0202F2D8, ED7C loads
 * the same four proc fields out of this run of globals, which sit two bytes
 * apart in address order and match the fields' widths exactly:
 *
 *   0202F2CC  ldr  -> proc->unk2c   also the guard for the trailing Proc_Start
 *   0202F2D0  ldr  -> proc->unk30   and sub_0806F000's first argument
 *   0202F2D4  ldrh -> proc->unk34
 *   0202F2D6  ldrh -> proc->unk36
 *
 * Widths come from the load instruction and are corroborated by the proc
 * fields they feed, which sub_0806E5CC (u16 first parameter) reads back. The
 * two word ones are `u32` rather than a pointer type on the weakest-type rule:
 * 0202F2CC is only ever compared against zero and 0202F2D0 is only masked with
 * 1 and stored, so nothing dereferences either. 0202F2D8, declared above, is
 * the neighbouring halfword EB5C zeroes and ED7C leaves alone -- so this run is
 * 0202F2CC..0202F2D9 and nothing yet reaches 0202F2D2 or 0202F2DA. */
/* sub_0806C52C's two parallel graphics sets -- one per arm of a single
 * `if (sub_0803866C())`. The two arms are the same five calls with five
 * different symbols each, which is what fixes the types: the 081A2xxx/081A3Dxx
 * pair in each arm goes to ApplyPaletteExt so `u16 []`, the other three go to
 * Decompress(u8 *, void *) so `u8 []`, and none can be `const` because neither
 * prototype takes one (the -Werror reason recorded on the 0817Dxxxx group).
 * Sizes are unknown -- only the bare symbol is ever passed. The first
 * ApplyPaletteExt in each arm is (0, 0x200), i.e. ApplyPalettes(src, 0, 16), so
 * those two are at least 16 palettes; the second is ApplyPalette(src, 16). */
extern u16 gUnknown_081A21B4[];
extern u16 gUnknown_081A3D64[];
extern u8 gUnknown_0819C454[];
extern u8 gUnknown_081A1C50[];
extern u8 gUnknown_081A31C4[];
extern u16 gUnknown_0819C254[];
extern u16 gUnknown_081A3D44[];
extern u8 gUnknown_08195318[];
extern u8 gUnknown_0819BCF0[];
extern u8 gUnknown_081A2A04[];

extern u32 gUnknown_0202F2CC;
extern u32 gUnknown_0202F2D0;
extern u16 gUnknown_0202F2D4;
extern u16 gUnknown_0202F2D6;
extern const struct ProcCmd gUnknown_08582C5C[];

/* sub_0806BB08's screen blobs (parked near-miss, 94.2% at exact size, so the
 * types below are as good as the ones above it -- only one CSE decision on the
 * constant 0 separates that candidate from the ROM). 081951F4/08195214 are
 * ApplyPaletteExt sources so `u16 []` and non-const; the rest are Decompress
 * or sub_080718F8 arguments so `u8 []`. 0858175C is Proc_EndEach's script and
 * 085819D4 is Proc_Start's; 085819E4 goes to sub_080670F8(const u8 *).
 *
 * 081D9424 is 0x12 bytes memcpy'd onto a stack `u16 [9]` by sub_080867BC and
 * indexed as halfwords there. */
extern u8 gUnknown_08191ADC[];
extern u8 gUnknown_08194614[];
extern u8 gUnknown_08194A9C[];
extern u8 gUnknown_0819507C[];
extern u16 gUnknown_081951F4[];
extern u16 gUnknown_08195214[];
extern u8 gUnknown_08195234[];
extern u8 gUnknown_081952D4[];
extern u8 gUnknown_081B9A38[];
extern const u16 gUnknown_081D9424[];
extern const struct ProcCmd gUnknown_0858175C[];
extern const struct ProcCmd gUnknown_085819D4[];
extern const u8 gUnknown_085819E4[];

/* The five ROM blobs sub_08040CA4 hands to the graphics helpers. Each is typed
 * from its consumer and not from its address: 081214B4 goes to
 * `Decompress(u8 *, void *)` and 0812189C to `ApplyPaletteExt(u16 *, ...)`, so
 * neither can be `const`; 08121344, 08121870 and 081240BC are the three
 * animation scripts sub_0801C210 takes as `void *`. Sizes are unknown -- the
 * function only ever passes the bare symbol. */
extern u8 gUnknown_08121344[];
extern u8 gUnknown_081214B4[];
extern u8 gUnknown_08121870[];
extern u16 gUnknown_0812189C[];
extern u8 gUnknown_081240BC[];

/* wave 13 (A5), all six from sub_0805D438 -- the per-step body of the
 * gUnknown_030046B0 script interpreter.
 *
 * gUnknown_030044D8 is a gate: the step returns immediately unless it is zero.
 * gUnknown_03004680 has only its ADDRESS taken, as sub_08071908's sole
 * argument, so `u8 []` is the weakest model that still gives the clean pool
 * word -- same reasoning as gUnknown_084C38BC. */
extern u8 gUnknown_030044D8;
extern u8 gUnknown_03004680[];
/* Two 1-bit flags at bits 0 and 1 of byte 0. BITFIELDS rather than a scalar
 * mask, and the evidence is the constant form: sub_0805D438 clears them with
 * `movs #2; rsbs` and `movs #3; rsbs`, whereas a scalar `&= ~1` narrows to a
 * bare `movs #0xfe`. That is the `mov #N; neg` tell recorded in the bitfield
 * rules of docs/agbcc-codegen.md. */
struct Unk030045CC
{
    /* 0x00 */ u8 unk00_0:1;
               u8 unk00_1:1;
               u8 :6;
};
extern struct Unk030045CC gUnknown_030045CC;
/* sub_0805D438 zeroes +0x00, +0x13, +0x06 and +0x07 in that order when it
 * begins a step, and gates its whole tail on +0x13 afterwards. Nothing else
 * about the object is proved; every filler is the gap between two proved
 * offsets. */
struct Unk030046C0
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 filler_01[0x05];
    /* 0x06 */ u8 unk06;
    /* 0x07 */ u8 unk07;
    /* 0x08 */ u8 filler_08[0x0b];
    /* 0x13 */ u8 unk13;
};
extern struct Unk030046C0 gUnknown_030046C0;
/* A ROM word holding a pointer to 12-byte records -- the stride is
 * `((n*2)+n)*4` in sub_0805D438, i.e. exactly 12. Only the +4 member has a
 * user: the step parks `&g[gUnknown_030040D8->unk00].unk04` in
 * gUnknown_03004784, so that member is an array rather than a scalar. */
struct Unk085766E0 /* 0x0c */
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ u8 unk04[0x08];
};
extern struct Unk085766E0 *gUnknown_085766E0;
extern u8 *gUnknown_03004784;

/* Three more agbcc `.LC` constant-pool words, NOT globals -- same species as
 * gUnknown_08090D88 above, found in the 0x08136050-0x081360E0 block. They hold
 * &gUnknown_03001FBC, &gUnknown_0300451C and &gUnknown_0300453C respectively.
 *
 * CORRECTION (wave 19, W19-B). This entry used to say "use them the way
 * gUnknown_08090D88 is used: bind `&gUnknown_081360Ax` to a local and read
 * `**local`. Spelling the underlying global directly compiles to the right
 * BYTES but the wrong relocation, because agbcc then builds its own unplaceable
 * pool word." Both halves are now wrong. The word is placeable since wave 18
 * (tools/split_rodata.py), and naming the globals directly DOES make agbcc emit
 * all three words, in the ROM's own slot order -- but only once the function's
 * two-bit guard is spelled so that it does not fold into one test. With the
 * `&&` spelling agbcc emits no `.rodata` at all and the reroute is invisible;
 * with the nested-`if` spelling the three words appear. So the reachability of
 * a `.LC` word is decided by the CANDIDATE's control flow, not by whether the
 * object behind it is a scalar -- see docs/agbcc-codegen.md. sub_0804F18C is
 * still the worked case and is still open, but on register allocation now, and
 * its `c_local` draft is kept only as _clocal_nearmiss.c.
 *
 * These three declarations are therefore unused by any draft and are kept only
 * as documentation of what lives at those addresses. */
extern s16 *const gUnknown_081360A0;
extern u16 *const gUnknown_081360A4;
extern u16 *const gUnknown_081360A8;
/* TWO halfwords, not one. sub_0804F18C writes [0] with a bare `strh` (it
 * stores OamData.priority into it straight after setting that field), and
 * sub_08050958 writes BOTH -- `strh r3,[r6]` and `strh r0,[r6,#2]` off a
 * single pool word for gUnknown_0300454C -- with the pair copied out of
 * gUnknown_03001470[proc].unk30 / .unk34, i.e. the current side and slot. It
 * also reads [1] back (`ldrh r0,[r6,#2]`). One symbol reached at +2 is an
 * array or an aggregate, never two globals; `u16 []` is the weaker of the two
 * and nothing distinguishes them here. Was `extern u16 gUnknown_0300454C;`;
 * no promoted file names it, so nothing needed re-verifying. */
extern u16 gUnknown_0300454C[];
/* A ROM halfword per side, indexed [gUnknown_0300453C]. Two readers,
 * sub_0804F658 and sub_0804E584, and both do nothing but pass it as
 * sub_0804BCB8's third argument. `u16 []` rather than `s16 []`: the `ldrsh` at
 * both sites is the conversion to that parameter's narrow SIGNED type, not the
 * object's own width -- combine folds sign_extend(truncate(zero_extend(mem:HI)))
 * into one sign-extending load, so `ldrsh` says nothing about the table here.
 * Extent unproved; only [gUnknown_0300453C] is ever reached. */
extern u16 gUnknown_0855214C[];
/* ROM u16 pairs indexed [gUnknown_0300453C][gUnknown_0300450C] -- `i * 4 + j * 2`
 * off the symbol, the same [2]-wide row shape as gUnknown_0855239C. The value is
 * an x offset: sub_0804F18C sign-extends it and adds it to a sprite x. */
extern u16 gUnknown_085644E0[][2];
/* The u16 ROM table gUnknown_02028E5C's column 1 indexes, named in that
 * global's own comment since wave 13 and declared here in wave 18 from
 * sub_0804E7A8, which does
 * `gUnknown_02029A10[i].entries[j].y -= gUnknown_085644D4[row[1]]`
 * with `row = gUnknown_02028E5C[i]`. A y correction, read `ldrh`, extent
 * unproved. */
/* A ROM table of (x, y) pixel offsets indexed [side][phase * 2] and
 * [side][phase * 2 + 1], where `phase` is gUnknown_02029B94[side][slot], the
 * six-step counter above. Row stride is 24 bytes = 12 u16, emitted as
 * `(c * 2 + c) * 8`, and the two reads are 4 bytes apart within the row -- so
 * the row holds six (x, y) pairs, one per counter value, which is what makes
 * the [12] a real extent rather than a stride. `ldrh`; the x half is added to
 * gUnknown_02029A10[..].x and the y half is added to .y after a u16
 * truncation, so nothing here sign-extends. */
extern u16 gUnknown_085523B0[][12];
extern u16 gUnknown_085644D4[];

/* The twelve 0x14-byte animation descriptors sub_08022BB8 picks between, and
 * the halfword offset table it pairs them with. The descriptors are named one
 * at a time rather than indexed, so each gets its own declaration; they are
 * only ever passed on as `void *`. gUnknown_080909B8 is indexed with i and
 * i + 1 for an (x, y) pair, so the entries alternate. */
extern u16 gUnknown_080909B8[];
extern u8 gUnknown_08499B8C[];
extern u8 gUnknown_08499BA0[];
extern u8 gUnknown_08499BB4[];
extern u8 gUnknown_08499BC8[];
extern u8 gUnknown_08499BDC[];
extern u8 gUnknown_08499BF0[];
extern u8 gUnknown_08499C04[];
extern u8 gUnknown_08499C18[];
extern u8 gUnknown_08499C2C[];
extern u8 gUnknown_08499C40[];
extern u8 gUnknown_08499C54[];
extern u8 gUnknown_08499C68[];

/* The 0x08083 sprite-builder triple (sub_080831FC, sub_08083484, sub_08083738)
 * and their caller sub_080829B0 all key off this SIX-byte table, and the extent
 * is proved rather than guessed: the ROM bytes are 00 05 02 04 03 01, a
 * permutation of 0..5, and every reader indexes it with `DivRem(x, 6)`, so a
 * seventh element could never be reached. What sits at +6 is a DIFFERENT table
 * -- the s16 offsets that sub_080829B0 names separately as gUnknown_08616972 --
 * so the boundary is a type change, not an inference from the index.
 *   Left non-const: the three builders each read it four or five times with a
 * `bl DivRem` between every pair of reads and the ROM re-`ldrb`s every time,
 * which by the const-across-a-call tell in docs/agbcc-codegen.md is what an
 * unqualified declaration produces. The reads have different indices in
 * principle, so this is corroborating rather than decisive -- flagged. */
extern u8 gUnknown_0861696C[6];
/* The two s16 coordinate tables that sit immediately after gUnknown_0861696C,
 * read by the 0x08082-0x08083 sprite block (sub_080829B0, sub_08082C0C,
 * sub_08083034, sub_08083A44) as `gUnknown_08616972[i + 1]` /
 * `gUnknown_08616980[i + 1]` for i in a five- or six-step loop, plus a
 * constant-folded [3] on the loop's special index.
 *   s16 rather than u16 is PROVED, not assumed, and the discriminator is a pair
 * of sibling expressions in sub_080829B0's two i == 2 arms over the same
 * element of gUnknown_08616980:
 *     `g[3] | 0x100`        -> ldrh ; orr ; lsl #16 ; asr #16
 *     `(g[3] - 8) | 0x100`  -> ldrsh ; sub ; orr        (no re-extension)
 * The C front end's `shorten` fires on BIT_IOR when both operands narrow, so
 * the first form computes in HImode and needs a sign-extension back to SImode
 * -- which only exists if the element type is SIGNED. The second form's left
 * operand is a MINUS in SImode, which get_narrower cannot narrow, so no
 * shortening happens and the sign already came from the `ldrsh`. A u16 table
 * gives neither the `ldrsh` nor the trailing `asr`. `g[3] & 0x1FF` in the same
 * arms loads with `ldrh` and needs no extension because combine drops both
 * (the mask is below 0x8000) -- that one is NOT evidence either way.
 *   gUnknown_08616972's extent is proved by the next symbol: 0x08616980 -
 * 0x08616972 = 14 bytes = seven elements, ROM
 * {-0x80, -0x28, -0x08, 0x10, -0x08, -0x28, -0x80}, i.e. period six with the
 * wrap element materialised so `[i + 1]` at i = 5 need not be reduced.
 * gUnknown_08616980 is left unsized -- nothing bounds it; ROM begins
 * {0x83, 0x80, 0x70, 0x50, 0x30, 0x20, 0x1D}. Neither is const: every read is a
 * fresh load with a `bl DivRem` or `bl Interpolate` between. */
extern s16 gUnknown_08616972[7];
extern s16 gUnknown_08616980[];
/* Two more of the OAM sprite blobs described above, on the `u16 *` fourth
 * parameter of PutSprite and PutSpriteExt and reaching nothing else. Their
 * extents are proved by each other and by gUnknown_0861696C's neighbours:
 * gUnknown_08615C76 is 0x0002 plus two (y, x, tile) triples = 14 bytes, which
 * lands exactly on gUnknown_08615C84, and that one is 0x0004 plus four
 * triples = 26 bytes. Same model, and the same single piece of evidence, as
 * gUnknown_08615C04 above. */
/* One more OAM sprite blob on the same model: ROM is 0x0001 followed by one
 * (y, x, tile) triple, and its single reader hands it straight to
 * sub_0801BD00's `void *` third parameter with no arithmetic. Not const --
 * that parameter is not. */
extern u16 gUnknown_085806F2[];
extern u16 gUnknown_08615C76[];
extern u16 gUnknown_08615C84[];
/* Two OAM sprite blobs, both typed only by the `u16 *` fourth parameter of
 * PutSprite / PutSpriteExt, the same model as gUnknown_0849B6C8 and
 * gUnknown_08499E10. Each is an OBJ count followed by that many (y, x, tile)
 * triples: gUnknown_08615C04 begins 0x0002 and gUnknown_0848B6CE begins 0x0001,
 * which is why the count is not part of the type. Neither is const -- those
 * parameters are not. */
extern u16 gUnknown_08615C04[];
extern u16 gUnknown_0848B6CE[];
/* Same OAM-blob model again, and the same single piece of evidence: it reaches
 * nothing but PutSpriteExt's `u16 *` fourth parameter (sub_0807567C and one
 * neighbour, fanin 2). ROM begins 0x0001 followed by one (y, x, tile) triple. */
extern u16 gUnknown_086143D8[];
/* Another of the same OAM blobs, fanin 13, at the head of the 0x0848B6xx run
 * that gUnknown_0848B6CE also belongs to: ROM is 0x0001 plus one triple, i.e.
 * 8 bytes, and a second blob starts at +8. Only ever a PutSpriteExt `u16 *`. */
extern u16 gUnknown_0848B6A0[];
/* A TWELVE-byte u8 table, {2,3,4,5,2,3,4,5,2,3,4,5}, read as
 * `gUnknown_08615E40[proc->unk52]` with a plain `ldrb` by sub_08079EA4 and used
 * as `(entry + 4) << 12` in a PutSpriteExt OAM word -- so the entries are OBJ
 * palette or tile-bank indices, and the repeat of period 4 is what the caller's
 * +0x52 counter cycles through. The extent is proved by a type change rather
 * than by the index: +0x0c starts a run of address-shaped words
 * (0x081D9484, 0x081DA8D0, 0x081DBEC8), which cannot be part of a byte table.
 *   NOTE for tools/lc_screen.py: this symbol is reported as a `.LC` pool word
 * (fanin 1, density 4) and it is NOT one. The use is a direct base-plus-index
 * `ldrb`, not the double indirection a rerouted address constant produces, and
 * the ROM bytes are 02 03 04 05..., not an address. Dereference before
 * believing the classification -- the screen splits on fan-in and position in
 * a .rodata run, and a genuine low-fan-in ROM table inside such a run looks
 * identical to it. */
extern u8 gUnknown_08615E40[12];
/* Two more OAM blobs, this pair on PutSprite's `u16 *` rather than
 * PutSpriteExt's, drawn one after the other by sub_080748A0 through two
 * different OBJ affine slots. Each is 0x0001 plus one (y, x, tile) triple, i.e.
 * exactly 8 bytes, which the 8-byte gap between the two addresses confirms.
 *   NOTE for tools/lc_screen.py: BOTH are reported as `.LC` pool words and
 * neither is one -- same misclassification as gUnknown_08615E40 above, and the
 * spacing should have been the giveaway, since a -fforce-addr pool pair is 4
 * bytes apart and these are 8. Three of the four `.LC` words the screen
 * attributed to this batch were ordinary ROM tables. */
extern u16 gUnknown_081CC4C4[];
extern u16 gUnknown_081CC4CC[];

/* ---- wave 20 (W20-B), the 0x08084580-0x080848B4 loader block ----
 * An array of TWO-POINTER records, and the stride is proved by the two
 * functions that read it rather than by the ROM bytes: sub_080845A8 reads
 * `[i][0]` (`lsls r0,#3; adds; ldr`) and sub_080845C4 reads `[i][1]`
 * (`lsls r2,#3` with `adds r0,#4` applied to the BASE, which is what agbcc
 * emits for the second member of an 8-byte record and NOT what a flat pointer
 * array with index `i*2+1` emits -- that spelling reassociates into
 * `lsl #1; add #1; lsl #2` and is three instructions longer). Both elements
 * go straight to Decompress's `u8 *` first parameter, so the element type is
 * `u8 *` and neither is const (Decompress does not take const). Member 0 is
 * decompressed to 0x06013300 and member 1 to 0x06013B00 + i*0x400, i.e. the
 * pair is (a shared/base tile blob, a per-index 1 KB tile blob). The count is
 * not part of the type -- nothing in this block bounds i. */
extern u8 *gUnknown_08616AC0[][2];
/* A single compressed blob, sub_080845E8's only argument to Decompress
 * (destination 0x06015300). `u8 *` for the same reason as above. */
extern u8 gUnknown_0823D980[];
/* A single compressed blob, sub_0803F374's only argument to Decompress
 * (destination 0x06013940). Same shape and same `u8 []` model as
 * gUnknown_0823D980 above -- the two accessors are a loose duplicate pair that
 * differs only in the blob and the destination (wave 20, W20-C). */
extern u8 gUnknown_081169D0[];
/* A run of 16-colour PALETTES -- 32 bytes = 16 u16 each -- flat rather than
 * 2-D on purpose. Retyped from u8 to u16 in wave 20 when a second agent settled
 * sub_08084864's return from its caller (sub_08082660 hands it straight to
 * ApplyPaletteExt's `u16 *`); the `u8` model was byte-neutral in both accessors
 * and had no oracle, which is exactly the case docs/agbcc-codegen.md warns has
 * none. The element COUNT per entry is what the 32-byte stride pins. sub_08084864
 * returns `gUnknown_0823DC38 + i * 32` and sub_0808488C returns
 * `gUnknown_0823DC38 + (i + 6) * 32`; declared as `u8 [][32]` the second one
 * DOES NOT MATCH, because fold distributes the element-size multiply over the
 * `+ 6` and folds the product into the symbol (`.word gUnknown_0823DC38+0xc0`,
 * with the runtime `adds r0,r4,#6` gone). Written as explicit pointer
 * arithmetic on a flat array the `+ 6` survives, which is what the ROM has.
 * See docs/agbcc-codegen.md, wave 20 (W20-B). The 32-byte stride and the fact
 * that entry 6 is where the second function starts are the only things pinned;
 * the element is not otherwise typed here because nothing in this block reads
 * through it. */
extern u16 gUnknown_0823DC38[];
/* Two compressed tile blobs, each Decompressed into *gUnknown_08499580 by one
 * of the duplicate pair sub_080858C0 / sub_08085908. `u8 []` and NOT `const`:
 * Decompress's first parameter is `u8 *`, the same reason gUnknown_0823D980
 * above is not const (wave 21, W21-A). */
extern u8 gUnknown_0823DE38[];
extern u8 gUnknown_0823DF48[];
/* The two fixed fallbacks returned by sub_08084864 and sub_0808488C when
 * sub_08084858(i) is non-zero -- same role, same shape, 32 bytes apart, so
 * they are almost certainly two entries of one table that the source names
 * individually. Same `u16 *` as gUnknown_0823DC38, and not proven further:
 * every caller of the two functions is still asm-resident. */
extern u16 gUnknown_0812596C[];
extern u16 gUnknown_0812598C[];
/* Only byte 1 is ever touched here, by sub_08084600 (`ldrb r0,[r0,#1]`, tested
 * against 0) and by sub_0808135C. An array rather than a struct because nothing
 * yet reads a second field, and `u8` because both reads are `ldrb`. Byte 0 is
 * untouched by either, so the extent is not pinned -- do not widen this to a
 * scalar on the strength of the two reads. */
extern u8 gUnknown_0300591C[];
/* Two u16 tables of animation frame ids, both indexed by the same 0..7 selector
 * sub_08084600 computes, and picked between by gUnknown_0300591C[1]. The first
 * is one-dimensional (`lsls r0, r5, #1`); the second is TWO frames per selector
 * (`lsls r1,r5,#1; adds r1,r1,r0; lsls r1,r1,#1` -- i.e. [i * 2 + parity]) with
 * the parity coming from DivRem(unk66, 2). u16 from the `ldrh`, and both are
 * handed to sub_08014668's fourth parameter. Neither is const: they sit 16 bytes
 * apart, which bounds gUnknown_08616FA4 at 8 entries and is consistent with the
 * selector's 0..7 range. */
extern u16 gUnknown_08616FA4[];
extern u16 gUnknown_08616FB4[];

/* ---- wave 24 (W24-C), the 0x08078 block ---- */

/* An 8-byte record table. sub_0807831C is the only reader: it indexes it with
 * gUnknown_0202FDFC.unk0c + its own proc's +0x58 (`lsls #3` = 8-byte stride)
 * and hands word 0 straight to sub_08074AAC, whose first parameter is the
 * 0xFF-terminated `const u8 *` id list -- same type as gUnknown_08615984 and
 * gUnknown_08615988, and settled by that call rather than by any read here.
 * Word 4 is not read anywhere in the ROM, so the record is bounded at 8 bytes
 * by the stride alone and filler is the honest spelling for it. */
struct Unk861500C /* 0x08 */
{
    /* 0x00 */ const u8 *unk_00;
    /* 0x04 */ u8 filler_04[0x04];
};

extern const struct Unk861500C gUnknown_0861500C[];

/* What sub_0807831C's proc keeps at +0x54 and hands to sub_080782C0. That
 * function walks word 0 as a SIGNED byte list (`ldrsb` off a zero index
 * register, terminated by -1) using each entry to index
 * gUnknown_0202FDFC.unk12, and compares the resulting count against the two
 * `ldrb`s at +4 and +5. It is a pointer PARAMETER's type and would normally
 * live in the .c, but sub_080782C0's prototype needs it: typing the parameter
 * directly rather than assigning it to a local inside the body is what puts
 * `adds r3, r0, #0` in the prologue ahead of `mov ip, r1`, and a local costs
 * exactly that ordering. */
struct Unk80782C0
{
    /* 0x00 */ const s8 *unk_00;
    /* 0x04 */ u8 unk_04;
    /* 0x05 */ u8 unk_05;
};

/* Three ROM blobs handed to sub_080785CC's fourth parameter and to nothing
 * else -- sub_08078404, sub_08078420 and sub_080783BC respectively. That
 * callee only stores the pointer to +0x54 of the proc it starts, so nothing in
 * the ROM dereferences them and `const void *` is all the evidence supports.
 * Their sizes are unpinned. */
extern const u8 gUnknown_084B9F00[];
extern const u8 gUnknown_084BA210[];
extern const u8 gUnknown_084BA480[];

/* Two more proc scripts, both only ever handed to Proc_StartBlocking:
 *   08615ACC  sub_080785CC, which fills +0x2c/+0x30 (its first two arguments),
 *             +0x54 (the blob) and +0x58 (the third). sub_08078558 is one of
 *             its methods and reads +0x2c and +0x30 back.
 *   08615BBC  sub_08078968, no fields written.
 * `const struct ProcCmd []` for the same reason as every other entry in this
 * group -- it is proc.h's parameter type and nothing here reads the data. */
extern const struct ProcCmd gUnknown_08615ACC[];
extern const struct ProcCmd gUnknown_08615BBC[];

/* The two scripts sub_08078ED4 picks between on gUnknown_03003FC0.unk01 == 3.
 * Both go to Proc_Start under the caller's own parent. */
extern const struct ProcCmd gUnknown_08615D88[];
extern const struct ProcCmd gUnknown_08615DD8[];

/* NOT GLOBALS: gUnknown_081D92D8, gUnknown_081D92DC, gUnknown_081D92E0 and
 * gUnknown_081D92E4 are four consecutive `-fforce-addr` address-constant words
 * (addends 0, 4, 8, 0xc, the textbook pattern), and all four hold the SAME
 * value -- 0x03001FFC, i.e. &gUnknown_03001FFC, the volatile BLDY shadow
 * declared in include/hardware.h. Dereferencing them in baserom.gba is what
 * settles it; the splitter invents a `gUnknown_<addr>` for a pool word and a
 * real global alike and cannot tell them apart.
 *
 * So sub_08078BDC and sub_08078C18 are a fade-in / fade-out pair written
 * against gUnknown_03001FFC directly, and their apparent double indirection
 * (`ldr r2, =sym; ldr r1, [r2]; ldrh`) is the pool word, not a pointer
 * variable. Declaring a `u16 *` here instead compiles to THREE loads and does
 * not match. */

/* ---- wave 24 (W24-C), the 0x08078 block, second pass ---- */

/* Four 4-byte records, read out of baserom.gba as
 *     {0x61, 0x69, 0x28, 0xff}  {0x62, 0x6a, 0x0e, 0xff}
 *     {0x63, 0x6b, 0x16, 0xff}  {0x64, 0x6c, 0x1e, 0xff}
 * and walked by sub_08078358 alone (`adds r4, #4`, i = 0..3). Bytes 0 and 1 are
 * tags handed to sub_0803CBD8; bytes 2 and 3 are a 0xFF-terminated id list
 * handed to sub_08074AAC, and byte 2 is ALSO read on its own to index
 * gUnknown_0202FDFC.unk12. `s8` for that pair because the read is `ldrsb` and
 * because 0xff is the -1 terminator sub_080782C0 walks its own list against --
 * the same element type, one indirection down. The `const u8 *` cast at the
 * sub_08074AAC call is the cost of that choice and is byte-free.
 *
 * This is the record the gUnknown_08615984 comment above predicted: the
 * 0x08615974-0x0861598B block really is two unrelated things at 4-byte
 * granularity, and reading the ROM confirms it rather than inferring it. */
struct Unk8615974 /* 0x04 */
{
    /* 0x00 */ u8 unk_00;
    /* 0x01 */ u8 unk_01;
    /* 0x02 */ s8 unk_02[2];
};

extern const struct Unk8615974 gUnknown_08615974[];

/* The fourth script sub_08078198 tests for existence, alongside 086147FC,
 * 0861485C and 08614894 which are already declared above. */
extern const struct ProcCmd gUnknown_08614614[];
/* Proc_Start'd by sub_08078E94 under a caller-supplied parent when
 * sub_08078E20's predicate is false. */
extern const struct ProcCmd gUnknown_08615D70[];

#endif // UNKNOWN_GLOBALS_H
