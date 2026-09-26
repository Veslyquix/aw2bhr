# sub_08039188

0x08039188, 220 bytes, THUMB, parked.

Best score so far: 33.6%, +4 bytes (best.c).

## Files

- `sub_08039188.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

31.8% identical, +4 bytes

### What still differs

A conflict between two translation units, not a residual in this function's C. sub_08039188 needs its callee sub_08039140 declared one way at the call site and another at the definition; no spelling of the caller can reach it. Also carries a register-pressure `ldrsb` fold (see the codegen doc: `ldrsb` vs `ldrb; lsls #24; asrs #24` is register pressure, not an idiom).

### Why it is close

The shape, types and statement order are derived; the 4-byte loss is structural to the declaration visible at the call site and simply moves between translation units depending on how sub_08039140 is declared.

### Already ruled out

- Retyping either parameter of sub_08039140 to `int` -- only MOVES the 4-byte loss into src/decomp/c_08039140.c. Net zero across the ROM.
- An UNPROTOTYPED declaration (`u8 sub_08039140();`) to get C89 default argument promotion at the call site -- probed: the escape hatch does not exist in agbcc. See the codegen doc section.
- Spellings of the caller generally -- the contract is cross-TU, so no caller-side C reaches it.

### Settled

- CORRECTS A WAVE-43 CONCLUSION recorded in include/unknown-functions.h. The refinement 'ONE unnarrowed argument is ambiguous but TWO of different signedness in one call can only mean no declaration in scope' was built on a miscount. Compiled against the existing `u8 sub_08039140(u16, s16, u8, u8)`, the `s16` argument already emits a bare `lsls r2,r1,#4` and nothing else, because the value is `s8 * 16` and combine deletes a sign-extension it can prove redundant (num_sign_bit_copies >= 17). Only the `u16` argument costs a shift pair. So the count was ONE -- the case the refinement itself calls ambiguous.
- A narrowing that combine can prove redundant is INVISIBLE at the call site. Any argument narrow enough for its declared type -- an s8-derived value into an s16, a masked value into a u16 -- looks like a promoted argument in the listing while its declaration is perfectly ordinary. COUNT UNNARROWED ARGUMENTS BY COMPILING, not by reading the ROM.

### Why it is parked

Wave 57 (W57-E). Cross-TU prototype conflict: cannot be matched while sub_08039140 is declared as it is, and retyping only relocates the loss. Fifth residual kind, alongside shape, type, allocation/constant-placement and block layout.

### Wave 88

WAVE 88 (W88-D): the kind-5 classification is WRONG -- the prototype is the SMALLER of two independent blockers, not the cause. Widening sub_08039140's parameter 0 to `int` does remove the caller's narrowing (ROM's bare `lsls r7,r0,#4` appears; 31.8% -> 33.6%) but the caller is STILL +4 and all of it is the `ldrsb` fold. The definition half is REFUTED: a compensating `u16 a = (u16)x;` in sub_08039140 is size-exact at 72 B with the whole residual a four-instruction BLOCK SWAP -- a narrow PARAMETER's conversion is emitted in the prologue insn group ahead of every source statement, and the cast IS a source statement, so it reproduces the instructions but never the position. `s16` refuted off the ROM alone (one shift pair where the ROM has two). Bound on the retype-plus-cast lever that closed sub_0807F57C this wave: it reaches a RETURN value, never a parameter of a function with other narrow parameters. Everything restored; c_08039140.c re-verified MATCHED by exit code. Evidence: work/sub_08039188/W88-notes.md.
