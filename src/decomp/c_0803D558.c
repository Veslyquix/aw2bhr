#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803D558.
 * sub_0803D558 @ 0x0803D558
 */

/* MATCHED wave 90 (W90-C). Three changes from the 94.3%/+4 park:
 *   - scan 2 through the struct (`->terrain[->rowOffset[y] + x]`, scan 1's
 *     spelling), which gives the ROM's (p + 0x417A) + y*2 grouping;
 *   - the value narrowed through two u8 temps (`cnt = v & 0x1f;
 *     v = cnt + b[v >> 5];` then the store). The 0x417A hoist was made by the
 *     RERUN of the loop pass (flag_rerun_loop_opt), not the first one: -dL
 *     shows pass 1 calling it "not desirable" and pass 2 moving it, because
 *     the inner loop is down to 24 real insns by then and move_movables tests
 *     threshold(26) * savings(1) * life(1) >= insn_count. The temps give the
 *     rerun 28 insns, and they are gone again by the final code;
 *   - `do { } while (0)` around scan 2's inner loop (decomp-permuter, run from
 *     the 98.6% base with the fixed scorer): the extra loop depth raises the
 *     weighted ref count of &gUnknown_08499590's outer-loop pseudo so global.c
 *     allocates it before y+1, putting it in r8 and y+1 in ip as the ROM has.
 * Also dropped the permuter's non-static `inline_fn`, which agbcc emitted out
 * of line after the body (+4). Older notes below are history. */
/* Wave 80 (W80-D): 352/352, 20 bytes, unchanged; the mechanism is now known
 * and the residual is a LICM decision, not a spelling. (1) Every raw pointer
 * sum reassociates its constant to the OUTSIDE at expansion (EXPAND_SUM
 * "constant comes last"), so no spelling of `p + 0x417A + y*2` -- casts,
 * `(int)`, bound `t = y*2`, `(*(u16 (*)[N])(p + c))[y]` (which c-typeck turns
 * into pointer arithmetic) -- can form (p + 0x417A) first. (2) Only the
 * struct member (`->rowOffset[y]`, scan 1's spelling) does, for the row AND the
 * cell, but it emits 0x417A as its own movable and this function's inner loop
 * hoists it (+4). (3) Whether that movable is hoisted flips with the loop's
 * composition (probes: values swapped -> hoists; both arrays u8 -> hoists;
 * cell array u16 -> nothing hoists), consistent with move_movables' savings *
 * lifetime threshold. The lever, if any, changes the loop's insn count at
 * loop time, not the sum. See the wave-80 docs chapter. */
/* WAVE 77, W77-B. Size-exact 352/352, 20 bytes differ (94.3%), unchanged.
 * CLASSIFIED as NOT ORDER: the residual at +0xEA..+0xFD (plus +0x106 and
 * +0x11C/+0x11E) is a REASSOCIATION, not a resequencing. The ROM forms
 * (ptr + 0x417A) + y*2 -- `ldr r1,[r6] / ldr r3,[pc,#96] / adds r0,r1,r3 /
 * adds r0,r0,r7` -- while this draft forms (y*2 + ptr) + 0x417A --
 * `ldr r2,[r6] / adds r0,r5,r2 / ldr r3,[pc,#96] / adds r0,r0,r3`. Registers
 * renumber with it (ROM r7/r5/r1 against r5/r7/r2) and +0x11C is `mov r3,r8`
 * against `mov r1,r8`. Only the leading `lsls r7,r5,#1` / `mov r5,r9` pair is
 * a true swap: 2 of the 20 bytes.
 *
 * RULED OUT this wave: a MIXED spelling -- struct-member for the row read and
 * raw pointer arithmetic for the store -- which reintroduces the hoist far
 * worse than either pure form (+36 bytes, 7.1%); and writing the row read as
 * *(u16 *)(gUnknown_08499590 + 0x417A + y * 2), which is byte-identical to
 * this draft at 20. */

/* WAVE 66: size-exact 352/352, 94.3% (20 differing bytes), independently
 * reverified after one uninterrupted 300-second permuter run. The active
 * source is readable C, not raw header-expanded permuter output.
 *
 * Replacing only the SECOND scan's struct-member spelling with raw pointer
 * arithmetic removed the unwanted four-byte 0x417A LICM hoist and moved the
 * draft from +4/59.7% to size-exact/85.8%. The permuter then raised it to
 * 94.3% by retaining the otherwise redundant `i = x` in the first scan.
 *
 * The exact remaining residual is confined to the second scan at +0xea: the
 * ROM forms `base + 0x417A` before adding `y * 2` and assigns the carried
 * values to r5/r7/r1, while this candidate reassociates the same operands and
 * uses r7/r5/r2. All code before and after that block is byte-identical; the
 * textual branch-label differences in the diff have identical encodings.
 * Struct-member spelling restores the ROM's operand grouping but reintroduces
 * the four-byte hoist. Volatile member variants prevent the hoist but add
 * repeated row/cell loads, so both axes are ruled out. */


