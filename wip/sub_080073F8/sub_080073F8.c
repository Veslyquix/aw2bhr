#include "global.h"

void sub_080073F8(int a1, int a2)
{
  struct Unk0200B0B0 *p;
  struct Unk0200B0D0 *d;
  struct Unk0200B224 *e;
  unsigned short new_var3;
  int v = -1;
  int w = 0;
  int n;
  int m;
  int i;
  int new_var;
  int new_var2;
  int row;
  int idx;
  {
    int test = a1;
    if (test != 0)
    {
      goto after_switch;
    }
  }
  switch (a2)
  {
    case 6:

    case 8:

    case 10:

    case 11:

    case 14:
      v = 0;
      w = 0;
      break;

    case 38:

    case 40:

    case 42:

    case 43:

    case 46:
      v = 0x20;
      w = 1;
      break;

    case 70:

    case 72:

    case 74:

    case 75:

    case 78:
      v = 0x40;
      w = 2;
      break;

    case 102:

    case 104:

    case 106:

    case 107:

    case 110:
      v = 0x60;
      w = 3;
      break;

    case 134:

    case 136:

    case 138:

    case 139:

    case 142:
      v = 0x80;
      w = 4;
      break;

    default:
      v = -1;
      break;

  }

  after_switch:
  for (i = 0; i < 10; i++)
  {
    gUnknown_0200B0D0[i].unk00 &= ~1;
  }


  p = gUnknown_0200B0B0;
  row = p->unk3a;
  if (a1 == 0)
  {
    idx = p->unk36;
  }
  else
  {
    idx = p->unk38;
  }
  n = 8;
  if (a1 == 0)
  {
    n = 10;
  }
  m = 7;
  if (a1 == 0)
  {
    m = 9;
  }
  e = &gUnknown_0200B224[idx];
  for (i = 0; i < m; i++)
  {
    d = &gUnknown_0200B0D0[row];
    d->unk00 &= ~1;
    new_var3 = (unsigned short) i;
    d->unk06 = new_var3;
    d->unk00 |= 8;
    d->unk10 = 0x8200;
    if (gUnknown_0200B0B0->unk07 == 0)
    {
      d->unk0c = gUnknown_084886F8[a1][4] << 8;
      d->unk08 = gUnknown_084886F8[a1][i];
      d->unk14 = 0;
    }
    else
    {
      d->unk0c = gUnknown_084886F8[a1][3] << 8;
      d->unk08 = gUnknown_084886F8[a1][i];
      new_var2 = 0;
      d->unk14 = new_var2;
    }
    d->unk04 = e->unk00;
    if ((a1 == new_var2) && (v >= 0))
    {
      new_var = ((*((volatile u16 *) (&d->unk04))) & 0x1f) | v;
      d->unk04 = new_var;
    }
    e++;
    idx++;
    if (a1 == 0)
    {
      if (idx > 0x10)
      {
        do
        {
          e -= 0x11;
        }
        while (0);
        idx -= 0x11;
      }
    }
    else
      if (idx > 0x13)
    {
      e -= 0x14;
      idx -= 0x14;
    }
    row++;
    if (row >= n)
    {
      row -= n;
    }
  }

  if ((a1 == 0) && (v >= 0))
  {
    sub_080077EC(a2, w);
    sub_08007B74();
  }
}

/* PARKED, wave 65 (W65-H). Candidate 988 bytes versus 1012, 67.5% identical;
 * the residual begins at +0x14 and is an allocation/preheader fixpoint around
 * the second loop. A controlled probe removed the authored e pointer and used
 * gUnknown_0200B224[idx] directly, testing whether strength reduction should
 * create the pointer. It regressed the loop by another 48 bytes and removed
 * the ROM's coupled pointer/index correction, so the authored pointer is not
 * the missing shape lever. The original draft above was explicitly restored.
 * (WAVE 89: that probe was run on a draft with NO giv and no sl/r8, i.e. at a
 * completely different register pressure. Per W86 "a permuter negative is about
 * the draft it ran on", the same applies to a probe negative -- this refutation
 * is VOID against the wave-89 draft and should be re-measured.) */



