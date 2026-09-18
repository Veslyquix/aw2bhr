#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08001158.
 * MakeTileSimple @ 0x08001158, IsTerrainAtCoordsType @ 0x0800119C,
 * SetTerrainAt @ 0x080011F4, GetDesignRoomOption @ 0x08001230,
 * sub_080012DC @ 0x080012DC, IsTerrainLand @ 0x080015E4,
 * IsTerrainWater @ 0x0800164C, IsTerrainWaterOrRiver @ 0x0800168C,
 * GetTileWithShadow_unkMapA22 @ 0x080016D0, GetTileWithShadow @ 0x08001704,
 * GetTileWithShadow2 @ 0x08001A04.
 *
 * Merged from seven separately-promoted files (formerly c_08001158.c,
 * c_0800119C.c, c_080011F4.c, c_08001230.c, c_080015E4.c, c_0800164C.c and
 * c_08001704.c) plus sub_080012DC (formerly c_080012DC.c), which is not part
 * of the design.c naming below but sits directly between the two named
 * groups and had to move here too: the linker places one promoted C file's
 * .text as a single unbroken block, so a promoted file can only own a truly
 * contiguous address run, and sub_080012DC is the only thing between
 * GetDesignRoomOption's end and IsTerrainLand's start. Most of this file is
 * named per aw2bhr-main's src/design.c (a from-scratch community fork, kept
 * outside this repository); the old sub_XXXXXXXX symbols are kept as linker
 * aliases below each renamed function so every other unit keeps resolving
 * them unchanged.
 */

/* Named per aw2bhr-main's src/design.c ("MakeTileSimple"): writes the
 * halfword tile plane at +0xA22 with the ROM's own row-offset idiom. */

/*
void MakeTileSimple(int x, int y, int tileID) {
  if (tileID < 0) {
    return;
  }

  gUnknown_08499590->unkMap_0A22[gUnknown_08499590->tileMap_417A[y] + x] =
      tileID & 0x1FF;

  return;
}
*/

void MakeTileSimple(int x, int y, int val) {
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;

  if (val < 0)
    return;

  p = gUnknown_08499590;
  t = y * 2;
  rows = p + tileMap_417A;
  off = (*(u16 *)(rows + t) + x) * 2;
  tiles = p + unkMap_0A22;
  *(u16 *)(tiles + off) = val & 0x1FF;
}

asm(".global sub_08001158\n.thumb_set sub_08001158, MakeTileSimple\n");

/* A bounds-checked cell-kind test on the gUnknown_08499590 map: outside the
 * width/height stored at +0 and +2 the answer is 0, otherwise it is whether the
 * cell equals the caller's kind.
 *
 * gUnknown_08499590 IS NOT BOUND BEFORE THE GUARD. The ROM loads it only at the
 * third test -- the first two compare the coordinates against zero and need
 * nothing -- and then keeps that one load across the whole tail. Naming it
 * inline in the guard and binding `p` only afterwards is what places the load
 * there; a `p = gUnknown_08499590;` at the top hoists it two compares early.
 *
 * `movs r2, #0` ahead of the cell compare is the shared result variable, the
 * same shape as IsTerrainWater below; the row/tile arithmetic is that
 * function's idiom verbatim.
 *
 * Named per aw2bhr-main's src/design.c ("IsTerrainAtCoordsType"). */
int IsTerrainAtCoordsType(int x, int y, int k) {
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;
  int r;

  if (x < 0 || y < 0 || y > *(u16 *)(gUnknown_08499590 + sizeY) - 1 ||
      x > *(u16 *)(gUnknown_08499590 + sizeX) - 1)
    return 0;

  p = gUnknown_08499590;
  r = 0;
  t = y * 2;
  rows = p + tileMap_417A;
  off = *(u16 *)(rows + t) + x;
  tiles = p + terrainMap_1432;

  if (tiles[off] == k)
    r = 1;

  return r;
}

asm(".global sub_0800119C\n.thumb_set sub_0800119C, IsTerrainAtCoordsType\n");

