#include "global.h"

/* WAVE 78 (W78-A): final shared-tree configured verification is 364/352
 * (+12), 32.4%. Pinning `best` to r8 and/or `aligned` to r7 made the candidate
 * size-exact but only 9.7% identical by rotating the rest of the allocation.
 * The readable active draft is retained; contaminated expanded permuter
 * best.c was not used. */

/* PARKED at 360 bytes vs 352 (+8). Instruction-for-instruction this is the
 * ROM; the whole residual is ONE REGISTER-ALLOCATION SWAP.
 *
 * ROM:  aligned -> r7 (low), best -> r8 (high), align -> ip, mask -> [sp].
 * Here: best    -> r7 (low), aligned -> ip (high), align -> r8, mask -> [sp].
 *
 * That swap is what costs the 8 bytes, and it costs them INDIRECTLY. With
 * `best` high the ROM copies it into r2 before each `str`, which leaves r0
 * free to hold `aligned - 0x10`; both the `best == head` arm and the
 * `> 0x20` arm then end with delta in r1, best in r2, hdr in r0, and gcc's
 * POST-RELOAD cross-jump merges an eleven-instruction tail
 * (`subs r1,#0x20 / str r1,[r2,#4] / movs r1,#0 / str r1,[r2,#8] /
 * adds r5,r0,#0` + the four address setups) at _080150F2. Here the head arm
 * keeps hdr in r2 and the other arm in r0, so nothing merges and the tail is
 * duplicated (+10 bytes), partly paid back by the split arm reusing the saved
 * delta in r8 instead of recomputing it (-2).
 *
 * Things that were tried and did NOT move the allocation:
 *   - declaring `aligned` before `best` (allocno creation order). No change:
 *     both pseudos tie at floor_log2(n_refs) == 3 and the tie-break did not
 *     go the way the priority formula predicts.
 *   - binding the delta to a shared `d` so both arms write one pseudo. That
 *     makes the arms cross-jump-able pre-reload but keeps `d` live into the
 *     split arm, where GCSE then reuses it and DELETES the recompute the ROM
 *     has -- a different +/-8, not a fix.
 * NEXT THING TO TRY: decomp-permuter. This is exactly its documented case
 * (order-right, slot-wrong) per docs/agbcc-codegen.md.
 *
 * EVERYTHING ELSE IS SETTLED, and four of these were each worth a rewrite:
 *
 * 1. `mask = -align` IS SOURCE, NOT A LICM HOIST. Writing `& -align` inline
 *    leaves `neg` inside the loop; a real local hoists it to the preheader AND
 *    spills it, which is where the ROM's `sub sp,#4` / `str r0,[sp]` /
 *    `ldr r1,[sp]` come from. It lands after `bestSize = 0; bestNext = NULL;`,
 *    exactly as the ROM has it.
 * 2. `t = align + 0xf` MUST BE BOUND. `((u32)p + align + 0xf)` reassociates to
 *    `(p + 0xf) + align`; the ROM computes `align + 0xf` into its own register
 *    first, which only a local produces.
 * 3. `used = p->used` MUST BE BOUND. It is what puts the `ldr r0,[r2,#8]`
 *    BEFORE the `ldr r5,[r2]` at the loop top, with the `cmp` after both.
 * 4. `n * 4` MUST BE TWO STATEMENTS. Written as one expression,
 *    `((u32 *)a - (u32 *)b) * 4` is an EXACT_DIV times its own divisor and
 *    tree-fold collapses it to `a - b`; the ROM keeps `asrs #2; lsls #2`.
 *    Binding the pointer difference to an `int` first defeats the fold.
 * 5. The four `return NULL`s are ONE block AT THE END, so the body must be
 *    nested inside `if (head != -1 && size != 0) { ... if (bestSize != 0)
 *    { ...; return aligned; } }` with a trailing `return NULL;`. Written as
 *    early returns, gcc parks the merged NULL block in the middle and every
 *    guard branch shortens -- that alone was ~14 bytes and the wrong layout.
 *
 * gUnknown_0808E530 is an agbcc -fforce-addr address constant, not a global:
 * [0x0808E530] = 0x03000050 -> gUnknown_03000050, the arena handle
 * src/decomp/c_08014E44.c gates on. Note the ROM reaches it BOTH ways -- the
 * first read goes through the .rodata word (ldr =0808E530; ldr; ldr) and the
 * two after the loop go direct from this function's own .text pool. Naming the
 * global normally reproduces both. Promotion must carry
 *   "rodata": ["0x0808E530"]
 *
 * Semantics: aligned-allocation front end for the same free list
 * src/decomp/c_08014E68.c walks. Alignments <= 0x10 fall through to the plain
 * sub_08014E44. Otherwise it best-fits over the free list on the smallest
 * p->size that can hold `size` at an `align`-aligned address at least 0x10
 * past the block header, then carves the header in at `aligned - 0x10` --
 * the `((struct MemBlock *)ptr)[-1]` idiom c_08014E68.c established.
 *
 * TWO ODDITIES THAT ARE IN THE ROM, NOT IN THIS TRANSCRIPTION:
 *   - the `(u32 *)aligned - (u32 *)best > 0xf` arm is DEAD. It is only
 *     reachable when the byte delta is <= 0x20, i.e. the word delta is <= 8,
 *     so the `> 0xf` test never passes. agbcc emits the predecessor search
 *     anyway because the two thresholds are written on different quantities.
 *   - the no-split arm stores a WORD COUNT into a member every other writer
 *     treats as a byte count (`asrs #2` with no `lsls #2` after it). */