/* WAVE 77 (W77-D), two readouts, no edit.
 *
 * 1. The ~142 ".4byte" words in this function's tail are the SWITCH JUMP TABLE
 *    (`.4byte _0800768A @ case N`), NOT a literal pool. The real pool is seven
 *    words: gUnknown_0200B0B0 (x2), gUnknown_0200B0D0 (x2), gUnknown_0200B224,
 *    gUnknown_084886F8, and _08007434 (the jump table's own base). Pool ORDER
 *    is not part of this residual; do not spend budget on it.
 *
 * 2. The W77-A address-expression lever (`(u8 *)base + n * sizeof(T)` instead
 *    of `base[a][b]`) does NOT apply here. It is conditional on the ROM's pool
 *    carrying a -fforce-addr word for the base. This function's pool has NO
 *    force-addr word at all -- every base is a plain symbol literal, loaded
 *    once or twice. `gUnknown_084886F8[a1][i]` must keep the array spelling.
 *
 * 3. The two `register ... asm("rN")` pins above were added in wave 76 and they
 *    ARE load-bearing for the recorded score: they took the draft from
 *    -24 bytes / 67.5% to -12 bytes / 69.66% by hand-writing the prologue's
 *    `mov r9, r0` and `mov r7, ip`. Read that the way wave 77 reads an inline
 *    `asm()` draft -- the pins buy the register NAMES the allocator would not
 *    choose, so the honest residual of this body is the wave-76 figure
 *    (-24 / 67.5%). They also make `tools/permute.py` abort
 *    outright (`Syntax error in base.c ... before: asm`), which is why the one
 *    tool documented for this residual class has never run on this function.
 *    Anyone taking a serious run at it should strip both pins first.
 */

/* WAVE 85 (W85-C), two source changes from the target listing, pins kept.
 *
 * 1. The `*(a1 == 0 ? &p->unk36 : &p->unk38)` ternary compiled to
 *    `adds r0,#56 / bne / subs r0,#2` where the ROM has a two-arm
 *    `adds r0,#54 / b.n / adds r0,#56` join with the shared
 *    `movs r4,#0; ldrsb r4,[r0,r4]` AFTER the join. Spelled as if/else on the
 *    members the arms hold only the address adds and the load is common, which
 *    is the ROM's shape; the unconditional `b.n` is also the dump point that
 *    gives the ROM its 2-word pool at +0x2c0 (gUnknown_0200B0D0, B0B0) that
 *    the candidate was missing (the two unaccounted pool words).
 *
 * 2. **RETRACTED IN WAVE 89 -- THIS READ-OUT WAS WRONG.** It claimed the ROM
 *    "advances it `adds r7,#4` ONLY inside the row-wrap block (after
 *    `subs r5,r5,r1`), not per iteration", and on that basis authored a source
 *    pointer `const s32 *p08` incremented in the `if (row >= n)` block. The ROM
 *    reads:
 *        cmp r5, r1 / blt _080077B4 / subs r5, r5, r1
 *      _080077B4:                       <- the label is BEFORE the increment
 *        ldr r7, [sp, #0x14] / adds r7, #4 / str r7, [sp, #0x14]
 *    `_080077B4` is the FALL-THROUGH target of the `blt`, so the increment is
 *    on the JOIN and runs every iteration. See the wave-89 block below for what
 *    that changes. Change 1 above is unaffected and is kept.
 */

/* WAVE 88 (W88-B). NO SOURCE CHANGE -- re-submitted unchanged to get a current
 * diff. The pool is complete at 144 words; this is not a pool problem. Three
 * missing instructions, all in the loop body and its preheader.
 *
 * 1. THE ROM RE-LOADS `d->unk04` AND THE CANDIDATE DOES NOT. -- FIXED in W88-C.
 *
 * 2/3. THE `[3]` READ IS HOISTED IN THE CANDIDATE AND NOT IN THE ROM.
 *    The ROM's preheader holds `sl = gUnknown_084886F8` and `r8 = a1*40` in
 *    two callee-saved registers, hoists ONLY the `[4]` address
 *    (`mov r0,sl / adds r0,#16 / add r0,r8 / str r0,[sp,#16]`), and
 *    REMATERIALISES the `[3]` address inside the else arm
 *    (`mov r0,sl / adds r0,#12 / add r0,r8 / ldr r0,[r0,#0]`).
 *    The candidate hoists BOTH into stack homes and never needs sl/r8 -- which
 *    is also why the ROM's frame is 4 bytes LARGER and why the ROM spills the
 *    two loop bounds where the candidate keeps them in sl/r8.
 *    "Both arms are equally conditional and equally invariant, so the asymmetry
 *    is not explained by loop.c's not_every_iteration; that is the open
 *    question."  -- ANSWERED IN WAVE 89, below.
 *
 * The permuter has still never run here (the two pins abort tools/permute.py).
 * Toolchain axis not re-swept: W81-E, 155 drafts x 7 profiles, zero flips. */

