#include "global.h"

/* Rasterises a text string's glyphs into VRAM: grab a 0x3000-byte scratch
 * block, and for every non-control character in `str` look its code up in
 * gUnknown_08090F30 and blit that entry's 0x100-byte tile run to the next
 * glyph slot, then release the block. `j` counts SLOTS (only printable
 * characters advance it) while `i` walks the string, which is why the two
 * counters are separate and why `j++` sits after the inner loop.
 *
 * PARKED at 87.2%, SIZE-EXACT (172 bytes), 22 of 172 bytes differ.
 *
 * WAVE 73 (W73-D) -- TWO CORRECTIONS TO THE RECORD BEFORE ANYTHING ELSE:
 *
 * 1. data/parked.json said "NOT CHARACTERISED", "W59-B did not open this
 *    function" and "NOTHING WAS RULED OUT". That was wrong: this header
 *    already carried three waves of measured evidence (W43-I and W57-E). The
 *    entry recorded position only because wave 59 never opened it, and it read
 *    as though the function were unexamined. It has been rewritten.
 *
 * 2. THE KEPT DRAFT WAS THE WEAKER OF TWO SPELLINGS, and this header was the
 *    reason. It listed `dst` assigned in the outer loop body, before the inner
 *    `for`, under "RULED OUT" -- noting in passing that it is the ONE spelling
 *    keeping 0x6140 and 0x06010000 as separate pool words and that it is
 *    size-EXACT -- while keeping the merged spelling, which is 164 bytes (-8)
 *    and 43.0%. Nobody had ever scored it. Measured this wave: 87.2% and
 *    size-exact. It is now the draft. A spelling filed under "ruled out" for
 *    having the wrong instruction POSITIONS was 44 points better than the one
 *    filed as kept.
 *
 * THE CONSTANT MERGE IS SOLVED and is no longer the residual. cse merges
 * `dst + 0x06010000` into `dst = (j << 8) + 0x6140` when both sit in the same
 * extended basic block, and every spelling that puts the assignment inside the
 * `if` -- or as the first statement of the inner loop body -- is in that same
 * EBB and merges. Hoisting it into the OUTER loop body puts the definition
 * behind the inner loop's back edge, where cse cannot reach it, and the two
 * pool words survive. That is worth the 8 bytes and 44 points.
 *
 * REMAINING, 22 bytes, TWO facts (ignore the branch lines in `--diff`: a
 * target symbolised `<_08039620>` against `<sub_08039588+0x98>` is the same
 * encoding and not a byte difference):
 *
 *  (a) POSITION. The ROM computes `dst` as an LICM HOIST in the inner loop's
 *      preheader -- AFTER the zero-trip guard (`ldrb`/`cmp`/`beq`) and AFTER
 *      the table-base hoist `ldr r3,[pc,#36]`. This draft computes it as a
 *      source statement, so the three instructions land BEFORE the guard.
 *  (b) SLOTS. The ROM shares r4 between `j` and `dst` -- `adds r6,r4,#1` saves
 *      j+1 before the reuse -- so `movs r4,#0`, `lsls r0,r4,#8` and
 *      `lsrs r4,r0,#16` all name r4. This draft has j in r3 and dst in r4,
 *      which also shifts both `ldr [pc,#N]` displacements.
 *      (b) follows from (a): while `dst` is a source statement its live range
 *      starts before the guard and cannot overlap j's.
 *
 * So the open question has MOVED. It is no longer "how do I stop fold/cse
 * merging the two literals" -- that is answered. It is: what source form keeps
 * the definition out of the use's extended basic block (which the pool words
 * require) while still presenting it to loop.c as a loop INVARIANT of the
 * inner loop (which the hoist position requires)? Those are the two ends of
 * the same span and every spelling so far sits at one end or the other.
 *
 * RULED OUT, all probed:
 *   - the expression inline, `(void *)(0x06010000 + j * 0x100 + 0x6140)`, and
 *     `(u8 *)0x06010000 + (j * 0x100 + 0x6140)`: merged, 164 bytes.
 *   - `dst = ...` as the first statement of the inner loop body: still merged,
 *     and it hoists BEFORE the table base, reversing the preheader.
 *   - `dst = ...` inside the `if`, i.e. at the use: merged. This was the kept
 *     draft for four waves at 43.0%.
 *   - hand-rotating the inner loop into `k = 0; if (tbl[k]) do {...} while;`
 *     so the assignment sits in the preheader: much worse -- it spills the
 *     table base to a `-fforce-addr` .rodata word and moves str into r9.
 *   - WAVE 73: decomp-permuter, 300 s / 4 threads, from the new 87.2% best.c.
 *     No match. Every candidate it scored regressed TOWARDS the merged -8
 *     spelling (best 40.7% at 164 bytes), which is the tool confirming from
 *     the other side that the size-exact spelling is the right branch. Wave
 *     57 had closed this axis by argument -- "the residual is a missing
 *     INSTRUCTION, which wave 37 lists as the permuter's one useless case" --
 *     and that argument was correct for the OLD draft and does not apply to
 *     this one, which is size-exact. It has now been measured rather than
 *     reasoned about.
 *
 * WAVE 43 (W43-I), still valid and it narrows the search: THE DEF/USE SPLIT IS
 * STRUCTURAL. Both `dst` and `dst + 0x06010000` are invariant in the inner
 * loop, yet the ROM hoists only the first -- because the second's destination
 * is r1, set immediately before the `bl`, and loop.c will not move an
 * invariant whose register is call-clobbered out past the call. `dst` itself
 * lands in callee-saved r4 and hoists freely. A non-trapping invariant inside
 * a conditional still hoists, so both may legitimately be written inside the
 * `if`.
 *
 * WAVE 73 (W73-G) -- THE `WHERE OUTSIDE THE LOOP` AXIS IS CLOSED BY
 * CONSTRUCTION, which collapses the span above to one question.
 *
 * Probed: `dst` defined in the outer body AND redundantly again at the END of
 * the inner body -- the one spelling that looked like it reached both ends
 * (outer def keeps the pool words; inner def gets hoisted; outer def then dies
 * and is deleted). It reaches neither end. The two pool words do survive, but
 * the inner def is NEITHER HOISTED NOR DELETED -- it sits at the loop bottom
 * costing two instructions an iteration -- and the outer def still lands ahead
 * of the zero-trip guard.
 *
 * The reason is a precondition of gcc's `move_movables` that this project had
 * not recorded: A MOVABLE'S REGISTER MUST NOT BE LIVE ON ENTRY TO THE LOOP.
 * Hoisting an invariant whose pseudo already holds a value coming in would not
 * remove the in-loop set, so loop.c declines. Defining `dst` ANYWHERE outside
 * the inner loop makes it live at entry and forecloses the hoist -- it is not
 * a matter of finding the right outer position, and no outer position exists.
 *
 * So `dst` must be defined ONLY inside the inner loop (already measured: that
 * DOES hoist, then merges and lands before the table base). What is left is to
 * get the def and the use into different extended basic blocks with BOTH
 * inside the loop and without adding control flow. cse runs BEFORE loop.c, so
 * it merges the constants while the def and the use are still adjacent; the
 * loop header is the join that would separate a preheader def from a body use,
 * but nothing puts the def there until LICM has already lost the chance.
 * See the chapter in docs/agbcc-codegen.md. */
void sub_08039588(u8 *str)
{
    u8 *buf;
    int dst;
    u16 i;
    u16 j;
    u16 k;

    buf = sub_08014E44(0x3000);

    j = 0;

    for (i = 0; str[i] != 0; i++)
    {
        if ((u8)(str[i] - 0x18) > 8)
        {
            dst = j * 0x100 + 0x6140;

            for (k = 0; gUnknown_08090F30[k] != 0; k++)
            {
                if (str[i] == gUnknown_08090F30[k])
                {
                    sub_08011C68(buf + k * 0x100, (void *)(0x06010000 + dst), 0x100);
                    break;
                }
            }

            j++;
        }
    }

    sub_08014ED4(buf);
}
