# sub_08085B30 notes

## W84-A (wave 84, agent A)

Baseline re-measured by exit code first: active draft == wave71 snapshot state,
1040/1040 size match, **9 of 1040 bytes differ (99.1%), first diff +0x108** --
exactly as parked; only code residual is the src2/dst1 r6/r7 home exchange at
+0x2d6..+0x2fe (+3 .rodata alias addend words at +0x108.., promotion business).

Two axes newly MEASURED this wave (both under configured profile):

1. **Destination commutation -- byte-neutral at exactly 9.**
   Both destination plus-operands swapped simultaneously
   (`(void *)(i * 0x100 + 0x06010E00)` / `(i * 0x100 + 0x06010E80)`).
   Snapshot: w84-dst-commute.c. This closes the last untouched
   operand-order axis on either giv (source-side commutation + association +
   rebasing + stride spellings were already closed in waves 71-83).

2. **GNU statement-expression nesting -- WORSE, 98.1% / 20 bytes.**
   Call A nested inside call B's second argument as
   `(void *)((int)({ CpuFastSet(A...); 0; }) + (0x06010E80 + i * 0x100))`,
   the wave-56-J nesting shape executed A-first. Snapshot: w84-nested.c.
   The nesting does not merely move creation points: it destroys src2's
   separate strength-reduce giv entirely (the +0x500 collapses into the bump:
   `adds r4,#0x500` path), reorders the preheader to [dst2][dst1][bump],
   and flips homes again. Closed hard.

3. **Chained permuter campaign -- CONFIRMED UNUSABLE, not just claimed.**
   Checked against docs (wave 75 sub_08073E0C mechanism, lines 45873ff): the
   empty read/write constraint PRESERVES a fixed-register copy but still
   requires the `register T v asm("rN")` pin, and wave-77 recorded that ANY
   inline asm disables tools/permute.py. Every asm-free spelling of the pin's
   purpose contradicts a known rule: expand_assignment expands the LHS before
   the RHS (wave 79), so the single-statement
   `gUnknown_03002B34 = sub_08087248();` necessarily emits the address pool
   ldr BEFORE the bl, which is precisely what the pin was introduced to
   reverse. No asm-free starting point for a chain exists on this function.

Verdict: park stands. The tie-break diagnosis (allocno exchange between two
adjacent same-class loop pseudos, nothing source-side left) now additionally
covers destination commutation and statement-expression nesting. Only lever
that could still matter: whatever makes gcse/PRE number the four preheader
movables in ROM's order (dst2, src2-giv, dst1, src-bump) -- a function-level
hash/insn-index question, not reachable by any window-local spelling measured.

Draft restored to the w84-pre.c state (identical to w83-snapshot.c content).