/* WAVE 62: the +4 residual is unchanged. Temporary o1 stayed +4 at 5.7%,
 * o1-no-force became +8 at 8.0%, and no-force became +16 at 8.2%; no profile
 * localised or accepted the ROM mechanism. A direct opaque no-op store grew
 * the function to +24, while a bound-pointer form compiled byte-identically
 * to this draft. The second-loop 0x417A hoist remains the exact residual.
 *
 * PARKED at +4 bytes, wave 55 (W55-E). Three attempts.
 *
 * The whole structure is settled and every instruction except two is
 * byte-exact: the four `i` loops, the two map scans, the `a[n++] = i`
 * compaction, the `if (++cnt == 4) return;` early exit out of the nest, and
 * the trailing `gPlayers[i].teamColor = a[i]` store all reproduce.
 *
 * THE ENTIRE RESIDUAL: in the SECOND map loop the candidate hoists the
 * 0x417A address constant out of the inner loop --
 *
 *     ldr r3, [pc, #104]
 *     mov r8, r3            <- 2 extra instructions, 4 bytes
 *     ...
 *     mov r2, r8            (where the ROM re-loads `ldr r3, [pc, #96]`)
 *
 * -- while the ROM re-materialises BOTH 0x417A and 0x1432 inside the loop
 * body every iteration and hoists NOTHING. Note the asymmetry with the FIRST
 * map loop, where the ROM DOES hoist `&map->rowOffset[y]` (r7) and
 * `map + 0x1432` (r6) into the inner preheader: the second loop STORES into
 * unk1432, which may alias the `gUnknown_08499590` pointer variable itself,
 * so the pointer is reloaded (`ldr r1, [r6]`) every iteration and nothing
 * derived from it survives -- but the bare address CONSTANTS are still
 * loop-invariant and this candidate's LICM takes one of them.
 *
 * The candidate's high registers are also rotated by one against the ROM
 * (ROM: b's base -> sb, &gUnknown_08499590 -> sl; candidate: b -> sl,
 * &gUnknown_08499590 -> r9), and its `i` lands in r3 where the ROM's lands
 * in r4. Those are byte differences but not size differences; they are
 * probably the same fact as the hoist, since r8 is left free in the
 * candidate and is exactly where the hoisted constant goes.
 *
 * Ruled out by measurement:
 *   - binding the cell address to a `u8 *p` local and writing
 *     `*p = (*p & 0x1f) + b[*p >> 5];`  -- WORSE: the frame grows 0x10 -> 0x14
 *     (p spills) and a `.rodata` -fforce-addr word for gUnknown_08499590
 *     appears that the ROM does not have, i.e. that spelling carries more
 *     live values than the original.
 *   - binding the index to `int o` and subscripting terrain twice with it --
 *     byte-identical to this draft; CSE collapses it, so it is not a lever.
 *
 * gUnknown_08499590 is reached through the shared `(struct Map *)` cast, the
 * same idiom as src/decomp/c_08000BF8.c. */


void sub_0803D558(void)
{
  u8 a[8];
  u8 b[8];
  int i;
  int x;
  int y;
  u8 cnt;
  u8 n;
  u8 v;
  for (i = 0; i <= 4; i++)
  {
    a[i] = 0;
    b[i] = 0;
  }

  cnt = 0;
  for (y = 0; y < ((struct Map *) gUnknown_08499590)->height; y++)
  {
    for (x = 0; x < ((struct Map *) gUnknown_08499590)->width; x++)
    {
      i = x;
      v = ((struct Map *) gUnknown_08499590)->terrain[((struct Map *) gUnknown_08499590)->rowOffset[y] + i];
      if ((v & 0x1f) == 8)
      {
        a[v >> 5] = 1;
        if ((++cnt) == 4)
        {
          return;
        }
      }
    }

  }

  n = 1;
  for (i = 0; i <= 4; i++)
  {
    if (a[i] != 0)
    {
      a[i] = 0;
      a[n++] = i;
    }
  }

  for (i = 0; i <= 4; i++)
  {
    if (a[i] != 0)
    {
      b[a[i]] = 0x20;
    }
  }


  for (y = 0; y < ((struct Map *) gUnknown_08499590)->height; y++)
  {
    do
    {
      for (x = 0; x < ((struct Map *) gUnknown_08499590)->width; x++)
      {
        v = ((struct Map *) gUnknown_08499590)->terrain[((struct Map *) gUnknown_08499590)->rowOffset[y] + x];
        cnt = v & 0x1f;
        v = cnt + b[v >> 5];
        ((struct Map *) gUnknown_08499590)->terrain[((struct Map *) gUnknown_08499590)->rowOffset[y] + x] = v;
      }
    } while (0);
  }

  for (i = 0; i <= 4; i++)
  {
    gPlayers[i].teamColor = a[i];
  }


}
