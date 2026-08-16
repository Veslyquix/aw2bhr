#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08012C58.
 * sub_08012C58 @ 0x08012C58
 */

#include "hardware.h"
/* MATCHED in Wave 74: 500/500 bytes under the configured profile. A redundant
 * early assignment to p3 before the third background's remaining setup calls
 * is dead before use but changes GCSE/PRE discovery order. It moves the
 * s->unk38 preheader load to the ROM position without moving the settled
 * post-loop computation. Preserve that assignment and the later overwrite.
 *
 * Before closure this was size-exact at 500/500 with 13 differing bytes, first
 * at +0xec, entirely FOUR INSTRUCTIONS IN THE WRONG PLACE in loop 1's
 * preheader. Nothing about the body, the types or the control flow was in
 * question.
 *
 * The preheader hoists seven values. Both builds hoist the same seven into the
 * same seven registers; only the position of one pair differs:
 *
 *   ROM   ip=&gUnknown_08499580, r9=0x3ff, sl=s->unk38, r8=&gUnknown_08499584,
 *         r3=s->unk08, r4=s->unk18, r6=s->unk28
 *   here  ip=&gUnknown_08499580, r9=0x3ff, r8=&gUnknown_08499584,
 *         r3=s->unk08, r4=s->unk18, r6=s->unk28, sl=s->unk38
 *
 * i.e. `ldr rN,[r7,#0x38]; mov sl,rN` has to move from LAST to THIRD. The four
 * struct loads are not read by the loop (it re-loads all four members every
 * iteration); they are copies made for the p0..p3 computations that FOLLOW the
 * loop, so this is gcse/PRE insertion order in the preheader, not LICM of
 * anything the loop body uses -- which is why no reordering of the loop body's
 * four statements can be the lever. Ordering the four p-assignments p3-first
 * would move the post-loop code too, and the post-loop code already matches.
 *
 * RULED OUT IN WAVE 66: all 24 declaration orders of p0..p3 emitted the
 * identical wrong preheader. One uninterrupted 300-second decomp-permuter run
 * also found no byte-level match and restored this 97.4% draft unchanged.
 * The source/type/body axes remain closed; this is a gcse/PRE insertion-order
 * fixpoint.
 *
 * Settled and worth keeping:
 *  - The parameter must stay `void *` -- include/unknown-functions.h declares
 *    `void sub_08012C58(void *)` and that is authoritative. The struct is
 *    reached through a local, which is byte-free (the ROM's `adds r7,r0,#0`).
 *  - The four BG shadows are `union BgCntBuf` (hardware.h) and the three
 *    setters take `struct Unk8012C30 *`, so the call sites cast, exactly as
 *    the note above those prototypes says.
 *  - The gDispIo block reads out as EIGHT bitfield writes in source order:
 *    mode = 0 (byte 0, `mov #8; neg; and`), then bg0..bg3_enable and obj_enable
 *    (byte 1, five separate `orr`s), then hblank_interval_free and obj_mapping
 *    (back to byte 0, `orr #0x20` / `orr #0x40`). agbcc keeps ONE byte-0
 *    read-modify-write live across the byte-1 store, which is why the two
 *    groups interleave in the output but not in the source.
 *  - `priority` is the 2-bit field at bit 0: 0/2/1/3 for
 *    03002B6C/03001FE8/030030B4/0300251C. The 3 arrives with NO `and` --
 *    store_fixed_bit_field's all_one path -- which is what pins the width.
 *  - `p0[i] = p1[i] = p2[i] = p3[i] = gUnknown_08489334[i]` must be ONE chained
 *    assignment: the ROM stores p3 first and p0 last, which is what right-to-
 *    left chaining gives, and p0's address is the one that spills to [sp].
 *  - gUnknown_08489334 is a NEW declaration added to include/unknown-globals.h
 *    this wave: 16 u16s, 0x08489334..0x08489354 per data/data.s.
 *  - None of this function's ten data_refs is a -fforce-addr pool word; every
 *    one is a real global reached from this function's own .text pool, so the
 *    promotion needs NO "rodata" entry. (0x08499578/7C/80/84 are ROM-resident
 *    `u16 *` POINTERS -- the `ldr rX,=sym; ldr rY,[rX]` pair is the pointer
 *    load, not an address constant.) */

