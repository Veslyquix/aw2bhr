# sub_0802AA78

0x0802AA78, 2356 bytes, THUMB, parked.

Best score so far: 93.9% (preprocessed form, not included).

## Files

- `sub_0802AA78.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

Wave 74 strongest semantic draft: exact 2356/2356, 89.3%, 253 differing bytes, first difference +0x90.

### What still differs

A coupled GCSE/pool-order and q-allocation residual remains around the sub_0802BB74/sub_0802BAFC branch and later merge. The historical 92.53%/176 and apparent 93.9%/144 records came from expanded-header contamination, not a reproducible ordinary draft.

### Why it is close

Control flow, canonical Map view, call sequence and total size are settled; Wave 74 improved the honest 87.9%/286 baseline to 89.3%/253.

### Already ruled out

- Both-arm reassociation shrinks to 2352; then-arm-only association is retained.
- Two clean chained --current permuter runs, over 11000 iterations total, found no match.
- Do not seed from the contaminated ~198KB best.c or reshape Map/Tbl49A2A6.

### Settled

- Retain the then-arm `(cx + tbl) + gUnknown_0849A284[6]`, unit->unk07 binding, and zero-lifetime accv compare temporary.

### Why it is parked

Wave 74 W74-B. Resume with a new GCSE/merge-allocation mechanism from the include-based active draft.