/* WAVE 88 (W88-C). RESIDUAL 1 IS FIXED. Hypothesis CONFIRMED, and it is the
 * volatile-read lever rather than the W87 redundant-mask one.
 *
 * gcse was forwarding the stored register across the join, so no rearrangement
 * of the two statements could force the re-load -- gcse proves the memory holds
 * the value it just stored, and that proof is independent of source order. What
 * defeats it is an access gcse is FORBIDDEN to prove anything about:
 *     d->unk04 = (*(volatile u16 *)&d->unk04 & 0x1f) | v;
 * A volatile READ (the store stays plain) is never forwarded or CSE'd, and it
 * costs no extra instruction -- it is exactly the ROM's `ldrh r1,[r2,#4]`.
 * The same probe run WITHOUT the volatile keeps `ldrh r1,[r4] / strh r1,[r2,#4]`
 * and then `mov r0,#0x1f / and r0,r0,r1` with no load -- a clean controlled
 * pair. KEPT.
 *
 * RESIDUAL 2/3: a source bind moves WHICH invariant is hoisted but cannot stop
 * an invariant from being hoisted at all. Binding `[4]`'s address to a local
 * split the two but `[3]` still got a stack home ([sp,#0xc]) instead of the
 * ROM's rematerialisation. NOT banked. */

/* ===========================================================================
 * WAVE 89 (W89-B). RESIDUAL 2/3 IS SOLVED, and its cause was the wave-85
 * read-out error retracted above -- not anything about LICM's treatment of
 * conditional arms.
 *
 * FIRST, THE PRE-REGISTERED HYPOTHESIS IS REFUTED, from the ROM alone: this is
 * NOT a goto loop and loop.c is NOT bypassed. The ROM has a zero-trip guard at
 * the top (`movs r6,#0 / ldr r7,[sp,#0xc] / cmp r6,r7 / bge _080077C2`) and its
 * exit test at the BOTTOM (`adds r6,#1 / ldr r0,[sp,#0xc] / cmp r6,r0 / blt
 * _0800770C`). That is a rotated `for` with duplicate_loop_exit_test applied --
 * every loop.c pass ran. No goto spelling was needed or tried.
 *
 * THE ACTUAL MECHANISM. `p08` was never a source variable; it is a
 * strength_reduce GIV for `gUnknown_084886F8[a1][i]`, whose init
 * (`mov r7,r8 / add r7,sl / str r7,[sp,#0x14]`) sits in the preheader AFTER the
 * guard -- exactly where the wave-58 rule says a compiler-written IV init sits,
 * and exactly where a source bind CANNOT sit. Authoring it as a source pointer:
 *   - deleted the giv, so nothing needed `base` and `a1*40` as separate live
 *     values, so sl and r8 were never populated;
 *   - which dropped register pressure far enough that loop.c's move_movables
 *     hoisted BOTH conditional arms' invariants into stack homes;
 *   - which shrank the frame by 4 and freed sl/r8 to hold the loop bounds the
 *     ROM spills.
 * Every one of the four W88 observations is a CONSEQUENCE of the missing giv.
 *
 * Restoring the plain `d->unk08 = gUnknown_084886F8[a1][i];` (and deleting the
 * `p08++` from the row-wrap block) reproduces, measured in one probe:
 *     ldr r1,=gUnknown_084886F8 / mov sl,r1        <- sl = base
 *     mov r1,ip / lsl r0,r1,#2 / add r0,r0,ip / lsl r0,r0,#3 / mov r8,r0
 *     <giv init base + a1*40>                      <- was absent entirely
 *     mov r0,sl / add r0,#0x10 / add r0,r8 / str r0,[sp,#0x10]   <- [4] hoist
 *   and in the else arm:
 *     mov r0,sl / add r0,#0xc / add r0,r8 / ldr r0,[r0]          <- [3] REMAT
 * i.e. the exact asymmetry W88 called the open question, with no lever applied
 * to it at all.
 *
 * THE TRANSFERABLE RULE: an LICM asymmetry between two equally-invariant,
 * equally-conditional expressions is a REGISTER-PRESSURE readout, not a
 * property of either expression. move_movables stops hoisting once estimated
 * pressure crosses its threshold, so the arm that loses is decided by how much
 * else is live -- and the usual way a draft loses that pressure is by
 * hand-authoring an induction variable the ROM left to strength_reduce. Do not
 * look for a spelling of the un-hoisted expression; look for a giv you wrote
 * out by hand. (Appended as a chapter to docs/agbcc-codegen.md, wave 89 W89-B.)
 *
 * REMAINING, from the verdict diff below this block's measurements: `e`'s bind
 * lands BEFORE the guard in the candidate and AFTER it in the ROM (last in the
 * preheader), which per the wave-58/87 reading makes the ROM's `e` a giv of
 * `idx` too, not the authored pointer. W65-H's refutation of that is VOID -- it
 * was measured at a pressure this draft no longer has.
 * =========================================================================== */