struct Unk8012C58
{
    /* 0x00 */ u32 unk00;
    /* 0x04 */ u32 unk04;
    /* 0x08 */ u32 unk08;
    /* 0x0c */ u32 unk0c;
    /* 0x10 */ u32 unk10;
    /* 0x14 */ u32 unk14;
    /* 0x18 */ u32 unk18;
    /* 0x1c */ u32 unk1c;
    /* 0x20 */ u32 unk20;
    /* 0x24 */ u32 unk24;
    /* 0x28 */ u32 unk28;
    /* 0x2c */ u32 unk2c;
    /* 0x30 */ u32 unk30;
    /* 0x34 */ u32 unk34;
    /* 0x38 */ u32 unk38;
    /* 0x3c */ u32 unk3c;
};

void sub_08012C58(void *arg)
{
  struct Unk8012C58 *s = arg;
  u16 *p0;
  u16 *p1;
  u16 *p2;
  u16 *p3;
  u16 i;
  sub_080122EC();
  sub_08012C30((struct Unk8012C30 *) (&gUnknown_03002B6C), s->unk00);
  sub_08012C1C((struct Unk8012C30 *) (&gUnknown_03002B6C), s->unk04);
  sub_08012C48((struct Unk8012C30 *) (&gUnknown_03002B6C), s->unk0c);
  sub_08012C30((struct Unk8012C30 *) (&gUnknown_03001FE8), s->unk10);
  sub_08012C1C((struct Unk8012C30 *) (&gUnknown_03001FE8), s->unk14);
  sub_08012C48((struct Unk8012C30 *) (&gUnknown_03001FE8), s->unk1c);
  sub_08012C30((struct Unk8012C30 *) (&gUnknown_030030B4), s->unk20);
  p3 = (u16 *) (s->unk30 + (s->unk38 << 5));
  sub_08012C1C((struct Unk8012C30 *) (&gUnknown_030030B4), s->unk24);
  sub_08012C48((struct Unk8012C30 *) (&gUnknown_030030B4), s->unk2c);
  sub_08012C30((struct Unk8012C30 *) (&gUnknown_0300251C), s->unk30);
  sub_08012C1C((struct Unk8012C30 *) (&gUnknown_0300251C), s->unk34);
  sub_08012C48((struct Unk8012C30 *) (&gUnknown_0300251C), s->unk3c);
  gDispIo.disp_ct.mode = 0;
  gDispIo.disp_ct.bg0_enable = 1;
  gDispIo.disp_ct.bg1_enable = 1;
  gDispIo.disp_ct.bg2_enable = 1;
  gDispIo.disp_ct.bg3_enable = 1;
  gDispIo.disp_ct.obj_enable = 1;
  gDispIo.disp_ct.hblank_interval_free = 1;
  gDispIo.disp_ct.obj_mapping = 1;
  gUnknown_03002B6C.bits.priority = 0;
  gUnknown_03001FE8.bits.priority = 2;
  gUnknown_030030B4.bits.priority = 1;
  gUnknown_0300251C.bits.priority = 3;
  for (i = 0; i <= 0x3ff; i++)
  {
    gUnknown_08499578[i] = s->unk08;
    gUnknown_0849957C[i] = s->unk18;
    gUnknown_08499580[i] = s->unk28;
    gUnknown_08499584[i] = s->unk38;
  }

  p0 = (u16 *) (s->unk00 + (s->unk08 << 5));
  p1 = (u16 *) (s->unk10 + (s->unk18 << 5));
  p2 = (u16 *) (s->unk20 + (s->unk28 << 5));
  p3 = (u16 *) (s->unk30 + (s->unk38 << 5));
  for (i = 0; i <= 0xf; i++)
  {
    p0[i] = (p1[i] = (p2[i] = (p3[i] = gUnknown_08489334[i])));
  }

  sub_08011C68(gUnknown_08499578, (void *) s->unk04, 0x800);
  sub_08011C68(gUnknown_0849957C, (void *) s->unk14, 0x800);
  sub_08011C68(gUnknown_08499580, (void *) s->unk24, 0x800);
  sub_08011C68(gUnknown_08499584, (void *) s->unk34, 0x800);
}
