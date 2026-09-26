# sub_08010EF8

0x08010EF8, 64 bytes, THUMB, parked.

Best score so far: 79.7% (best.c).

## Files

- `sub_08010EF8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

79.7% identical, SIZE-EXACT, 13 differing bytes

### What still differs

One instruction's POSITION, across a loop boundary. The ROM keeps `ldr r6,<pool>` in the preheader and re-reads BOTH levels inside the loop (`ldr r1,[r6]; ldrh r1,[r1]`); every candidate hoists the middle `ldr` into the preheader and leaves only the `ldrh` in the body. Same instruction count, hence the exact size.

### Why it is close

The body is not in question -- prologue, the `dest + x + 0x20` start cell, both libgcc calls, the digit arithmetic, the u16 re-narrowing and the exit test are byte-exact, and wave 51 re-derived the same body independently from the assembly.

### Already ruled out

- TEN declaration spellings across waves 42, 51 and 58: honest `gUnknown_0300308C[0]`; volatile array; sized array [2]; base bound to a local inside the loop; variable index `g[value % 10]`; `u16 *const` scalar; `u16 *`; `u16 *volatile`; `u16 *const volatile`; and (wave 58) `u16 *g[]` and `u16 *const g[]` measured side by side in one probe. The last two are byte-identical to each other AND to the scalar draft, which closes the wave-51 row that called the non-const array 'one LICM decision away'.
- Wave 58: call-clobbering and store aliasing as explanations. This loop contains TWO calls (__umodsi3, __udivsi3) and a store through a pointer parameter, and agbcc hoists a non-const, non-volatile global load out of it regardless. The two compilations differ in neither, so neither can be the mechanism.
- Not a permuter case: the difference is instruction ORDER across a loop boundary, not a register assignment.
- Wave 79 (W79-C) re-measured and CONFIRMED this entry unchanged: 64/64 size-exact, 79.7%, 13 differing bytes, first difference at +0x11. No new axis was opened, and the smallest budget in the batch was spent here deliberately. Two candidates were checked on paper and neither reaches it: the wave-79 u32-pointer-arithmetic lever that closed sub_080228D8 moves a pool ldr past an index scaling and says nothing about an LICM hoist; and the W40-J / W43-A chapters of docs/agbcc-codegen.md already explain why a constant subscript cannot be talked into the reloaded form -- in sub_08010ADC, the function that DOES get the reload, the index is an INDUCTION VARIABLE with strength reduction in play, which g[value % 10] is not. Treat this entry as closed.

### Settled

- Classification: constant placement realised as an LICM decision -- instruction ORDER across a loop boundary. This is the same unreachable family as sub_080373F0's basic-block layout: a choice made inside a compiler pass with no source-level handle, and no spelling of the declaration reaches it.
- `const`ness and `volatile`ness do not decide the hoist; all ten spellings hoist. The question was never how to spell the global.

### Why it is parked

Wave 58 (W58-A), carried from waves 42 and 51. Ten spellings measured; the residual is an LICM hoist, which is instruction order across a loop boundary and has no source lever.
