# sub_08012B70

0x08012B70, 88 bytes, THUMB, parked.

Best score so far: 87.5% (best.c).

## Files

- `sub_08012B70.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

87.5% -- 11 of 88 bytes differ, size EXACT (wave 39, W39-A; RE-MEASURED and unchanged in wave 73 by W73-B and again by W73-G)

### What still differs

The 43-instruction stream is 1:1 with the ROM: same opcodes, same order, same immediates, same branch structure, same `mov ip, r0`. EVERY differing byte is a register NUMBER, in two linked pairs. (1) dst and src are swapped -- draft r5/r4, ROM r4/r5. (2) the row base and the row pointer are swapped -- the draft keeps the base in callee-saved r5 (it is the SAME pseudo as dst, which is reassigned) and puts p in scratch r2, where the ROM puts the base in scratch r2 and recycles dst's now-dead r4 for p. w->r6, h->r7, i->r1, j->r3 and add->ip already match exactly, as does everything from `lsrs r7, r0, #8` onward apart from the register numbers.

### Why it is close

The type model and the statement order are settled and independently corroborated rather than guessed: the split PROMOTE_MODE pair fixes the parameter widths (and the retype was confirmed by re-verifying all three callers byte-for-byte), and the position of the src prologue copy fixes parameter 2 as a directly-walked pointer. No statement-order or type error remains to find.

### Already ruled out

- old_agbcc with -fprologue-bugfix removed -- MEASURED, not assumed, via a throwaway data/compiler-overrides.json entry: 85.2%, WORSE than the default toolchain's 87.5%. It keeps the same wrong register assignment AND additionally emits `ldrb` before `ldrh`. Consistent with the wave-38 discriminator, which locates the two allocators' divergence at a CALL inside a loop body -- this function has no calls at all.
- A separate local for the row base (`d = dst + x; d = d + y * 0x20;`). This DOES produce the ROM's fresh-pseudo base and would free dst's register for p, but it always costs the `adds r4, r0, #0` prologue copy: with dst read-only, gcc loads the stack parameter into r1 rather than r0, dst never leaves r0, and the function comes out 42 instructions / 4 bytes SHORT. Probed in five spellings -- own local in one statement and in two, base assigned back into dst, the mixed `dst = dst + x; d = dst + y * 0x20;`, and declaration order both d-before-p and p-before-d -- all 42 instructions. THIS IS THE CORE TENSION: the prologue copy needs dst long-lived, the base register needs dst dead.
- A `void *` second parameter with a `u16 *s = src;` local -- puts the src prologue copy seven instructions later, after the stack argument's narrowing, instead of at instruction 3. Not reachable by statement reordering, because parameter setup always precedes a body statement.
- `int` parameters 3-5 with explicit `(u16)` casts at the uses -- loses both prologue `lsls`, because the narrowing is then emitted whole at the use.
- decomp-permuter, FOUR runs totalling roughly 43,000 iterations: 60.2 -> 72.7 -> 86.4 -> 87.5%, and then a full 600 s run starting from 87.5% produced nothing better at all. It has CONVERGED; do not simply re-run it longer. Its two surviving edits are already in the draft and are worth keeping -- a zero-trip `do { } while (0)` around the second offset add plus `src++`, and `y * 0x20` bound to an `int` local -- together worth 14.8 points.
- `*p = add + *src` operand order, and the `p++` / `src++` order inside the inner loop -- byte-neutral.
- Toolchain axis re-measured across all seven profiles, confirming and extending the old_agbcc note: configured/default/no-force all 87.5% (identical); o1 and o1-no-force 8.0% at -4 bytes; old-agbcc and old-agbcc-no-force 85.2%. Nothing beats the configured profile.
- SUBTRACTION OF A NEGATION (`dst - (-x)`, `p = dst - (-(i * 0x20))`), the spelling that matched sub_0802FA64 this wave by making a symbolic base operand 1: NEGATIVE here, and it makes things worse in the exact direction the entry's 'core tension' predicts. Both the row-pointer-only and the both-sites variants compile identically to each other and LOSE the `adds r4, r1, #0` src prologue copy -- src stays in r1 and is walked from there, i is promoted to callee-saved r4. Measured by compile_probe.
- decomp-permuter re-confirmed CONVERGED: two further runs this wave (300 s from the draft with --current, 300 s from best.c) both reported base score 70 and no candidate better than the starting point.

### Settled

- Parameters 3, 4 and 5 are u16, NOT the `int` they were declared with. A prologue `lsls rN, rN, #0x10` whose matching `lsrs` is MISSING -- it reappears at the use fused with the scale, `lsrs #0xf` for `dst + x` (*2) and `lsrs #0xa` for `y * 0x20` (*0x40) -- is a sub-word PARAMETER, whereas an `int` with an explicit `(u16)` cast emits the narrowing whole at the use and leaves no prologue `lsls`. Retyped in include/unknown-functions.h; sub_080399F8, sub_0807FE90 and sub_08080498 were all re-run through try_match and are still byte-identical.
- Parameter 2 is a directly-walked `u16 *`, not a `void *`: `adds r5, r1, #0` is a PROLOGUE copy sitting ahead of the `ldr r0, [sp, #0x14]`, which only happens when the parameter itself is the walking pointer.
- gUnknown_080A31A4 is `u16 []`, not `u8 []` -- sub_08012B70 is its only reader and walks it as halfwords. Byte-neutral at all three call sites, which pass only the base address.
- w and h come from ONE halfword, not two byte loads: `hdr = *src` (ldrh), `w = (u8)hdr` (agbcc re-loads it as `ldrb` off the same address), `h = hdr >> 8`. The ldrh-BEFORE-ldrb order is what distinguishes this from `w = *(u8 *)src; h = *src >> 8;`.
- The destination offset is `dst + x` plus `y * 0x20` in u16 units (a 0x40-byte row stride), and the row pointer is `p = dst + i * 0x20` -- a MULTIPLY per outer iteration, not an accumulate: the ROM has `lsls r0, r1, #6; adds r4, r2, r0` every time round.
- Both loop counters are u16 tested unsigned; the outer counter's increment being hoisted above the inner loop is the compiler's doing, not the source's.

### Why it is parked

Register allocation, not source semantics. The instruction stream, the type model and every read form are settled; what remains is which hard register the row base and the row pointer land in, and that is coupled to whether dst survives as a pseudo of its own. Both sides of that coupling have been probed to exhaustion from source, the toolchain axis is measured and worse, and the permuter has converged. Unparking needs a construct that keeps dst alive across the stack-parameter load WITHOUT making it the row base. WAVE 73: still the correct diagnosis. This was the ONE function in the wave-73 pure-register-name batch that no lever moved, and it is also the only one of the six that had ALREADY had the permuter run on it before this wave.
