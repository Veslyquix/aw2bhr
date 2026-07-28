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

/* 0x10 bytes: sub_08017A58/sub_08017B8C/sub_08017BB0 all advance a cursor of
 * this type by exactly 0x10. unk04 is a `next` link in sub_08018BAC and the
 * destination address of a store in sub_08017B8C/sub_08017BB0, which cast it;
 * unk0c is the value written there.
 */
struct UnkC528Node /* 0x10 */
{
    /* 0x00 */ u8 filler_00[4];
    /* 0x04 */ struct UnkC528Node *unk04;
    /* 0x08 */ u8 filler_08[4];
    /* 0x0c */ u32 unk0c;
};

struct UnkC528 /* 0x18 */
{
    /* 0x00 */ struct UnkC528Node *unk00;
    /* 0x04 */ struct UnkC528Node *unk04;
    /* 0x08 */ u8 filler_08[0x04];
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
    /* 0x1f */ u8 filler_1f[0x09];
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
    /* 0x00 */ u32 unk00;
    /* 0x04 */ u32 unk04;
    /* 0x08 */ u8 unk08; /* sub_08016A14 bumps it while bit 0 is clear */
    /* 0x09 */ u8 filler_09[0x17];
    /* 0x20 */ u8 unk20[0x18];
    /* 0x38 */ u8 filler_38[0xa8];
};

/* Reached as a struct, not as the u16 array it was first declared as: there is
 * a `strb` at +6, which no u16 element addresses. The distinction is not
 * cosmetic -- sub_08003934's `|= 8` at +0 only matches through an aggregate
 * member lvalue (see the `orr` operand rule in docs/agbcc-codegen.md), so a
 * scalar spelling of this global cannot express it at all.
 */
struct Unk0200B0B0 /* >= 0x4e */
{
    /* 0x00 */ u16 unk00; /* flags; bit 3 set by sub_08003934, cleared by sub_08003948 */
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u8 unk06;
    /* 0x07 */ u8 filler_07[0x28];
    /* 0x2f */ u8 unk2f; /* set by sub_080078D4 */
    /* 0x30 */ u8 filler_30[0x1c];
    /* 0x4c */ u16 unk4c;
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
    /* 0x00 */ u8 filler_00[0x13];
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u8 filler_14[0x08];
};

struct Unk02029A10 /* 0x24 */
{
    /* 0x00 */ u8 filler_00[0x08];
    /* 0x08 */ u16 x;
    /* 0x0a */ u16 y;
    /* 0x0c */ u16 xSub;
    /* 0x0e */ u16 ySub;
    /* 0x10 */ u16 xStep;
    /* 0x12 */ u16 yStep;
    /* 0x14 */ u16 frame;
    /* 0x16 */ u16 frameCount;
    /* 0x18 */ u8 filler_18[0x0c];
};

