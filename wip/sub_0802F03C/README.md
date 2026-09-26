# sub_0802F03C

0x0802F03C, 512 bytes, THUMB, parked.

Best score so far: 93.2%.

## Files

- `sub_0802F03C.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

WAVE 79 (W79-E) RE-MEASURED BY EXIT CODE: exact 512/512, 93.2%, 35 differing bytes, first difference +0x57. Unchanged from wave 74 -- the number the coordinator quoted is current.

### What still differs

Re-read instruction by instruction in wave 79 with the branch-label noise filtered out. It is exactly what wave 74 said and nothing else: a pure r4/r5 EXCHANGE running the whole length of the function (`movs r4,#0` vs `movs r5,#0`, `movs r5,#63` vs `movs r4,#63`, every `adds rN,#1`/`cmp rN,#3`/`cmp rN,#127`/`subs rN,#1` pair, and the two `ldr rN,[pc,#N]` bases that follow them), plus three reload scratch picks that ride on it: `ldr r7`/`ldr r6` against `ldr r6`/`ldr r3`, and the loop-invariant `adds r3, r5, #1` (the ROM's saved i+1) landing in r0 and then r1 in the candidate. NO INSTRUCTION IS MISSING, ADDED, OR OUT OF ORDER.

### Why it is close

All ten loops and total size match; Wave 74 reproduced the strongest valid candidate.

### Already ruled out

- Declaration, scope, signedness and loop-counter ownership probes did not close the swap.
- Clean chained --current permuter searches were drained with no match.
- WAVE 79 (W79-E): NO SOURCE CONSTRUCT SITS BEHIND THIS RESIDUAL. Re-classified from the diff under the wave-77 discriminator -- there is nothing whose respelling or deletion would change the SET OF PSEUDOS the allocator is handed. Every differing byte is a register number field of one allocno-priority tie between the two loop counters, plus scratch picks downstream of it. This is the 'exact size plus a one-register rotation is an allocno-priority tie' class. No probes were spent, by design; the classification is the result.
- W83-D: diff CONFIRMED CURRENT BY EXIT CODE (93.2%, 35 of 512, first +0x57) and SEVEN-PROFILE SWEEP completed: every temporary profile is size-mismatched (no-force 516, o1 500, o1-no-force 496, old-agbcc 516, old-agbcc-no-force 516 vs 512) and none better. configured remains canonical. No probes spent on source spellings, per the W79-E NO-CONSTRUCT directive.

### Settled

- The Wave-72 fourth-loop counter fix is load-bearing; do not rework loop structure.

### Why it is parked

Wave 74 W74-C, re-confirmed wave 79 W79-E. Resume only with a new register-priority lever. Classified NO-CONSTRUCT: allocno tie plus reload scratch picks. Do not give this function a spelling budget again until such a lever exists.
