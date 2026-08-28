#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080363F8.
 * sub_080363F8 @ 0x080363F8
 */

/* WAVE 87 (W87-E): **MATCHED**, 132/132 byte-for-byte (`configured`).
 * Parked wave 45 (W45-B), re-measured waves 51 (W51-B) and 57 (W57-E) at
 * 136 bytes (+4) / 22.7%. The park's open question was stated as "no third
 * spelling of a 10-bit extraction is known", and that is what this answers.
 *
 * 1. THE CSE THAT COST THE EXTRA CALLEE-SAVED REGISTER: A REDUNDANT MASK ON
 *    THE SHIFTED VALUE. The two `>> 22` reads have to differ at cse time and
 *    be IDENTICAL after combine. `(x << 22) & 0xffc00000` is a no-op -- the
 *    shift already cleared those bits -- so cse sees `(and (ashift ...) C)`
 *    and `(ashift ...)` as different expressions and does not merge them,
 *    while combine's `simplify_and_const_int` proves the AND redundant from
 *    `nonzero_bits` and deletes it. Two bare `lsrs rX,r5,#22` remain, one on
 *    each side of `bl __umodsi3`, and only `v.unk04 << 22` (r5) lives across
 *    the call. Wave 51's `(u16)` cast failed because the FRONT END folds it
 *    away before cse ever sees two expressions; this mask survives to cse and
 *    dies in combine, which is the whole trick. 136 (+4) -> size-exact 132.
 *
 * 2. EVALUATION ORDER, two binds, both load-bearing. `c` bound in a PRECEDING
 *    statement puts the shift pair before `ldrh r4,[r1,#4]` (wave 51 read this
 *    order off the ROM correctly but could not use it while the cse still
 *    merged). `n = idx + (b->unk04 & 0xfc00);` bound as its own statement, with
 *    the store written `<coordinate> + n`, gives the ROM's
 *    `lsrs r1,r5,#22 / adds r1,r1,r2 / mov r2,r8 / strh r1,[r2,#4]`. `n` must
 *    be u32 or int -- a `u16 n` adds an `lsl #16 / lsr #16` truncation.
 *
 * 3. THE LAST TWO HUNKS WERE ONE DECLARATION: `off` IS `unsigned short`, NOT
 *    `u32`. That single change buys BOTH the ROM's `ldr r2,=0x3FF /
 *    adds r0,r2,#0 / ands r6,r0` (the copy of the mask constant that a u32
 *    `off` never emits) AND the ROM's `movs r2,#0xfc / lsls r2,r2,#8 /
 *    ands r2,r4 / adds r2,r0,r2`, which ties the AND's destination to the
 *    CONSTANT's pseudo and leaves r4 intact. It still calls `__umodsi3`, so
 *    the park's "off must be UNSIGNED or the modulo goes to __modsi3" holds --
 *    but it is the SIGNEDNESS that matters, not the width, and the width is
 *    what decides the two allocations. A plain `short` gives byte-identical
 *    code with `__modsi3`; that is how the permuter found it.
 *
 * 4. `new_var = 22;` IS LOAD-BEARING. It is the permuter's own find (link 1 of
 *    the first chain ever run on this function, iteration 0, permuter score 0)
 *    and folding `(v.unk04 << new_var) >> 22` back into `v.unk04 << 22 >> 22`
 *    loses the match. DO NOT TIDY IT.
 *
 * Everything the park listed as settled is unchanged: `s16` first parameter,
 * `idx` u16, the gUnknown_03001470[a].unk18 cast, the dead `ldr r0,[sp]`
 * struct-return load. The wave-45 bitfield reading and the plain `& 0x3ff`
 * coordinate spelling stay ruled out; this draft uses neither. */

struct Unk363F8A
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ u16 unk04;
};
struct Unk363F8B
{
    /* 0x00 */ u8 filler_00[0x48];
    /* 0x48 */ u8 *unk48;
};

void sub_080363F8(s16 a, struct Unk363F8A *b)
{
  struct UnkVec v;
  int new_var;
  u16 idx;
  unsigned short off;
  u32 c;
  u32 n;
  v = sub_08015638(a);
  new_var = 22;
  c = (v.unk04 << new_var) >> 22;
  off = (b->unk04 - c) & 0x3ff;
  idx = off % 9;
  n = idx + (b->unk04 & 0xfc00);
  b->unk04 = (((v.unk04 << 22) & 0xffc00000) >> 22) + n;
  if (idx == 0)
  {
    sub_08011E54(((struct Unk363F8B *) gUnknown_03001470[a].unk18)->unk48 + (off * 32), (void *) (0x06010000 + ((v.unk04 << 22) >> 17)), 0x120);
  }
}
