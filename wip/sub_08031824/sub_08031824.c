#include "global.h"

/* WAVE 88 (W88-B). Status `asm`, never parked; the draft was the only record.
 * Baseline (w88-start.c) scored 68.8%, size +4 (296 vs 292), under `configured`.
 *
 * FOUR residuals were diagnosed from the baseline diff and THREE are now fixed:
 *
 * 1. WRONG SYMBOL in the 5-byte copy loop (this was the whole size delta).
 *    The baseline read `gUnknown_020280C0[j].filler_14[n]`, which makes agbcc
 *    emit a pool word with addend 0x18 plus a runtime `subs r1,#4`. The ROM has
 *    a CLEAN `.4byte gUnknown_020280D4` and no subtract. gUnknown_020280D4 is
 *    already declared flat in include/unknown-globals.h and is the same 28-byte
 *    stride table sub_0803BFBC (promoted, src/decomp/c_0803BFBC.c) reads.
 *    Naming it directly removes the extra instruction AND fixes the pool word.
 *
 * 2. ADDRESS-ADD OPERAND ORDER. `(u8 *)p + j * 0x1c` emits `adds r1,r6,r2`
 *    (INDEX first) because fold canonicalises PLUS(ptr, MULT) to PLUS(MULT, ptr).
 *    The ROM has `adds r1,r2,r6` (POINTER first). Binding the index to a plain
 *    local first -- `off = j * 0x1c; ((u8 *)p + off)[0x33]` -- removes the
 *    MULT_EXPR from the PLUS and the canonicalisation does not fire. This fixed
 *    BOTH p-relative sites. See the new chapter in docs/agbcc-codegen.md.
 *
 * 3. TAIL EVALUATION ORDER. The ROM computes `q = p + off` first, then loads
 *    the C0 member, THEN derives `q + 0x39`. Binding q and binding the loaded
 *    value (`v = c[j].filler_14[5]; q[0x39] = v;`) reproduces it exactly.
 *    gUnknown_020280C0's address is bound to `c` after `j = 0` so it lands in
 *    sl as a plain pool word; without that bind agbcc builds a .rodata
 *    force-addr word and double-loads it (measured, wave 88).
 *
 * WAVE 88 (W88-C) -- THE PREHEADER TENSION IS RESOLVED. The fourth residual was
 * the loop-2 preheader group: ROM `[i=0][p+5][p+0x22][p+0x34][p+2]`, candidate
 * `[i=0][p+0x22][p+0x34][p+5][p+2]`. W88-B measured a real two-requirements-
 * one-slot tension -- only the COMPONENT_REF spelling `p->unk05[i]` keeps the
 * ROM's dead `ldrb r1,[r2]` volatile load, but only a POINTER bind holds the
 * bind's source position, and a dead pointer bind is deleted (W80-B refuted
 * here, consistent with W80-F). Four spellings were measured and all four lost
 * one requirement or the other.
 *
 * BOTH requirements are satisfiable at once by WRAPPING THE VOLATILE ARRAY IN A
 * ONE-MEMBER STRUCT and binding a pointer to it:
 *      struct Unk5Cell { volatile u8 unk00[0x18]; };
 *      b5 = (struct Unk5Cell *)((void *)p->unk05);   <- live bind, source order
 *      ...  b5->unk00[i] = ...                       <- still a COMPONENT_REF
 * The access stays a COMPONENT_REF (so gcc 2.9 sets TREE_SIDE_EFFECTS on the
 * volatile FIELD and emits the dead destination load), while the base is a
 * genuine live pointer bind that holds its source position. Wrapping the ARRAY
 * inside the struct also avoids the padding that killed W88-B's cell-struct
 * attempt (`struct { volatile u8 v; } *` pads to 4 and strides by 4): the
 * member is the array, so sizeof is 0x18 and the stride is 1.
 * Measured: preheader becomes [i=0][p+5][p+0x22][p+0x34][p+2] -- byte-exact.
 *
 * A SECOND fact fell out of that probe and is the TWO-LOCALS RULE. With only
 * `b5`, loop 3 indexes r6 directly and the ROM's `adds r4,r6,#0` disappears
 * (candidate 2 bytes short). The ROM copies p+5 into a second pseudo before
 * loop 3, i.e. there are TWO source locals: the early bind `b5` and a second
 * pointer `d5 = b5;` written immediately before the loop. The copy survives
 * because both pseudos span more than one basic block, so they leave
 * local_alloc entirely (wave 57) and never coalesce. Writing
 * `i = 0; d5 = b5; for (; i < 0x18; i++) d5->unk00[i] = ...` reproduces the
 * ROM's loop-3 preheader `[i=0][adds r4,r6,#0][ldr r5,=src]` exactly.
 *
 * ---------------------------------------------------------------------------
 * WAVE 89 (W89-B). 93.2% (20 differ) -> 97.3% (8 differ), size-exact throughout.
 * THREE facts fixed. All three had been written off in the W88 notes as "bare
 * register picks / no source construct known to reach it"; all three had one.
 *
 * A. THE ELSE-ARM CONSTANT ORDER -- the else loop is ASCENDING in the source
 *    and gcc REVERSES it. W88 left the arm emitting `[i=0x10][j+1][0]` where
 *    the ROM has `[j+1][0][i=0x10]`. The two W88 measurements pin the mechanism:
 *
 *      draft   source [i=0x10]        -> emitted [i=0x10] [j+1] [0]
 *      W88-C   source [z=0][i=0x10]   -> emitted [0][i=0x10] [j+1]
 *
 *    In BOTH, `adds r4,r7,#1` lands exactly at the boundary between the SOURCE
 *    BINDS and the LICM HOISTS (the wave-87 preheader rule). The ROM puts
 *    `adds r4,r7,#1` FIRST, so in the ROM there are ZERO source binds in that
 *    group -- neither `movs r1,#0` nor `movs r3,#16` was written by the
 *    programmer. `movs r1,#0` is the LICM hoist of the invariant store value,
 *    and `movs r3,#16` is check_dbra_loop's REWRITTEN counter init, emitted at
 *    loop_start (after the hoists) because check_dbra_loop DELETES the source's
 *    own init. So the source is the same shape as the if arm:
 *        for (i = 0; i < 0x11; i++) slot_base[off + i] = 0;
 *    gcc reverses it -- the biv's only other use is the store-address giv,
 *    which reverses with it -- giving the ROM's descending pointer walk and its
 *    `subs r3,#1 / cmp r3,#0 / bge` bottom. Authoring the descending loop by
 *    hand produces the SAME loop body but keeps the init in the source-bind
 *    slot, which was the entire residual. The IF arm is NOT reversed (its biv
 *    feeds TWO givs, buf[i] and slot_base[off+i]), which is why the two arms
 *    legitimately order these differently -- the asymmetry is real, not an
 *    artefact of a hoisted increment.  93.2% -> 95.2%.
 *
 * B. THE TAIL'S TWO LOADED VALUES ARE TWO SOURCE LOCALS. The ROM puts them in
 *    DIFFERENT registers in ONE basic block (`ldrb r2,[r0,#25]` then
 *    `ldrb r0,[r0,#26]`, the second re-using the now-dead address register).
 *    Reusing one `v` gives one pseudo and therefore one register for both.
 *    Read W80-F's "same register, different block = ONE variable" backwards:
 *    different registers in the SAME block = TWO variables. Declaring `v2` for
 *    the second load makes the ROM's second ldrb/strb pair byte-exact.
 *    95.2% -> 95.9%.
 *
 * C. `v = (v2 = sub_0803CD14(k));` -- a PERMUTER find (first run, iteration
 *    ~15k, from the 95.9% draft; a second 15k-iteration chain run from the
 *    97.3% result found nothing better, so 97.3% is a real ceiling for this
 *    base). Assigning the call's result to BOTH locals extends v2's live range
 *    back to the call instead of starting it at the tail, which re-ranks the
 *    tied allocnos and fixes the FIRST TAIL STORE's value/address temp pair
 *    (ROM r2/r3, candidate had r3/r2) -- i.e. it finished fix B, from the far
 *    end of the loop body. This is the wave-83 live-range-split lever pointing
 *    the other way: not a narrow copy that SPLITS a range, but a shared
 *    assignment that JOINS two, and it reached an allocno pair ~40 instructions
 *    away from the edit. NOT TIDIED -- do not fold it back into `v = f(k);`.
 *    95.9% -> 97.3%.
 *
 * REMAINING RESIDUAL -- 8 bytes, three bare local_alloc scratch picks. No
 * instruction is out of order, missing or extra anywhere in the function, and
 * the whole tail is now byte-exact:
 *   - loop 1: ROM `mov r1,r8 / adds r2,r1,r3`, candidate `mov r0,r8 / adds r2,r0,r3`
 *   - the gUnknown_020280C0 pool load lands in r0 where the ROM uses r1
 *   - the 5-byte copy setup uses r1 for both `ldr` destinations where the ROM
 *     uses r3 (`ldr r3,[pc,#68]` and `ldr r3,[sp,#52]`).
 * In all three the ROM declines r0/r1 for a dead scratch where local_alloc
 * takes it. 30k permuter iterations across two chained runs (the second from
 * the 97.3% base) did not move any of them; 97.3% is a real ceiling for this
 * base, so any further attempt needs a different source construct, not a
 * longer search.
 *
 * Toolchain axis not re-swept: W81-E ran all 155 open drafts x 7 profiles with
 * zero exit-0 flips. */