struct MemBlock
{
    /* 0x00 */ struct MemBlock *next;
    /* 0x04 */ u32 size;
    /* 0x08 */ u32 used;
    /* 0x0c */ u32 filler_0c;
};

void *sub_08014FF8(int align, u32 size)
{
    u32 aligned;
    struct MemBlock *best;
    struct MemBlock *p;
    struct MemBlock *next;
    struct MemBlock *bestNext;
    struct MemBlock *q;
    u32 bestSize;
    u32 used;
    u32 mask;
    u32 a;
    u32 t;
    int n;

    best = NULL;
    aligned = 0;

    if (gUnknown_03000050 != -1 && size != 0)
    {
        if (align <= 0x10)
            return sub_08014E44(size);

        size = (size + 0xf) & -0x10;
        bestSize = 0;
        bestNext = NULL;
        mask = -align;

        p = (struct MemBlock *)gUnknown_03000050;
        while (1)
        {
            used = p->used;
            next = p->next;
            if (used == 0)
            {
                t = align + 0xf;
                a = ((u32)p + t) & mask;
                if (a >= (u32)p + 0x10 && a + size < (u32)p + p->size
                    && (bestSize > p->size || bestSize == 0))
                {
                    aligned = a;
                    best = p;
                    bestSize = p->size;
                    next = bestNext = p->next;
                }
            }
            if (next == NULL)
                break;
            p = next;
        }

        if (bestSize != 0)
        {
            if (best == (struct MemBlock *)gUnknown_03000050)
            {
                best->next = (struct MemBlock *)(aligned - 0x10);
                n = (u32 *)aligned - (u32 *)best;
                best->size = n * 4 - 0x20;
                best->used = 0;
            }
            else if ((int)(aligned - (u32)best) > 0x20)
            {
                best->next = (struct MemBlock *)(aligned - 0x10);
                best->size = aligned - (u32)best - 0x20;
                best->used = 0;
            }
            else if ((u32 *)aligned - (u32 *)best > 0xf)
            {
                q = (struct MemBlock *)gUnknown_03000050;
                while (q->next != NULL)
                {
                    if (q->next == best)
                    {
                        q->next = (struct MemBlock *)(aligned - 0x40);
                        q->size += 0x10;
                        break;
                    }
                    q = q->next;
                }
            }

            if (bestSize >= size + 0x20)
            {
                ((struct MemBlock *)aligned)[-1].next = (struct MemBlock *)(aligned + size);
                ((struct MemBlock *)aligned)[-1].size = size;
                ((struct MemBlock *)aligned)[-1].used = 1;
                ((struct MemBlock *)(aligned + size))->next = bestNext;
                n = (u32 *)aligned - (u32 *)best;
                ((struct MemBlock *)(aligned + size))->size = bestSize - size - n * 4;
                ((struct MemBlock *)(aligned + size))->used = 0;
            }
            else
            {
                ((struct MemBlock *)aligned)[-1].next = bestNext;
                ((struct MemBlock *)aligned)[-1].size = (u32 *)bestNext - (u32 *)aligned;
                ((struct MemBlock *)aligned)[-1].used = 1;
            }

            return (void *)aligned;
        }
    }

    return NULL;
}



