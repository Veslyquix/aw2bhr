#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803F990.
 * sub_0803F990 @ 0x0803F990
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803F990.
 * sub_0803F990 @ 0x0803F990
 */

#include "map.h"
static inline u8 flags(int f) { return f; }
static inline u8 terrain(u8 f) { return f & 0x1f; }
static inline u8 army(u8 f) { return (f & 0xe0) >> 5; }

void sub_0803F990(void) {
  int k;
  int h;
  s16 cy;
  s16 cx;
  int w;
  s16 i;

  cx = gMap->scrollX / 16;
  cy = gMap->scrollY / 16;
  w = 15;
  h = 10;
  if (cx + 14 == gMap->width - 1)
    w = 14;
  if (cy + 9 == gMap->height - 1)
    h = 9;
  sub_0803FC28(cx, cy, w, h);

  for (i = 0; i <= 0x5B; i++) {
    s8 raw = gUnknown_03003150[i].flags;

    if (flags(raw) == 0xff)
      return;

    if (cx > gUnknown_03003150[i].x || gUnknown_03003150[i].x > cx + w ||
        cy > gUnknown_03003150[i].y || gUnknown_03003150[i].y > cy + h)
      continue;
    k = army(gUnknown_03003150[i].flags);
    switch (terrain(gUnknown_03003150[i].flags)) {
    case 6:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F990, k, 1);
      break;
    case 0xE:
      if (gMap->unk234A[gMap->rowOffset[gUnknown_03003150[i].y] +
                        gUnknown_03003150[i].x] != 0)
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                     gUnknown_0849FAB0[k], k, 1);
      else
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                     gUnknown_0849FAB0[0], 0, 1);
      break;
    case 0xA:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F998, k, 1);
      break;
    case 0xB:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9A0, k, 1);
      break;
    case 8:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849FAC4[k], k, 1);
      break;
    case 0x14:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9A8, k, 1);
      break;
    case 0x11:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9B0, k, 1);
      break;
    case 0x12:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9B8, k, 1);
      break;
    case 0x15:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9D0, sub_08027198(5), 0);
      break;
    case 0x16:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9D8, sub_08027198(5), 0);
      break;
    case 0x17:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9C0, sub_08027198(5), 0);
      break;
    case 0x18:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9C8, sub_08027198(5), 0);
      break;
    case 0x19:
      sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y,
                   gUnknown_0849F9E0, sub_08027198(5), 0);
      break;
    case 0xFF:
      return;
    }
  }
}
