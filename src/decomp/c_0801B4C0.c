#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801B4C0.
 * sub_0801B4C0 @ 0x0801B4C0
 */

/* MATCHED, wave 42 (W42-E), by decomp-permuter from wave 40's 86.6% draft.
 * `relocs` reports gUnknown_02002FFF against gUnknown_02002000 -- different
 * symbols resolving to the same address, which is the accepted false mismatch,
 * so this IS a match. The promotion needs nothing special for it.
 *
 * THE LEVER, and it is worth carrying forward: the two read-modify-writes are
 * ONE statement, `unk00[i] = (unk10[i] |= 0xff)`, with a PLAIN ASSIGNMENT on
 * the outer half. Wave 40 tested the all-`|=` form `unk00[i] |= unk10[i] |=
 * 0xff` and correctly ruled it out -- agbcc folds both sides to `movs #0xff;
 * strb` and loses the ldrb/orrs/strb the ROM has. The plain `=` outer half
 * does NOT trigger that fold, while still materialising the outer LHS address
 * first, which is the register-allocation ordering the whole residual was
 * about. So the wave-40 conclusion "chained assignment folds" was too broad:
 * it is the chained `|=` that folds, not the chain.
 *
 * Everything below was already settled by wave 40 and is unchanged: the gate's
 * branch sense and
 * the placement of its `return 1` at the END (writing it as an
 * `if (g != 1) return 1;` guard instead puts that block right after the test,
 * which is the mirror image of the ROM), both loops, both induction variables,
 * the six stores and their order, and every pool word and its position.
 *
 * THE WHOLE RESIDUAL IS ONE REGISTER-ALLOCATION ORDERING DECISION and the ~29
 * differing bytes are all its consequence. The ROM computes `&unk00[i]` into r2
 * as the FIRST instruction of the loop body -- before the unk10 statement that
 * stores first -- which leaves the 0xff constant in r3; this candidate computes
 * it in place after the unk10 store, so 0xff takes r2 and every later scratch
 * shifts by one register. No instruction is missing, added or reordered
 * otherwise.
 *
 * Ruled out by probe, all in the full function rather than in isolation:
 *   - Swapping the two statements. It swaps the STORES too (measured), so the
 *     ROM's source order really is unk10 first, unk00 second.
 *   - `unk00[i] |= unk10[i] |= 0xff;`. This does produce the ROM's ordering --
 *     outer LHS address first, inner store first -- but agbcc then folds both
 *     `| 0xff` on a u8 to plain `movs #0xff; strb`, losing the ldrb/orrs/strb
 *     the ROM has.
 *   - Binding `&unk00[i]` to a `u8 *` local before the unk10 statement. Same
 *     fold. Worth recording that the fold is CONTEXT-dependent and not a
 *     property of `x |= 0xff`: the plain two-statement form in this same
 *     function does NOT fold, which is why it is the right shape.
 *   - Making unk00/unk10 one `u8 [0x20]` member indexed [i] and [i + 0x10].
 *     Strength reduction then reaches both through one giv with `#0x10`
 *     displacements and spills, which is further away, not closer.
 *
 * NEXT THING TO TRY: decomp-permuter. This is exactly its stated case
 * (order-wrong and slot-wrong register allocation with the instruction stream
 * already correct); it was not run only because the brief's "above 256 bytes"
 * trigger did not fire at 216.
 *
 * One more thing the promotion needs: the last pool word. The ROM spells it as
 * the symbol gUnknown_02002FFF with addend 0; this candidate emits a
 * relocation against gUnknown_02002000 with 0xfff in the word. Same linked
 * address -- the same artefact try_match already accepts on sub_0801B018's
 * gUnknown_0200CC58 -- but here it is still inside the byte diff because the
 * rest has not converged. */
int sub_0801B4C0(void)
{
  int i;
  int j;
  if (gUnknown_0200CD0C == 1)
  {
    sub_0801B598(gUnknown_0200CC30, (void (**)(void)) gUnknown_0200CC34);
    for (i = 0; i < 0x10; i++)
    {
      gUnknown_0200CC38.unk00[i] = (gUnknown_0200CC38.unk10[i] |= 0xff);
      gUnknown_0200CC38.unk20[i] = 0;
      gUnknown_0200CC38.unk30[i] = 0;
      gUnknown_0200CC88[i + 0x10] = 0;
      gUnknown_0200CC88[i] = 0;
      sub_0801B6A8(gUnknown_02002000, 0x1000);
      for (j = 0; j < 4; j++)
      {
        sub_0801B618(i, (int) gUnknown_02002000);
        if (sub_0801B648(i, (int) gUnknown_02002000) == 0)
        {
          break;
        }
      }

      if (j == 4)
      {
        return 1;
      }
      gUnknown_0200CC38.unk40[i] = gUnknown_02002000[0xfff];
    }

    return 0;
  }
  return 1;
}
