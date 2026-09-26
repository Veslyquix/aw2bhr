#include "global.h"

/* Wave 80 (W80-C): parked again at the wave-78 fixpoint (size exact, 42 of
 * 560, 92.5%). Two measurements, both against the ROM preheader:
 *
 * 1. The wave-78 `t = i` copy is a SIZE COSTUME, not a lever. Without it
 *    (index `i` used directly, `t` only as the result accumulator) the
 *    candidate is 568/560 (+8) -- but the preheader gets two things RIGHT
 *    that the copy gets wrong: i lands in r6 as in the ROM (the copy puts i
 *    in r1 and `t` in r7, with an extra `adds r7, r1, #0`), and `&b[1]` is
 *    computed `mov r7, sp; adds r7, #10` from scratch as in the ROM, where
 *    the copy form lets CSE derive it as `adds r0, #2` off `&b[0]`. The copy
 *    pays for its own instruction with that derivation. The +8 without it
 *    is post-loop: `&d[0]` takes r7 (the ROM has it in r8 because r7 holds
 *    gUnknown_03004580 during the loop), gUnknown_03004580 takes r8, the
 *    spill-slot numbering shifts by 4 and c[side] gets spilled ([sp,#0x30]).
 *    So the true residual is the priority order between the `&d[0]` pseudo
 *    and gUnknown_03004580, plus which of gUnknown_085D6A48 / _085D6A52
 *    keeps a register across the loop (ROM: A48 in r9, A52 reloaded inline;
 *    every draft form here: A52 in r9, A48 inline). That is an allocno
 *    ordering with no construct found behind it.
 * 2. The `((0, gUnknown_085D6A48))` comma anchor is byte-neutral: with and
 *    without it the preheader is identical, so it is NOT anchoring anything
 *    and is kept only because the wave-78 fixpoint carries it.
 *
 * Wave 78 configured fixpoint: size exact, 42 of 560 bytes differ (92.5%),
 * first difference +0x13. `t = i` in the setup loop keeps the whole 560-byte
 * instruction count, and a distinct short-lived `u` for the final
 * sub_08054E8C pair fixes that tail without disturbing the setup allocation.
 *
 * The remaining real residual is confined to the setup loop's allocation and
 * pool/setup order. Both images have the final pool words in the required
 * 03004580/A48/03004582 order, but the ROM creates the A48 pseudo before the
 * stack-backed setup bases while this draft creates it afterward. Downstream
 * code and the final call pair are byte-exact. Reusing `u` for the setup index
 * regresses to 568/560 (+8), 14.8%.
 * The Wave-63 zero-code LICM barrier between the A48/A52 reads also does not
 * transfer here: `gUnknown_08551E64[0][0] += 0` gives 572/560 (+12), 17.7%.
 * Earlier row-aggregate spellings hoisted neither word. A Wave-78 300 s
 * permuter reached 93.2% only with `d[t] = (i = ...)`, which changes loop
 * control and is therefore not a semantics-preserving candidate. */
void sub_08054C5C(void)
{
  u16 a[2];
  u16 b[2];
  u16 c[2];
  u16 d[2];
  u16 e[2];
  struct Unk020298E0 *new_var;
  u16 side;
  u16 t;
  u16 u;
  u16 i;
  side = gUnknown_0300450C;
  for (i = 0; i < 2; i++)
  {
    t = i;
    b[t] = gUnknown_03004580[t][2];
    e[t] = gUnknown_03004580[t][0];
    a[t] = ((0, gUnknown_085D6A48))[gUnknown_03004582[t][0]][0];
    d[t] = gUnknown_02029808[t].unk30[0];
    c[t] = gUnknown_085D6A52[gUnknown_03004582[t][0]][b[t]];
  }

  CpuFastSet(gUnknown_08540F7C, (void *) 0x05000300, 0x10);
  t = sub_08055058(a[side], b[side], c[side], i = d[side ^ 1]);
  t = sub_08055374(a[side], t);
  t = sub_0805521C(side, a[side], b[side], t);
  t = sub_08055288(side, a[side], e[side], b[side], t);
  t = sub_0805530C(side, a[side], b[side], t);
  gUnknown_020296B0[side ^ 1].unk00 = gUnknown_020296B0[side].unk00;
  gUnknown_020298E0[side ^ 1].unk00 = (*(new_var = &gUnknown_020298E0[side])).unk00;
  gUnknown_02029710[side ^ 1].unk00 = gUnknown_02029710[side].unk00;
  if ((c[side] != 2) && ((a[0] != a[1]) || (c[0] != c[1])))
  {
    t = sub_0805521C(side ^ 1, a[side ^ 1], b[side ^ 1], t);
    t = sub_08055288(side ^ 1, a[side ^ 1], e[side ^ 1], b[side ^ 1], t);
    t = sub_0805530C(side ^ 1, a[side ^ 1], b[side ^ 1], t);
  }
  u = sub_08054E8C(0, a[0], b[0], 0);
  sub_08054E8C(1, a[1], b[1], u);
}
