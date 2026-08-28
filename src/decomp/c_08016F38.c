#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08016F38.
 * sub_08016F38 @ 0x08016F38
 */

/* MATCHED — Wave 86 (W86-D), configured profile, 720/720 byte-exact.
 * Requires the pool word to be PLACED on promotion:
 *   "rodata": ["0x0808E550"]   (gUnknown_0808E550, the -fforce-addr word)
 *
 * Parked since wave 74 at 99.6% / 3 bytes at +0x12e/+0x132/+0x134 — an r0/r1
 * exchange on `adds; ldrh [.,#2]; cmp`, the ROM landing the sum in the loaded
 * pointer's register and the draft in the offset's. W77-M, W81-A, W82-A and
 * W84 each ruled the residual a bare commutation tie with no source lever.
 *
 * IT HAD A SOURCE LEVER, and it was written down in the MIRROR function.
 * sub_08017208 (src/decomp/c_08017208.c) is this function's load-side twin —
 * same struct SaveBlk, same struct Map, same `unk417a[x] + y` plane loop, same
 * `gUnknown_03003F68 + 2` read, source and destination exchanged. Its wave-53
 * residual was the SAME r0/r1 exchange on the SAME two operands, and wave 80
 * (W80-C) closed it with the W77-K lever: bind the integer BYTE OFFSET as its
 * own statement, keep the destination an ARRAY REFERENCE.
 *
 *     idx = ...unk417a[x] + y;
 *     off = idx * 2;                                  <-- the whole lever
 *     ... != *(u16 *)((u8 *)gUnknown_03003F68 + off + 2)
 *
 * `off = idx * 2;` creates the index chain's pseudo BEFORE the pool constant
 * and the gUnknown_03003F68 load, so the chain takes r1 and the constants take
 * r0, as the ROM has it. The park had ruled out the INLINE form
 * `*(u16 *)((u8 *)g + idx*2 + 2)` as byte-neutral at 3 — that is exactly the
 * spelling wave 80 showed is NOT the lever. The statement split is.
 *
 * The wave-75 `asm volatile ("" : "=r" (k));` pin is RETAINED and still
 * load-bearing (it emits no instruction; without it the early
 * gUnknown_030033EC copy takes r5 instead of ROM scratch r0). It also blocks
 * tools/permute.py — do not remove it to enable a permuter run. */

struct Map
{
    /* 0x0000 */ u16 unk00;
    /* 0x0002 */ u16 unk02;
    /* 0x0004 */ s16 unk04;
    /* 0x0006 */ s16 unk06;
    /* 0x0008 */ s16 unk08;
    /* 0x000a */ s16 unk0a;
    /* 0x000c */ s16 unk0c;
    /* 0x000e */ s16 unk0e;
    /* 0x0010 */ u16 unk10;
    /* 0x0012 */ u8 filler_12[0xa22 - 0x12];
    /* 0x0a22 */ u16 unk0a22[(0x417a - 0xa22) / 2];
    /* 0x417a */ u16 unk417a[(0x421a - 0x417a) / 2];
};
struct SaveBlkRec
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 unk01;
    /* 0x02 */ u16 unk02;
};
struct SaveBlk
{
    /* 0x0000 */ u16 unk0000;
    /* 0x0002 */ u16 unk0002;
    /* 0x0004 */ struct Unk802C57C unk0004;
    /* 0x0008 */ struct Unk08499594 unk0008;
    /* 0x0014 */ u8 unk0014[0x140 - 0x14];
    /* 0x0140 */ u8 unk0140[0x48];
    /* 0x0188 */ struct Unk08499594 unk0188[4 * 51];
    /* 0x0b18 */ int unk0b18[4];
    /* 0x0b28 */ u8 filler_0b28[0xb98 - 0xb28];
    /* 0x0b98 */ struct Unk03002F08 unk0b98;
    /* 0x0ba0 */ void (*unk0ba0)(void);
    /* 0x0ba4 */ bool8 (*unk0ba4)(void);
    /* 0x0ba8 */ u32 unk0ba8;
    /* 0x0bac */ u8 unk0bac;
    /* 0x0bad */ u8 filler_0bad[1];
    /* 0x0bae */ u16 unk0bae;
    /* 0x0bb0 */ u16 unk0bb0;
    /* 0x0bb2 */ u16 unk0bb2;
    /* 0x0bb4 */ u16 unk0bb4;
    /* 0x0bb6 */ u16 unk0bb6;
    /* 0x0bb8 */ struct SaveBlkRec unk0bb8[(0xd28 - 0xbb8) / 4];
    /* 0x0d28 */ struct Unk02028360 unk0d28[16];
    /* 0x0da8 */ u8 unk0da8[4];
};