#include "global.h"

extern u8 gUnknown_02028040[];
extern u8 gUnknown_02028042[];
extern u8 gUnknown_0202805A[];

struct Unk5Cell { volatile u8 unk00[0x18]; };

void sub_08031824(void)
{
    struct Unk02025764 *p;
    struct Unk020280C0 *c;
    struct Unk5Cell *b5;
    struct Unk5Cell *d5;
    int i;
    int j;
    int off;
    int off2;
    u8 k;
    u8 v;
    u8 v2;
    u8 buf[0x34];
    u8 *slot_base;
    u8 * volatile copy_base;

    p = &gUnknown_02025764;

    for (i = 0; i < 2; i++)
        p->unk00[i] = gUnknown_02028040[i];

    i = 0;
    b5 = (struct Unk5Cell *)((void *)p->unk05);
    slot_base = &p->unk22[0][0];
    copy_base = slot_base + 0x12;

    for (; i < 3; i++)
        p->unk02[i] = gUnknown_0202805A[i];

    i = 0;
    d5 = b5;

    for (; i < 0x18; i++)
        d5->unk00[i] = gUnknown_02028042[i];

    j = 0;
    c = gUnknown_020280C0;

    for (; j < 3; j++)
    {
        u8 *src;
        u8 *dst;
        u8 *q;

        k = j;

        v = (v2 = sub_0803CD14(k));
        off = j * 0x1c;
        ((u8 *)p + off)[0x33] = v;

        if (sub_0803CCB8(k, buf) == 1)
        {
            for (i = 0; i < 0x11; i++)
                slot_base[off + i] = buf[i];
        }
        else
        {
            for (i = 0; i < 0x11; i++)
                slot_base[off + i] = 0;
        }

        src = (u8 *)(j * 0x1c + (int)gUnknown_020280D4);
        dst = (u8 *)(j * 0x1c + (int)copy_base);
        i = 4;
        do
        {
            *dst++ = *src++;
        } while (--i >= 0);

        off2 = j * 0x1c;
        q = (u8 *)p + off2;
        v = c[j].filler_14[5];
        q[0x39] = v;
        v2 = c[j].filler_14[6];
        q[0x3a] = v2;
    }
}