/* The write half of the MakeTileSimple map idiom: gUnknown_08499590 is a base
 * pointer, +0x417A is a per-ROW halfword offset table indexed y * 2, and the
 * row offset plus x indexes a BYTE plane at +0x1432 (MakeTileSimple writes the
 * halfword plane at +0xA22 with the same arithmetic scaled by two).
 *
 * The locals are punctuation -- one per address step -- and they are what
 * keeps the two pool constants in the ROM's order. Value 7 is TERRAIN_SEA,
 * the terrain kind IsTerrainWater and IsTerrainWaterOrRiver also single out.
 *
 * Named per aw2bhr-main's src/design.c ("SetTerrainAt"), which also names
 * the TERRAIN_SEA callee EnsureValidTile. */
void SetTerrainAt(int x, int y, int val) {
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;

  p = gUnknown_08499590;
  t = y * 2;
  rows = p + tileMap_417A;
  off = *(u16 *)(rows + t) + x;
  tiles = p + terrainMap_1432;
  tiles[off] = val;

  if (val == TERRAIN_SEA)
    EnsureValidTile(x, y);
}

asm(".global sub_080011F4\n.thumb_set sub_080011F4, SetTerrainAt\n");

/* Named per aw2bhr-main's src/design.c ("GetDesignRoomOption"): the identity
 * map over every TerrainKind value the design.c/design.h fork names (case 9
 * and 0x12 are unused by the ROM). */
int GetDesignRoomOption(int a) {
  switch (a & 0x1f) {
  case TERRAIN_PLAIN:
    return TERRAIN_PLAIN;
  case TERRAIN_RIVER:
    return TERRAIN_RIVER;
  case TERRAIN_MOUNTAIN:
    return TERRAIN_MOUNTAIN;
  case TERRAIN_WOOD:
    return TERRAIN_WOOD;
  case TERRAIN_ROAD:
    return TERRAIN_ROAD;
  case TERRAIN_CITY:
    return TERRAIN_CITY;
  case TERRAIN_SEA:
    return TERRAIN_SEA;
  case TERRAIN_HQ:
    return TERRAIN_HQ;
  case TERRAIN_AIRPORT:
    return TERRAIN_AIRPORT;
  case TERRAIN_PORT:
    return TERRAIN_PORT;
  case TERRAIN_BRIDGE:
    return TERRAIN_BRIDGE;
  case TERRAIN_SHOAL:
    return TERRAIN_SHOAL;
  case TERRAIN_BASE:
    return TERRAIN_BASE;
  case TERRAIN_REEF:
    return TERRAIN_REEF;
  case TERRAIN_PIPE:
    return TERRAIN_PIPE;
  case TERRAIN_PIPE_SEAM:
    return TERRAIN_PIPE_SEAM;
  case TERRAIN_SILO:
    return TERRAIN_SILO;
  }

  return 0;
}

asm(".global sub_08001230\n.thumb_set sub_08001230, GetDesignRoomOption\n");

/* A pure lookup: 26 live cases out of a 137-entry jump table, and nothing else.
 *
 * The case bodies are laid out in SOURCE order, not in case-value order, so the
 * grouping is readable straight off the ROM and it is not the grouping the
 * jump table suggests: five runs of five keys 32 apart (6/38/70/102/134,
 * 8/40/72/104/136, 10/42/74/106/138, 11/43/75/107/139, 14/46/78/110/142) whose
 * results also step by 5, then a lone case 17. The key is therefore
 * `something * 32 + kind` and the result `base + something * 5`, which is why
 * the values interleave in the table and read consecutively down the function.
 *
 * `int r = 0;` before the switch rather than `return` in each arm: the ROM sets
 * r2 to 0 ahead of the range check and every arm falls into one shared
 * `adds r0, r2, #0; bx lr`. The 0xe1/0xe6-style `movs; lsls #1` pairs are just
 * how agbcc builds an even constant above 255 -- the odd ones next to them get
 * a pool word instead.
 *
 * Not part of aw2bhr-main's design.c naming; kept here only because it sits
 * between GetDesignRoomOption and IsTerrainLand in ROM order and this file's
 * .text must be one unbroken block.
 */

