#ifndef GUARD_MAP_H
#define GUARD_MAP_H
// 0x0201E450 
enum { MAP_POOL_SIZE = 0x508 };
struct Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ s16 scrollX; // unk04
    /* 0x0006 */ s16 scrollY; // unk06
    /* 0x0008 */ u16 unk08;
    /* 0x000A */ u16 unk0a;
    /* 0x000C */ u16 camX; 
    /* 0x000E */ u16 camY; 
    /* 0x0010 */ u16 unk10;
    /* 0x0012 */ u8 unit[MAP_POOL_SIZE]; // unk0012
    /* 0x051A */ u8 unitUnk[MAP_POOL_SIZE]; // often the same as unit[]
    /* 0x0A22 */ u16 tile[MAP_POOL_SIZE];
    /* 0x1432 */ u8 terrain[MAP_POOL_SIZE];
    /* 0x193A */ s8 property[MAP_POOL_SIZE]; // s8: all 3 readers are signed (0xFF = -1 = "none", used as an index/test)
    /* 0x1E42 */ u8 visible[MAP_POOL_SIZE]; 
    /* 0x234A */ u8 unk234A[MAP_POOL_SIZE];
    /* 0x2852 */ s8 move[MAP_POOL_SIZE]; // unk2852. s8: 3 signed reads (< 0, >= 0, > 0; -1 = blocked) vs 1 unsigned
                                       // (`(u8)move > 0x78`, so the -1 sentinel counts as "too far")
    /* 0x2D5A */ s8 danger[MAP_POOL_SIZE]; // unk2D5A. s8: 6 signed reads (sentinel/<= 0 tests, `best = danger`) vs 4 unsigned
                                       // (min-search compares `(u8)danger > best`, where 0xFF must rank as the worst value)
    /* 0x3262 */ u8 dangerMask[MAP_POOL_SIZE]; 
    /* 0x376A */ u8 unk376A[MAP_POOL_SIZE];
    /* 0x3C72 */ u8 unk3C72[MAP_POOL_SIZE]; // might be signed (0x7f sentinel, ++, sums), but NO signed read exists and s8 changes
                                       // the code of c_0805A744/c_0805B980/c_0805F4F8, so it stays u8
    /* 0x417a */ u16 rowOffset[(0x421a - 0x417a) / 2];
    /* 0x421a */ u8 unk421a[0x4232 - 0x421a];

    /* 0x4232 */ u8 filler_4232[1];
    /* 0x4233 */ u8 unk4233;
};

/* `gMap` is a linker alias for `gUnknown_08499590` (include/unknown-globals.h),
 * the same 4-byte ROM data slot given a second name with the honest type --
 * see aw2bhr.lds for the linker symbol assignment that ties them together
 * (a plain `.set` can't alias across translation units at assembly time).
 * `gUnknown_08499590` itself is deliberately left declared `u8 *`: the huge
 * majority of already-matched files index it with raw byte-offset arithmetic
 * (`gUnknown_08499590 + tileMap_417A`, etc.), and per the Wave 50 note beside
 * its declaration, agbcc's codegen for that arithmetic depends on it staying
 * a `u8 *` -- switching the canonical symbol's type would silently change
 * addressing math in ~300 call sites without a compile error. New code that
 * wants a typed `struct Map *` (no cast, no manual offset math) should use
 * `gMap` instead of casting `gUnknown_08499590`. */
extern struct Map *gMap;

#endif /* GUARD_MAP_H */
