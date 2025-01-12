#include "global.h"

#include "design.h"
void MakeTileSimple(int x, int y, int tileID) {
  if (tileID < 0) {
    return;
  }

  gUnknown_08499590->unkMap_0A22[gUnknown_08499590->tileMap_417A[y] + x] =
      tileID & 0x1FF;

  return;
}

int IsTerrainAtCoordsType(int x, int y, int terrainID) {
  int result = 0;

  if (x < 0 || y < 0) {
    return result;
  }
  if (y > gUnknown_08499590->sizeY - 1 || x > gUnknown_08499590->sizeX - 1) {
    return result;
  }
  return gUnknown_08499590
             ->terrainMap_1432[gUnknown_08499590->tileMap_417A[y] + x] ==
         terrainID;
}

void SetTerrainAt(int x, int y, int terrainID) {

  gUnknown_08499590->terrainMap_1432[gUnknown_08499590->tileMap_417A[y] + x] =
      terrainID;
  if (terrainID == _Sea) {
    sub_08008BB8(x, y);
  }
}

int GetDesignRoomOption(int id) {
  switch (id & 0x1f) {
  case _Plain: {
    return _Plain;
    break;
  }
  case _River: {
    return _River;
    break;
  }
  case _Mtn: {
    return _Mtn;
    break;
  }
  case _Wood: {
    return _Wood;
    break;
  }
  case _Road: {
    return _Road;
    break;
  }
  case _City: {
    return _City;
    break;
  }
  case _Sea: {
    return _Sea;
    break;
  }
  case _HQ: {
    return _HQ;
    break;
  }
  case _Arprt: {
    return _Arprt;
    break;
  }
  case _Port: {
    return _Port;
    break;
  }
  case _Brdg: {
    return _Brdg;
    break;
  }
  case _Shoal: {
    return _Shoal;
    break;
  }
  case _Base: {
    return _Base;
    break;
  }
  case _Reef: {
    return _Reef;
    break;
  }
  case _Pipe: {
    return _Pipe;
    break;
  }
  case _Seam: {
    return _Seam;
    break;
  }
  case _Silo: {
    return _Silo;
    break;
  }

  default: {
    break;
  }
  }
  return 0;
}

u16 sub_080012DC(int val) {
  u16 var;

  var = 0;
  switch (val) {
  case 6:
    var = 0x1C2;
    break;
  case 38:
    var = 0x1C7;
    break;
  case 70:
    var = 0x1CC;
    break;
  case 102:
    var = 0x1d1;
    break;
  case 134:
    var = 0x1d6;
    break;
  case 8:
    var = 0x1C0;
    break;
  case 40:
    var = 0x1c5;
    break;
  case 72:
    var = 0x1ca;
    break;
  case 104:
    var = 0x1cf;
    break;
  case 136:
    var = 0x1d4;
    break;
  case 10:
    var = 0x1c3;
    break;
  case 42:
    var = 0x1c8;
    break;
  case 74:
    var = 0x1cd;
    break;
  case 106:
    var = 0x1d2;
    break;
  case 138:
    var = 0x1d7;
    break;
  case 11:
    var = 0x1c4;
    break;
  case 43:
    var = 0x1c9;
    break;
  case 75:
    var = 0x1ce;
    break;
  case 107:
    var = 0x1d3;
    break;
  case 139:
    var = 0x1d8;
    break;
  case 14:
    var = 0x1c1;
    break;
  case 46:
    var = 0x1c6;
    break;
  case 78:
    var = 0x1cb;
    break;
  case 110:
    var = 0x1d0;
    break;
  case 142:
    var = 0x1d5;
    break;
  case 17:
    var = 0x180;
    break;
  }
  return var;
}

u8 IsTerrainLand(int x, int y) {
  u8 terrain = gUnknown_08499590
                   ->terrainMap_1432[gUnknown_08499590->tileMap_417A[y] + x];
  int var;
  int var2;
  if (terrain == _River) {
    var = sub_080094EC(x, y);
  } else {
    var = 0;
  }
  var2 = sub_08008C34(x, y);
  return ((terrain != _Sea) && (terrain != _Shoal) && (terrain != _Reef) &&
          (!var2) && (!var));
}

u8 IsTerrainWater(int x, int y) {
  u8 terrain = gUnknown_08499590
                   ->terrainMap_1432[gUnknown_08499590->tileMap_417A[y] + x];
  return ((terrain != _Sea) && (terrain != _Shoal) && (terrain != _Reef));
}

