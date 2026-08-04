#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080149C0.
 * sub_080149C0 @ 0x080149C0, sub_08014A5C @ 0x08014A5C
 */

/* MATCHED -- 156/156 bytes, byte-for-byte identical. Wave 42, W42-D, closing
 * wave 40's park. Its twin sub_08014A5C matched from the same fix.
 *
 * WHAT CLOSED IT: binding sub_08015BD0's result to a `short` local before
 * subscripting. Wave 40 was at 97.4% with two transposed instructions --
 *
 *   ROM                                   wave-40 candidate
 *     lsls r0, r0, #0x18                    ldr  r2, =gUnknown_03001470
 *     ldr  r2, =gUnknown_03001470           lsls r0, r0, #0x18
 *     asrs r0, r0, #0x18                    asrs r0, r0, #0x18
 *
 * -- the array base's pool load landing one slot too early, before the
 * sign-extension of the index instead of inside it.
 *
 * WAVE 40 TESTED THIS EXACT LEVER WITH `s8` AND CORRECTLY MEASURED IT
 * BYTE-NEUTRAL, then generalised from one width to all of them. That
 * generalisation was the error. An `s8` local IS held sign-extended by
 * PROMOTE_MODE, so `s8 i = f();` and the inline call expression really do
 * generate the same two shifts in the same place. A `short` local does not:
 * SImode is not its natural mode either, but the s16 pseudo forces the call
 * result into its own register before the s8 narrowing is applied to it, and
 * that extra pseudo is what delays the independent `ldr` by one slot. The
 * measurement was right and the conclusion drawn from it was too wide --
 * a width sweep is not finished after one width.
 *
 * Found by decomp-permuter (`mcp__aw2bhr-decomp__permute`, 1279 iterations,
 * ~300 s) from wave 40's own best.c, which is what wave 40 said to try next.
 * Confirms the brief: order-wrong with the register allocation already correct
 * is the permuter's case. See the wave-42 note in docs/agbcc-codegen.md --
 * an inherited HIGH-scoring draft is a bad thing to hand-rewrite from and a
 * GOOD thing to hand to the permuter, and those are not in conflict.
 *
 * Everything else is settled, and two of these were the whole job:
 *
 *   THE SWITCH HAS THREE CASES, NOT TWO. The ROM dispatches
 *   `cmp #1; beq; cmp #1; bgt; cmp #0; beq; b` -- a balanced tree ROOTED AT 1.
 *   agbcc's balance_case_nodes only rebalances when there are MORE than two
 *   case nodes; with exactly two it leaves the sorted list alone and roots at
 *   the LOWEST value, which emits a two-compare if/else chain that is 6 bytes
 *   shorter. Writing `case 2: break;` alongside `case 0:` and `case 1:` is what
 *   produces the ROM's three-compare tree: case 2's body is the same as
 *   default, so jump optimisation folds its arm into the `bgt` and no `cmp #2`
 *   survives. Case ORDER in the source is irrelevant -- the nodes are sorted
 *   before the tree is built, so listing `case 1` first changes nothing.
 *
 *   THE SLOT IS REACHED AS `struct Unk08014074 *`. gUnknown_03001470[] is
 *   `struct Unk03001470[]` (0x60 stride, which is where the ROM's
 *   `(i * 2 + i) << 5` comes from), but the fields this function writes are the
 *   word at +0x20, +0x24, +0x28, the halfwords at +0x2c/+0x2e and the bytes at
 *   +0x30/+0x32/+0x33 -- and struct Unk03001470 declares s16s at 0x20 and 0x24
 *   and an int at 0x2c, so it cannot describe these accesses. struct
 *   Unk08014074 is the view that fits: it is the record sub_080147B4 fills with
 *   the SAME fields in the SAME order. The slot is cast to it, exactly as
 *   already-promoted src/decomp/c_08014740.c does. struct Unk03001470 is NOT
 *   reshaped. Note the SKIPPED byte at +0x31, which sub_080147B4 does write.
 *
 *   Arguments 1, 2, 5 and 6 are narrow, but the prototype must stay `int`.
 *   The four `lsls #0x10; lsrs #0x10` pairs are grouped in the prologue after
 *   all six parameter copies, which is PROMOTE_MODE's signature -- and a cast
 *   at the uses cannot produce them, since every use is a `strb` or `strh` that
 *   force_to_mode would fold the cast into. They are reproduced with u16 LOCALS
 *   rather than by retyping the parameters, because the two matched callers
 *   DISAGREE: src/decomp/c_080487B4.c passes `a1 + 2` with no cast at all,
 *   which a narrow parameter would force it to narrow (+4 bytes, breaking a
 *   matched function), while src/decomp/c_0807B2F8.c already writes an explicit
 *   `(s16)`. `int` plus u16 locals is the only spelling both callers survive.
 *
 * THE THREE CALLEE PROTOTYPES BELOW ARE DECLARED HERE AND NOT IN
 * include/unknown-functions.h ON PURPOSE, and this needs a decision before
 * promotion. None of the three is declared in any header today. sub_08013D4C is
 * defined in src/decomp/c_08013D4C.c against a file-local `struct Unk8013D4C`
 * and sub_0801B998 in src/decomp/c_0801B964.c against a file-local `struct
 * Unk1B998` -- and BOTH of those tags are partial views of the very object this
 * function fills, at the same offsets with the same widths (Unk8013D4C's
 * unk28/unk30..33; Unk1B998's unk20/unk2c/unk2e/unk32). Putting these
 * declarations in the shared header with `struct Unk08014074 *` requires
 * retyping those two promoted files onto the same tag and re-verifying their
 * four functions. c_08013D4C.c is a drop-in -- every member it names exists in
 * Unk08014074 with the same type -- while c_0801B964.c additionally needs its
 * `u32 unk20` reconciled with Unk08014074's `u8 *` at the sub_0801B9C8 call,
 * whose second parameter is declared `u32`. That unification was left undone
 * rather than done half-way mid-wave; it is a clean, self-contained job.
 * sub_08014084 is undeclared anywhere, so it is free: the `s16` return is read
 * off the `lsls #0x10; asrs #0x10` the ROM applies to its result at this call
 * site, which is agbcc re-narrowing a narrow-returning callee.
 */