void sub_08016F38(u8 a1)
{
  struct SaveBlk *p = (struct SaveBlk *) gUnknown_02000000;
  s16 i;
  s16 j;
  s16 k;
  s16 x;
  s16 y;
  int idx;
  int off;
  if (a1)
  {
    p->unk0bac = 1;
  }
  else
  {
    p->unk0bac = 0;
  }
  p->unk0ba8 = gUnknown_03001FD4;
  p->unk0004 = gUnknown_030033E4;
  p->unk0000 = gUnknown_03004080;
  asm volatile ("" : "=r" (k));
  p->unk0002 = gUnknown_030033EC;
  sub_0808B6E8(p->unk0140, &gUnknown_03003FC0, 0x48);
  p->unk0008 = *((struct Unk08499594 *) gUnknown_03004490);
  for (i = 0; i < 4; i++)
  {
    p->unk0b18[i] = gUnknown_030033F4[i];
  }

  p->unk0b98 = gUnknown_03002F08;
  p->unk0ba0 = gUnknown_03002F20;
  p->unk0ba4 = gUnknown_03001FF0;
  p->unk0bae = ((struct Map *) gUnknown_08499590)->unk00;
  p->unk0bb0 = ((struct Map *) gUnknown_08499590)->unk02;
  p->unk0bb2 = ((struct Map *) gUnknown_08499590)->unk04;
  p->unk0bb4 = ((struct Map *) gUnknown_08499590)->unk06;
  p->unk0bb6 = ((struct Map *) gUnknown_08499590)->unk10;
  if ((gUnknown_03003FC0.unk02 < 0xb4) || (gUnknown_03003FC0.unk02 > 0xbf))
  {
    sub_080247A4(gUnknown_03003FC0.unk02);
    k = 0;
    for (y = 0; y < ((struct Map *) gUnknown_08499590)->unk00; y++)
    {
      for (x = 0; x < ((struct Map *) gUnknown_08499590)->unk02; x++)
      {
        idx = ((struct Map *) gUnknown_08499590)->unk417a[x] + y;
        off = idx * 2;
        if (((struct Map *) gUnknown_08499590)->unk0a22[idx] != *(u16 *)((u8 *)gUnknown_03003F68 + off + 2))
        {
          p->unk0bb8[k].unk02 = ((struct Map *) gUnknown_08499590)->unk0a22[idx];
          p->unk0bb8[k].unk00 = y;
          p->unk0bb8[k].unk01 = x;
          k++;
        }
      }

    }

    p->unk0bb8[k].unk02 = 0xffff;
    sub_0802481C();
  }
  for (i = 0; i < 5; i++)
  {
    sub_0808B6E8((((u8 *) p) + (i * 0x3c)) + 0x14, &gUnknown_02023284[i * 0x3c], 0x3c);
  }

  for (i = 0; i < 4; i++)
  {
    for (j = 0; j < 51; j++)
    {
      p->unk0188[(i * 51) + j] = gUnknown_02022684[(i * 64) + j];
    }

  }

  for (i = 0; i < 16; i++)
  {
    p->unk0d28[i] = gUnknown_02028360[i];
  }

  sub_08045700(p->unk0da8);
}
