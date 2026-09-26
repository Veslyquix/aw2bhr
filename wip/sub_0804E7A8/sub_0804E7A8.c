/* WAVE 87 (W87-D). Three negatives, none of which moved the byte count.
 *  - `u16 w2 = w;` (the W83 live-range-split lever) is BYTE-IDENTICAL both
 *    immediately after the call and after the `t == 0x1C` block: 91.2%,
 *    29/328, first difference +0x10, twice. W86-B's published precondition
 *    ("the original pseudo DIES at the copy") is met here and is NOT the
 *    real one. Read c_08040EF4.c lines 69-81: there BOTH halves of the split
 *    span a `bl` (y's half spans `bl Div`, new_var's spans `bl Div` and three
 *    `bl sub_0801C254`). Here w2's half never spans a call, so it wants a
 *    scratch register and the copy folds. The lever is CLOSED for this
 *    function -- satisfying it would require moving a call.
 *  - The prompt's twin `sub_080501DC` DOES NOT CALL sub_0804BDD8; it has no
 *    instance of this residual's construct. The real shape sibling is the
 *    MATCHED `sub_0804F8BC` (src/decomp/c_0804F8BC.c).
 *  - Transplanting F8BC's `*(u16 **)(c * sizeof(u16 *) + (u8 *)gUnknown_084C3F78)`
 *    for p1/p2 costs 4 bytes (89.9%): the raw pointer sum computes `c*4`
 *    BEFORE the pool load, the subscript FORCE_REGs the base first, and the
 *    base-first order is the ROM's. That region already matched -- do not
 *    transplant into a region the diff shows as identical.
 * NEXT: the biggest hunk is the tail's ARGUMENT EVALUATION ORDER (ROM does
 * both subtractions, then arg1's ldrsh, then both asrs; the draft does arg1
 * first), not the sl/r9 swap. Attack the order. See W87-notes.md.
 */
