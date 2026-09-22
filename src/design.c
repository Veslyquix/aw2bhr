#include "global.h"
#include "hardware.h"
#include "map.h"

void MakeTileSimple(int x, int y, int val) {
  if (val < 0)
    return;

  gMap->tile[gMap->rowOffset[y] + x] = val & 0x1FF;
}

asm(".global sub_08001158\n.thumb_set sub_08001158, MakeTileSimple\n");

int IsTerrainAtCoordsType(int x, int y, int k) {
  if (x < 0 || y < 0 || y > gMap->height - 1 || x > gMap->width - 1)
    return 0;

  return gMap->terrain[gMap->rowOffset[y] + x] == k;
}

asm(".global sub_0800119C\n.thumb_set sub_0800119C, IsTerrainAtCoordsType\n");

void SetTerrainAt(int x, int y, int val) {
  gMap->terrain[gMap->rowOffset[y] + x] = val;

  if (val == TERRAIN_SEA)
    EnsureValidTile(x, y);
}

asm(".global sub_080011F4\n.thumb_set sub_080011F4, SetTerrainAt\n");

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

int GetDefaultTileForTerrain(int a) {
  int r;

  r = 0;

  switch (a) {
  case TERRAIN_CITY:
    r = TILE_CITY;
    break;
  case TERRAIN_CITY_OS:
    r = TILE_CITY_OS;
    break;
  case TERRAIN_CITY_BM:
    r = TILE_CITY_BM;
    break;
  case TERRAIN_CITY_GE:
    r = TILE_CITY_GE;
    break;
  case TERRAIN_CITY_YC:
    r = TILE_CITY_YC;
    break;

  case TERRAIN_HQ:
    r = TILE_HQ;
    break;
  case TERRAIN_HQ_OS:
    r = TILE_HQ_OS;
    break;
  case TERRAIN_HQ_BM:
    r = TILE_HQ_BM;
    break;
  case TERRAIN_HQ_GE:
    r = TILE_HQ_GE;
    break;
  case TERRAIN_HQ_YC:
    r = TILE_HQ_YC;
    break;

  case TERRAIN_AIRPORT:
    r = TILE_AIRPORT;
    break;
  case TERRAIN_AIRPORT_OS:
    r = TILE_AIRPORT_OS;
    break;
  case TERRAIN_AIRPORT_BM:
    r = TILE_AIRPORT_BM;
    break;
  case TERRAIN_AIRPORT_GE:
    r = TILE_AIRPORT_GE;
    break;
  case TERRAIN_AIRPORT_YC:
    r = TILE_AIRPORT_YC;
    break;

  case TERRAIN_PORT:
    r = TILE_PORT;
    break;
  case TERRAIN_PORT_OS:
    r = TILE_PORT_OS;
    break;
  case TERRAIN_PORT_BM:
    r = TILE_PORT_BM;
    break;
  case TERRAIN_PORT_GE:
    r = TILE_PORT_GE;
    break;
  case TERRAIN_PORT_YC:
    r = TILE_PORT_YC;
    break;

  case TERRAIN_BASE:
    r = TILE_BASE;
    break;
  case TERRAIN_BASE_OS:
    r = TILE_BASE_OS;
    break;
  case TERRAIN_BASE_BM:
    r = TILE_BASE_BM;
    break;
  case TERRAIN_BASE_GE:
    r = TILE_BASE_GE;
    break;
  case TERRAIN_BASE_YC:
    r = TILE_BASE_YC;
    break;

  case TERRAIN_SILO:
    r = TILE_SILO;
    break;
  }

  return r;
}

asm(".global sub_080012DC\n.thumb_set sub_080012DC, GetDefaultTileForTerrain\n");

