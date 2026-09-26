# sub_08020EDC

0x08020EDC, 492 bytes, THUMB, parked.

Best score so far: 93.9%, +4 bytes (preprocessed form, not included).

## Files

- `sub_08020EDC.c`: the current draft

## What has been tried

From `data/parked.json`.

### Best so far

90.7% identical, SIZE-EXACT (492/492), 46 differing bytes, first difference at +0x1a. Waves 49, 65, 71, 73; re-measured wave 79 (W79-F), unchanged. best.c holds a 496-byte (+4) variant scoring 93.9%, and THAT is the number that reached the wave-79 brief as this function's -- read the draft's own `bytes:` line, not `best so far:`.

### What still differs

Allocation only. The ROM parks y in r5 and emits delta's narrowing group whole before flags'; the draft leaves y in r1 and hoists one lsls a slot early. Instruction sequence is aligned end to end.

### Why it is close

Every shape and type question is settled -- see the long header comment in work/sub_08020EDC/sub_08020EDC.c, which is this function's real write-up. Wave 71 settled the sunk-deref spelling; wave 73 added a live-range split worth 1.1 points.

### Already ruled out

- Splitting the r == 0 block's row base into two statements (`rows = p; rows = rows + 0x417a;`) on its own: 90.2%, first difference at +0x1e -- WORSE than 90.7%. It only helps in combination with the parameter widening above.
- THE REMAINING 0.8 POINTS ARE A CROSS-TU PROTOTYPE CONTRACT -- STOP HERE (wave 73, W73-F). The only thing decomp-permuter found past 90.7% is 91.5% size-exact, and it depends on widening the 6th parameter from u8 to unsigned int (the permuter rewrites the prototype block, so it never compiles against the real header). include/unknown-functions.h declares `void sub_08020EDC(s16, s16, s16, u8 *, int, u8)` and the MATCHED caller src/decomp/c_080210C8.c passes an `int a6` through `lsls #0x18; lsrs #0x18`, which is exactly the int->u8 narrowing that prototype's 6th parameter requires. Widening it here deletes that narrowing there and costs the caller 4 bytes. NOTE the header's own prose above that declaration asserts arguments 5 AND 6 are int, contradicting the declaration on the same lines; the declaration is the one the caller agrees with, so the prose is what is stale.
- Binding the unit id to a local (m = ids[off]) instead of writing ids[off] twice: 60.2%, 26 points WORSE.
- Copying y into its own s16 local before the r == 0 test: 84.8%. The permuter's 91.1% variant places that copy INSIDE the r == 0 block where it is uninitialised on the loop path -- illegal, and legalising it (wave 65) costs 8 bytes (492 -> 500).
- Chaining decomp-permuter from best.c: USELESS HERE and the reason is generalisable. best.c holds a 496-byte (+4) 93.9% variant, because trymatch moves best.c forward on byte-identity percentage alone with no regard for size, so on a size-exact target a non-size-exact variant can own best.c forever. permute.py prefers best.c, so a 300 s chained run returned candidates that were ALL +4 bytes. Pass --current to search from the size-exact draft instead (wave 73, W73-F).
- WAVE 79 (W79-F) spent NO probe, by the brief's own rule for residual kind 5. Re-measured only: 492 bytes, 90.7%, first difference +0x1a, identical to wave 73. Nothing on the caller side (src/decomp/c_080210C8.c) has changed, so the cross-TU prototype contract still blocks the only known lever.

### Why it is parked

Residual kind 3 (allocation).

### Improved by wave 73

SPLITTING THE TERRAIN-TYPE VALUE'S LIVE RANGE, found by decomp-permuter run --current from the draft and semantics-checked afterwards: `ty = cells[off] & 0x1f; t = ty;` in place of `t = cells[off] & 0x1f;`. ty is dead across the split and is reassigned at its next use, so the program is unchanged. 89.6% -> 90.7%, still size-exact. Note this candidate was DISCARDED by trymatch's own best.c rule (90.7% < best.c's 93.9%) even though it is the better starting point; it had to be lifted out of work/sub_08020EDC/permuter/output-670-1/source.c by hand.

### Wave 86

WAVE 86 (W86-E, vocabulary-twin axis): twin sub_08020DBC (src/decomp/c_08020DBC.c, adjacent, matched wave 83) is a TRUE SHAPE TWIN. Transplanting both of its constant locals verbatim (`rowOff` replacing all three `rows = p + 0x417a;` bindings, `new_var2` replacing the literal 0x13) onto the wave-79 draft: configured 492/492, 89.4% (from 90.7%), first difference UNMOVED at +0x1a -- the transplant does not touch the y/r5 allocation the park names. REFUTED; draft restored (md5-verified). The residual-kind-5 verdict (cross-TU prototype contract on the 6th parameter) stands. Note best.c's 93.9% is a +4-byte variant, not a draft score.