/* PARKED at 91.2% -- 328 of 328 bytes, SIZE EXACT, 29 differing bytes, first
 * at +0x10. Wave 79 (W79-A). READ THE DIFF, NOT THE SCORE: the older 94.2%
 * draft (kept beside this file as wave79-94pct-s16locals.c) has FEWER
 * differing bytes but MORE wrong, because the byte-identity percentage is
 * positional and this draft's one remaining difference starts at +0x10.
 *
 * WHAT WAVE 79 SOLVED. The residual recorded across waves up to 71 was that
 * the ROM emits `lsls rN,#16` beside EACH of the two tail subtractions and
 * defers BOTH `asrs` past the gUnknown_03001FBC load, splitting each s16
 * conversion around the first argument's setup. Nine spellings of the locals
 * were ruled out chasing it. The locals were the CAUSE. Passing the two
 * computed arguments INLINE to a callee prototyped with narrow parameters
 * (`void sub_080155C0(s16, s16, s16);`) makes expand_call compute each
 * argument in its DECLARED HImode -- that is the `lsl` -- and
 * load_register_parameters re-extend it into the promoted SImode argument
 * register only after EVERY argument has been evaluated -- that is the
 * deferred `asr`. The matched sibling src/decomp/c_0804FCA4.c writes the
 * identical call inline. The instruction stream is now the ROM's.
 *
 * WHAT IS LEFT, and it is one fact: the ROM puts the `&gUnknown_03001FBC`
 * address pseudo in sl and `w = sub_0804BDD8(...)` in r9; this candidate puts
 * the address in r9 and w in sl. Everything else in the diff -- `mov r3,sl`
 * vs `mov r3,r9`, `mov r0,r9` vs `mov r0,sl`, which register the two tail
 * `ldrh` scratches take, and where argument 1's setup sits relative to the two
 * subtractions -- follows from that swap.
 *
 * NOT A DIFFERENCE: the pool word relocates against `gUnknown_085D6C88 + 0xc`
 * where the ROM writes `gUnknown_085D6C94 + 0`. Same address. Chasing it costs
 * the whole budget and reloc_equivalent will bless it once the stream is clean.
 *
 * ================= RULED OUT IN WAVE 79, DO NOT RE-DERIVE =================
 *  - `int x, y;` with an explicit `(s16)` cast on the ASSIGNMENT is
 *    BYTE-IDENTICAL to `s16 x, y;`. The cast at the def folds into the use.
 *  - Against THIS inline draft, all worse: `row` as its own statement (89.6%);
 *    p1/p2 moved above sub_08056E9C, i.e. the matched sibling's own statement
 *    order (+4 B, 22.6%); `int w` (-4 B, 40.9%); p1/p2 moved down to just
 *    before `entry` (-8 B, 32.6%); `w = sub_0804BDD8(...)` moved down to just
 *    before its use (-4 B, 36.9%); `p1[0]`/`p2[0]` for `*p1`/`*p2`
 *    (byte-identical).
 *  - REGISTER PINNING, the lever that closed three of wave 79's five: it does
 *    not reach this one. `register u16 w asm("r9")` costs 4 bytes (40.9%) --
 *    pinning a sub-word local blocks its narrowing from folding -- and a
 *    pinned `register u16 *pfbc asm("sl")` bound to &gUnknown_03001FBC costs 4
 *    bytes (89.9%). The address is a CSE-created pseudo with no local to pin.
 *
 * ================= WAVE 85 (W85-D) ADDITIONS =================
 *  - `register int w asm("r9")` MEASURED: 324 bytes (-4), 39.6%. With an int
 *    target the re-narrow `lsls r0,#16; lsrs r0,#16` after bl sub_0804BDD8
 *    FOLDS AWAY -- it belongs to the u16 local's narrowing, not to the call
 *    site -- so BOTH pin spellings on w are now dead (u16 pin: wave 79's
 *    40.9%; int pin: 39.6%). w must stay a plain u16 local.
 *  - THE ARG-ORDER CLAIM ABOVE IS UNSUPPORTED. FCA4's MATCHED assembly
 *    evaluates the identical call's argument 1 (the fbc ldrsh) FIRST with
 *    IMMEDIATE asrs (ldrsh; subs/lsls/asrs; subs/lsls/asrs; bl), while this
 *    ROM evaluates it LAST with both asrs deferred
 *    (subs/lsls; subs/lsls; mov r3,sl; ldrsh; asrs; asrs; bl). FCA4 also has
 *    &fbc in sl -- so sl-placement and arg1-first coexist in the matched
 *    sibling, and "arg 1's position follows from the swap" is refuted. The arg
 *    order is an independent context decision (FCA4 re-reads entry->y fresh at
 *    the call; this ROM keeps entry->y live in r2 from the -= block).
 *  - ALLOCATION ORDER: FCA4's ROM allocates e-copy->r8, c-copy->sb, &fbc->sl;
 *    this ROM allocates c-copy->r8, w->sb, &fbc->sl. &fbc lands LAST among the
 *    high-register pseudos in BOTH ROMs, but the priority arithmetic
 *    (nrefs*live_length/(size*(copies+1)): &fbc ~= 99-132 vs w ~= 50) predicts
 *    &fbc SECOND -- which is exactly what every candidate does. Whatever ranks
 *    &fbc last in the ROM is not in those terms; the W56-F gcse-PRE
 *    pseudo-numbering mechanism (reaching_regs numbered after all
 *    expand-time pseudos) is the surviving theory. No source spelling tested
 *    in waves 79 or 85 moves it.
 *
 * NEXT ATTEMPT: still "change register PRESSURE across sub_0804BDD8", but see
 * the W85-D additions first -- the pressure levers tried are listed above and
 * none of them reaches the ranking. Do not rewrite from the exemplar -- the
 * exemplar's spelling is already what this draft uses.
 *
 * FOUR DECISIONS THAT ARE LOAD-BEARING AND MUST BE PRESERVED:
 *  - the sound table is a STRUCT array (`gUnknown_085D6C88[B].unk0c[j][i]`),
 *    not the flat `s16 [][6][2]` view its own pool word suggests; the flat
 *    view costs 136 bytes here (52.7%) and the whole match on sub_0804FCA4.
 *  - `entry` is an explicit BYTE-OFFSET SUM, not `&gUnknown_02029A10[c].
 *    entries[e]`. The subscript spelling computes `c * 180` first; the ROM
 *    computes `e * 36` first and adds the base last. sub_0804E8F0 needs the
 *    plain subscript for the SAME expression, because there the address is
 *    used once instead of CSEd across four member accesses.
 *  - `row = gUnknown_02028E5C[c]` is bound INSIDE the subscript that uses it.
 *  - the two computed arguments are INLINE (see above). */
#include "global.h"

void sub_0804E7A8(void)
{
    struct Unk02029A10 *entry;
    u16 *p1, *p2, *row;
    u16 c, e, t, w;

    c = gUnknown_03001470[gUnknown_03001FBC].unk30;
    e = gUnknown_03001470[gUnknown_03001FBC].unk34;
    t = sub_080156C4(gUnknown_03001FBC);
    sub_08056E9C(c, e);
    w = sub_0804BDD8(c, e, gUnknown_03001FBC);
    p1 = gUnknown_084C3F70[c];
    p2 = gUnknown_084C3F78[c];
    if (t == 0x1C)
    {
        sub_0803B48C(gUnknown_085D6C88[gUnknown_03004580[c][1]]
                                      .unk0c[gUnknown_03004580[c][2] - 1]
                                      [gUnknown_020296B0[c].unk1a & 1]);
        gUnknown_020296B0[c].unk1a++;
    }
    entry = (struct Unk02029A10 *)(e * sizeof(struct Unk02029A10)
                                   + c * sizeof(struct Unk02029A10Group)
                                   + (u8 *)gUnknown_02029A10);
    entry->x += gUnknown_08553B28[c][w];
    entry->y -= gUnknown_085644D4[(row = gUnknown_02028E5C[c])[1]];
    sub_080155C0(gUnknown_03001FBC, entry->x - *p1, entry->y - *p2);
}