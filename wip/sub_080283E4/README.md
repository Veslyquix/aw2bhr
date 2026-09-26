# sub_080283E4

0x080283E4, 388 bytes, THUMB, parked.

Best score so far: 90.7%.

## Files

- `sub_080283E4.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

90.7% identical, SIZE-EXACT (388/388), 36 differing bytes, first difference at +0x16. Waves 36, 71, 73 (W73-F took it from 87.6%).

### What still differs

Pure register names in the `& 0x30` and `& 0xc0` blocks and their downstream renaming. Every instruction is the ROM's instruction, in the ROM's order. The .rodata addends and the nine string-table relocations are benign.

### Why it is close

This is the SEVENTH member of the pure register-name residual class (see the wave-73 chapter in docs/agbcc-codegen.md). Three of the other six closed in wave 73.

### Already ruled out

- Writing the 0xc0 block's offset as three inline `*(q + 0x39)` reads instead of `q += 0x39; *q`: 88.9%, size-exact -- an improvement over the old 87.6% draft but SUPERSEDED by the inline-subscript fix above, and the two do not combine (the 90.7% draft keeps `q += 0x39;`).
- IMPROVED, not an axis to rule out (wave 73, W73-F): the `& 0x30` block must NOT bind `ent`. Writing `gUnknown_03001470[gUnknown_03001FBC].unk38 = 1 - gUnknown_03001470[gUnknown_03001FBC].unk38;` with the subscript inline on both sides takes it 87.6% -> 90.7%, size-exact, 36 of 388 bytes, first difference at +0x16. This is the OPPOSITE of the `--` line at the tail, where binding `ent` is required, so the binding rule here is per-statement and not per-function. Lifted from decomp-permuter output-535-1, which reached 89.9% with the same inline spelling plus a self-assignment; dropping the self-assignment scores BETTER than the permuter's own candidate.
- Bound-entry timing, `register` hints on `ent`, and existing sized-string layouts (wave 71).
- Binding `ent` before the `--` line is REQUIRED, not optional: written inline as `*(s16 *)&gUnknown_03001470[i].unk38` the +0x38 folds into the relocation addend and the ldrsh reads offset 0.
- gpKeySt getting an ORDINARY inline pool word while the other three globals get force-addr words, in the same function, is the reference-count trigger and not something to spell differently.
- LEVER 2, `base - (-index)` (wave 73, W73-F): NEGATIVE, and the reason generalises. Writing the 0xc0 block's address as `q = (u8 *)&gUnknown_03003FC0 - (-*(s16 *)&ent->unk38);` forces `ent` to be computed before `q`, which MOVES the force-addr pool load for gUnknown_03003FC0 from the head of the block (where the ROM has it, `ldr r2,[r5]` is the block's first instruction) to after the element-address computation. And it buys nothing, because the additive spelling ALREADY has the symbolic base as operand 1 and as the destination: the ROM is `adds r2, r2, r0` and the draft reproduces that. THE GENERAL RULE: read the ROM's address add before reaching for lever 2 -- it is indicated only when the ROM has the symbolic base as operand 1 AND your candidate has it as operand 2. Here the operand order was never the residual.
- decomp-permuter, first ever runs on this function (wave 73, W73-F): 300 s and 600 s, both chained from best.c. Internal score 610 -> 460, but NO byte-level improvement -- every verified candidate came back at 87.6% or 87.1%. Unlike the other three never-permuted members of this class, the permuter does not move this one.
- W83-D: diff CONFIRMED CURRENT (90.7%, 36 of 388, first +0x16) and SEVEN-PROFILE SWEEP completed: default == configured; no-force 400, o1 408, o1-no-force 404, old-agbcc-no-force 400 (all size-mismatched); old-agbcc 78 of 388 (79.9%), first diff +0x4. No toolchain lever.

### Why it is parked

Residual kind 3 (allocation), pure register-name class.

### Wave 87

WAVE 87 (W87-F, do{}while(0) transfer test): NO EFFECT on the residual and every placement that did anything was a REGRESSION; draft unchanged (90.7%, 388/388, first difference +0x16), 0 try_match on the lever. The five pool pointers live across the seven bl's ARE global.c allocnos and the wrapper moves them (z1 around the `& 0x30` if: &g03003FC0/&g03001470 swap; z2 around the `& 0xc0` body: wrong; z3 = z1+z2 does NOT compose here, gives z1's result; z4 around the `held & 9` block: wrong) -- but the BASELINE already holds the ROM's r4/r5/r7/r3/r6 exactly, so every move is away from the ROM. The actual residual, the r2/r3 pair inside the `& 0xc0` block (ROM `ldr r2,[r5]` q's base then `ldr r3,[r6]` the array base; draft swapped), is set by local-alloc inside one block and the lever cannot reach it. Also measured outside the lever: p1 RHS bound to a temp in the `held & 9` block (RHS now precedes the destination add but ALSO moves `ldr r3,=g08499598 / ldr r0,[r3]` after the RHS; the ROM loads the destination POINTER first and adds #0x57 last; same count, wrong order); p2 `ent` bound before `q` in the `& 0xc0` block (WORSE: q's base load moves after the index computation, q lands in r1); p3 = p1+p2 inherits p2's regression. The +0x16 difference wants the destination pointer loaded first and its constant offset applied last -- a third spelling not yet found. Do not re-run z1-z4 or p1-p3.
