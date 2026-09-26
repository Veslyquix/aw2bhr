/* WAVE 89 (W89-H) -- READ THIS BEFORE THE BLOCKS BELOW. TWO OF THEIR CLAIMS
 * ARE NOW MEASURED RATHER THAN ARGUED, AND THE THIRD IS WRONG.
 * Draft, score and size UNCHANGED (128/128, 50.8%, first difference +0xc,
 * `configured`, re-measured by me). Two compile_probe calls, ZERO try_match.
 * Full record: work/sub_08035170/W89-notes.md, section `## W89-H`.
 *
 * 1. SIZE DELTA IS NOT 0 -- read the diff, not the header. The candidate is
 *    missing `adds r5,r1,#0` (2 B) and emits a two-instruction tail where the
 *    ROM has three (2 B), and gets all four bytes back as `.short 0x0000`
 *    padding. `size: match` here is the wave-77 sub_08045FC8 costume: the code
 *    is -4 BYTES.
 *
 * 2. WHICH PASS OWNS `base + 0x2f`: **gcse**, and it is now MEASURED.
 *    `--profile o1` sets flag_gcse = 0 and flag_cse_follow_jumps = 0 while
 *    KEEPING -fforce-addr, so it moves the optimisation level and nothing else.
 *    The unmodified draft under `o1` builds the post-call address INDEPENDENTLY
 *    (`ldr r0,.L19+0x4`, a separate `.word gUnknown_03003FC0+0x2f`); under -O2
 *    it reuses the guard's pseudo. cse runs at -O1 and did NOT unify them, so
 *    the unifier is an -O2-only pass, and the only one that crosses a join is
 *    gcse. The join is visible in the assembly, as the W89-D screening rule
 *    asks: +0x68 has TWO predecessors (the `bne` target and the fall-through
 *    from `cmp r1,#3 / beq`), and a multi-referenced label ends a cse block.
 *
 * 3. THE FIFTH SPLITTER (W89-D) CANNOT BE SPELLED HERE, and the bound is
 *    STRUCTURAL rather than a fact about this function. A fold-proof mask needs
 *    an operand whose value range lets combine prove the mask redundant. This
 *    address is `symbol_from_memory + 0x2f` and neither operand qualifies: the
 *    base is a full-width pointer (nonzero_bits all ones -- a mask on it is
 *    real code, not a splitter), and the offset is a constant (every mask over
 *    it is discharged by fold before cse numbers anything). MEASURED, not
 *    assumed: probe V_FOLD carried the offset in a `u8 off = 0x2f;` local and
 *    read `*((vu8 *)&gUnknown_03003FC0 + ((((u32)off << 24) & 0xff000000)
 *    >> 24))` -- BYTE-IDENTICAL to the plain draft, the same output as all
 *    twenty-two earlier spellings.
 *      THE TRANSFERABLE RULE: the fifth splitter's reachable set is address
 *    computations with a NARROW VARIABLE operand (`sym + idx*K` off a sub-word
 *    load -- that is sub_08061DCC, where it worked). `sym + constant_offset`
 *    has none. Check for a variable operand before pre-registering it.
 *
 * 4. THE FINDING THAT MATTERS, AND IT INVERTS THIS FILE'S FRAMING SINCE WAVE 57:
 *    **THE RESIDUAL IS NOT THE ADDRESS CSE.** Probe V_KILL made the member
 *    offset a `volatile u8` local, so no pass can precompute the post-call
 *    address -- the CSE is definitively dead. The ROM's shape did NOT appear.
 *    gcc parks the BASE in the callee-saved register
 *    (`ldr r1,.L15 / ldr r5,[r1]` then `add r0,r0,r5` after the call) and still
 *    never reloads the force-addr word. The ROM parks `&.LC`, the POOL WORD'S
 *    ADDRESS, and reloads the base through it. Splitting the address CSE does
 *    not change which value wins the register, so the "22 spellings failed to
 *    split the address" history was measuring the wrong fact. (W89-C cites
 *    W43-H for "the register is downstream of the CSE"; here it is NOT. That is
 *    why the diagnostic is worth running -- it comes out both ways.)
 *
 * CLASSIFICATION, CHANGED AND NOW FINAL. Not "bare gcse-owned address CSE".
 * The value the ROM holds in its callee-saved register is the address of a
 * COMPILER-GENERATED `.rodata` force-addr word, and no C expression denotes it.
 * W86-G hit the same wall ("binding `&.LC` needs a `T **` local and .LC cannot
 * be named") but blamed the address CSE. To make gcc prefer `&.LC` to the base,
 * the base's memory read must be unforwardable across the call, and the only
 * object that could be qualified to force that is `.LC` itself -- which has no
 * name, because -fforce-addr invents it after the front end is gone.
 * Unreachable from the C text, for a reason about NAMING rather than about CSE.
 * Do not pre-register another splitter for this function. -- W89-H */

