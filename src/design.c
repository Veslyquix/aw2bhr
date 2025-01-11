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

u8 IsTerrainAtCoordsType(int x, int y, int terrainID) {
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
extern void sub_08008BB8(int x, int y);
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
