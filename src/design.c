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

int sub_080012DC(int a) {
  int r;

  r = 0;

  switch (a) {
  case TERRAIN_CITY:
    r = 0x1c2;
    break;
  case TERRAIN_CITY_OS:
    r = 0x1c7;
    break;
  case TERRAIN_CITY_BM:
    r = 0x1cc;
    break;
  case TERRAIN_CITY_GE:
    r = 0x1d1;
    break;
  case TERRAIN_CITY_YC:
    r = 0x1d6;
    break;

  case TERRAIN_HQ:
    r = 0x1c0;
    break;
  case TERRAIN_HQ_OS:
    r = 0x1c5;
    break;
  case TERRAIN_HQ_BM:
    r = 0x1ca;
    break;
  case TERRAIN_HQ_GE:
    r = 0x1cf;
    break;
  case TERRAIN_HQ_YC:
    r = 0x1d4;
    break;

  case TERRAIN_AIRPORT:
    r = 0x1c3;
    break;
  case TERRAIN_AIRPORT_OS:
    r = 0x1c8;
    break;
  case TERRAIN_AIRPORT_BM:
    r = 0x1cd;
    break;
  case TERRAIN_AIRPORT_GE:
    r = 0x1d2;
    break;
  case TERRAIN_AIRPORT_YC:
    r = 0x1d7;
    break;

  case TERRAIN_PORT:
    r = 0x1c4;
    break;
  case TERRAIN_PORT_OS:
    r = 0x1c9;
    break;
  case TERRAIN_PORT_BM:
    r = 0x1ce;
    break;
  case TERRAIN_PORT_GE:
    r = 0x1d3;
    break;
  case TERRAIN_PORT_YC:
    r = 0x1d8;
    break;

  case TERRAIN_BASE:
    r = 0x1c1;
    break;
  case TERRAIN_BASE_OS:
    r = 0x1c6;
    break;
  case TERRAIN_BASE_BM:
    r = 0x1cb;
    break;
  case TERRAIN_BASE_GE:
    r = 0x1d0;
    break;
  case TERRAIN_BASE_YC:
    r = 0x1d5;
    break;

  case TERRAIN_SILO:
    r = 0x180;
    break;
  }

  return r;
}

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

int GetTileWithShadow_unkMapA22(int x, int y) {
  struct Map *map = gMap;

  return GetTileWithShadow(x, y, map->tile[map->rowOffset[y] + x]);
}

asm(".global sub_080016D0\n.thumb_set sub_080016D0, "
    "GetTileWithShadow_unkMapA22\n");

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
 * #2` on gActiveMap->unk28 fixes the element stride at 4.
 */