/* WAVE 89 (W89-C) -- THE WAVE-88 `static inline` HELPER IS REFUTED HERE, AND
 * THE REFUTATION ANSWERS THE WAVE-89 QUESTION FOR THE WHOLE POOL:
 * **A `static inline` HELPER DOES NOT REACH A GCSE-OWNED PSEUDO.**
 * 0 try_match spent on an experiment; one compile_probe, four variants.
 * Full measurements in work/sub_08035170/W89-notes.md.
 *
 * The wave-88 chapter "THE `static inline` HELPER RE-CUTS AT A CALL BOUNDARY"
 * (docs/agbcc-codegen.md) closed sub_0802FACC's identically-worded residual
 * after six other levers failed, so it was pre-registered for this function.
 * Four spellings, all four in one compile_probe:
 *
 *   P1  static __inline__ u8 rd2f(void) { return gUnknown_03003FC0.unk2f; }
 *       called at BOTH unk2f sites, every other reference left bare
 *   P4  the same helper at the POST-CALL site ONLY
 *   P2  helpers (rd2c/rd2d/rd2f) at EVERY reference
 *   P3  static __inline__ struct Unk03003FC0 *adr(void)
 *         { return &gUnknown_03003FC0; }  at every reference
 *
 * P1 and P4 KEEP the two-level force-addr word (.LC -> gUnknown_03003FC0) and
 * still emit, byte for byte, what every one of the previous eighteen
 * spellings emitted:
 *       add r5,r2,#0 ; add r5,r5,#0x2f     (before the bl)
 *       ldrb r4,[r5]                       (after it)
 * The helper gives the loaded BYTE its own pseudo. It does not give the
 * ADDRESS one. Nothing moved.
 *
 * P2 and P3 are a WRONG MECHANISM outright, and this is new: they COLLAPSE the
 * force-addr word. The literal pool holds `.word gUnknown_03003FC0` directly,
 * with no .LC indirection at all -- the same failure W86-G recorded for its V2
 * `p->everywhere` variant, now shown to be caused by the absence of any BARE
 * symbol reference rather than by the pointer bind.
 *
 * WHY THE LEVER CANNOT REACH THIS RESIDUAL (the general rule; a chapter has
 * been appended to docs/agbcc-codegen.md).  W88-C's positive on sub_0802FACC
 * replaced a SOURCE-LEVEL LOCAL BIND -- a pointer object read from RAM once
 * and held in a pseudo across a call -- with a re-read at each use. A `bl`
 * kills memory, so gcse cannot forward the re-read, and the bind disappeared.
 * Here there is no source bind to remove: both occurrences are ALREADY written
 * independently as `gUnknown_03003FC0.unk2f`, and what gcse unifies is not a
 * memory value but an ADDRESS-ARITHMETIC pseudo, `base + 0x2f`, which is a
 * register value that no call invalidates. The helper has no bind to delete
 * and no memory read to make unforwardable.
 *
 *   THE BOUND, stated so no later wave re-spends it: the helper acts on values
 *   that reach the use THROUGH MEMORY. It is inert against anything gcse owns
 *   as a register expression. cse's EBB table is split by a join; volatile
 *   splits value CSE; a statement boundary splits cse; the inline helper
 *   splits a memory bind. NONE of the four touch gcse's unification of two
 *   identical register-level address computations. That is this residual, and
 *   after twenty-two spellings across waves 45/51/57/59/79/86/89 it should be
 *   read as unreachable from the C text rather than as an untried spelling.
 *
 * Classification unchanged: bare gcse-owned address CSE (the wave-77
 * does-not-convert class). Draft, score and size unchanged. -- W89-C */

