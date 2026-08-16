#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801914C.
 * sub_0801914C @ 0x0801914C
 */

/* NOT MATCHED -- 87.0%, SIZE-EXACT, and every difference is a register name.
 * Two independent swaps, no instruction added, removed or reordered:
 *   the parameter takes r5 and the CSEd table base r4, where the ROM has them
 *   the other way round; and `w` takes r1 with `v` in r0, where the ROM has
 *   `w` in r0 and `v` in r2 (reusing the register that held the `#8` ldrsh
 *   offset). The final `subs` is `subs r0, r0, #1` here against
 *   `subs r0, r2, #1` there, which is the same instruction on the same values.
 *
 * sub_080188D0's neighbour and near-twin: the same palette repaint, but the
 * fallback of 5 is applied by preset-and-overwrite rather than by two calls,
 * and the node's unk08 is read ONCE here (nothing loads another global between
 * the test and the use, so CSE fires where it did not there).
 *
 * The three-question sort from wave 31, run and recorded:
 *  1. n_refs -- the parameter and the table base BOTH have three (one def, two
 *     uses), so there is no power-of-two crossing to reach, and no fourth
 *     reference to either exists in the function.
 *  2. tie-break -- the parameter is defined first (in the prologue) and by the
 *     rule should take the lower register; it does not, so the two are not
 *     tied. The base is born later and dies at the same point, i.e. it has the
 *     shorter live range and the higher priority. That is what the formula
 *     predicts and it is what THIS candidate produces -- the ROM is the one
 *     that disagrees with it.
 *  3. operand order -- neither feeds an index add whose operands would have to
 *     move: the parameter feeds a shift and the base is already operand 2 of
 *     `adds r0, r0, r2` in both.
 *
 * So question 3 ends it: this is a type-model question, not a source-spelling
 * one. RULED OUT by probe: `w` and `v` in either declaration order; a bound
 * `struct Unk0200C528Node *p` for the node, declared first, which is the shape
 * that matched sub_080188D0; naming the node inline instead. All four give the
 * identical allocation. A ternary for the fallback is WORSE -- agbcc folds the
 * `- 1` into both arms (`movs r2, #4`) and loses the shared `subs`. */
bool8 sub_0801914C(s16 a)
{
  int w;
  int v;
  if (gUnknown_03002514 != 1)
  {
    w = (s16) gUnknown_0200C528[a].unk04->unk08;
    v = 5;
    if (w != 0)
    {
      v = w;
    }
    gUnknown_0200C528[a].unk04->unk08 += 0;
    sub_0802D5CC(v - 1, gUnknown_03002F08.unk00);
  }
  gUnknown_0200C528[a].unk04++;
  return 1;
}
