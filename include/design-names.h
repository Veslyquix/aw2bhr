#ifndef GUARD_DESIGN_NAMES_H
#define GUARD_DESIGN_NAMES_H

// struct Unk_0201E450 {
    // u16 sizeX; // map size 
    // u16 sizeY; 
    // STRUCT_PAD(0x0004, 0x0A22);
    // u16 unkMap_0A22[0x508]; // length 0x508? 
    // u8 terrainMap_1432[0x508]; // offset 0x1432 - length unknown 
    // STRUCT_PAD(0x193a, 0x417A);
    // u16 tileMap_417A[0x508]; // length unknown
// };

// extern struct Unk_0201E450 * gUnknown_08499590;

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