/* WAVE 86 (W86-G) -- THE INLINE SIBLINGS OF THE RULED-OUT STATEMENT SPLIT ARE
 * NOW RULED OUT TOO, AND THE MECHANISM HAS A NAME: gcse, NOT cse.
 * Held at 128/128 SIZE-EXACT, configured profile; no try_match spent, draft
 * unchanged. Full measurements in work/sub_08035170/W86-notes.md.
 *
 * Three inline variants in one compile_probe, none of which the park had:
 *  V1 `struct Unk03003FC0 *p = &gUnknown_03003FC0;` at the TOP, used for the
 *     entry unk2c read and the case 1/2 pre-call reads, with the PLAIN global
 *     in case 0 and for the post-call assignment -- keeps the two-level
 *     force-addr word, reproduces the case 0 reload, and STILL ends with
 *     `ldrb r4,[r5]` off the pre-call `base + 0x2f` pseudo.
 *  V2 `p->` for EVERY reference -- COLLAPSES the pool word to one level
 *     (`.word gUnknown_03003FC0`, no .LC indirection). Wrong mechanism.
 *  V3 post-call read through a FRESH pointer local bound AFTER the call --
 *     byte-identical tail to V1.
 * That is eighteen spellings across waves 45/51/57/59/86.
 *
 * WHY NO SPELLING REACHES IT. The ROM re-derives in exactly the two blocks
 * that are control-flow JOINS -- `case 0` (the `beq` plus the `default`
 * fall-through) and the `bl sub_08035080` block (the `bne` plus the
 * `unk2d != 3` fall-through) -- because a join starts a new extended basic
 * block and empties cse's table. The candidate reproduces the first and not
 * the second, and cse is NOT the reason: at the second join `base + 0x2f` is
 * not an expression being looked up, it is a live PSEUDO the RTL already
 * names, unified across the join and the call by GCSE, which is global and
 * which no EBB boundary constrains.
 *   THE GENERAL FACT: `volatile` splits value CSE and a statement boundary
 * splits cse's table; NEITHER touches gcse. An address unified by gcse is
 * unreachable from the C text unless the two occurrences have genuinely
 * different base pseudos, which here needs the base re-loaded after the call
 * -- and gcc never re-loads it because it still holds the finished address.
 * The residual is circular by construction.
 *
 * The ROM's `adds r5,r1,#0` at +0xc sits in the ENTRY block, which dominates
 * everything, so whatever creates it is at the top of the function. V1 shows a
 * `T *` local at the top becomes the BASE, not `&.LC`; binding `&.LC` needs a
 * `T **` local and .LC cannot be named (W43-A measured 0x08090E3C: a real
 * `T *` declaration emits a THIRD load). best.c's 85.2% shape reaches the
 * ROM's allocation only by reading a pointer bound in a block that does not
 * DOMINATE the use -- indefensible, never promote it, but it says the lever is
 * a dominance fact rather than a spelling. Classify as bare
 * allocation / gcse; do not spend another wave on spellings. -- W86-G */

#include "global.h"