int sub_080012DC(int a) {
  int r;

  r = 0;

  switch (a) {
  case 6:
    r = 0x1c2;
    break;
  case 38:
    r = 0x1c7;
    break;
  case 70:
    r = 0x1cc;
    break;
  case 102:
    r = 0x1d1;
    break;
  case 134:
    r = 0x1d6;
    break;

  case 8:
    r = 0x1c0;
    break;
  case 40:
    r = 0x1c5;
    break;
  case 72:
    r = 0x1ca;
    break;
  case 104:
    r = 0x1cf;
    break;
  case 136:
    r = 0x1d4;
    break;

  case 10:
    r = 0x1c3;
    break;
  case 42:
    r = 0x1c8;
    break;
  case 74:
    r = 0x1cd;
    break;
  case 106:
    r = 0x1d2;
    break;
  case 138:
    r = 0x1d7;
    break;

  case 11:
    r = 0x1c4;
    break;
  case 43:
    r = 0x1c9;
    break;
  case 75:
    r = 0x1ce;
    break;
  case 107:
    r = 0x1d3;
    break;
  case 139:
    r = 0x1d8;
    break;

  case 14:
    r = 0x1c1;
    break;
  case 46:
    r = 0x1c6;
    break;
  case 78:
    r = 0x1cb;
    break;
  case 110:
    r = 0x1d0;
    break;
  case 142:
    r = 0x1d5;
    break;

  case 17:
    r = 0x180;
    break;
  }

  return r;
}

/* A walkability predicate over the gUnknown_08499590 map: the cell must not be
 * kind 7, 0xd or 0x13, must pass sub_08008C34, and -- for kind 2 only -- must
 * pass sub_080094EC as well.
 *
 * BOTH CALL RESULTS ARE BOUND before the test chain, because the ROM makes both
 * calls unconditionally. Folded into the `&&` chain, sub_08008C34 would be
 * called after the three kind compares and short-circuited away; the ROM calls
 * it first and only then materialises the shared `movs r1, #0`.
 *
 * `movs r1, #0` sits between the call and the compares -- one shared result
 * variable the five `beq`/`bne` fall through to -- which is the same shape
 * IsTerrainWater below documents. The row/tile arithmetic is that function's
 * idiom verbatim: rows at +0x417A indexed `y * 2`, tiles at +0x1432.
 *
 * Named per aw2bhr-main's src/design.c ("IsTerrainLand"); kind 2 is
 * TERRAIN_RIVER, and 7/0xd/0x13 are TERRAIN_SEA/TERRAIN_SHOAL/TERRAIN_REEF. */
int IsTerrainLand(int x, int y) {
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;
  int v;
  int w;
  int s;
  int r;

  p = gUnknown_08499590;
  t = y * 2;
  rows = p + tileMap_417A;
  off = *(u16 *)(rows + t) + x;
  tiles = p + terrainMap_1432;
  v = tiles[off];

  if (v == TERRAIN_RIVER)
    s = sub_080094EC(x, y);
  else
    s = 0;

  w = sub_08008C34(x, y);

  r = 0;
  if (v != TERRAIN_SEA && v != TERRAIN_SHOAL && v != TERRAIN_REEF && w == 0 &&
      s == 0)
    r = 1;

  return r;
}

asm(".global sub_080015E4\n.thumb_set sub_080015E4, IsTerrainLand\n");

/* A predicate over the byte plane SetTerrainAt writes: kinds 7 and 0xd answer
 * 0 outright, and everything else answers "is it not 0x13".
 *
 * The tail is do_store_flag's branchless returned !=:
 * movs r1,#0x13; eors r1,r2; rsbs r0,r1; orrs r0,r1; lsrs r0,#0x1f. The
 * movs r0, #0 sits AHEAD of the compares, so the 0 is one shared result
 * variable that the two beqs fall through to -- not a return 0 per arm.
 *
 * Named per aw2bhr-main's src/design.c ("IsTerrainWater"); 7/0xD/0x13 are
 * TERRAIN_SEA/TERRAIN_SHOAL/TERRAIN_REEF. */
