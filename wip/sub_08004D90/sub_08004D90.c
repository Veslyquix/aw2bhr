#include "global.h"

/* WAVE 87 (W87-C): 19.1% -> 85.3%, and SIZE-EXACT at 68/68 with BOTH pool
 * words and both relocations present. The park's central claim is REFUTED.
 *
 * The park said: "the ROM materialises `ldr rN, =gUnknown_08499578` inside BOTH
 * arms of the if and dereferences once after the merge... Ruled out: source
 * ordering, exhaustively -- putting the array reference in both arms drags the
 * deref into the arms... It is a -fforce-addr placement artefact with no
 * source-level lever." That ruled out the INLINE form only. The STATEMENT-SPLIT
 * sibling (wave 86's rule) had never been tried and it reproduces the ROM:
 *
 *   bind the ADDRESS OF THE POINTER GLOBAL to a local in EACH arm --
 *   `u16 **p; ... p = &gUnknown_08499578;` -- and dereference once after the
 *   merge as `&(*p)[i]`.
 *
 * `&gUnknown_08499578` is an ADDRESS CONSTANT, so each arm emits only the
 * force-addr `ldr rN,=sym` (two pool words, exactly as the ROM has) and the
 * `ldr rN,[rN]` deref stays after the merge. `gUnknown_08499578` written bare
 * is a pointer LOAD, which is why the park's inline attempt dragged the deref
 * into the arms. Same distinction the promoted c_08026100.c states for its
 * wave-17 anchor: `pp = &gUnknown_08499594` works where `u = gUnknown_08499594`
 * does not. `p` being set in BOTH arms also makes it a MULTI-SET pseudo, which
 * blocks propagation -- the lever the twin src/decomp/c_08087514.c matched on.
 *
 * MEASURED THIS WAVE (all `configured` profile):
 *  - statement-split as above: 68/68 bytes, 85.3%, first difference at +0x8.
 *    Both pool words and both R_ARM_ABS32 relocs correct.
 *  - `i = (p = &gUnknown_08499578, b * 2);` comma anchor, keeping both arm
 *    assignments: WORSE -- the initializer becomes the live definition, the
 *    arm assignments are CSE'd away and only ONE pool word survives. Confirms
 *    W80-F ("a dead address is a no-op"): here it is worse than a no-op.
 *  - arm statement order swapped (`i += 5;` before `p = &...;`): the pool load
 *    SINKS BELOW the merge and one pool word is lost. THE ADDRESS BIND MUST BE
 *    THE FIRST STATEMENT IN EACH ARM -- this is load-bearing, not stylistic.
 *  - `*p + i` in place of `&(*p)[i]`: byte-identical.
 *  - `i + *p` (index first): byte-identical.
 *
 * THE WHOLE RESIDUAL IS NOW ONE SWAPPED REGISTER PAIR. Every instruction,
 * both pool words, both relocs and the branch structure are the ROM's; the ROM
 * holds the index in r1 and the address/pointer in r0, this candidate holds
 * the index in r0 and the address/pointer in r1, and the swap then shows up in
 * all ten differing bytes. The candidate ties the loaded pointer to the add's
 * destination (r1, which is argument 2); the ROM does not, and gives r1 to the
 * index instead. Nothing in the statement text distinguishes them -- the two
 * pseudos have the same shape and the comma/statement-order levers above are
 * spent.
 *
 * WAVE 87 (W87-E): THAT PERMUTER CHAIN HAS NOW BEEN RUN AND IS A NEGATIVE.
 * Four links x 300 s (`tools/permute.py`, link 1 `--current` from this draft,
 * links 2-4 from best.c), ~72,500 iterations, base score 70 on every link:
 * nothing beat 85.3%. Also byte-identical to this draft, all measured this
 * wave: `int k = i;` bound before the call (the W86-G composed-allocno probe);
 * splitting the index live range with `j = i * 32 + 3;`; a second
 * `p = &gUnknown_08499578;` at the end of one arm to raise p's ref count.
 * `u16 *q = *p;` after the merge is WORSE -- it pulls the deref up ahead of the
 * final `lsls #1`. The residual is now measured, not assumed: the ROM gives r1
 * to the INDEX and r0 to the pointer, and `p` would have to outrank `i` in
 * local-alloc's priority order. The next lever must change the two ALLOCNO
 * PRIORITIES, not the statement text. See work/sub_08004D90/W87-notes.md.
 *
 * The arithmetic staging is unchanged and still load-bearing: agbcc folds
 * `&g[(x + K) * 32 + 3]` down to `x * 64 + C` at TREE level, so the index must
 * be staged through an `int` local one step at a time (`i = b * 2`, then
 * `i += K`, then `i = i * 32 + 3`). Writing any two steps as one expression
 * refolds it. */
void sub_08004D90(int a, int b, u8 *c)
{
    u16 **p;
    int i;

    i = b * 2;
    if (a == 0)
    {
        p = &gUnknown_08499578;
        i += 5;
    }
    else
    {
        p = &gUnknown_08499578;
        i += 7;
    }

    i = i * 32 + 3;
    sub_0801F2AC(9, &(*p)[i]);
    sub_08004DD4(a, b, c, 2);
}
