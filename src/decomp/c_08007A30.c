#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08007A30.
 * sub_08007A30 @ 0x08007A30
 */

/* WAVE 76: configured exact match. Reusing the eased values in fixed r3/r5
 * lifetimes reproduces both switch arms; an explicit r0 halfword-extension
 * chain reproduces the tail. Promotion needs rodata 0x0808D7E8. */

void sub_08007A30(void)
{
  register int a asm("r3");
  register int b asm("r5");
  u8 t;
  struct ActiveMap *p;
  s16 *pair;
  p = gActiveMap;
  switch (p->overlayState)
  {
    case 0:
      a = p->overlayX;
      a += (0x730 - a) >> 3;
      if (a <= 0x750)
    {
      a = 0x750;
      p->overlayState = 0xA;
    }
      pair = &gActiveMap->overlayX;
      *pair = a;
      pair++;
      b = *pair;
      b += (0x9C0 - b) >> 3;
      if (b > 0x99F)
    {
      b = 0x9A0;
    }
      *pair = b;
      break;

    case 0xA:
      a = p->overlayX;
      a += (0x7A0 - a) >> 3;
      if (a > 0x77F)
    {
      a = 0x780;
      p->overlayState = 0x14;
      gActiveMap->overlayTimer = 0x1E;
    }
      pair = &gActiveMap->overlayX;
      *pair = a;
      pair++;
      b = *pair;
      b += (0x950 - b) >> 3;
      if (b <= 0x970)
    {
      b = 0x970;
    }
      *pair = b;
      break;

    case 0x14:
      t = p->overlayTimer;
      p->overlayTimer = t - 1;
      if (((s8) t) <= 0)
    {
      gActiveMap->overlayState = 0;
    }
      break;

  }

  {
    register int raw asm("r0");
    struct ActiveMap *tail = gActiveMap;
    raw = (u16)tail->overlayX;
    raw <<= 16;
    a = raw >> 20;
    raw = (u16)tail->overlayY;
    raw <<= 16;
    b = raw >> 20;
  }
  a |= 0x400;
  sub_0801BD00(0x64, a, gUnknown_08488880, 0);
  b |= 0x400;
  sub_0801BD00(0x86, b, gUnknown_08488888, 0);
}

/* PARKED, wave 65 (W65-H). Size-exact, 90.4%: 28 of 292 bytes differ.
 * A 15,422-iteration permuter pass improved the configured 71.23% draft to
 * this fixpoint. The remaining two repeated hunks are allocation-only: each
 * unk6e/unk70 chain uses r2/r1 where the ROM uses r1/r5, and the tail assigns
 * the second eased value and 0x400 constant to r4/r5 where the ROM uses r5/r4.
 * Instruction count, control flow, literal placement, and relocations align.
 * The pass was re-measured from its extracted source; do not submit the raw
 * preprocessed permuter best.c directly. */