int IsTerrainWater(int x, int y) {
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;
  int v;
  int r;

  p = gUnknown_08499590;
  t = y * 2;
  rows = p + tileMap_417A;
  off = *(u16 *)(rows + t) + x;
  tiles = p + terrainMap_1432;
  v = tiles[off];

  r = 0;

  if (v != TERRAIN_SEA && v != TERRAIN_SHOAL)
    r = (v != TERRAIN_REEF);

  return r;
}

asm(".global sub_0800164C\n.thumb_set sub_0800164C, IsTerrainWater\n");

/* IsTerrainWater's neighbour and NOT a copy of it: one more excluded kind
 * (TERRAIN_REEF, which is the one IsTerrainWater compares against) and a
 * different final comparand (TERRAIN_RIVER). Same shared-r tail; see that
 * function for the idiom.
 *
 * Named per aw2bhr-main's src/design.c ("IsTerrainWaterOrRiver"). */
int IsTerrainWaterOrRiver(int x, int y) {
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;
  int v;
  int r;

  p = gUnknown_08499590;
  t = y * 2;
  rows = p + tileMap_417A;
  off = *(u16 *)(rows + t) + x;
  tiles = p + terrainMap_1432;
  v = tiles[off];

  r = 0;

  if (v != TERRAIN_SEA && v != TERRAIN_SHOAL && v != TERRAIN_REEF)
    r = (v != TERRAIN_RIVER);

  return r;
}

asm(".global sub_0800168C\n.thumb_set sub_0800168C, IsTerrainWaterOrRiver\n");

/* The read half of MakeTileSimple: same row-offset arithmetic, the HALFWORD
 * plane at +0xA22 (hence the extra lsls #1), and the cell handed to
 * GetTileWithShadow alongside the coordinates that produced it. r0 and r1 are
 * never clobbered on the way, so the first two arguments cost nothing.
 *
 * It RETURNS what GetTileWithShadow returns, and the epilogue is the only
 * thing that says so: pop {r1}; bx r1 keeps r0 intact, where a void function
 * would have popped the return address into r0 itself.
 *
 * Named per aw2bhr-main's src/design.c ("GetTileWithShadow_unkMapA22"). */
int GetTileWithShadow_unkMapA22(int x, int y) {
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;

  p = gUnknown_08499590;
  t = y * 2;
  rows = p + tileMap_417A;
  off = (*(u16 *)(rows + t) + x) * 2;
  tiles = p + unkMap_0A22;
  return GetTileWithShadow(x, y, *(u16 *)(tiles + off));
}

asm(".global sub_080016D0\n.thumb_set sub_080016D0, "
    "GetTileWithShadow_unkMapA22\n");

/* The tile-edit query behind GetTileWithShadow_unkMapA22: given a cell (x, y)
 * and the object id v standing on it, translate v between the two rows of
 * gUnknown_0848591C.
 *
 * Which direction depends on the terrain of the cell to the LEFT -- hence the
 * `x > 0` guard and the `- 1` on the row offset. For 27 terrain codes the
 * lookup runs row0 -> row1, and row1's 0x21 entry additionally consults
 * IsTerrainAtCoordsType on the cell BELOW (x, y + 1) before answering 3. Every
 * other terrain, and every cell on the left edge, runs row1 -> row0.
 *
 * The two rows are walked as POINTERS, not subscripted: the ROM advances both
 * r3 and r4 by 2 every iteration while keeping a separate counter against
 * 0x30, which subscripting cannot produce -- `pa[i]` leaves the base invariant
 * and strength-reduces the exit test onto the pointer instead. Binding both
 * before the `if` is what shares one pool word across all three loops.
 *
 * `off` is split over two statements deliberately: written as one expression,
 * fold reassociates `row - 1 + x` into `(x - 1) + row` and emits the `subs` on
 * the parameter instead of on the loaded row offset.
 *
 * Named per aw2bhr-main's src/design.c ("GetTileWithShadow"). */