int IsTerrainWaterOrRiver(int x, int y) {
  u8 terrain = gUnknown_08499590
                   ->terrainMap_1432[gUnknown_08499590->tileMap_417A[y] + x];
  return ((terrain != _Sea) && (terrain != _Shoal) && (terrain != _Reef) &&
          (terrain != _River));
}

u32 GetTileWithShadow_unkMapA22(int x, int y) {
  // ...
  u16 unk =
      gUnknown_08499590->unkMap_0A22[gUnknown_08499590->tileMap_417A[y] + x];

  return GetTileWithShadow(x, y, unk); // 17d0
}
#define tMap_0848591C_size 49
extern s16 gUnknown_0848591C[tMap_0848591C_size * 2];
// extern short * gUnknown_0848597e; // accessed as 848591c+0x62
int GetTileWithShadow(int x, int y, int tile) {
  int i;
  s16 *tMapA;
  s16 *tMapB;
  tMapA = gUnknown_0848591C;
  tMapB = &gUnknown_0848591C[tMap_0848591C_size];

  if (x <= 0) {
    for (i = 0; i < tMap_0848591C_size; ++i) {
      if (tile == *tMapB) {
        return (int)*tMapA;
      }
      tMapA++;
      tMapB++;
    }
  } else {
    int y_ = gUnknown_08499590->tileMap_417A[y] - 1;
    // if these tiles/terrain/something, use shadows?
    switch (gUnknown_08499590->terrainMap_1432[y_ + x]) {
    case 3:
    case 4:
    case 6:
    case 8:
    case 10:
    case 0xb:
    case 0xe:
    case 0x26:
    case 0x28:
    case 0x2a:
    case 0x2b:
    case 0x2e:
    case 0x46:
    case 0x48:
    case 0x4a:
    case 0x4b:
    case 0x4e:
    case 0x66:
    case 0x68:
    case 0x6a:
    case 0x6b:
    case 0x6e:
    case 0x86:
    case 0x88:
    case 0x8a:
    case 0x8b:
    case 0x8e:
      for (i = 0; i < tMap_0848591C_size; ++i) {
        if (tile == *tMapA) {
          // 0x21 is the Plain with shadow on the left in the tileset
          if (*tMapB == 0x21 && (IsTerrainAtCoordsType(x, y + 1, _Mtn))) {
            return 0x3; // Mountain top with left shadow in tileset
          } else {
            return (int)*tMapB;
          }
        }
        tMapA++;
        tMapB++;
      }
      break;
    default:
      for (i = 0; i < tMap_0848591C_size; ++i) {
        if (tile == *tMapB) {
          return (int)*tMapA;
        }
        tMapA++;
        tMapB++;
      }
    }
  }

  return -1;
}

// this cuts out the part where it replaces plain with shadow with mountaintop
// with shadow
int GetTileWithShadow2(int x, int y, int tile) {
  int i;
  s16 *tMapA;
  s16 *tMapB;
  tMapA = gUnknown_0848591C;
  tMapB = &gUnknown_0848591C[tMap_0848591C_size];

  if (x <= 0) {
    for (i = 0; i < tMap_0848591C_size; ++i) {
      if (tile == *tMapB) {
        return (int)*tMapA;
      }
      tMapA++;
      tMapB++;
    }
  } else {
    int y_ = gUnknown_08499590->tileMap_417A[y] - 1;
    // if these tiles/terrain/something, use shadows?
    switch (gUnknown_08499590->terrainMap_1432[y_ + x]) {
    case 3:
    case 4:
    case 6:
    case 8:
    case 10:
    case 0xb:
    case 0xe:
    case 0x26:
    case 0x28:
    case 0x2a:
    case 0x2b:
    case 0x2e:
    case 0x46:
    case 0x48:
    case 0x4a:
    case 0x4b:
    case 0x4e:
    case 0x66:
    case 0x68:
    case 0x6a:
    case 0x6b:
    case 0x6e:
    case 0x86:
    case 0x88:
    case 0x8a:
    case 0x8b:
    case 0x8e:
      for (i = 0; i < tMap_0848591C_size; ++i) {
        if (tile == *tMapA) {
          return (int)*tMapB;
        }
        tMapA++;
        tMapB++;
      }
      break;
    default:
      for (i = 0; i < tMap_0848591C_size; ++i) {
        if (tile == *tMapB) {
          return (int)*tMapA;
        }
        tMapA++;
        tMapB++;
      }
    }
  }

  return -1;
}
