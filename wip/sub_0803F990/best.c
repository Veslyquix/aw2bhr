#include "global.h"

/* PARKED (wave 66, W66-B) at 85.54%, now SIZE-EXACT (664/664). Binding the
 * flags byte to a block-local `int` and declaring y before x removed the old
 * extra live value: the frame fell from 20 to the ROM's 16 bytes, constant 1
 * moved to r7, constant 0 to r8, the loop giv to sb, and the x/y spill slots
 * became exact. The remaining residual is a size-neutral low-register swap:
 * the ROM carries the s16 loop counter in r2 and the flags byte in r1, while
 * this draft carries the counter in r1 and flags in r2. This changes the loop
 * head and final `lsrs` destination but leaves block layout, calls, frame,
 * constants, spill slots and literal pools exact. Moving i, flags or n through
 * function/block scope, reversing declaration order, and int/u8/u16/u32 flags
 * are byte-identical on that swap; an added volatile comparison copy gets the
 * desired r2/r1 allocation but introduces a stack spill. No permuter was run
 * because the Wave 66 brief limited it to a single run and the batch already
 * had higher-value exact-size probes.
 *
 * Historical wave-49 diagnosis follows. THE SHAPE IS SETTLED -- every byte
 * from the prologue through the
 * guards, the whole 14-arm decision tree, and case bodies 6, 0xe, 0xa, 0xb, 8
 * and 0x14 are byte-identical, and so is the loop tail. What is left is ONE
 * register-allocation fact, described below.
 *
 * ================= REMAINING DIFF =================
 * The ROM parks sub_0803F908's fifth argument constant 1 in r7 -- a LOW
 * callee-saved register -- so each of the eight `n`-passing arms stores it with
 * a bare `str r7, [sp]`, and parks the constant 0 in r8. This candidate has 1 in
 * r8 and 0 in r9, so every one of those arms pays a `mov rN, r8` (or `mov rN,
 * r9`) before the `str`, and the loop giv that the ROM keeps in sb lands in sl.
 * There is also one extra 4-byte frame slot (`add sp, #20` against the ROM's
 * `#16`). That is +20 bytes, and it is one live value too many somewhere -- not
 * a statement-order or type error.
 *
 * RULED OUT, each measured:
 *  - Binding the record to a `struct Unk03003150 *e` before the guards versus
 *    writing `gUnknown_03003150[i]` at every use: BYTE-IDENTICAL output. CSE
 *    recreates the pointer either way, so this is not the extra pseudo.
 *  - Not binding `n = flags >> 5` before the switch: strictly worse. The ROM
 *    computes it once (`lsrs r6, r1, #5`) off the flags byte already loaded at
 *    the loop top and reuses r6 in eight arms; written inline at each arm agbcc
 *    re-extracts with `lsls #24; lsrs #29`, +8 instructions.
 *
 * WHAT TO TRY NEXT: the extra live value. Candidates, in order of promise --
 * (a) `w`, which the ROM spills to [sp,#4] at its definition and reloads twice;
 * (b) the s16 `x`/`y` pair, whose `<< 16` forms occupy [sp,#0xc] and [sp,#8]
 * and might want to be two separate locals rather than reused across the
 * pre-loop clamp and the in-loop guards; (c) the permuter, since this is exactly
 * a register-allocation residual with the instruction order already correct,
 * which the wave-37 note says is its case.
 *
 * ================= WHAT IS SETTLED =================
 * 1. `case 0xff: return;` and the top `if (E.flags == 0xff) return;` must both
 *    be RETURNS, not `break`. See the chapter added to docs/agbcc-codegen.md:
 *    with `break` at the top, loop.c's duplicate_loop_exit_test copies the whole
 *    0xff test to the loop bottom (+7 instructions and a second
 *    gUnknown_03003150 pool word); a `return` jumps to the epilogue rather than
 *    the loop-exit label and the pass declines. That change alone made the loop
 *    tail byte-exact.
 * 2. `x` and `y` are s16 locals: assigned zero-extended (`lsls #0xc; lsrs #0x10`
 *    off the signed division by 16) and sign-extended at each use, which is
 *    agbcc's PROMOTE_MODE for a signed sub-word local; gcc keeps `x << 16` in
 *    the stack slot so the use is a single `asrs`.
 * 3. `i` is s16 too -- the array index comes out `asrs r0, r2, #0xe`, i.e.
 *    `(s16)i * 4` through the shared shift, not `lsls #2`.
 * 4. gUnknown_03003150.flags needs no bitfield: `& 0x1f` at bit 0 is a plain
 *    `ands` and `>> 5` at the top of the byte is a plain `lsrs`, which is what a
 *    bitfield pair would emit anyway, and the whole byte is also compared
 *    against 0xff.
 * 5. `case 0xff` is DEAD -- the switch index is `flags & 0x1f`, which can never
 *    be 0xff -- but expand_end_case works from the index type's range, not value
 *    range, so the arm survives into the tree. It has to be written.
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
    register int flags asm("r0");
    register u8 raw asm("r1");
    u8 n;
    flags = (raw = gUnknown_03003150[i].flags);
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