/* WAVE 79 (W79-C) -- RESIDUAL RECLASSIFIED AS A CSE BASE CHOICE. READ THIS
 * FIRST; THE BLOCK BELOW IS WAVES 45/51/57/59 AND ITS "NEXT LEVER" IS
 * WITHDRAWN.
 *
 * Re-measured unchanged: 128/128 SIZE-EXACT, 50.8%, first difference at +0xc.
 * (The 85.2% trymatch prints is best.c's. best.c reads an UNINITIALISED
 * pointer on the case 1/2 path and must never be promoted.)
 *
 * THE WHOLE 63-BYTE DIFF IS ONE DECISION: the candidate has ONE pseudo for
 * `&gUnknown_03003FC0.unk2f` used on both sides of the sub_08035080 call; the
 * ROM has TWO. Everything else follows -- because the ROM re-derives the
 * address after the call it needs the .LC word's address to survive that call,
 * so the address takes a callee-saved register and pays `adds r5,r1,#0` at
 * +0xc, which is the first differing instruction.
 *
 * WHY NO SPELLING REACHES IT: the post-call block is DOMINATED by the pre-call
 * read, and both name the same member at the same offset, so the two address
 * computations are unconditionally equivalent and CSE is entitled to unify
 * them. There is no C text that distinguishes them.
 *
 * WAVE 79 RULED OUT, six more spellings, every one still parking `base + 0x2f`
 * in callee-saved r5 and reading post-call with a bare `ldrb r4,[r5]`:
 *   1. all four reads plain/non-volatile   (the -4, 124-byte wave-57 shape)
 *   2. volatile on the GUARD read only     (this draft)
 *   3. volatile on the POST-CALL read only (`ldrb r0,[r5]; adds r4,r0,#0`, +2)
 *   4. the case 1/2 arm restructured from one && chain into four early-exit
 *      `if (...) break;` statements -- changes the CFG, changes zero bytes
 *   5. the guard's unk2f read bound to a `u8 w` local in the case block
 *   6. ((volatile struct Unk03003FC0 *)&gUnknown_03003FC0)->unk2f post-call
 *
 * DO NOT re-derive the pointer-global reading of the pool word. The wave-43
 * W43-A chapter of docs/agbcc-codegen.md measured 0x08090E3C specifically:
 * gUnknown_08090E3C -> 0x03003FC0 checked against baserom.gba, the force-addr
 * reading is right, a real `T *` declaration emits a THIRD load, and the ROM
 * re-reading the word after every call is normal .LC behaviour rather than
 * evidence of a mutable pointer variable. The candidate's own `.rodata` word
 * is the same mechanism; the relocation difference is not the residual.
 *
 * Fifteen spellings across waves 45/51/57/59/79 have failed. -- W79-C
 */