int GetTileWithShadow(int x, int y, int v) {
  const s16 *pa;
  const s16 *pb;
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;
  int i;

  pa = gUnknown_0848591C[0];
  pb = gUnknown_0848591C[1];

  if (x <= 0) {
    for (i = 0; i <= 0x30; i++) {
      if (v == *pb)
        return *pa;
      pa++;
      pb++;
    }
  } else {
    p = gUnknown_08499590;
    t = y * 2;
    rows = p + tileMap_417A;
    off = *(u16 *)(rows + t) - 1;
    off += x;
    tiles = p + terrainMap_1432;

    switch (tiles[off]) {
    case 3:
    case 4:
    case 6:
    case 8:
    case 10:
    case 11:
    case 14:
    case 38:
    case 40:
    case 42:
    case 43:
    case 46:
    case 70:
    case 72:
    case 74:
    case 75:
    case 78:
    case 102:
    case 104:
    case 106:
    case 107:
    case 110:
    case 134:
    case 136:
    case 138:
    case 139:
    case 142:
      for (i = 0; i <= 0x30; i++) {
        if (v == *pa) {
          if (*pb == 0x21 && IsTerrainAtCoordsType(x, y + 1, TERRAIN_MOUNTAIN))
            return 3;
          return *pb;
        }
        pa++;
        pb++;
      }
      break;
    default:
      for (i = 0; i <= 0x30; i++) {
        if (v == *pb)
          return *pa;
        pa++;
        pb++;
      }
      break;
    }
  }

  return -1;
}

asm(".global sub_08001704\n.thumb_set sub_08001704, GetTileWithShadow\n");

/* GetTileWithShadow's twin, and the relationship is NOT a parameter swap:
 * this is the SAME function with the `*pb == 0x21` / IsTerrainAtCoordsType
 * special case deleted from the row0 -> row1 branch. Everything else -- the
 * `x > 0` guard, the cell-to-the-left terrain switch with the same 27 cases,
 * both directions of the gUnknown_0848591C walk, the -1 miss return -- is
 * identical source.
 *
 * The register differences follow from that one deletion: with no call, `y` is
 * dead after the row offset is built, so it loses its callee-saved register
 * (r6 here, r7 there) and no `mov ip` scratch is needed; and the two row
 * pointers land the other way round (r4/r3 rather than r3/r4).
 *
 * Named per aw2bhr-main's src/design.c ("GetTileWithShadow2"). */
int GetTileWithShadow2(int x, int y, int v) {
  const s16 *pa;
  const s16 *pb;
  u8 *p;
  u8 *rows;
  u8 *tiles;
  int t;
  int off;
  int i;

  pa = gUnknown_0848591C[0];
  pb = gUnknown_0848591C[1];

  if (x <= 0) {
    for (i = 0; i <= 0x30; i++) {
      if (v == *pb)
        return *pa;
      pa++;
      pb++;
    }
  } else {
    p = gUnknown_08499590;
    t = y * 2;
    rows = p + tileMap_417A;
    off = *(u16 *)(rows + t) - 1;
    off += x;
    tiles = p + terrainMap_1432;

    switch (tiles[off]) {
    case 3:
    case 4:
    case 6:
    case 8:
    case 10:
    case 11:
    case 14:
    case 38:
    case 40:
    case 42:
    case 43:
    case 46:
    case 70:
    case 72:
    case 74:
    case 75:
    case 78:
    case 102:
    case 104:
    case 106:
    case 107:
    case 110:
    case 134:
    case 136:
    case 138:
    case 139:
    case 142:
      for (i = 0; i <= 0x30; i++) {
        if (v == *pa)
          return *pb;
        pa++;
        pb++;
      }
      break;
    default:
      for (i = 0; i <= 0x30; i++) {
        if (v == *pb)
          return *pa;
        pa++;
        pb++;
      }
      break;
    }
  }

  return -1;
}

asm(".global sub_08001A04\n.thumb_set sub_08001A04, GetTileWithShadow2\n");
