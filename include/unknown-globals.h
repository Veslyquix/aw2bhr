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
struct Unk0200B0B0 /* >= 0x76 */
{
    /* 0x00 */ u16 unk00; /* flags; bit 3 set by sub_08003934, cleared by sub_08003948;
                           * bit 14 set by sub_08004BC0 */
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u8 unk06;
    /* 0x07 */ u8 filler_07[0x21];
    /* 0x28 */ u16 unk28; /* index into gUnknown_0200B224 (sub_08001CE8) */
    /* 0x2a */ u8 filler_2a[0x05];
    /* 0x2f */ u8 unk2f; /* set by sub_080078D4 */
    /* 0x30 */ u8 filler_30[0x1c];
    /* 0x4c */ u16 unk4c;
    /* 0x4e */ u8 filler_4e[0x1e];
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
    /* 0x00 */ u8 filler_00[0x10];
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
    /* 0x15 */ u8 filler_15[0x0b];
    /* 0x20 */ u16 unk20; /* every sub_080152EC caller that stores anything
                           * stores a halfword here (sub_08035144,
                           * sub_08042B84) */
    /* 0x22 */ u8 filler_22[0x04];
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

union Unk802C57CBuf
{
    struct Unk802C57C pos;
    u32 raw;
};

struct Unk03003FC0 /* 0x47 */
{
    /* 0x00 */ u8 filler_00[0x01];
    /* 0x01 */ u8 unk01; /* set to 3 by sub_0803B8C4, alongside Proc_Start */
    /* 0x02 */ u8 unk02;
    /* 0x03 */ u8 unk03;
    /* 0x04 */ u8 unk04; /* strb, sub_08018C54 */
    /* 0x05 */ u8 filler_05[0x01];
    /* 0x06 */ u8 unk06;
    /* 0x07 */ u8 unk07;
    /* 0x08 */ u8 unk08; /* a mode flag: the whole sub_08042E2C..sub_0804301C
                          * table-lookup family reads it and returns a fixed
                          * fallback when it is zero */
    /* 0x09 */ u8 filler_09[0x24];
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
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 filler_01[0x03];
    /* 0x04 */ u16 unk04_0:7; /* ldrb [.,#4]; lsls #25; lsrs #25 */
               u16 unk04_7:4; /* ldrh [.,#4]; lsls #21; lsrs #28 -- spans into
                               * byte 5, which is why the container is u16 */
               u16 unk05_3:5; /* byte 5 bits 3..7, kept by `movs #7; ands` */
    /* 0x06 */ u8 unk06_0:7;  /* sub_08025B80: ldrb [.,#6]; lsls #25; lsrs #25,
                               * cleared with `movs #0x80; rsbs` = ~0x7f */
               u8 unk06_7:1;  /* sub_08042998: lsrs #7 */
    /* 0x07 */ u8 filler_07[0x05];
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
    /* 0x16 */ u8 filler_16[0x04];
    /* 0x1a */ u8 unk1a; /* sub_0803D6D0 snapshots [0..4] of these into
                          * gUnknown_030040F8, one per player slot */
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
    /* 0x2a */ u8 unk2a; /* sub_08026F9C/sub_08026FD0 compare it between two
                          * entries; both reach it as element [n + 1], so the
                          * runtime offset is 0x3c + 0x2a = 0x66 */
    /* 0x2b */ u8 filler_2b[0x06];
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
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ volatile u16 unk04; /* volatile: sub_08030574's plain `= 5` emits a
                                    * dead `ldrh` of the field right before the
                                    * `strh`, which a non-volatile member does not */
    /* 0x06 */ s8 unk06; /* signed: sub_0802F4F4 reads it ldrb; lsls #24; asrs #24 */
    /* 0x07 */ u8 filler_07[0x02];
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
struct Unk08580934_Obj /* >= 0x3e */
{
    /* 0x00 */ u8 filler_00[0x1c];
    /* 0x1c */ u16 unk1c;
    /* 0x1e */ u8 filler_1e[0x06];
    /* 0x24 */ u16 unk24;
    /* 0x26 */ u16 unk26;
    /* 0x28 */ s16 unk28;
    /* 0x2a */ u8 filler_2a[0x0e];
    /* 0x38 */ u16 unk38;
    /* 0x3a */ u16 unk3a;
    /* 0x3c */ u16 unk3c;
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
struct Unk08580934
{
    /* 0x00 */ u8 filler_00[0x2d];
    /* 0x2d */ u8 unk2d;
    /* 0x2e */ u8 filler_2e[0x16];
    /* 0x44 */ struct Unk08580934_Obj *unk44[0xc];
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
    /* 0x00 */ u8 filler_00[0x1a];
    /* 0x1a */ u16 unk1a; /* ldrh, tested against 0 by sub_0802C660 */
    /* 0x1c */ u8 filler_1c[0x0c];
    /* 0x28 */ u8 unk28;
    /* 0x29 */ u8 filler_29[0x03];
    /* 0x2c */ u32 unk2c;
    /* 0x30 */ u8 filler_30[0x0c];
    /* 0x3c */ u8 unk3c[4];
    /* 0x40 */ u8 filler_40[0x1c];
};

/* Stride 0x104; sub_08042E18 reads unk16. */
/* The 0x44-byte sub-record at +0x40 of struct Unk085D3DD0. Stride proved by
 * `lsls #4; adds` (x17) sharing the outer `lsls #2` with the x65 outer index in
 * sub_08042E2C, sub_08042E84, sub_08042EDC, sub_08042FC4 and sub_0804301C --
 * i.e. base + a*0x104 + b*0x44 + K, with K running 0x40, 0x46, 0x48, 0x4a,
 * 0x4e. Placing the sub-array at +0x40 is what makes those five K values fall
 * on member offsets 0, 6, 8, 0x0a, 0x0e. The extent (2) is NOT proved: nothing
 * bounds b, and 2 is simply the most that fits before 0x104. */
struct Unk085D3DD0Entry /* 0x44 */
{
    /* 0x00 */ u32 unk00;
    /* 0x04 */ u8 filler_04[0x02];
    /* 0x06 */ s16 unk06;
    /* 0x08 */ s16 unk08;
    /* 0x0a */ s16 unk0a;
    /* 0x0c */ u8 filler_0c[0x02];
    /* 0x0e */ s16 unk0e;
    /* 0x10 */ u8 filler_10[0x34];
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
    /* 0x17 */ u8 filler_17[0x29];
    /* 0x40 */ struct Unk085D3DD0Entry unk40[2];
    /* 0xc8 */ u8 filler_c8[0x3c];
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
 *     cmdPtr at +0x40 and patternStack[] at +0x44 (it is ply_pend).
 *
 * Fields marked `filler` are the canonical names carried over from the public
 * layout but unproved HERE; narrow one when a function needs it, do not move
 * anything.
 */
#define MPLAY_ID_NUMBER 0x68736D53 /* 'Smsh' */
#define MUSICPLAYER_STATUS_PAUSE 0x80000000
#define FADE_VOL_SHIFT 2
#define TEMPORARY_FADE 0x0001

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

struct MusicPlayerTrack /* 0x50 */
{
    /* 0x00 */ u8 flags;
    /* 0x01 */ u8 wait;
    /* 0x02 */ u8 patternLevel;
    /* 0x03 */ u8 repN;
    /* 0x04 */ u8 filler_04[0x1a];
    /* 0x1e */ u8 echoVolume;
    /* 0x1f */ u8 echoLength;
    /* 0x20 */ void *chan;
    /* 0x24 */ struct ToneData tone;
    /* 0x30 */ u8 filler_30[0x10];
    /* 0x40 */ u8 *cmdPtr;
    /* 0x44 */ u8 *patternStack[3];
};

struct MusicPlayerInfo /* 0x40 */
{
    /* 0x00 */ void *songHeader;
    /* 0x04 */ u32 status;
    /* 0x08 */ u8 filler_08[0x1c];
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
/* Exactly 0x20 bytes -- gUnknown_0200B614 is the next symbol, and every user
 * indexes 0..0x1f. SIGNED: the ARM routine sub_08000234 reads it with `ldrsb`
 * and adds the value to a palette component. sub_080136C4 clears all 32. */
extern s8 gUnknown_0200B5F4[0x20];
extern struct Unk0200C420 gUnknown_0200C420;
extern u32 gUnknown_0200C500[2];
extern struct Unk0200C528 gUnknown_0200C528[];
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
/* A double-buffer pointer pair, swapped whole by sub_08073AE8. Both hold
 * addresses: sub_08073C1E feeds gUnknown_0202FDE0 straight to REG_DMA0SAD, and
 * sub_08073930 stores gUnknown_0202FDDC through a pointer read out of ROM.
 * gUnknown_0202FDE4 is a third slot filled from the same source by sub_08073A80
 * and is not declared yet -- nothing matched reaches it. */
extern void *gUnknown_0202FDDC;
extern void *gUnknown_0202FDE0;
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
 */
extern u32 gUnknown_03000560;
extern u32 gUnknown_03000564;
extern u32 gUnknown_03000568;
extern u32 gUnknown_03000570;
extern u32 gUnknown_03000574;
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
/* At least 0x20 halfwords: sub_0801DA94 clears [0..0x1f] through a variable
 * index. SIGNED elements -- sub_0801DAB0 scans the same 0x20 with
 * `movs r5,#0; ldrsh r0,[r2,r5]`, which is the s16-object tell; the plain
 * `strh 0` writers (sub_0801DA94, sub_0801DAE8) cannot see the difference.
 * sub_0801DAE8 takes an s16 index and skips -1, so -1 is "no slot". */
extern s16 gUnknown_03001430[];
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
/* volatile is load-bearing: sub_0804BA4C ends with a self-assignment
 * (`ldrh r0,[r1]; strh r0,[r1]` on one address, nothing else), and agbcc drops
 * `g = g` entirely on a plain object -- the whole store disappears from the
 * emitted code. Only a volatile lvalue keeps both halves. The other user,
 * sub_080122EC's `gUnknown_03002F18 = 0`, is a bare scalar store and is
 * byte-identical either way (verified with trymatch after the change). */
extern volatile u16 gUnknown_03002F18;
extern struct Unk03002F08 gUnknown_03002F08;
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
/* At least 3 bytes: sub_08035568 clears [0..2] through a variable u16 index
 * (`cmp #2; bls`), so this is an array rather than a struct. `strb`, so the
 * element is byte-sized; nothing has read one yet, so the signedness is open. */
extern u8 gUnknown_03003124[];
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
/* Five bytes, one per player slot. sub_0803D6B8 fills [0..4] with the identity
 * permutation 0..4 (descending index loop); sub_0803D6D0 refills it from
 * gUnknown_08499598[i].unk1a and sub_0803D6FC from a caller-supplied buffer at
 * +0x4C4. All three write with `strb` through a variable index, so this is a
 * u8 array; no reader has settled the signedness. */
extern u8 gUnknown_030040F8[];
/* A bitmask, ANDed against gUnknown_03004008 in sub_080369BC to gate a frame.
 * u16 (ldrh); cleared by sub_08036B28 and sub_08036B34. */
extern u16 gUnknown_030043F4;
extern struct Unk802C57C gUnknown_030044A4;
/* A parking slot for gUnknown_030032D8: sub_08028CD8 moves 030032D8 here and
 * writes 0x10 in its place, sub_08034ED0 moves it back and zeroes this one.
 * ldrh/strh throughout, and sub_080346BC compares it against 0xe. */
extern u16 gUnknown_030044DC;
extern struct Unk030044E0 *gUnknown_030044E0;
extern struct Unk03004504 gUnknown_03004504;
extern u16 gUnknown_03004518;
extern u16 gUnknown_03004538;
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
extern void (*gUnknown_03004778)(void);
extern u16 gUnknown_03004780;
/* The record payload array the gUnknown_03005944 cursor family writes into.
 * u8 elements: every access in the ROM is `ldrb`/`strb` through the symbol
 * address plus a variable index (sub_08078608/58/A4/sub_080786F0 write three
 * bytes per record, sub_08044C10 and the 0x0807Cxxx readers read them back).
 * Indexed by a caller-supplied cursor, not by gUnknown_03005944.
 */
extern u8 gUnknown_030058E0[];
/* Word flag guarding an optional sub-proc; set/cleared by sub_08080F3C and
 * sub_08080F90, tested `!= 0` as a whole word by sub_08081290 and 0x080814E0.
 */
extern u32 gUnknown_030058FC;
/* Word cell, `ldr`/`str` everywhere (sub_08080FB8 tests it `!= 0`,
 * sub_08081E54 stores into it). */
extern u32 gUnknown_03005920;
/* Word cell holding a small state id -- sub_08080F3C and sub_08080F90 both set
 * it to 6. Read whole with `ldr` and stored into a u16 proc field at +0x66 by
 * 0x0808151C, which is where the `ldr; strh` pairing in sub_0807BE24 comes
 * from too. */
extern u32 gUnknown_03005924;
/* Word cell; the only reference in the ROM is sub_0807BE24, which reads it
 * `ldr` and stores it into a u16 proc field at +0x4c. `ldr` rather than `ldrh`
 * is what fixes it at 32 bits -- a u16 global would have loaded `ldrh`. */
extern u32 gUnknown_0300592C;
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
/* A proc script: sub_08045F80 hands it to Proc_Start on tree 3. */
extern const struct ProcCmd gUnknown_0848A150[];
extern u16 *gUnknown_08499578;
extern u16 *gUnknown_0849957C;
extern u16 *gUnknown_08499580;
/* A fourth 0x400-entry tilemap buffer alongside 08499578/7C/80. NOT const:
 * sub_080616F0 re-`ldr`s it on every iteration of its clear loop. */
extern u16 *gUnknown_08499584;
extern u8 *gUnknown_08499590;
extern struct Unk08499594 *gUnknown_08499594;
extern struct Unk08499598 *gUnknown_08499598;
extern struct Unk084995A0 *gUnknown_084995A0;
/* ROM byte table indexed by a u8 read out of a caller-supplied pointer;
 * sub_08042084 returns whether the entry is non-zero. The address is odd, so
 * this is a plain byte array and not an aggregate. const is safe here: no
 * prototype in unknown-functions.h takes it. */
extern const u8 gUnknown_084995C1[];
extern void *gUnknown_08499E38[];
/* A proc script: sub_08028ED0 is its sole user and hands it to
 * Proc_StartBlocking. */
extern const struct ProcCmd gUnknown_08499FEC[];
/* ROM blob handed to sub_080152EC by sub_08042B70 and sub_08042B84, which is
 * the same slot the routine stores in gUnknown_03001470[i].unk04 (a
 * `const void *`). Nothing indexes it, so `const u8 []` is the weakest model
 * that reproduces the clean pool word; widen it when the consumer is matched. */
extern const u8 gUnknown_0849A0F0[];
extern const struct Unk0849A2C8 gUnknown_0849A2C8[];
extern const struct Unk0849A354 gUnknown_0849A354[];
extern struct Unk0849B018 *gUnknown_0849B018;
extern struct Unk0849B01C *gUnknown_0849B01C;
extern struct Unk0849B060 *gUnknown_0849B060;
/* Proc scripts, all only ever handed to Proc_Start/Proc_StartBlocking:
 *   0849B8B8  sub_08034308, blocking, parent forwarded
 *   0849BC98  sub_0803433C, parent forwarded
 *   0849D56C  sub_08037F80, tree 3
 *   0849D7FC  sub_08039930, parent forwarded, stashes a word at +0x54
 *   0849E778  sub_0803B6E8, tree 3, stashes a word at +0x54
 *   0849E7A0  sub_0803B774, tree 3
 *   0849ECE0  sub_0803B8C4, tree 3
 *   0849F5D0  sub_0803D960, blocking, stashes 6 at +0x64 */
extern const struct ProcCmd gUnknown_0849B8B8[];
extern const struct ProcCmd gUnknown_0849BC98[];
extern const struct Unk0849CD88 gUnknown_0849CD88[];
extern const struct ProcCmd gUnknown_0849D56C[];
extern struct Unk0849D5F8 *gUnknown_0849D5F8;
extern const struct ProcCmd gUnknown_0849D7FC[];
extern const struct ProcCmd gUnknown_0849E778[];
extern const struct ProcCmd gUnknown_0849E7A0[];
extern struct Unk0849ECDC *gUnknown_0849ECDC;
extern const struct ProcCmd gUnknown_0849ECE0[];
extern const struct ProcCmd gUnknown_0849F5D0[];
extern const struct ProcCmd gUnknown_0849FB44[];
/* A proc script: sub_08042C10 hands it to Proc_Start on tree 3. */
extern const struct ProcCmd gUnknown_0849FC0C[];
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
/* A proc script: sub_08045790 hands it to Proc_Start on tree 3. */
extern const struct ProcCmd gUnknown_084A0A3C[];
extern struct Unk084C1430 *gUnknown_084C1430;
/* ROM blobs handed to sub_080152EC, the same slot as gUnknown_0849A0F0.
 * 084C3D6C is the only one started on tree 1 rather than 0. */
extern const u8 gUnknown_084C1824[];
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
/* Two more 0x400-entry u16 tilemap buffers. sub_08054C04 CpuFastSets 0x200
 * words out of gUnknown_08551A04 to 0x06002800, which fixes the extent; the
 * writers sub_0805701C/sub_08057110 store TILEREF-shaped halfwords. */
extern u16 *gUnknown_08551A00;
extern u16 *gUnknown_08551A04;
/* ROM u16 pair indexed by a 0/1 flag and its complement -- sub_0805741C uses
 * gUnknown_085538AE[a ^ 1] for the BG3 control shadow and [a] for
 * gUnknown_0300251C. The address is halfword- but not word-aligned, so this is
 * a plain u16 array and not an aggregate. */
extern const u16 gUnknown_085538AE[];
extern u32 *gUnknown_08555450[];
extern struct Unk08580934 *gUnknown_08580934;
/* Proc scripts in the 0x0858xxxx table, each proved by being the sole argument
 * of a Proc_Start/Proc_Find call. `const` because that is what proc.h's
 * prototypes take; they are ROM data and nothing writes them.
 *   08580EAC  Proc_Start, sub_080673D0 (fills +0x2c/+0x38/+0x3c)
 *   08580FE4  Proc_Find,  sub_0806780C (+0x5c)
 *   08580FF4  Proc_Find,  sub_080678BC (+0x60) and sub_080678D4 (+0x3c)
 *   08581014  Proc_Find,  sub_08067A24 (+0x50, u8)
 *   08581068  Proc_Find,  sub_08067C7C (+0x38)
 *   085810E4  Proc_Start, sub_08067DD4 (no fields written)
 *   08581420  Proc_Find,  sub_0806978C/sub_080697A4 (+0x36, u8 = 0/1)
 *   08582AF4  Proc_Start, sub_0806E210 (+0x58)
 */
extern const struct ProcCmd gUnknown_08580EAC[];
extern const struct ProcCmd gUnknown_08580FE4[];
extern const struct ProcCmd gUnknown_08580FF4[];
extern const struct ProcCmd gUnknown_08581014[];
extern const struct ProcCmd gUnknown_08581068[];
extern const struct ProcCmd gUnknown_085810E4[];
extern const struct ProcCmd gUnknown_08581420[];
extern const struct ProcCmd gUnknown_08582AF4[];
extern const struct Unk085C77A0 gUnknown_085C77A0[];
extern const s16 gUnknown_08580E64[];
extern const struct Unk085D3DD0 gUnknown_085D3DD0[];
extern const struct Unk085D5ABC gUnknown_085D5ABC[];
/* Proc scripts. sub_0807639C and sub_0807F8D0 hand 08614460 / 08616740 to
 * Proc_Start(script, parent); sub_08078540 hands 08615AAC to
 * Proc_StartBlocking and stashes a pointer at +0x54 of the new proc. */
extern const struct ProcCmd gUnknown_08614460[];
extern const struct ProcCmd gUnknown_08615AAC[];
extern const struct ProcCmd gUnknown_08616740[];
/* More proc scripts, from the 0806Exxx / 08073xxx / 08074xxx starters:
 *   08582BB4  Proc_StartBlocking, sub_0806E6C8 (+0x5c = arg)
 *   08582BE4  Proc_Start,         sub_0806E728 (+0x54 = the parent it was
 *                                 started under, so the field is a ProcPtr)
 *   08582C24  Proc_Start,         sub_0806E8C8 (+0x58/+0x5c = 0, +0x60 = arg)
 *   086141B4  Proc_Start(.., PROC_TREE_VSYNC), sub_08073900 (+0x5c = arg)
 *   086142E4  Proc_StartBlocking, sub_08074AAC (+0x2c = arg, +0x30 = 0)
 */
extern const struct ProcCmd gUnknown_08582BB4[];
extern const struct ProcCmd gUnknown_08582BE4[];
extern const struct ProcCmd gUnknown_08582C24[];
extern const struct ProcCmd gUnknown_086141B4[];
extern const struct ProcCmd gUnknown_086142E4[];

#endif // UNKNOWN_GLOBALS_H
