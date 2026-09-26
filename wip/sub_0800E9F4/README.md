# sub_0800E9F4

0x0800E9F4, 256 bytes, THUMB, parked.

Best score so far: 89.8% (preprocessed form, not included).

## Files

- `sub_0800E9F4.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

86.7% readable configured candidate, exact 256/256 bytes, 34 differing bytes, first difference at +0x2 -- re-measured wave 73 (W73-E) on the draft itself. THE DRAFT IS DELIBERATELY NOT best.c: best.c reads 89.84% but is SEMANTICALLY WRONG (see settled_by_this_attempt), so the higher number must not be quoted as this function's score or installed as the draft.

### What still differs

The instruction stream is in the ROM's order. The residual is the x/rows/cells three-register cycle; changing one lifetime rotates the other two rather than converging.

### Why it is close

The readable draft is size-exact with all row reads, cell tests and control flow present. Only register operands differ across the coupled map-address lifetime.

### Already ruled out

- Struct and zero-trip wrapper spellings -- same three-register cycle.
- Full-map locals -- move `result` to ip rather than fixing x/rows/cells.
- Direct aggregate cell access -- adds address instructions and regresses.
- Typed u16 indexing -- CSEs adjacent row reads and shrinks the function away from the ROM.
- Unsigned local types, split result initialisation and deleting the self-assignment lifetime probe -- byte-neutral.
- Wave 73 (W73-E): REFUTED as written. This entry said `do not repeat it from the same draft`; a single 300 s run repeated from best.c took best.c from 87.11% to 89.84%, size-exact. Run 2 chained from that new best.c was flat. Run 3 used `--current` to start from the readable 86.7% draft (a starting point the MCP permute tool cannot select), base score 195, 420 s / ~3,000 iterations -- its harvested candidates re-measured at 86.7%, no gain. So all three neighbourhoods are now sampled and only run 1 moved, invalidly. A permuter run is a property of the STARTING POINT, not of the function -- contrast the sibling sub_0800E8CC, where the identical chained method went 83.11% -> 91.22% -> 92.23% with semantically clean mutations.
- No compiler override is configured or evidenced for this function; the residual occurs under the canonical configured profile.

### Settled

- The residual is allocation-only; aggregate layout and loop/control-flow models have both been tested.
- The mutated 87.11% best.c is an exploration artefact, not a maintainable replacement for the active readable draft.
- Wave 73 (W73-E): THE MUTATED best.c IS NOT MERELY UNREADABLE, IT IS SEMANTICALLY WRONG, and that is why it must never be installed as the draft. The 89.84% body saves the row offset into `new_var3` for the guard and then reassigns `ro2 = x`, but the guarded block still reads `ro2`, so `i` becomes `x + 1` where the original computes `rowOffset + 1` and `t` becomes `(2x + 1) * 2` instead of `(rowOffset + 1 + x) * 2`. decomp-permuter's `reuse a dead variable` transform is not always semantics-preserving. Chaining runs from such a best.c is still fine -- a byte MATCH cannot be semantically wrong -- but adopting a non-matching best.c as work/<fn>/<fn>.c poisons every later measurement. Contrast the sibling sub_0800E8CC, whose 91.22% permuter gain in the same wave IS clean and IS adoptable. AND THE REPAIR WAS TRIED AND FAILED (W73-E): the old row offset is still live in `new_var3`, so `i = new_var3 + 1; t = (i + ro2) * 2;` is the exact semantic repair, keeping every other mutation of the 89.84% body including the `p - (-t)` address form. It measures 86.7% -- identical to the un-mutated readable draft. THE ENTIRE GAIN CAME FROM THE INVALID READ. Contrast sub_08014DCC, where the same repair technique on an invalid 68.33% body yielded 70.0% and a new best because three of its four mutations were sound. So repairing an invalid gain is worth exactly one attempt, and an invalid gain is NOT evidence that a valid version of it exists. W73-B replicated the failed repair on sub_08045C18 the same wave (reverting only the invalid reassignment collapsed 97.1% -> 89.4%, back to baseline) and supplied the mechanism, which is what makes this predictive: once the local carries a CONSTANT instead of a loaded value, CSE const-propagates it and the pseudo vanishes, so the extra live range the permuter was buying disappears with it. A repair recovers the gain only when the invalid part was INCIDENTAL to the live range -- which is the minority case, since a live range is exactly what the permuter searches for. FORM-CHECKED (W73-E, after W73-D showed the hazard): permute.py judges BOTH the spliced and the RAW header-expanded form of each candidate and either can set best.c/best.json, so a best score may be unreproducible from an ordinary draft. This function's 89.84% was set by the SPLICED form (the raw form only tied it), so it IS directly comparable to the 86.7% repair and to the readable draft. Grep -B1 'new best:' in the run log before quoting any permuter score. Repairs recovered 1 of 4 across three batches.

### Why it is parked

Two focused waves and the permuter leave an exact-size candidate blocked on one three-register allocation cycle. Resume only with a new allocator-priority mechanism.

### Park kind

EXACT-SIZE REGISTER-ALLOCATION NEAR-MISS
