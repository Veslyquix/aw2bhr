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