/* ===========================================================================
 * WAVE 89 (W89-F). PERMUTER CHAIN: 71.8% / -16  ->  95.9% / SIZE-EXACT.
 * The size delta is CLOSED. 41 of 1012 bytes differ, first difference +0x2ea.
 *
 * THE PINS ARE GONE AND THAT IS WHAT UNLOCKED THIS. W89-B's re-measurement of
 * the two wave-76 `register asm` pins is CONFIRMED independently: pinned 72.2%
 * vs stripped 71.8%, both at -16 bytes, the only difference being which of
 * v/base lands in sl vs r9 (so the first difference moves +0x26b <-> +0x14,
 * positionally, with the same body). W77-D's "worth 4 points" is wrong for the
 * wave-89 structure. 0.4 points was the entire price of making this function
 * permutable for the first time in 13 waves.
 *
 * CHAIN (each run from the previous best.c, 300 s, 4 threads, `configured`):
 *   base 71.8% / -16   ->  93.68% / SIZE-EXACT  (run 1)
 *   93.68%             ->  94.86% / size-exact  (run 2)
 *   94.86%             ->  95.95% / size-exact  (run 3)
 *   95.95%             ->  nothing, 14,737 iterations, full length  (run 4)
 * Run 4 is a REAL negative for this base (it ran to the timeout at full
 * iteration count, it was not killed). Snapshots of every rung are kept as
 * work/sub_080073F8/w89f-perm{1,2,3}-*.c; the stripped base is w89f-stripped.c.
 *
 * WHAT THE PERMUTER FOUND, and it is the -16 the notes called "one fact":
 * a CONSTANT-ZERO LOCAL set in the ELSE arm only and then re-read in the
 * loop's own guard test --
 *     else { ...; new_var2 = 0; d->unk14 = new_var2; }
 *     ...
 *     if ((a1 == new_var2) && (v >= 0))
 * plus a narrow copy local for the `i` store (`unsigned short new_var3 = i;
 * d->unk06 = new_var3;`) and a `do { e -= 0x11; } while (0);`.
 * The zero local is the extra live value the ROM has and the draft did not:
 * it is live across the whole loop body, which is exactly the pressure that
 * makes the ROM keep r7 as pure scratch and SPILL the p08 giv to [sp,#0x14].
 * W89-B read the spill correctly as pressure (W77-B) and correctly refused to
 * add a local for it; the answer was a local carrying a CONSTANT, whose cost
 * is a live range and not an instruction. See the new doc chapter.
 *
 * DO NOT TIDY THIS. `new_var2` is read on a path where it was not assigned;
 * that is the permuter's doing and it is load-bearing. Folding any of the
 * three new locals back costs the size-exactness.
 *
 * REMAINING RESIDUAL -- ONE ORDERING FACT, and the pool order is its
 * CONSEQUENCE, not a second fact:
 *   ROM:        [guard] [sl=084886F8] [r8=a1*40] [p08 giv init] [[4] hoist]
 *               [e bind: ldr .. / lsls r0,r4,#2 / adds r3,r0,r1]
 *   candidate:  [e bind] [guard] [sl] [r8] [giv init] [[4] hoist]
 * i.e. the ROM emits `e`'s bind LAST in the preheader, after every hoist; the
 * candidate emits it FIRST, before the zero-trip guard. Because the candidate
 * therefore creates gUnknown_0200B224's address pseudo BEFORE
 * gUnknown_084886F8's, the two pool words at +0x354/+0x358 come out swapped --
 * per the "misplaced ldr and swapped pool words are ONE fact" rule, do not
 * chase the pool order. Everything else in the diff is either that swap's
 * displacement fallout (`ldr r0,[pc,#96]` vs `[pc,#92]`) or a wave-59
 * symbolisation false difference (`_08007690` vs `sub_080073F8+0x298`).
 *
 * THE GIV READING OF `e` IS REFUTED A SECOND TIME, NOW AT 96% PRESSURE.
 * `e`'s bind sitting after the LICM hoists is the strength_reduce slot, so the
 * obvious reading is that the ROM's `e` is a giv of the biv `idx` (its coupled
 * `subs r3,#68` / `subs r3,#80` track `idx -= 0x11` / `idx -= 0x14`). It is
 * not reachable that way. Probe: delete `e`, index `gUnknown_0200B224[idx]`
 * directly, delete `e++` and both `e -= K`. strength_reduce creates NO giv --
 * the address is rebuilt inline every iteration
 * (`lsl r0,r3,#2 / ldr r1,.L64 / add r0,r0,r1 / ldrh r0,[r0]`) -- and the whole
 * allocation collapses (n moves to sl, a1*40 to ip, base to r9). This
 * replicates W65-H and W89-B's re-run at a THIRD, much higher pressure, so the
 * refutation is now robust rather than draft-specific: one use in the body
 * against three biv update sites is not profitable enough for strength_reduce
 * to fire here. THE AUTHORED `e` STAYS. Its bind POSITION is the open fact.
 *
 * Toolchain axis not re-swept (W81-E). Permuter budget spent: 4 runs.
 * =========================================================================== */