u16 *sub_08013D4C(struct Unk08014074 *);
s16 sub_08014084(struct Unk08014074 *, u16 *);
void sub_0801B998(struct Unk08014074 *, u16 *, u16);

void sub_080149C0(int a1, int a2, u16 *a3, u8 *a4, int a5, int a6)
{
  u16 x = a1;
  u16 y = a2;
  u16 e = a5;
  u16 f = a6;
  struct Unk08014074 *s;
  u16 *v;
  short new_var;
  new_var = sub_08015BD0(0);
  s = (struct Unk08014074 *) (&gUnknown_03001470[new_var]);
  s->unk20 = a4;
  s->unk24 = 0;
  s->unk28 = a3;
  s->unk2c = e;
  s->unk2e = 0;
  s->unk30 = x;
  s->unk32 = x;
  s->unk33 = y;
  for (;;)
  {
    v = sub_08013D4C(s);
    switch (sub_08014084(s, v))
    {
      case 0:
        return;

      case 1:
        sub_0801B998(s, v, f);
        break;

      case 2:
        break;

    }

  }

}

void sub_08014A5C(int a1, int a2, void *a3, int a4, int a5, int a6)
{
  short new_var;
  u16 x = a1;
  u16 y = a2;
  u16 d = a4;
  u16 e = a5;
  u16 f = a6;
  struct Unk08014074 *s;
  u16 *v;
  new_var = sub_08015BD0(0);
  s = (struct Unk08014074 *) (&gUnknown_03001470[new_var]);
  s->unk20 = gUnknown_08610A38[d];
  s->unk24 = 0;
  s->unk28 = a3;
  s->unk2c = e;
  s->unk2e = 0;
  s->unk30 = x;
  s->unk32 = x;
  s->unk33 = y;
  for (;;)
  {
    v = sub_08013D4C(s);
    switch (sub_08014084(s, v))
    {
      case 0:
        return;

      case 1:
        sub_0801B998(s, v, f);
        break;

      case 2:
        break;

    }

  }

}