struct Unk02029A10Group /* 0xb4 */
{
    /* 0x00 */ struct Unk02029A10 entries[5];
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
    /* 0x15 */ u8 filler_15[0x11];
    /* 0x26 */ u16 unk26;
    /* 0x28 */ u8 filler_28[0x10];
    /* 0x38 */ u16 unk38;
    /* 0x3a */ u8 filler_3a[0x26];
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

union Unk802C57CBuf
{
    struct Unk802C57C pos;
    u32 raw;
};

struct Unk03003FC0 /* 0x47 */
{
    /* 0x00 */ u8 filler_00[0x02];
    /* 0x02 */ u8 unk02;
    /* 0x03 */ u8 unk03;
    /* 0x04 */ u8 filler_04[0x02];
    /* 0x06 */ u8 unk06;
    /* 0x07 */ u8 unk07;
    /* 0x08 */ u8 filler_08[0x25];
    /* 0x2d */ u8 unk2d; /* set to 0/1/2 by sub_08035558/sub_08035538/sub_08035548 */
    /* 0x2e */ u8 filler_2e[0x04];
    /* 0x32 */ u8 unk32;
    /* 0x33 */ u8 filler_33[0x10];
    /* 0x43 */ u8 unk43;
    /* 0x44 */ u8 unk44;
    /* 0x45 */ u8 unk45;
    /* 0x46 */ u8 unk46;
};

struct Unk030040D8
{
    /* 0x00 */ u8 filler_00[0x05];
    /* 0x05 */ u8 unk05;
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

struct Unk08499594 /* 0x0c */
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 filler_01[0x0b];
};

/* Merged from eight variants -- the widest disagreement in the tree. Every
 * variant agreed on 0x3c total; they differed only in which bytes they had
 * bothered to name.
 */
struct Unk08499598 /* 0x3c */
{
    /* 0x00 */ u8 filler_00[0x0c];
    /* 0x0c */ u8 unk0c;
    /* 0x0d */ u8 unk0d;
    /* 0x0e */ u8 unk0e;
    /* 0x0f */ u8 unk0f;
    /* 0x10 */ u8 filler_10[0x03];
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler_16[0x04];
    /* 0x1a */ u8 unk1a;
    /* 0x1b */ u8 unk1b;
    /* 0x1c */ u8 filler_1c[0x01];
    /* 0x1d */ u8 unk1d; /* indexes gUnknown_085D3DD0 (sub_08043D84) */
    /* 0x1e */ u8 unk1e;
    /* 0x1f */ u8 unk1f;
    /* 0x20 */ u32 unk20;
    /* 0x24 */ u8 filler_24[0x01];
    /* 0x25 */ u8 unk25;
    /* 0x26 */ u16 unk26;
    /* 0x28 */ u16 unk28;
    /* 0x2a */ u8 filler_2a[0x07];
    /* 0x31 */ u8 unk31;
    /* 0x32 */ u8 filler_32[0x08];
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

struct Unk0849B018 /* 0x0a */
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ volatile u16 unk04; /* volatile: sub_08030574's plain `= 5` emits a
                                    * dead `ldrh` of the field right before the
                                    * `strh`, which a non-volatile member does not */
    /* 0x06 */ s8 unk06; /* signed: sub_0802F4F4 reads it ldrb; lsls #24; asrs #24 */
    /* 0x07 */ u8 filler_07[0x02];
    /* 0x09 */ u8 unk09;
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

struct Unk08580934
{
    /* 0x00 */ u8 filler_00[0x74];
    /* 0x74 */ struct Unk08580934_Sub *unk74[1];
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
    /* 0x00 */ u8 filler_00[0x28];
    /* 0x28 */ u8 unk28;
    /* 0x29 */ u8 filler_29[0x03];
    /* 0x2c */ u32 unk2c;
    /* 0x30 */ u8 filler_30[0x0c];
    /* 0x3c */ u8 unk3c[4];
    /* 0x40 */ u8 filler_40[0x1c];
};

/* Stride 0x104; sub_08042E18 reads unk16. */
struct Unk085D3DD0 /* 0x104 */
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u8 filler_06[0x0f];
    /* 0x15 */ u8 unk15;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ u8 filler_17[0xed];
};

struct Unk085D5ABC /* 0x5c */
{
    /* 0x00 */ u8 filler_00[0x06];
    /* 0x06 */ u16 unk06;
    /* 0x08 */ u8 filler_08[0x02];
    /* 0x0a */ u8 unk0a;
    /* 0x0b */ u8 filler_0b[0x01];
    /* 0x0c */ u8 unk0c;
    /* 0x0d */ u8 filler_0d[0x02];
    /* 0x0f */ u8 unk0f;
    /* 0x10 */ u8 filler_10[0x0e];
    /* 0x1e */ u8 unk1e[2][0x1a];
    /* 0x52 */ u8 filler_52[0x0a];
};

/* -------------------------------------------------------------- EWRAM -- */

extern struct Unk0200B0B0 *gUnknown_0200B0B0;
/* Exactly 0x20 bytes -- gUnknown_0200B614 is the next symbol, and every user
 * indexes 0..0x1f. SIGNED: the ARM routine sub_08000234 reads it with `ldrsb`
 * and adds the value to a palette component. sub_080136C4 clears all 32. */
extern s8 gUnknown_0200B5F4[0x20];
extern struct Unk0200C420 gUnknown_0200C420;
extern u32 gUnknown_0200C500[2];
extern struct UnkC528 gUnknown_0200C528[];
extern struct SpriteEntry gUnknown_0200D510[];
extern struct Unk0200E438 gUnknown_0200E438[];
extern struct Unk0200F720 gUnknown_0200F720[];
extern struct Unk0200F920 gUnknown_0200F920[];
extern struct Unk02027F74 gUnknown_02027F74;
extern struct Unk02028030 gUnknown_02028030;
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
extern struct Unk02029A10Group gUnknown_02029A10[];

/* -------------------------------------------------------------- IWRAM -- */

/* 16 entries: sub_08011B18 clears indices 0..15 and sub_08011B34 stops
 * scanning at gUnknown_03000040, the next symbol in the linker script. */
extern void *gUnknown_03000000[];
extern u16 gUnknown_03000040;
/* A u16 pair set together by sub_0801224C. Two separate pool words in that
 * function, so they are two scalars rather than one aggregate. */
extern u16 gUnknown_03000044;
extern u16 gUnknown_03000046;
extern struct Unk03000278 gUnknown_03000278;
extern struct Unk03000288 gUnknown_03000288[];
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
/* SIGNED: sub_08057CA4 reads it back with `ldrsh`. Written 0 and 1 as flags
 * by sub_08057B2E and sub_08057BCC. */
extern s16 gUnknown_030005E8[];
extern u8 gUnknown_03000650[];
/* A callback slot: sub_0801F4A4 stores &sub_0801F4B4 into it and nothing else
 * touches it yet, so the pointed-to signature is only as good as sub_0801F4B4's
 * own prototype in unknown-functions.h. Declared unprototyped on purpose.
 */
extern void (*gUnknown_030013EC)();
extern u16 gUnknown_03001400;
extern u16 gUnknown_03001404;
extern u16 gUnknown_03001418;
/* VOLATILE: sub_08017EEC reads it twice -- once into gUnknown_030030A8 and once
 * for gUnknown_03001FF4 = it + 0x6f -- and the two named globals in between
 * cannot alias it, so plain agbcc CSEs the pair into one `ldrh`. The qualifier
 * keeps both loads and still emits `ldrh` rather than the `ldrsh` an s16 would.
 */
extern volatile u16 gUnknown_03001420;
extern struct Unk03001470 gUnknown_03001470[];
extern s16 gUnknown_03001FBC;
extern u32 gUnknown_03001FD4;
extern u32 gUnknown_03001FE0;
/* A callback, not a data word: sub_080198F0 does `ldr r0,[r0]; cmp r0,#0;
 * beq; bl _call_via_r0` and then tests the result with `lsls #24`. Cleared by
 * sub_080198C4 and sub_08017F0C; saved/restored alongside gUnknown_03002F20
 * by sub_080171B4 / sub_08017540. */
extern bool8 (*gUnknown_03001FF0)(void);
extern u16 gUnknown_03001FF4;
extern u16 gUnknown_03001FF8;
extern u16 gUnknown_03002000;
extern u16 gUnknown_0300200C;
extern struct Unk03002040 gUnknown_03002040;
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
extern u16 gUnknown_0300251C;
extern u16 gUnknown_03002520[];
/* Paired with gUnknown_030030D0 -- an x/y scroll origin subtracted from
 * gUnknown_03001418 / gUnknown_03001FF8 when sub_08012420 writes BGxHOFS.
 * Always ldrh/strh. Cleared together by sub_08013324/sub_08013388/sub_0801339C. */
extern u16 gUnknown_03002B20;
extern struct SpriteEntry *gUnknown_03002B24;
/* A 0/1 toggle: sub_080129B4 flips it with `1 - x` and pushes the result into
 * REG_BLDCNT's effect field. volatile because that function re-reads it after
 * the store instead of reusing the value it just computed -- GCC is otherwise
 * free to forward the untruncated `1 - x`, since every consumer is a 16-bit
 * store, and the reload disappears. */
extern volatile u16 gUnknown_03002B2C;
extern u8 gUnknown_03002B30;
extern u16 gUnknown_03002B34;
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
extern u16 gUnknown_03002F18;
/* A 0/1 flag, always ldrh/strh. sub_08013028 and sub_080160DC set it,
 * sub_08016094 tests it and clears it. */
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
/* The y half of the scroll origin pair whose x half is gUnknown_03002B20. */
extern u16 gUnknown_030030D0;
extern volatile u16 gUnknown_030030E8;
extern struct Unk030030F0 gUnknown_030030F0;
extern union Unk802C57CBuf gUnknown_03003100;
extern struct Unk03003130 gUnknown_03003130;
extern u16 gUnknown_030032C0;
extern struct Unk802C57C gUnknown_030032C4;
extern u16 gUnknown_030032D8;
extern struct Unk03003338 *gUnknown_03003338;
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
extern union Unk802C57CBuf gUnknown_03003F24;
/* At least 7 bytes: sub_0803BBD4 clears [0..6] through a variable index, so
 * this really is an array and not a struct. Elements are SIGNED --
 * sub_0803BB44/BB5C/BB74 and sub_0803B8E0/B904 all read one with
 * `ldrb; lsl #24; asr #24`. The getters at 0803BC7C/BC88/BC94 return the same
 * bytes zero-extended, i.e. as u8.
 */
extern s8 gUnknown_03003F30[];
extern int gUnknown_03003F40;
extern void *gUnknown_03003F68;
extern struct Unk03003FC0 gUnknown_03003FC0;
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
extern struct Unk030040D8 *gUnknown_030040D8;
/* SIGNED: sub_08034FC0 reads it back with `ldrsh` for its `!= 0` guard before
 * decrementing. sub_08034FB0 increments it. */
extern s16 gUnknown_030040E8;
extern void (*gUnknown_030040EC)(void);
/* A bitmask, ANDed against gUnknown_03004008 in sub_080369BC to gate a frame.
 * u16 (ldrh); cleared by sub_08036B28 and sub_08036B34. */
extern u16 gUnknown_030043F4;
extern struct Unk802C57C gUnknown_030044A4;
extern struct Unk030044E0 *gUnknown_030044E0;
extern u16 gUnknown_03004518;
extern u16 gUnknown_03004538;
extern u16 gUnknown_030045D4;
extern u16 gUnknown_03004780;
/* Write cursor into the gUnknown_03005948/58 byte arrays, post-incremented
 * per record by sub_08078608 and its siblings.
 */
extern u32 gUnknown_03005944;
/* A word-sized 0/1 flag: sub_08082412 toggles it with `~g & 1`, five sites
 * test the whole word, and sub_080846F4 returns just its low byte. */
extern u32 gUnknown_03005968;
/* Five words, cleared/filled as a unit by sub_08078740 and sub_08078758. */
extern u32 gUnknown_030059C0[];

/* ---------------------------------------------------------------- ROM -- */

extern struct Unk08090CD8 *const gUnknown_08090CD8;
extern const s16 gUnknown_08090EAC[];
/* 0x280 bytes = 20 uncompressed 4bpp tiles; sub_08037258 returns its address.
 * Non-const because nothing constrains it yet and const is the direction that
 * breaks under -Werror. */
extern u8 gUnknown_080913BC[];
/* 0x1a4-byte compressed blob, handed to Decompress(u8 *, void *) by
 * sub_0802D5B8 via the accessor sub_08037250 -- hence u8 *, not const. */
extern u8 gUnknown_080D3FE4[];
extern const struct ProcCmd gUnknown_086140D4[];
extern u8 gUnknown_0810BE60[];
extern u8 gUnknown_0810E6E0[];
extern u8 gUnknown_0810E820[];
extern const u8 gUnknown_08106A64[][32];
extern const u8 gUnknown_08108264[][32];
/* Compressed blobs, 0x2f8 and 0x37c bytes. Non-const because both are only
 * ever handed to Decompress(u8 *, void *), whose prototype takes u8 *. */
extern u8 gUnknown_08126244[];
extern u8 gUnknown_0812653C[];
extern u8 gUnknown_081268F8[]; /* handed out by sub_0801F49C */
/* Two proc scripts started as a pair -- sub_08011550/sub_080115E0 run 0848923C
 * and sub_0801156C/sub_080115F8 run 0848925C, in both cases stashing a u16 at
 * +0x64 of the new proc. */
extern const struct ProcCmd gUnknown_0848923C[];
extern const struct ProcCmd gUnknown_0848925C[];
/* A proc script: sub_08014BC0 and sub_08014C74 both hand it to Proc_Start. */
extern const struct ProcCmd gUnknown_0848A140[];
extern u16 *gUnknown_08499578;
extern u16 *gUnknown_0849957C;
extern u16 *gUnknown_08499580;
extern u8 *gUnknown_08499590;
extern struct Unk08499594 *gUnknown_08499594;
extern struct Unk08499598 *gUnknown_08499598;
extern void *gUnknown_08499E38[];
extern const struct Unk0849A2C8 gUnknown_0849A2C8[];
extern const struct Unk0849A354 gUnknown_0849A354[];
extern struct Unk0849B018 *gUnknown_0849B018;
extern struct Unk0849B060 *gUnknown_0849B060;
extern const struct Unk0849CD88 gUnknown_0849CD88[];
extern struct Unk0849D5F8 *gUnknown_0849D5F8;
extern struct Unk0849ECDC *gUnknown_0849ECDC;
extern const struct ProcCmd gUnknown_0849FB44[];
/* Named proc scripts reached from this file. Declared non-const to agree with
 * the existing declaration in src/title-screen.c. */
extern struct ProcCmd ProcScr_MainMenu[];
extern const struct Unk084A06F0 gUnknown_084A06F0[];
extern const struct ProcCmd gUnknown_084A07E8[];
extern struct Unk084C1430 *gUnknown_084C1430;
extern struct Unk084C3240 *gUnknown_084C3240;
extern u32 *gUnknown_08555450[];
extern struct Unk08580934 *gUnknown_08580934;
extern const struct Unk085C77A0 gUnknown_085C77A0[];
extern const s16 gUnknown_08580E64[];
extern const struct Unk085D3DD0 gUnknown_085D3DD0[];
extern const struct Unk085D5ABC gUnknown_085D5ABC[];

#endif // UNKNOWN_GLOBALS_H
