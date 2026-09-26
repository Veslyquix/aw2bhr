# sub_08056638 — 144 bytes, 95.8%, size-exact, NOT matched

Wave 58, W58-D. Re-read against the wave-52 park. **Nothing in the wave-52 note
below is wrong and none of it needs re-measuring.** What this wave adds is the
classification and the reason it is not worth another attempt.

## The residual is THREE instructions, and it is an LICM-hoist inversion

Instruction counts are identical. Diffing `target.s` against the draft's own
`sub_08056638.s`, all six differing bytes are these three plus the pool order:

| | ROM | candidate |
|---|---|---|
| loop head, 1st base | `mov r3, sb` | `ldr r3, .L21+4` |
| loop head, 2nd base | `mov r0, sb` | `ldr r0, .L21+4` |
| swap block base | `ldr r2, =gUnknown_0202980A` | `mov r2, r9` |

Both compilations hoist ONE of the two row symbols to a callee-saved hi register
for the whole function and rematerialise the other from the literal pool at its
uses. The ROM hoists `gUnknown_02029822` (the sort key, read every iteration in
the loop head) and rematerialises `gUnknown_0202980A`; the candidate does the
exact opposite. The pool words come out swapped because the hoisted one's `ldr`
is emitted first — that is a symptom of the same fact, not a second fact.

**This is the W58-B "HOLD/REMATERIALISE inversion" residual** (see
`docs/agbcc-codegen.md`), and specifically it is an LICM decision: which
invariant `reg = symbol_ref` is moved to the preheader. W58-A's chapter "LICM
hoists a non-const global load out of a loop that CONTAINS CALLS" puts that in
the unreachable family — instruction ORDER across a loop boundary, reachable by
neither a declaration nor the permuter.

## Ruled out THIS wave, in addition to wave 52's list

- **The member/struct spelling is settled and is NOT the lever.** Both rows are
  0x6c-stride rows of `gUnknown_02029808` through their own linker symbols, and
  `include/unknown-globals.h` (W48-G, W49-M) records the discriminator directly:
  the member form emits `=gUnknown_02029808` plus `adds rB, #0x1a`, an extra
  instruction this function does not have. The flat form both rows already use
  is the right one. Do not spend a probe re-deriving this.
- **The wave-39 LICM blocker does not apply.** The only documented way to stop
  LICM hoisting an invariant is a SECOND assignment to the pseudo
  (`n_times_set == 2`). Here the pseudo being hoisted is the bare `symbol_ref`
  itself, which is single-set by construction — no C spelling gives one symbol
  two different values inside the loop without changing the address arithmetic
  the ROM already matches.

## Do not run the permuter

Wave 52 ran four sessions, ~85k iterations, three starting points. It moves
registers; it cannot move an insn across the loop boundary.

## Wave 81 (W81-B)
Deferring the gUnknown_02029822[side][j] = b; store past both payload writes (semantically free -- different arrays) so the payload base pseudos are created first: 85.4% / 21 bytes, first difference +0x26. The write order inside the swap block is also load-bearing. Park stands as classified.## W90-A (wave 90) -- still 95.8%, 6 bytes; the residual is now a NUMBER

Draft unchanged (`w90-start.c` == draft, re-verified by the permuter's
baseline each run).

**Mechanism, read straight off an RTL dump (`agbcc ... -dg`; recipe in
`work/sub_0807E980/NOTES.md`).** The `.greg` dump prints every allocno's
`refs` and `live_length`; global.c sorts by
`floor_log2(refs) * refs / live_length`. For the draft:

| pseudo | what | refs | live | priority | gets |
|---|---|---|---|---|---|
| 36 | side*0x6c | 7 | 42 | 0.333 | r8 |
| 109 | &gUnknown_0202980A | 8 | 80 | 0.300 | sb |
| 169 | i+1 | 4 | 35 | 0.229 | sl |
| 31 | &gUnknown_02029822 | 7 | 88 | 0.159 | nothing -> rematerialised from the pool |

REFS ARE LOOP-DEPTH WEIGHTED, AND A `do { } while (0)` COUNTS AS A LOOP LEVEL
in flow (its NOTE_INSN_LOOP_BEG survives to flow here): 109's 8 is
1 (set) + 3 (use at depth 3) + 4 (use inside the swap do/while). THAT is why the
do/while(0) is load-bearing -- it is worth exactly one ref, and one ref crosses
the floor_log2 step at 8. The ROM therefore needs refs(22) in {8, 9} and
refs(0A) <= 7 with every other allocno's order unchanged.

**Exhaustive search of the obvious lever (1,024 variants):** every combination
of wrapping / not wrapping each of the ten inner-loop statements in its own
do/while(0) was compiled with `-dg` (scratch `e638/combo`), and the same space
was run through the permuter as a pure PERM_GENERAL enumeration
(`w90-dowhile.perm.txt`, 1,024 iterations, best = the draft, 95.8%).
320 combinations DO put gUnknown_02029822 in sb and rematerialise
gUnknown_0202980A exactly as the ROM does -- and in every one of them
side*0x6c (36) goes to ip instead of r8, because the only statements that
reference 22's pseudo also reference 36, so any depth bump that lifts 22 to 8
refs lifts 36 to 8 or more, moving it up to or past the j+1 copy (170, 6/21 =
0.571), which then no longer takes ip first (one-wrap variant, `a = ...` wrapped
and the swap do/while removed: 36 is 8/42 = 0.571 exactly and wins the tie on
the lower allocno number). So the next lever has to raise 22's refs WITHOUT
touching side*0x6c's -- or raise the j+1 copy's (170) with it. Not a
statement-wrap question any more.

Permuter, fixed scorer: perm-w90-1 undirected 900 s (11,720 it) and
perm-w90-2 directed 900 s (10,674 it; `w90-directed.perm.txt`: LINESWAP of the
locals, RANDOMIZE of the body, five PERM_GENERAL swap-block shapes) -- nothing
better than the base (720).