/* PARKED -- wave 45, wave 51 (W51-B), re-measured wave 57 (W57-E) and again in
 * wave 59 (W59-B): still exactly 128/128 and 50.8%, first difference at +0xc.
 * SIZE IS EXACT; the previous plain draft was 124 (-4). The score is positional,
 * not a shape problem: the dispatch tree, both sub_080129F8 calls, the pool
 * split and both `case 1/2` guards are byte-exact.
 *
 * WAVE 59 NOTE: its callee sub_08035080 was MATCHED this wave and its contract
 * is unchanged (`u8 sub_08035080(void)`), so nothing here needs revisiting on
 * that account. The wave-59 loop-rotation lever that closed sub_08035080 does
 * NOT apply here -- this function contains no loop, and the residual is a CSE
 * across a call rather than a hoist.
 *
 * WAVE 57 -- RESIDUAL CLASSIFIED: register allocation. One callee-saved
 * register holds a different thing than the ROM's, and everything else follows.
 *
 *   ROM     keeps &.LC (the .rodata force-addr word's ADDRESS) in r5 across the
 *           sub_08035080 call, and re-derives the whole access afterwards:
 *           ldr r0,[r5] ; adds r0,#0x2f ; ldrb r4,[r0]
 *   draft   keeps the finished address `base + 0x2f` in r5 and reloads only the
 *           value: ldrb r0,[r5] ; adds r4,r0,#0
 *
 * Pick the active pane index. The signed `blt` in the dispatch tree fixes the
 * switch operand as int rather than u8; `default:` sits ahead of `case 0:` and
 * falls into it. That much has been settled since wave 45.
 *
 * WHAT THE `vu8` CASTS BUY, and what they do not. Making the member's reads
 * volatile at the use site splits the LOAD -- gcc emits a fresh `ldrb` after
 * the call instead of reusing the value, and that is what took the function
 * from 124 to the exact 128 -- but it does NOT split the ADDRESS: `base + 0x2f`
 * is still computed once, before the call, and parked in a callee-saved
 * register. **`volatile` splits value CSE, not address CSE.** So the volatile
 * casts are a size fix and probably not the original text; treat them as
 * scaffolding, not as evidence that unk2f is volatile. Nothing in the tree
 * decides that either way.
 *
 * WAVE 57 -- THE PLAIN (NON-VOLATILE) READ IS RE-CONFIRMED BY compile_probe,
 * and it fails for a reason worth writing down. Spelling both reads as plain
 * `gUnknown_03003FC0.unk2f` still emits `add r5,r2,#0 ; add r5,r5,#0x2f` before
 * the call and a bare `ldrb r4,[r5]` after it -- i.e. the ADDRESS pseudo
 * survives the call in both spellings, and only the VALUE differs. A plausible
 * theory going in was that the -fforce-addr word is ordinary (not
 * constant-pool) memory, so a `bl` invalidates it and forces the base to be
 * reloaded; that is true of the ROM but it does not help, because gcc never
 * needs the base again once `base + 0x2f` is live in a register. The reload
 * only appears if the ADDRESS expression is unavailable too.
 *
 * The knock-on of the ROM's re-materialisation is the other 2 bytes: because
 * the tail re-reads the force-addr word, `&.LC` is live across the call and
 * gets a callee-saved register of its own (`adds r5, r1, #0` right after the
 * entry load, which is the FIRST differing instruction at +0xc), which this
 * candidate has no reason to emit.
 *
 * RULED OUT, do not re-run:
 *  - decomp-permuter, 300 s, 19,333 iterations from the 85.2% best.c: no byte
 *    match, ceiling 83.6%. Both permuter candidates scored IDENTICALLY spliced
 *    and raw, which proves there is NO header drift behind this one -- it is
 *    not the sub_080319AC failure mode.
 *  - `(u16)`/no-op width casts as a way to break the CSE (measured on
 *    sub_080363F8 the same wave: folded away in the front end, zero effect).
 *  - plain non-volatile reads at both sites (wave 57, above): 124 bytes, and
 *    the address is cached exactly as it is here.
 *
 * best.c holds an 85.2% permuter shape that binds `struct Unk03003FC0 *new_var
 * = &gUnknown_03003FC0;` inside `case 0:` and then reads `(*new_var).unk2d` /
 * `(*new_var).unk2f` from `case 1/2:` -- i.e. it USES THE POINTER
 * UNINITIALISED on that path. It is bytewise informative and semantically
 * indefensible; do not promote it as-is, but the fact that binding the struct
 * address to a local moves the score that far up is the strongest lead here.
 *
 * NEXT LEVER: WITHDRAWN by W89-C above -- there is no next lever at the
 * statement level; see the bound recorded at the top of this file. */
u8 sub_08035170(void)
{
    int v;

    v = gUnknown_03003FC0.unk2c;

    switch (v)
    {
    default:
        v = 0;
    case 0:
        if (gUnknown_03003FC0.unk2d == 1)
        {
            if (sub_080129F8(gUnknown_03004490[2]))
                v = 1;
            else if (sub_080129F8(gUnknown_03004490[1]))
                v = 2;
        }
        break;

    case 1:
    case 2:
        if (gUnknown_03003FC0.unk2d != 2
            && (v != *(vu8 *)&gUnknown_03003FC0.unk2f || gUnknown_03003FC0.unk2d != 3)
            && sub_08035080())
            v = *(vu8 *)&gUnknown_03003FC0.unk2f;
        break;
    }

    return v;
}