int IsTerrainLand(int x, int y) {
  struct Map *map = gMap;
  int v;
  int w;
  int s;
  int r;

  v = map->terrain[map->rowOffset[y] + x];

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

int IsTerrainWater(int x, int y) {
  struct Map *map = gMap;
  int v;
  int r;

  v = map->terrain[map->rowOffset[y] + x];

  r = 0;

  if (v != TERRAIN_SEA && v != TERRAIN_SHOAL)
    r = (v != TERRAIN_REEF);

  return r;
}

asm(".global sub_0800164C\n.thumb_set sub_0800164C, IsTerrainWater\n");

int IsTerrainWaterOrRiver(int x, int y) {
  struct Map *map = gMap;
  int v;
  int r;

  v = map->terrain[map->rowOffset[y] + x];

  r = 0;

  if (v != TERRAIN_SEA && v != TERRAIN_SHOAL && v != TERRAIN_REEF)
    r = (v != TERRAIN_RIVER);

  return r;
}

asm(".global sub_0800168C\n.thumb_set sub_0800168C, IsTerrainWaterOrRiver\n");

int GetTileWithShadowAt(int x, int y) {
  struct Map *map = gMap;

  return GetTileWithShadow(x, y, map->tile[map->rowOffset[y] + x]);
}

asm(".global sub_080016D0\n.thumb_set sub_080016D0, "
    "GetTileWithShadowAt\n");

int GetTileWithShadow(int x, int y, int v) {
  const s16 *pa;
  const s16 *pb;
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
    off = gMap->rowOffset[y] - 1;
    off += x;

    switch (gMap->terrain[off]) {
    case TERRAIN_MOUNTAIN:
    case TERRAIN_WOOD:
    case TERRAIN_CITY:
    case TERRAIN_HQ:
    case TERRAIN_AIRPORT:
    case TERRAIN_PORT:
    case TERRAIN_BASE:
    case TERRAIN_CITY_OS:
    case TERRAIN_HQ_OS:
    case TERRAIN_AIRPORT_OS:
    case TERRAIN_PORT_OS:
    case TERRAIN_BASE_OS:
    case TERRAIN_CITY_BM:
    case TERRAIN_HQ_BM:
    case TERRAIN_AIRPORT_BM:
    case TERRAIN_PORT_BM:
    case TERRAIN_BASE_BM:
    case TERRAIN_CITY_GE:
    case TERRAIN_HQ_GE:
    case TERRAIN_AIRPORT_GE:
    case TERRAIN_PORT_GE:
    case TERRAIN_BASE_GE:
    case TERRAIN_CITY_YC:
    case TERRAIN_HQ_YC:
    case TERRAIN_AIRPORT_YC:
    case TERRAIN_PORT_YC:
    case TERRAIN_BASE_YC:
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

int GetTileWithShadow2(int x, int y, int v) {
  const s16 *pa;
  const s16 *pb;
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
    off = gMap->rowOffset[y] - 1;
    off += x;

    switch (gMap->terrain[off]) {
    case TERRAIN_MOUNTAIN:
    case TERRAIN_WOOD:
    case TERRAIN_CITY:
    case TERRAIN_HQ:
    case TERRAIN_AIRPORT:
    case TERRAIN_PORT:
    case TERRAIN_BASE:
    case TERRAIN_CITY_OS:
    case TERRAIN_HQ_OS:
    case TERRAIN_AIRPORT_OS:
    case TERRAIN_PORT_OS:
    case TERRAIN_BASE_OS:
    case TERRAIN_CITY_BM:
    case TERRAIN_HQ_BM:
    case TERRAIN_AIRPORT_BM:
    case TERRAIN_PORT_BM:
    case TERRAIN_BASE_BM:
    case TERRAIN_CITY_GE:
    case TERRAIN_HQ_GE:
    case TERRAIN_AIRPORT_GE:
    case TERRAIN_PORT_GE:
    case TERRAIN_BASE_GE:
    case TERRAIN_CITY_YC:
    case TERRAIN_HQ_YC:
    case TERRAIN_AIRPORT_YC:
    case TERRAIN_PORT_YC:
    case TERRAIN_BASE_YC:
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

/* The `ldrsh` fixes gUnknown_0200B224[].unk00 as a signed halfword; the `lsls
 * #2` on gActiveMap->selectionIndex fixes the element stride at 4.
 */
s16 sub_08001CE8(void) { return gUnknown_0200B224[gActiveMap->selectionIndex].unk00; }

/* A linear search over the byte pairs at gUnknown_084859E0: key, value, with
 * 0xFF terminating the table and 0xE returned when the key is absent.
 *
 * The `result` local is what puts the 0xE ahead of the loop -- both exits
 * arrive at one `bx lr` with the value already in r0, so this cannot be spelled
 * as two returns. The table pointer is initialised FIRST: source order is what
 * puts the pool `ldr` ahead of the `movs`, and swapping the two statements
 * swaps the two instructions (measured, wave 42).
 *
 * The key test comes first and the terminator test is the loop's exit
 * condition, so the shape is `for (;;)` with both breaks. A `while (p[0] !=
 * key)` header emits the 0xFF compare first and costs an extra `adds r0, r3,
 * #0` on the not-found path. */
int sub_08001D04(int a1) {
  const u8 *p;
  int result;

  p = gUnknown_084859E0;
  result = 0xE;
  for (;;) {
    if (p[0] == a1) {
      result = p[1];
      break;
    }
    if (p[0] == 0xFF)
      break;
    p += 2;
  }
  return result;
}

/* Look up an id in gUnknown_0200B224 and return its index, or -1.
 *
 * gActiveMap->editMode selects both the mask and the entry count: 0x1F over
 * 17 entries, or 0x3F over 20. The two arms are structurally identical but the
 * ROM carries both bodies -- they share only the `return i` block and the -1
 * tail, which agbcc cross-jumps on its own.
 *
 * unk07 is the plain `s8` member: the `ldrb; lsls #0x18; asrs #0x18` here is
 * what agbcc emits for it when the base pointer is already in a register, and
 * is not evidence of a cast (src/decomp/c_08002EC8.c reads the same member and
 * gets the reg+reg `ldrsb` form instead).
 *
 * The `ldrh` on the s16 unk00 is the mask narrowing the load: only the low 5 or
 * 6 bits survive, so agbcc drops the sign extension. */
int sub_08001D24(int a1) {
  int i;

  if (gActiveMap->editMode == 0) {
    a1 &= 0x1F;
    for (i = 0; i <= 0x10; i++) {
      if ((gUnknown_0200B224[i].unk00 & 0x1F) == a1)
        return i;
    }
  } else {
    a1 &= 0x3F;
    for (i = 0; i <= 0x13; i++) {
      if ((gUnknown_0200B224[i].unk00 & 0x3F) == a1)
        return i;
    }
  }

  return -1;
}

void sub_08001D8C(void) { gActiveMap->tilePanelYState = 10; }

void sub_08001D9C(void) { gActiveMap->tilePanelYState = 0; }

/* Wave 37 (W37-E). Matched. PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D70C"]
 * 0x0808D70C holds &gActiveMap -- an -fforce-addr address constant. Note
 * the function reaches the SAME global both ways: through that forced address
 * at the top and through a plain `ldr =gActiveMap` pool word from the
 * second switch onwards. One source spelling, two codegen forms.
 *
 * Three things cost attempts here, all worth reusing:
 *
 * 1. `idx` MUST be a local. gActiveMap->cursorMoveScale is ordinary memory, so cse
 *    drops it at every `bl`; the four Div arguments each recomputed
 *    `(0x100 - unk68) >> 4` from scratch, +60 bytes. gSinLut is `const`, so its
 *    reads ARE preserved across the calls and need no local -- the cos<<4 CSE
 *    that lands in sl falls out on its own.
 * 2. The `& 0xFF` belongs INSIDE the gSinLut subscript, not in idx's own
 *    statement. As its own statement it emits `movs #255; ands` before the
 *    `ldr =gSinLut`; the ROM has the pool load first. Same size, wrong bytes.
 * 3. `switch` case bodies come out in SOURCE label order. The shared
 *    `case 0: case 0x1E:` arm sits THIRD in the ROM, after 0xA and 0x14 --
 *    putting it first (the natural reading order) was +4 bytes of extra
 *    branches.
 *
 * m1..m4 are four separate locals on purpose: one `u16 m` reused at the four
 * sites has a live range spanning the whole tail, and agbcc spills it -- +4
 * bytes of frame and one more callee-saved register, which pushes sx/sy off
 * r6/r5. Where the value is only TESTED in one arm of a nested if, pass a
 * literal 0 rather than the variable (the m2 site): passing the variable adds
 * an `adds r4, r0, #0` copy, while `0` lets cse pick the register the compare
 * just proved zero -- which is r7 (b) on one side and r4 (m) on the other,
 * exactly as the ROM has it. */

void sub_08001DAC(void) {
  int flag;
  int b;
  int sx;
  int sy;
  int idx;
  u16 m1;
  u16 m2;
  u16 m3;
  u16 m4;

  sx = gActiveMap->cursorX - (gMap->scrollX >> 4);
  flag = 1;

  switch (gActiveMap->tilePanelYState) {
  case 0:
    gActiveMap->tilePanelYSpeed += 2;
    if (gActiveMap->tilePanelYSpeed > 7)
      gActiveMap->tilePanelYSpeed = 8;
    gActiveMap->tilePanelY += gActiveMap->tilePanelYSpeed;
    if (gActiveMap->tilePanelY > 0xB7) {
      gActiveMap->tilePanelY = 0xB8;
      gActiveMap->tilePanelYState = flag;
    }
    flag = 0;
    break;
  case 1:
    return;
  case 0xA:
    gActiveMap->tilePanelYSpeed += 1;
    if (gActiveMap->tilePanelYSpeed > 7)
      gActiveMap->tilePanelYSpeed = 8;
    gActiveMap->tilePanelY -= gActiveMap->tilePanelYSpeed;
    if (gActiveMap->tilePanelY <= 0x6A) {
      gActiveMap->tilePanelY = 0x6A;
      gActiveMap->tilePanelYState = 0xB;
    }
    break;
  }

  switch (gActiveMap->tilePanelState) {
  case 0xA:
    gActiveMap->tilePanelX += (0x1180 - gActiveMap->tilePanelX) >> 3;
    if (gActiveMap->tilePanelX > 0xEFF) {
      gActiveMap->tilePanelX = 0xFD80;
      gActiveMap->tilePanelState = 0x14;
    }
    break;
  case 0x14:
    gActiveMap->tilePanelX += (0xA0 - gActiveMap->tilePanelX) >> 3;
    if (gActiveMap->tilePanelX >= 0) {
      gActiveMap->tilePanelX = 0;
      gActiveMap->tilePanelState = 0x1E;
    }
    break;
  case 0:
  case 0x1E:
    if (sx <= 6) {
      gActiveMap->panelSide = 1;
      gActiveMap->tilePanelState = 0x64;
    }
    break;
  case 0x64:
    gActiveMap->tilePanelX += (-960 - gActiveMap->tilePanelX) >> 3;
    if (gActiveMap->tilePanelX < -640) {
      gActiveMap->tilePanelX = 0x11A0;
      gActiveMap->tilePanelState = 0x6E;
    }
    break;
  case 0x6E:
    gActiveMap->tilePanelX += (0xB40 - gActiveMap->tilePanelX) >> 3;
    if (gActiveMap->tilePanelX <= 0xCA0) {
      gActiveMap->tilePanelX = 0xCA0;
      gActiveMap->tilePanelState = 0x78;
    }
    break;
  case 0x78:
    if (sx > 7) {
      gActiveMap->panelSide = 0;
      gActiveMap->tilePanelState = 0xA;
    }
    break;
  }

  sx = gActiveMap->tilePanelX >> 4;
  b = gActiveMap->editMode != 0;

  if (b == 0) {
    if ((gActiveMap->flags & 0x40) == 0)
      sub_08002964(0, sx + 7, gActiveMap->tilePanelY + 0x26,
                   gActiveMap->selectedTerrain, b, flag);
    sy = gActiveMap->tilePanelY;
    if ((gActiveMap->selectedTerrain & 0x1F) == 8)
      sy += 6;
  } else {
    m1 = gActiveMap->flags & 0x40;
    if (m1 == 0)
      sub_080029F4(0, sx + 7, gActiveMap->tilePanelY + 0x26, gActiveMap->cursorUnit, m1,
                   flag);
    sy = gActiveMap->tilePanelY;
  }

  if (gActiveMap->cursorMoved != 0) {
    switch (gActiveMap->cursorMoveState) {
    case 0:
      gActiveMap->cursorMoveTimer = 0xA;
      gActiveMap->cursorMoveState = 8;
      gActiveMap->cursorMoveScale = 0;
      break;
    case 9:
      sub_08000C68();
    case 8:
      gActiveMap->cursorMoveState++;
    case 0xA:
      gActiveMap->cursorMoveScale += 0x20;
      if (gActiveMap->cursorMoveScale > 0xFF)
        gActiveMap->cursorMoveScale = 0x100;
      idx = (0x100 - gActiveMap->cursorMoveScale) >> 4;
      SetObjAffine(0,
                   Div(gSinLut[0x40 + (idx & 0xFF)] << 4,
                       gActiveMap->cursorMoveScale != 0 ? gActiveMap->cursorMoveScale : 2),
                   Div(-gSinLut[idx & 0xFF] << 4, 0x100),
                   Div(gSinLut[idx & 0xFF] << 4,
                       gActiveMap->cursorMoveScale != 0 ? gActiveMap->cursorMoveScale : 2),
                   Div(gSinLut[0x40 + (idx & 0xFF)] << 4, 0x100));
      gActiveMap->cursorMoveTimer--;
      if (gActiveMap->cursorMoveTimer < 0) {
        gActiveMap->cursorMoveState = 0;
        gActiveMap->cursorMoved = 0;
      }
      break;
    }

    m2 = gActiveMap->flags & 0x40;
    if (m2 == 0) {
      if (b == 0)
        sub_0800272C(0, sx + 0xB, sy, gActiveMap->selectedTerrain, 1, b, flag);
      else
        sub_08002844(0, sx + 0xB, sy, gActiveMap->cursorUnit, 1, 0, flag);
    }
  } else {
    m3 = gActiveMap->flags & 0x40;
    if (m3 == 0) {
      if (b == 0)
        sub_0800272C(0, sx + 0xB, sy, gActiveMap->selectedTerrain,
                     gActiveMap->spriteFrame, m3, flag);
      else
        sub_08002844(0, sx + 0xB, sy, gActiveMap->cursorUnit, gActiveMap->spriteFrame, m3,
                     flag);
    }
  }

  sub_08003088(sx, sy);

  if (gActiveMap->tilePanelY > 0x9F)
    return;

  sub_08002510(sx, 0x26);

  m4 = gActiveMap->flags & 0x40;
  if (m4 == 0) {
    sub_08002298(sx, gActiveMap->tilePanelY - 10);
    DrawOamObject(0xAA, (sx + 2) & 0x1FF, (gActiveMap->tilePanelY - 1) & 0xFF, m4, 0);
    PutSprite(5, sx, gActiveMap->tilePanelY, gUnknown_08485B2C, 0x3000);
  }

  if (gActiveMap->mode != 4)
    ApplyPaletteExt(gUnknown_084891C0, 0x260, 0x20);
}

/* Wave 57 (W57-A). sub_08002510's state machine (src/decomp/c_08002510.c) on a
 * DIFFERENT lane of the same record: unk64/unk60 here are unk5a/unk5c there,
 * with the same 0 -> 0xA -> 0x14 -> 0x1E -> 0x32 -> 0x3C -> 0x46 -> 0x50 ladder
 * split across two switches and the same `v += (K - v) >> 3` easing.  Reading
 * that exemplar before this assembly is what made it a two-probe match.
 * PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D710"]
 * 0x0808D710 holds &gActiveMap (dereferenced in baserom.gba), its own
 * -fforce-addr copy beside sub_08002510's 0x0808D714, so the honest
 * `gActiveMap` spelling is what produces the ROM's
 * `ldr rN,=<pool>; ldr rM,[rN]; ldr rP,[rM]` triple.
 *
 * a1 is declared and never read, exactly as in sub_08002510.
 *
 * `a2 &= 0xFF` IS LOAD-BEARING and is not the same code as `v = a2 & 0xFF`.
 * The ROM passes the masked value to sub_0802BD54's u16 parameter as
 * `lsls #0x10; lsrs #0x10`, and that truncation is redundant on a value known
 * to fit in 8 bits -- combine deletes it via nonzero_bits, which is only
 * tracked for a pseudo with ONE set.  Masking the parameter in place gives it
 * two sets (the incoming copy and the AND), nonzero_bits goes unknown, and the
 * pair survives.  A separate `int v = a2 & 0xFF;` is a single-set pseudo and
 * folds the pair away -- measured both ways with compile_probe, and it is the
 * only difference between a 632-byte match and a 628-byte miss.  sub_08002510
 * never discriminated this because it passes its `v` only to DrawOamObject's
 * int parameter.
 *
 * 0xFD80 is unsigned because the ROM's pool word is `.4byte 0x0000FD80`, while
 * -800 / -640 are full negative ints (`0xFFFFFCE0` / `0xFFFFFD80`).
 * unk12 stays u8 with an (s8) cast at each use, per its header comment. */
void sub_08002298(int a1, int a2) {
  int a;

  a2 &= 0xFF;

  switch (gActiveMap->countPanelState) {
  case 0:
    if (gActiveMap->editMode == 0) {
      if (GetPropertyKindForTerrain(gActiveMap->selectedTerrain) == 0)
        return;
    } else if (gActiveMap->cursorUnit == 0x19) {
      return;
    }
    gActiveMap->countPanelState = gActiveMap->panelSide != 0 ? 0xA : 0x32;
    gActiveMap->countPanelX = 0x1180;
    break;
  case 0xA:
    gActiveMap->countPanelX += (0xBE0 - gActiveMap->countPanelX) >> 3;
    if (gActiveMap->countPanelX <= 0xCC0) {
      gActiveMap->countPanelX = 0xCC0;
      gActiveMap->countPanelState = 0x14;
    }
    break;
  case 0x14:
    if (gActiveMap->editMode == 0) {
      if (gActiveMap->panelSide == 0 ||
          GetPropertyKindForTerrain(gActiveMap->selectedTerrain) == 0)
        gActiveMap->countPanelState = 0x1E;
    } else if (gActiveMap->panelSide == 0 || gActiveMap->cursorUnit == 0x19) {
      gActiveMap->countPanelState = 0x1E;
    }
    break;
  case 0x1E:
    gActiveMap->countPanelX += (0x1180 - gActiveMap->countPanelX) >> 3;
    if (gActiveMap->countPanelX > 0x10DF) {
      gActiveMap->countPanelX = 0x10E0;
      gActiveMap->countPanelState = gActiveMap->panelSide == 0 ? 0x32 : 0;
    }
    break;
  }

  switch (gActiveMap->countPanelState) {
  case 0x32:
    if (gActiveMap->editMode == 0) {
      if (GetPropertyKindForTerrain(gActiveMap->selectedTerrain) == 0)
        return;
    } else if (gActiveMap->cursorUnit == 0x19) {
      return;
    }
    gActiveMap->countPanelState = gActiveMap->panelSide == 0 ? 0x3C : 0;
    gActiveMap->countPanelX = 0xFD80;
    break;
  case 0x3C:
    gActiveMap->countPanelX += (0x320 - gActiveMap->countPanelX) >> 3;
    if (gActiveMap->countPanelX > 0xBF) {
      gActiveMap->countPanelX = 0xC0;
      gActiveMap->countPanelState = 0x46;
    }
    break;
  case 0x46:
    if (gActiveMap->editMode == 0) {
      if (gActiveMap->panelSide != 0 ||
          GetPropertyKindForTerrain(gActiveMap->selectedTerrain) == 0)
        gActiveMap->countPanelState = 0x50;
    } else if (gActiveMap->panelSide != 0 || gActiveMap->cursorUnit == 0x19) {
      gActiveMap->countPanelState = 0x50;
    }
    break;
  case 0x50:
    gActiveMap->countPanelX += (-800 - gActiveMap->countPanelX) >> 3;
    if (gActiveMap->countPanelX <= -640) {
      gActiveMap->countPanelX = -640;
      gActiveMap->countPanelState = gActiveMap->panelSide == 0 ? 0x32 : 0;
    }
    break;
  }

  a = gActiveMap->countPanelX >> 4;
  DrawOamObject(0x54, (a - 0xC) & 0x1FF, a2 + 1, 0, 0);
  if (gActiveMap->editMode == 0)
    sub_0802BD54((a + 0x1A) & 0x1FF, a2, 0x3C - (s8)gActiveMap->propertyCount);
  else
    sub_0802BD54(
        (a + 0x1A) & 0x1FF, a2,
        0x32 - (s8)((struct ActiveMap *)((u8 *)gActiveMap + gActiveMap->unitArmy))
                   ->propertyCount);
}

/* Wave 37 (W37-E). Matched first attempt. PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D714"]
 * 0x0808D714 holds &gActiveMap (dereferenced in baserom.gba), so this is
 * an -fforce-addr address constant and the honest `gActiveMap` spelling
 * is what produces the ROM's `ldr rN,=<pool>; ldr rM,[rN]; ldr rP,[rM]` triple.
 * Do not invent a `gUnknown_0808D714` global for it.
 *
 * This is sub_080030BC's state machine (src/decomp/c_080030BC.c) run on a
 * SINGLE lane: unk5a / unk5c here are unk72[i] / unk82[i] there, with the same
 * 0 -> 0xA -> 0x14 -> 0x1E -> 0x32 -> 0x3C -> 0x46 -> 0x50 ladder split across
 * two switches and the same `v += (K - v) >> 3` easing. Reading that exemplar
 * before this assembly is what made it a one-attempt match.
 *
 * a1 is declared and never read -- exactly like sub_080030BC's a2/a3.
 * 0xFD80 is unsigned because the ROM's pool word is `.4byte 0x0000FD80`, while
 * -928 / -480 are full negative ints (`0xFFFFFC60` / `0xFFFFFE20`). */

void sub_08002510(int a1, int a2) {
  int v;

  v = a2 & 0xFF;

  switch (gActiveMap->sidePanelState) {
  case 0:
    if (sub_0800C9E8() == 0)
      return;
    gActiveMap->sidePanelState = gActiveMap->panelSide != 0 ? 0xA : 0x32;
    gActiveMap->sidePanelX = 0x1180;
    break;
  case 0xA:
    gActiveMap->sidePanelX += (0xB40 - gActiveMap->sidePanelX) >> 3;
    if (gActiveMap->sidePanelX <= 0xD60) {
      gActiveMap->sidePanelX = 0xD60;
      gActiveMap->sidePanelState = 0x14;
    }
    break;
  case 0x14:
    if (sub_0800C9E8() == 0 || gActiveMap->panelSide == 0 || gActiveMap->mode != 1)
      gActiveMap->sidePanelState = 0x1E;
    break;
  case 0x1E:
    gActiveMap->sidePanelX += (0x12A0 - gActiveMap->sidePanelX) >> 3;
    if (gActiveMap->sidePanelX > 0x10DF) {
      gActiveMap->sidePanelX = 0x10E0;
      if (sub_0800C9E8() == 0)
        return;
      if (gActiveMap->mode == 1)
        gActiveMap->sidePanelState = gActiveMap->panelSide == 0 ? 0x32 : 0;
    }
    break;
  }

  switch (gActiveMap->sidePanelState) {
  case 0x32:
    if (sub_0800C9E8() == 0)
      return;
    gActiveMap->sidePanelState = gActiveMap->panelSide == 0 ? 0x3C : 0;
    gActiveMap->sidePanelX = 0xFD80;
    break;
  case 0x3C:
    gActiveMap->sidePanelX += (0x3C0 - gActiveMap->sidePanelX) >> 3;
    if (gActiveMap->sidePanelX > 0x19F) {
      gActiveMap->sidePanelX = 0x1A0;
      gActiveMap->sidePanelState = 0x46;
    }
    break;
  case 0x46:
    if (sub_0800C9E8() == 0 || gActiveMap->panelSide != 0 || gActiveMap->mode != 1)
      gActiveMap->sidePanelState = 0x50;
    break;
  case 0x50:
    gActiveMap->sidePanelX += (-928 - gActiveMap->sidePanelX) >> 3;
    if (gActiveMap->sidePanelX <= -480) {
      gActiveMap->sidePanelX = -480;
      if (sub_0800C9E8() == 0)
        return;
      if (gActiveMap->mode == 1)
        gActiveMap->sidePanelState = gActiveMap->panelSide == 0 ? 0x32 : 0;
    }
    break;
  }

  DrawOamObject(0x8F, ((gActiveMap->sidePanelX >> 4) - 0x18) & 0x1FF, v, 0, 0);
  gActiveMap->sidePanelFrame = (gActiveMap->sidePanelFrame + 1) & 0x3F;
}

/* Loads one of eleven OBJ graphics sets into OBJ VRAM and then hands the
 * resulting sprite to sub_0801BD00.
 *
 * a4 is a kind code. Its low five bits select the loader family; the value 8
 * there means "one of the five sized variants", which the switch turns into
 * sub_0803F6BC's second argument, and anything else is passed through with
 * variant 1 and shifts the sprite down eight pixels. */
void sub_0800272C(int a1, int a2, int a3, int a4, int a5, int a6, int a7) {
  void *dest;

  dest = (void *)(0x06010000 + ((gUnknown_08485C9C[a1] & 0x3FF) << 5));

  if ((a4 & 0x1F) == 8) {
    switch (a4) {
    case 0x08:
    case 0x28:
      sub_0803F6BC(8, 1, dest, a7);
      break;
    case 0x48:
      sub_0803F6BC(8, 2, dest, a7);
      break;
    case 0x68:
      sub_0803F6BC(8, 3, dest, a7);
      break;
    case 0x88:
      sub_0803F6BC(8, 4, dest, a7);
      break;
    }
  } else {
    sub_0803F6BC(a4 & 0x1F, 1, dest, a7);
    a3 += 8;
  }

  if (a5) {
    int attr1;

    attr1 = a2 & 0x1FF;
    if (a6)
      attr1 |= 0x1000;
    a3 = (a3 & 0xFF) | 0x500;
    sub_0801BD00(attr1, a3, gUnknown_08485CC8[a1], sub_08001D04(a4) << 12);
  } else {
    int attr1;

    attr1 = a2 & 0x1FF;
    if (a6)
      attr1 |= 0x1000;
    a3 = (a3 & 0xFF) | 0x400;
    sub_0801BD00(attr1, a3, gUnknown_08485CC8[a1], sub_08001D04(a4) << 12);
  }
}

/* The sibling of sub_0800272C one table along: loads a unit's OBJ graphics and
 * palette and hands the sprite to sub_0801BD00. a4's low six bits are the unit
 * kind; 0x19 takes a wholly different loader and a different sprite mode.
 *
 * `pal` must be a single-assignment local, NOT a folded 0x6000 in the ternary.
 * agbcc synthesises the constant 0x6000 as `mov #0xC0; lsl #7` (its split takes
 * the SMALLEST shift), but the ROM has `mov r0,#6; lsl r3,r0,#0xc` -- a real
 * ashift whose input is rematerialised into a scratch. That is what a
 * single-def constant local gets: its def is in another basic block so combine
 * never folds the shift, local-alloc gives it reg_equiv_constant instead of a
 * hard register, and reload reloads the 6 into r0 at the use. */
void sub_08002844(int a1, int a2, int a3, int a4, int a5, int a6, int a7) {
  int cls;
  int attr0, attr1;
  int pal;

  pal = 6;
  cls = (s8)gActiveMap->unitArmy;
  if (cls == 0)
    cls = 1;

  a4 &= 0x3F;
  if (a4 != 0x19) {
    if (a7) {
      sub_08011E54(
          sub_08026190() + ((sub_080261A4(cls, a4) & 0x3FF) << 5),
          (void *)(0x06010000 + ((gUnknown_08485D20[a1] & 0x3FF) << 5)), 0x80);
    }
    ApplyPalette(
        (u16 *)(gUnknown_0810E6E0 + (gPlayers[cls].teamColor - 1) * 0x20), 22);
  } else {
    sub_0801F19C(0x12, (void *)0x06010000, gUnknown_08485D20[a1]);
    ApplyPalette(gUnknown_081268D8, 30);
  }

  a3 += 8;

  attr1 = a2 & 0x1FF;
  if (a6)
    attr1 |= 0x1000;
  attr0 = ((a3 + 8) & 0xFF) | 0x400;
  if (a5)
    attr0 |= 0x100;
  sub_0801BD00(attr1, attr0, gUnknown_08485D44[a1],
               a4 != 0x19 ? pal << 12 : 0xE000);
}

void sub_08002964(int a1, int a2, int a3, int a4, int a5, int a6) {
  int idx;
  int attr0, attr1;

  GetDesignRoomOption(a4);
  if (a1 != 0)
    idx = a1 * 8 + 0x2B2;
  else
    idx = 0x262;

  if (a6)
    sub_08011E54((void *)GetTerrainNameGraphic(a4 & 0x1F),
                 (void *)(0x06010000 + (idx << 5)), 0x100);

  attr1 = (a2 - 4) & 0x1FF;
  attr0 = (a3 & 0xFF) | 0x400;
  if (a5)
    attr0 |= 0x100;
  sub_0801BD00(attr1, attr0, gUnknown_08485CF4[a1], 0x1000);
}

/* Draws one CO-power / terrain-window sprite, loading its graphic into OBJ
 * VRAM first when a6 says to.  a1 selects the army: 0 uses the fixed VRAM slot
 * at 0x06014BC0, anything else the per-army slot eight tiles further along.
 *
 * FOUND BY THE PERMUTER (wave 61) after this function had been parked since
 * wave 52 as "compiler output we cannot spell".  TWO THINGS BELOW ARE
 * LOAD-BEARING AND MUST NOT BE TIDIED AWAY -- both were re-checked with
 * trymatch after each edit:
 *
 *   1. `idxBase` HOLDS 0x28C IN A VARIABLE, assigned before the `if (a6)`.
 *      That is the fold barrier.  Written as a literal, agbcc collapses
 *      ((a1 - 1) * 8 + 0x28C) * 32 + 0x06010000 to `lsls r6,#8` plus a
 *      0x06015080 pool word; held in a variable it emits the ROM's own
 *      unfolded `movs #0xa3; lsls #2; adds; lsls #5; ldr =0x06010000; adds`.
 *      Waves 52, 57 and 59 ruled out statement splits, block boundaries,
 *      reference counts and all six compiler profiles looking for this; a
 *      variable-held constant is what it turned out to be.
 *
 *   2. `t = (a1 - 1) * 8;` LOOKS DEAD AND IS NOT.  Nothing reads t afterwards,
 *      but deleting the store loses the match, and so does reusing t as the
 *      index in place of recomputing (a1 - 1) * 8 in the expression (196
 *      bytes).  The store is doing register-allocation work, so the source
 *      really does compute that product twice.
 *
 * t is read for gUnknown_08489190[t] in both arms BEFORE it is overwritten,
 * so the reuse is legitimate and the source argument is the diamond's.
 */
void sub_080029F4(int a1, int a2, int a3, int a4, int a5, int a6) {
  u8 t;
  int k;
  void *src;
  int attr0;
  int attr1;
  int idxBase;

  t = gUnknown_02028E40;
  k = a4 & 0x3F;
  idxBase = 0x28C;

  if (a6 != 0) {
    if (a1 == 0) {
      if (k != 0x19)
        src = (void *)sub_0802A838(k);
      else
        src = gUnknown_08489190[t];

      sub_08011E54(src, (void *)0x06014BC0, 0x100);
    } else {
      if (k != 0x19)
        src = (void *)sub_0802A838(k);
      else
        src = gUnknown_08489190[t];

      t = (a1 - 1) * 8;
      sub_08011E54(
          src, (void *)(0x06010000 + ((((a1 - 1) * 8) + idxBase) << 5)), 0x100);
    }
  }

  attr1 = (a2 - 4) & 0x1FF;
  attr0 = (a3 & 0xFF) | 0x400;
  if (a5)
    attr0 |= 0x100;

  sub_0801BD00(attr1, attr0, gUnknown_08485D68[a1], 0x1000);
}

void sub_08002AB0(void) {
  int i;
  int j;
  int flag;
  struct DesignRingEntry *q;

  if (gActiveMap->flags & 0x10) {
    sub_0801BD00(0x78, 0x48C, (void *)gUnknown_08485B52, 0);
    if (gActiveMap->state == 0x33) {
      flag = gActiveMap->editMode;
      j = gActiveMap->ringIndex + 3;
      if (flag == 0)
        j = gActiveMap->ringIndex + 4;
      if (j > 9)
        j -= 10;
      switch (gDesignRing[j].itemId & 0x1F) {
      case 6:
      case 8:
      case 10:
      case 11:
      case 14:
        if (gActiveMap->spriteId == -1)
          sub_08007B54();
        break;
      }
    } else {
      sub_08007B74();
    }
  }

  j = gActiveMap->ringIndex;
  for (i = 9; i >= 0; i--) {
    q = &gDesignRing[j];
    j++;
    if (j > 9)
      j -= 10;
    if (q->flags & 1) {
      if (!(q->flags & 0x80))
        sub_08002964(q->spriteSlot + 1, (q->x >> 8) - 4, (q->y >> 8) + 0x21,
                     q->itemId, q->flags & 0x20, q->flags & 8);
      if (!(q->flags & 0x40))
        sub_0800272C(q->spriteSlot + 1, q->x >> 8, q->y >> 8, q->itemId,
                     q->flags & 0x10, q->flags & 0x100, q->flags & 8);
      q->flags &= ~8;
    }
  }
}

void sub_08002C38(void) {
  int i;
  int j;
  struct DesignRingEntry *q;

  if (gActiveMap->flags & 0x10) {
    sub_0801BD00(0x78, 0x48C, (void *)gUnknown_08485B52, 0);
    if (gActiveMap->state == 0x33) {
      j = gActiveMap->ringIndex + 3;
      if (j > 7)
        j = gActiveMap->ringIndex - 5;
      if (gDesignRing[j].itemId != 0x19) {
        if (gActiveMap->spriteId == -1)
          sub_08007B54();
      } else {
        sub_08007B74();
      }
    }
  }

  j = gActiveMap->ringIndex;
  for (i = 7; i >= 0; i--) {
    q = &gDesignRing[j];
    j++;
    if (j > 7)
      j -= 8;
    if (q->flags & 1) {
      if (!(q->flags & 0x80))
        sub_080029F4(q->spriteSlot + 1, (q->x >> 8) - 4, (q->y >> 8) + 0x21,
                     q->itemId, q->flags & 0x20, q->flags & 8);
      if (!(q->flags & 0x40))
        sub_08002844(q->spriteSlot + 1, q->x >> 8, q->y >> 8, q->itemId,
                     q->flags & 0x10, q->flags & 0x100, q->flags & 8);
      q->flags &= ~8;
    }
  }
}

void sub_08002D7C(void) {
  sub_0801F114();
  sub_0801F150(1, (void *)0x06010000, 0x31C, 0x14);
  sub_0801F234(0x3E);
  sub_0801F234(0x3F);
  sub_0801F234(0x40);
  sub_0801F234(0x41);
  sub_0801F150(2, (void *)0x06010000, 0x32C, 0x1D);
  sub_0801F234(0x54);
  sub_0801F234(0x90);
  sub_0801F234(0x91);
  sub_0801F234(0x8E);
  sub_0801F234(0x8F);
  sub_0801F234(0xAA);
  sub_08002EF8();
}

void sub_08002DEC(void) {
  ApplyPaletteExt((u16 *)GetTerrainNamePalette(3, 0), 0x2E0, 0x20);
  ApplyPaletteExt((u16 *)GetTerrainNamePalette(0xF, 0), 0x2C0, 0x20);
  ApplyPaletteExt((u16 *)GetTerrainNamePalette(1, 0), 0x3C0, 0x20);
  ApplyPaletteExt((u16 *)GetTerrainNamePalette(5, 0), 0x3E0, 0x20);
}

/* A 0x460-byte VRAM push and one call. 0x460 is `movs #0x8c; lsls #3`, agbcc's
 * way of building an even constant above 255 without a pool word. */
void sub_08002E3C(void) {
  sub_08011E54(gUnknown_0808D8AC, (void *)0x06014D40, 0x460);
  sub_08002EF8();
}

void sub_08002E5C(void) {
  sub_08011E54(gUnknown_0808D8AC, (void *)0x06014D40, 0x460);
  sub_08002EF8();
  sub_08011E54(gUnknown_0808DD0C, (void *)0x06016180, 0x200);
  sub_08011E54(gUnknown_0808DF0C, (void *)0x06016140, 0x20);
  sub_08011E54(gUnknown_0808DF2C, (void *)0x06016160, 0x20);
}

/* F018: `push {lr}; bl a; bl b; bl c; pop {r0}; bx r0`.
 * THREE INDEPENDENT STATEMENTS, not a nest. Nothing moves r0 between the `bl`s,
 * which by itself does not separate `c(b(a()))` from three calls -- both leave
 * r0 alone. What settles it is the callees: all three take no arguments (none
 * of them reads r0-r3 before writing it) and all three end `pop {r0}`, i.e.
 * void, so there is no value to nest. src/decomp/c_08048558.c is the matched
 * exemplar of the same shape. */
void sub_08002EB4(void) {
  sub_08002DEC();
  sub_08002D7C();
  sub_08002E5C();
}

/* Bit 5 of the flag word gates a two-way choice on unk07.
 *
 * unk07 is read `movs r0, #7; ldrsb r0, [r2, r0]` -- the reg+reg form agbcc
 * rewrites a plain s8 member load into, and the same tell that settled unk06 in
 * sub_08000664. The pointer is loaded once and held: nothing here writes
 * through it, so there is no aliasing reload.
 *
 * Wave 31 declared this `void (void)` from its call sites in sub_08000DC0
 * before its body had been read; the body agrees -- no argument register is
 * read, and the epilogue is `pop {r0}; bx r0`. */
void sub_08002EC8(void) {
  sub_08001DAC();

  if ((gActiveMap->flags & 0x20) == 0) {
    if (gActiveMap->editMode == 0)
      sub_08002AB0();
    else
      sub_08002C38();
  }
}

/* One call whose second argument is 0xAB or 0xAA depending on unk07, and whose
 * first is always 0xAA.
 *
 * An if/ELSE, not `v = 0xAA;` followed by a guarded overwrite: both spellings
 * preset r1 to 0xAA and conditionally replace it, but the plain assignment puts
 * that `movs r1, #0xaa` ahead of the pool load, where the ROM has it after the
 * field has been read.
 *
 * The two 0xAA are NOT shared: agbcc does not CSE a `movs` of a small constant
 * across a branch -- the same observation as src/decomp/c_0802D168.c's two
 * `movs r0, #1`. */
void sub_08002EF8(void) {
  int v;

  if (gActiveMap->editMode == 0)
    v = 0xAB;
  else
    v = 0xAA;

  sub_0801F1EC(0xAA, v);
}

/* Draws the 5x4 grid of unit icons from a 20-halfword template copied onto the
 * stack. `k` walks the template flat while `i` and `j` place the cell: `x`
 * steps 0x14 across a row from 0x4C, `y` steps 0x19 down from 0x13.
 *
 * `gUnknown_08485CC8[i + 1]` is why `adds r6, #1` sits in the middle of the
 * body rather than at the bottom -- the same idiom the matched sub_08003640
 * uses on gUnknown_08485C9C, and it is what makes the counter run 1..4 while
 * the coordinate givs run from the i = 0 origin.
 *
 * The `lsls #0x10` hoisted into the outer loop with only the `lsrs #0x10` left
 * at the call is LICM on the u16 conversion sub_0802BD54's second parameter
 * forces; it must not be authored. */
void sub_08002F1C(void) {
  u16 buf[0x14];
  int i, j, k, x, y;
  u16 t;

  sub_0808B6E8(buf, gUnknown_0808D728, 0x28);
  y = 0x13;
  k = 0;
  for (j = 0; j <= 4; j++) {
    x = 0x4C;
    for (i = 0; i <= 3; i++) {
      t = buf[k];
      sub_0802BD54((x + 0xA) & 0x1FF, (y + 0x10) | 0x400, sub_0800C8A0(t));
      sub_0801BD00((x + 2) & 0x1FF, y | 0x400, gUnknown_08485CC8[i + 1],
                   sub_08001D04(t) << 12);
      x += 0x14;
      k++;
    }
    y += 0x19;
  }
}

/* Loads the four unit-slot graphics named by a 4-byte template on the stack.
 *
 * `gUnknown_08485C9C[i + 1]` is the same spelling the matched sub_08003640
 * (src/decomp/c_08003640.c) uses on the same table, and it is what puts
 * `adds r4, #1` between the two array reads: the template is indexed with the
 * pre-increment value and the tile table with the post-increment one. */
void sub_08002FE4(void) {
  u8 buf[4];
  int i;

  sub_0808B6E8(buf, gUnknown_0808D750, 4);
  sub_0801A444(9, 2, 0xB, 0x11);
  sub_08013AD4(2);
  for (i = 0; i <= 3; i++) {
    sub_0803F6BC(buf[i] & 0x1F, 0,
                 (void *)(0x06010000 + (gUnknown_08485C9C[i + 1] << 5)), 1);
  }
}
