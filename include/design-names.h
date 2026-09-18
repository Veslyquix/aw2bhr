#ifndef GUARD_DESIGN_NAMES_H
#define GUARD_DESIGN_NAMES_H

/* Friendly names cross-referenced against aw2bhr-main's src/design.c and
 * include/design.h (a from-scratch community fork, kept outside this
 * repository). Each function below is a linker alias for an existing
 * sub_XXXXXXXX symbol -- see the defining src/decomp/c_ADDR.c file for the
 * `.thumb_set` directive and the citation. The old sub_XXXXXXXX declaration
 * in unknown-functions.h is left untouched so every existing caller keeps
 * compiling unchanged; this header is only for new code that wants to call
 * these by name.
 */

void MakeTileSimple(int x, int y, int tileID);
int IsTerrainAtCoordsType(int x, int y, int terrainID);
void SetTerrainAt(int x, int y, int terrainID);
int GetDesignRoomOption(int id);
int IsTerrainLand(int x, int y);
int IsTerrainWater(int x, int y);
int IsTerrainWaterOrRiver(int x, int y);
int GetTileWithShadow_unkMapA22(int x, int y);
int GetTileWithShadow(int x, int y, int tile);
int GetTileWithShadow2(int x, int y, int tile);
void EnsureValidTile(int x, int y);

/* aw2bhr-main's include/design.h names these terrain-kind values (case 9 and
 * 0x12 are unused by the ROM). GetDesignRoomOption's switch is the
 * identity map over exactly this set. */
/* aw2bhr-main's include/design.h models gUnknown_08499590 as a typed struct
 * (`struct Unk_0201E450`) with these field names. This repo keeps
 * gUnknown_08499590 as a raw `u8 *` and does the byte-offset arithmetic
 * explicitly (see unknown-globals.h) rather than introducing a competing
 * struct -- a struct field rename here would ripple through every one of the
 * struct's many other call sites across src/decomp/, most of which have
 * nothing to do with design.c. These are offset constants for the same
 * fields, not struct members, so the existing `p + tileMap_417A` idiom reads
 * the way the fork's `p->tileMap_417A` does without that risk. */
#define sizeX            0
#define sizeY            2
#define unkMap_0A22      0xA22
#define terrainMap_1432  0x1432
#define tileMap_417A     0x417A

enum TerrainKind {
    TERRAIN_PLAIN = 1,
    TERRAIN_RIVER = 2,
    TERRAIN_MOUNTAIN = 3,
    TERRAIN_WOOD = 4,
    TERRAIN_ROAD = 5,
    TERRAIN_CITY = 6,
    TERRAIN_SEA = 7,
    TERRAIN_HQ = 8,
    TERRAIN_AIRPORT = 0xA,
    TERRAIN_PORT = 0xB,
    TERRAIN_BRIDGE = 0xC,
    TERRAIN_SHOAL = 0xD,
    TERRAIN_BASE = 0xE,
    TERRAIN_PIPE = 0xF,
    TERRAIN_PIPE_SEAM = 0x10,
    TERRAIN_SILO = 0x11,
    TERRAIN_REEF = 0x13,
};

#endif /* GUARD_DESIGN_NAMES_H */