s16 sub_08001CE8(void) { return gUnknown_0200B224[gActiveMap->unk28].unk00; }

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
 * gActiveMap->unk07 selects both the mask and the entry count: 0x1F over
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

  if (gActiveMap->unk07 == 0) {
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

void sub_08001D8C(void) { gActiveMap->unk4c = 10; }

void sub_08001D9C(void) { gActiveMap->unk4c = 0; }

/* Wave 37 (W37-E). Matched. PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D70C"]
 * 0x0808D70C holds &gActiveMap -- an -fforce-addr address constant. Note
 * the function reaches the SAME global both ways: through that forced address
 * at the top and through a plain `ldr =gActiveMap` pool word from the
 * second switch onwards. One source spelling, two codegen forms.
 *
 * Three things cost attempts here, all worth reusing:
 *
 * 1. `idx` MUST be a local. gActiveMap->unk68 is ordinary memory, so cse
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

  switch (gActiveMap->unk4c) {
  case 0:
    gActiveMap->unk54 += 2;
    if (gActiveMap->unk54 > 7)
      gActiveMap->unk54 = 8;
    gActiveMap->unk50 += gActiveMap->unk54;
    if (gActiveMap->unk50 > 0xB7) {
      gActiveMap->unk50 = 0xB8;
      gActiveMap->unk4c = flag;
    }
    flag = 0;
    break;
  case 1:
    return;
  case 0xA:
    gActiveMap->unk54 += 1;
    if (gActiveMap->unk54 > 7)
      gActiveMap->unk54 = 8;
    gActiveMap->unk50 -= gActiveMap->unk54;
    if (gActiveMap->unk50 <= 0x6A) {
      gActiveMap->unk50 = 0x6A;
      gActiveMap->unk4c = 0xB;
    }
    break;
  }

  switch (gActiveMap->unk4a) {
  case 0xA:
    gActiveMap->unk4e += (0x1180 - gActiveMap->unk4e) >> 3;
    if (gActiveMap->unk4e > 0xEFF) {
      gActiveMap->unk4e = 0xFD80;
      gActiveMap->unk4a = 0x14;
    }
    break;
  case 0x14:
    gActiveMap->unk4e += (0xA0 - gActiveMap->unk4e) >> 3;
    if (gActiveMap->unk4e >= 0) {
      gActiveMap->unk4e = 0;
      gActiveMap->unk4a = 0x1E;
    }
    break;
  case 0:
  case 0x1E:
    if (sx <= 6) {
      gActiveMap->unk3e = 1;
      gActiveMap->unk4a = 0x64;
    }
    break;
  case 0x64:
    gActiveMap->unk4e += (-960 - gActiveMap->unk4e) >> 3;
    if (gActiveMap->unk4e < -640) {
      gActiveMap->unk4e = 0x11A0;
      gActiveMap->unk4a = 0x6E;
    }
    break;
  case 0x6E:
    gActiveMap->unk4e += (0xB40 - gActiveMap->unk4e) >> 3;
    if (gActiveMap->unk4e <= 0xCA0) {
      gActiveMap->unk4e = 0xCA0;
      gActiveMap->unk4a = 0x78;
    }
    break;
  case 0x78:
    if (sx > 7) {
      gActiveMap->unk3e = 0;
      gActiveMap->unk4a = 0xA;
    }
    break;
  }

  sx = gActiveMap->unk4e >> 4;
  b = gActiveMap->unk07 != 0;

  if (b == 0) {
    if ((gActiveMap->unk00 & 0x40) == 0)
      sub_08002964(0, sx + 7, gActiveMap->unk50 + 0x26,
                   gActiveMap->selectedTerrain, b, flag);
    sy = gActiveMap->unk50;
    if ((gActiveMap->selectedTerrain & 0x1F) == 8)
      sy += 6;
  } else {
    m1 = gActiveMap->unk00 & 0x40;
    if (m1 == 0)
      sub_080029F4(0, sx + 7, gActiveMap->unk50 + 0x26, gActiveMap->unk24, m1,
                   flag);
    sy = gActiveMap->unk50;
  }

  if (gActiveMap->unk65 != 0) {
    switch (gActiveMap->unk66) {
    case 0:
      gActiveMap->unk67 = 0xA;
      gActiveMap->unk66 = 8;
      gActiveMap->unk68 = 0;
      break;
    case 9:
      sub_08000C68();
    case 8:
      gActiveMap->unk66++;
    case 0xA:
      gActiveMap->unk68 += 0x20;
      if (gActiveMap->unk68 > 0xFF)
        gActiveMap->unk68 = 0x100;
      idx = (0x100 - gActiveMap->unk68) >> 4;
      SetObjAffine(0,
                   Div(gSinLut[0x40 + (idx & 0xFF)] << 4,
                       gActiveMap->unk68 != 0 ? gActiveMap->unk68 : 2),
                   Div(-gSinLut[idx & 0xFF] << 4, 0x100),
                   Div(gSinLut[idx & 0xFF] << 4,
                       gActiveMap->unk68 != 0 ? gActiveMap->unk68 : 2),
                   Div(gSinLut[0x40 + (idx & 0xFF)] << 4, 0x100));
      gActiveMap->unk67--;
      if (gActiveMap->unk67 < 0) {
        gActiveMap->unk66 = 0;
        gActiveMap->unk65 = 0;
      }
      break;
    }

    m2 = gActiveMap->unk00 & 0x40;
    if (m2 == 0) {
      if (b == 0)
        sub_0800272C(0, sx + 0xB, sy, gActiveMap->selectedTerrain, 1, b, flag);
      else
        sub_08002844(0, sx + 0xB, sy, gActiveMap->unk24, 1, 0, flag);
    }
  } else {
    m3 = gActiveMap->unk00 & 0x40;
    if (m3 == 0) {
      if (b == 0)
        sub_0800272C(0, sx + 0xB, sy, gActiveMap->selectedTerrain,
                     gActiveMap->unk34, m3, flag);
      else
        sub_08002844(0, sx + 0xB, sy, gActiveMap->unk24, gActiveMap->unk34, m3,
                     flag);
    }
  }

  sub_08003088(sx, sy);

  if (gActiveMap->unk50 > 0x9F)
    return;

  sub_08002510(sx, 0x26);

  m4 = gActiveMap->unk00 & 0x40;
  if (m4 == 0) {
    sub_08002298(sx, gActiveMap->unk50 - 10);
    sub_0801F34C(0xAA, (sx + 2) & 0x1FF, (gActiveMap->unk50 - 1) & 0xFF, m4, 0);
    PutSprite(5, sx, gActiveMap->unk50, gUnknown_08485B2C, 0x3000);
  }

  if (gActiveMap->unk04 != 4)
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
 * never discriminated this because it passes its `v` only to sub_0801F34C's
 * int parameter.
 *
 * 0xFD80 is unsigned because the ROM's pool word is `.4byte 0x0000FD80`, while
 * -800 / -640 are full negative ints (`0xFFFFFCE0` / `0xFFFFFD80`).
 * unk12 stays u8 with an (s8) cast at each use, per its header comment. */
void sub_08002298(int a1, int a2) {
  int a;

  a2 &= 0xFF;

  switch (gActiveMap->unk64) {
  case 0:
    if (gActiveMap->unk07 == 0) {
      if (sub_0800C7E8(gActiveMap->selectedTerrain) == 0)
        return;
    } else if (gActiveMap->unk24 == 0x19) {
      return;
    }
    gActiveMap->unk64 = gActiveMap->unk3e != 0 ? 0xA : 0x32;
    gActiveMap->unk60 = 0x1180;
    break;
  case 0xA:
    gActiveMap->unk60 += (0xBE0 - gActiveMap->unk60) >> 3;
    if (gActiveMap->unk60 <= 0xCC0) {
      gActiveMap->unk60 = 0xCC0;
      gActiveMap->unk64 = 0x14;
    }
    break;
  case 0x14:
    if (gActiveMap->unk07 == 0) {
      if (gActiveMap->unk3e == 0 ||
          sub_0800C7E8(gActiveMap->selectedTerrain) == 0)
        gActiveMap->unk64 = 0x1E;
    } else if (gActiveMap->unk3e == 0 || gActiveMap->unk24 == 0x19) {
      gActiveMap->unk64 = 0x1E;
    }
    break;
  case 0x1E:
    gActiveMap->unk60 += (0x1180 - gActiveMap->unk60) >> 3;
    if (gActiveMap->unk60 > 0x10DF) {
      gActiveMap->unk60 = 0x10E0;
      gActiveMap->unk64 = gActiveMap->unk3e == 0 ? 0x32 : 0;
    }
    break;
  }

  switch (gActiveMap->unk64) {
  case 0x32:
    if (gActiveMap->unk07 == 0) {
      if (sub_0800C7E8(gActiveMap->selectedTerrain) == 0)
        return;
    } else if (gActiveMap->unk24 == 0x19) {
      return;
    }
    gActiveMap->unk64 = gActiveMap->unk3e == 0 ? 0x3C : 0;
    gActiveMap->unk60 = 0xFD80;
    break;
  case 0x3C:
    gActiveMap->unk60 += (0x320 - gActiveMap->unk60) >> 3;
    if (gActiveMap->unk60 > 0xBF) {
      gActiveMap->unk60 = 0xC0;
      gActiveMap->unk64 = 0x46;
    }
    break;
  case 0x46:
    if (gActiveMap->unk07 == 0) {
      if (gActiveMap->unk3e != 0 ||
          sub_0800C7E8(gActiveMap->selectedTerrain) == 0)
        gActiveMap->unk64 = 0x50;
    } else if (gActiveMap->unk3e != 0 || gActiveMap->unk24 == 0x19) {
      gActiveMap->unk64 = 0x50;
    }
    break;
  case 0x50:
    gActiveMap->unk60 += (-800 - gActiveMap->unk60) >> 3;
    if (gActiveMap->unk60 <= -640) {
      gActiveMap->unk60 = -640;
      gActiveMap->unk64 = gActiveMap->unk3e == 0 ? 0x32 : 0;
    }
    break;
  }

  a = gActiveMap->unk60 >> 4;
  sub_0801F34C(0x54, (a - 0xC) & 0x1FF, a2 + 1, 0, 0);
  if (gActiveMap->unk07 == 0)
    sub_0802BD54((a + 0x1A) & 0x1FF, a2, 0x3C - (s8)gActiveMap->propertyCount);
  else
    sub_0802BD54(
        (a + 0x1A) & 0x1FF, a2,
        0x32 - (s8)((struct ActiveMap *)((u8 *)gActiveMap + gActiveMap->unk2f))
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

  switch (gActiveMap->unk5a) {
  case 0:
    if (sub_0800C9E8() == 0)
      return;
    gActiveMap->unk5a = gActiveMap->unk3e != 0 ? 0xA : 0x32;
    gActiveMap->unk5c = 0x1180;
    break;
  case 0xA:
    gActiveMap->unk5c += (0xB40 - gActiveMap->unk5c) >> 3;
    if (gActiveMap->unk5c <= 0xD60) {
      gActiveMap->unk5c = 0xD60;
      gActiveMap->unk5a = 0x14;
    }
    break;
  case 0x14:
    if (sub_0800C9E8() == 0 || gActiveMap->unk3e == 0 || gActiveMap->unk04 != 1)
      gActiveMap->unk5a = 0x1E;
    break;
  case 0x1E:
    gActiveMap->unk5c += (0x12A0 - gActiveMap->unk5c) >> 3;
    if (gActiveMap->unk5c > 0x10DF) {
      gActiveMap->unk5c = 0x10E0;
      if (sub_0800C9E8() == 0)
        return;
      if (gActiveMap->unk04 == 1)
        gActiveMap->unk5a = gActiveMap->unk3e == 0 ? 0x32 : 0;
    }
    break;
  }

  switch (gActiveMap->unk5a) {
  case 0x32:
    if (sub_0800C9E8() == 0)
      return;
    gActiveMap->unk5a = gActiveMap->unk3e == 0 ? 0x3C : 0;
    gActiveMap->unk5c = 0xFD80;
    break;
  case 0x3C:
    gActiveMap->unk5c += (0x3C0 - gActiveMap->unk5c) >> 3;
    if (gActiveMap->unk5c > 0x19F) {
      gActiveMap->unk5c = 0x1A0;
      gActiveMap->unk5a = 0x46;
    }
    break;
  case 0x46:
    if (sub_0800C9E8() == 0 || gActiveMap->unk3e != 0 || gActiveMap->unk04 != 1)
      gActiveMap->unk5a = 0x50;
    break;
  case 0x50:
    gActiveMap->unk5c += (-928 - gActiveMap->unk5c) >> 3;
    if (gActiveMap->unk5c <= -480) {
      gActiveMap->unk5c = -480;
      if (sub_0800C9E8() == 0)
        return;
      if (gActiveMap->unk04 == 1)
        gActiveMap->unk5a = gActiveMap->unk3e == 0 ? 0x32 : 0;
    }
    break;
  }

  sub_0801F34C(0x8F, ((gActiveMap->unk5c >> 4) - 0x18) & 0x1FF, v, 0, 0);
  gActiveMap->unk5b = (gActiveMap->unk5b + 1) & 0x3F;
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
  cls = (s8)gActiveMap->unk2f;
  if (cls == 0)
    cls = 1;

  a4 &= 0x3F;
  if (a4 != 0x19) {
    if (a7) {
      sub_08011E54(
          sub_08026190() + ((sub_080261A4(cls, a4) & 0x3FF) << 5),
          (void *)(0x06010000 + ((gUnknown_08485D20[a1] & 0x3FF) << 5)), 0x80);
    }
    ApplyPalette((u16 *)(gUnknown_0810E6E0 +
                         (gPlayers[cls].teamColor - 1) * 0x20),
                 22);
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

  sub_08001230(a4);
  if (a1 != 0)
    idx = a1 * 8 + 0x2B2;
  else
    idx = 0x262;

  if (a6)
    sub_08011E54((void *)sub_0802A85C(a4 & 0x1F),
                 (void *)(0x06010000 + (idx << 5)), 0x100);

  attr1 = (a2 - 4) & 0x1FF;
  attr0 = (a3 & 0xFF) | 0x400;
  if (a5)
    attr0 |= 0x100;
  sub_0801BD00(attr1, attr0, gUnknown_08485CF4[a1], 0x1000);
}
