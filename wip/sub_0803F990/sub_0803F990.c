#include "global.h"

/* WAVE 77, W77-B. Still size-exact 664/664, 3 bytes differ (99.5%). Residual
 * CLASSIFIED as NOT ORDER, per byte: +0x75 is the loop-top ldr's Rd (0x4912 ->
 * 0x4812, r1 -> r0), +0x78 is the asrs's Rd (0x1390 -> 0x1391, r0 -> r1),
 * +0x7A is the adds's Rn/Rm (0x1844 -> 0x180C). Same four instructions in the
 * same sequence; the -fforce-addr base of gUnknown_03003150 and the scaled
 * index (s16)i*4 swap homes, and the adds keeps the index as Rn in both.
 *
 * RULED OUT this wave, all measured on the configured profile:
 *  - source addend order is BYTE-NEUTRAL: &gUnknown_03003150[i],
 *    gUnknown_03003150 + i, i + gUnknown_03003150 and
 *    (struct Unk03003150 *)((int)gUnknown_03003150 + i * 4) all give 3 bytes.
 *    (struct ...*)(i * 4 + (int)gUnknown_03003150) is worse at 7.
 *  - an `off = i * 4;` local before the base reference: 7 bytes.
 *  - register asm("r1") on the base or asm("r0") on the index: 489 and 493
 *    bytes (26.4% / 25.8%), identical whether declared at block top or in a
 *    tight enclosing block. An extra fixed register inside the loop reruns
 *    global allocation for the whole body.
 *  - the `record` asm("r4") pin below is BYTE-NEUTRAL and can be dropped; the
 *    flags/raw asm("r0")/asm("r1") pins are load-bearing (dropping them costs
 *    107 bytes, 83.9%).
 *  - decomp-permuter CANNOT RUN on this function: tools/permute.py aborts with
 *    `Syntax error in base.c ... before: asm` on any register asm local, and
 *    the flags/raw pins cannot be removed. The draft is untouched by the abort.
 */

/* WAVE 86 (W86-B). Held at 99.5%, 3 of 664, size-exact, first difference
 * +0x75 (configured profile). THE WAVE-83 LIVE-RANGE-SPLIT LEVER WAS TESTED
 * IN THREE PLACEMENTS AND ALL THREE ARE WORSE. It is refuted here.
 *
 * The lever: a NARROW live copy of the loop index (`s16 j;`), per the promoted
 * proof in src/decomp/c_08040EF4.c. Measured, all configured profile:
 *   A  `j = i;` immediately BEFORE `record = &gUnknown_03003150[j];`, and
 *      every later site in the loop body reading gUnknown_03003150[j]:
 *      SIZE-EXACT 664, 40 of 664 differ, 94.0%, first difference +0x30.
 *   B  `j = i;` immediately AFTER `record = &gUnknown_03003150[i];`, later
 *      sites on j: 664, 470 differ, 29.2%, first difference +0xa.
 *   C  minimal split -- j used ONLY at the base reference, every other site
 *      left on i: 664, 486 differ, 26.8%, first difference +0xa.
 * Baseline is 3 differing bytes. A is 13x worse, B and C are catastrophic.
 *
 * WHAT THIS MEASURES, and it is the useful part. A stays SIZE-EXACT and only
 * moves the first difference from +0x75 to +0x30, so the copy really does
 * re-run the allocation rather than adding code -- the lever ACTS, it just
 * acts the wrong way. B and C collapse because the copy is then live
 * ALONGSIDE the base's pseudo instead of ahead of it.
 *
 * THE DISCRIMINATOR (see the chapter appended to docs/agbcc-codegen.md this
 * wave): a live-range split re-ranks a tie only when the ORIGINAL pseudo DIES
 * at the copy. In c_08040EF4.c, `new_var = y;` is y's LAST use -- y is dead
 * from that point and its live range is genuinely SPLIT in two. Here the
 * source of the copy is the LOOP COUNTER `i`, which the for-increment and the
 * exit test keep live to the bottom of the body. So `j = i;` does not split
 * anything: it ADDS a pseudo that is live across the whole body next to one
 * that already was, register pressure goes up by one inside a loop that
 * already carries the -fforce-addr base, the `i * 4` index, `record`, `x`,
 * `y`, `w`, `h` and two asm-pinned registers, and global-alloc re-runs for
 * the entire body. That is the same shape as the wave-77 `register asm`
 * result recorded below (an extra fixed register inside the loop reran global
 * allocation for the whole body, 26.4%). A LOOP COUNTER IS THE ONE VALUE THE
 * SPLIT LEVER CANNOT BE APPLIED TO.
 *
 * So the residual is unchanged and still what W77-B classified it as: the
 * -fforce-addr base of gUnknown_03003150 and the scaled index (s16)i*4 swap
 * homes, and both are COMPILER TEMPS with no source construct behind them.
 * Also settled negatively this wave, on sibling functions in the same batch:
 * declaration order of locals is byte-neutral (sub_08066874), and promoting a
 * temp to a source local -- which gives it a lower allocno number than every
 * temp in the function -- is byte-neutral (sub_0805B6A0). The allocno-NUMBER
 * half of the mechanism does not reach any of these ties.
 */

