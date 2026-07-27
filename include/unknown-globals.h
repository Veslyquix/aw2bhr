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

struct UnkC528Node
{
    u8 filler_00[4];
    struct UnkC528Node *unk04;
};

struct UnkC528 /* 0x18 */
{
    struct UnkC528Node *unk00;
    struct UnkC528Node *unk04;
    u8 filler_08[0x10];
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
 */
struct Unk0200E438 /* 0x4c */
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ u32 unk04;
    /* 0x08 */ u32 unk08;
    /* 0x0c */ u8 filler_0c[0x08];
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s32 unk18;
    /* 0x1c */ u16 unk1c;
    /* 0x1e */ u8 filler_1e[0x12];
    /* 0x30 */ struct UnkVec unk30;
    /* 0x38 */ u8 filler_38[0x04];
    /* 0x3c */ u16 unk3c;
    /* 0x3e */ u16 unk3e;
    /* 0x40 */ s16 unk40;
    /* 0x42 */ u8 filler_42[0x02];
    /* 0x44 */ u32 unk44;
    /* 0x48 */ u32 *unk48;
};

struct Unk0200F720 /* 0x10 */
{
    /* 0x00 */ u8 filler_00[0x06];
    /* 0x06 */ u16 unk06;
    /* 0x08 */ u16 unk08;
    /* 0x0a */ u16 unk0a;
    /* 0x0c */ u8 filler_0c[0x04];
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

/* Merged from four variants. unk00 is a word in sub_080153F0 and unk08 is a
 * word in sub_08015C30, so this one carries two independent word fields.
 */
struct Unk03001470 /* 0x60 */
{
    /* 0x00 */ u32 unk00;
    /* 0x04 */ u8 filler_04[0x04];
    /* 0x08 */ u32 unk08;
    /* 0x0c */ u8 filler_0c[0x1a];
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
    /* 0x00 */ u8 filler_00[0x43];
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
    /* 0x1c */ u8 filler_1c[0x02];
    /* 0x1e */ u8 unk1e;
    /* 0x1f */ u8 unk1f;
    /* 0x20 */ u32 unk20;
    /* 0x24 */ u8 filler_24[0x01];
    /* 0x25 */ u8 unk25;
    /* 0x26 */ u8 filler_26[0x0b];
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
    /* 0x00 */ u8 filler_00[0x09];
    /* 0x09 */ u8 unk09;
};

struct Unk0849CD88 /* 0x24 */
{
    /* 0x00 */ u8 filler_00[0x14];
    /* 0x14 */ u32 unk14;
    /* 0x18 */ u8 filler_18[0x0c];
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

struct Unk085D5ABC /* 0x5c */
{
    /* 0x00 */ u8 filler_00[0x1e];
    /* 0x1e */ u8 unk1e[2][0x1a];
    /* 0x52 */ u8 filler_52[0x0a];
};

/* -------------------------------------------------------------- EWRAM -- */

extern u16 *gUnknown_0200B0B0;
extern u32 gUnknown_0200C420[2];
extern u32 gUnknown_0200C500[2];
extern struct UnkC528 gUnknown_0200C528[];
extern struct SpriteEntry gUnknown_0200D510[];
extern struct Unk0200E438 gUnknown_0200E438[];
extern struct Unk0200F720 gUnknown_0200F720[];
extern struct Unk0200F920 gUnknown_0200F920[];
extern struct Unk02028030 gUnknown_02028030;
extern struct Unk020280C0 gUnknown_020280C0[];
extern u8 gUnknown_02028E40;
extern u8 gUnknown_02028E41[];
extern struct Unk02029A10Group gUnknown_02029A10[];

/* -------------------------------------------------------------- IWRAM -- */

extern void *gUnknown_03000000[];
extern u16 gUnknown_03001400;
extern u16 gUnknown_03001418;
extern struct Unk03001470 gUnknown_03001470[];
extern s16 gUnknown_03001FBC;
extern u32 gUnknown_03001FD4;
extern u16 gUnknown_03001FF8;
extern u16 gUnknown_03002000;
extern u16 gUnknown_0300200C;
extern struct Unk03002040 gUnknown_03002040;
extern u8 gUnknown_030020B8;
extern u8 gUnknown_030024E4;
extern u16 gUnknown_0300251C;
extern u16 gUnknown_03002520[];
extern struct SpriteEntry *gUnknown_03002B24;
extern u8 gUnknown_03002B30;
extern u16 gUnknown_03002B34;
extern u8 gUnknown_03002B40;
extern u8 gUnknown_03002B44;
extern u8 gUnknown_03002B4C;
extern u8 gUnknown_03002B68;
extern struct Unk03002B80 gUnknown_03002B80;
extern u8 gUnknown_03002EFC;
extern u16 gUnknown_03002F00;
extern u16 gUnknown_03002F18;
extern void *gUnknown_03002FA0[];
extern u16 gUnknown_030030A0;
extern u16 gUnknown_030030C4;
extern volatile u16 gUnknown_030030E8;
extern s8 gUnknown_030030F0;
extern union Unk802C57CBuf gUnknown_03003100;
extern struct Unk03003130 gUnknown_03003130;
extern u16 gUnknown_030032C0;
extern struct Unk802C57C gUnknown_030032C4;
extern struct Unk802C57C gUnknown_030033E0;
extern struct Unk802C57C gUnknown_030033E4;
extern u8 gUnknown_030033F4[];
extern union Unk802C57CBuf gUnknown_03003F24;
extern struct Unk03003FC0 gUnknown_03003FC0;
extern u16 gUnknown_03004080;
extern struct Unk802C57C gUnknown_03004090;
extern struct Unk802C57C gUnknown_030040A4;
extern struct Unk030040D8 *gUnknown_030040D8;
extern struct Unk802C57C gUnknown_030044A4;
extern struct Unk030044E0 *gUnknown_030044E0;
extern u16 gUnknown_03004518;
extern u16 gUnknown_03004538;
extern u16 gUnknown_030045D4;
extern u16 gUnknown_03004780;

/* ---------------------------------------------------------------- ROM -- */

extern struct Unk08090CD8 *const gUnknown_08090CD8;
extern const s16 gUnknown_08090EAC[];
extern u8 gUnknown_0810E6E0[];
extern const u8 gUnknown_08106A64[][32];
extern const u8 gUnknown_08108264[][32];
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
extern const struct Unk0849CD88 gUnknown_0849CD88[];
extern const struct ProcCmd gUnknown_0849FB44[];
extern u32 *gUnknown_08555450[];
extern struct Unk08580934 *gUnknown_08580934;
extern const struct Unk085D5ABC gUnknown_085D5ABC[];

#endif // UNKNOWN_GLOBALS_H