struct Unk3F990Map
{
    /* 0x0000 */ u16 unk00;
    /* 0x0002 */ u16 unk02;
    /* 0x0004 */ s16 unk04;
    /* 0x0006 */ s16 unk06;
    /* 0x0008 */ u8 filler_0008[0x234A - 0x08];
    /* 0x234A */ u8 flag[0x417A - 0x234A];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct Unk3F990Map *)gUnknown_08499590)
#define E gUnknown_03003150[i]

void sub_0803F990(void)
{
  s16 y;
  s16 x;
  s16 i;
  int w;
  int h;
  x = ((struct Unk3F990Map *) gUnknown_08499590)->unk04 / 16;
  y = ((struct Unk3F990Map *) gUnknown_08499590)->unk06 / 16;
  w = 15;
  h = 10;
  if ((x + 14) == (((struct Unk3F990Map *) gUnknown_08499590)->unk00 - 1))
  {
    w = 14;
  }
  if ((y + 9) == (((struct Unk3F990Map *) gUnknown_08499590)->unk02 - 1))
  {
    h = 9;
  }
  sub_0803FC28(x, y, w, h);
  for (i = 0; i < 0x5c; i++)
  {
    register struct Unk03003150 *record asm("r4");
    u8 n;
    record = &gUnknown_03003150[i];
    {
    register int flags asm("r0");
    register u8 raw asm("r1");
    flags = (raw = record->flags);
    if (flags == 0xff)
    {
      return;
    }
    if (x > gUnknown_03003150[i].x)
    {
      continue;
    }
    if (gUnknown_03003150[i].x > (x + w))
    {
      continue;
    }
    if (y > gUnknown_03003150[i].y)
    {
      continue;
    }
    if (gUnknown_03003150[i].y > (y + h))
    {
      continue;
    }
    n = 1;
    n = (raw >> n) >> 4;
    switch (raw & 0x1f)
    {
      case 6:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F990, n, 1);
        break;

      case 0xe:
        if (((struct Unk3F990Map *) gUnknown_08499590)->flag[((struct Unk3F990Map *) gUnknown_08499590)->rowOffset[gUnknown_03003150[i].y] + gUnknown_03003150[i].x] != 0)
      {
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849FAB0[n], n, 1);
      }
      else
      {
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849FAB0[0], 0, 1);
      }
        break;

      case 0xa:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F998, n, 1);
        break;

      case 0xb:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F9A0, n, 1);
        break;

      case 8:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849FAC4[n], n, 1);
        break;

      case 0x14:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F9A8, n, 1);
        break;

      case 0x11:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F9B0, n, 1);
        break;

      case 0x12:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F9B8, n, 1);
        break;

      case 0x15:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F9D0, sub_08027198(5), 0);
        break;

      case 0x16:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F9D8, sub_08027198(5), 0);
        break;

      case 0x17:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F9C0, sub_08027198(5), 0);
        break;

      case 0x18:
        sub_0803F908(gUnknown_03003150[i].x, (*(&gUnknown_03003150[i])).y, gUnknown_0849F9C8, sub_08027198(5), 0);
        break;

      case 0x19:
        sub_0803F908(gUnknown_03003150[i].x, gUnknown_03003150[i].y, gUnknown_0849F9E0, sub_08027198(5), 0);
        break;

      case 0xff:
        return;

    }
    }

  }

}