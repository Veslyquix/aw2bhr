# sub_080303C8

0x080303C8, 428 bytes, THUMB, parked.

Best score so far: 19.6% (best.c).

## Files

- `sub_080303C8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

Wave 74 semantic baseline: 420/428 (-8), 18.0%, 343 of 420 candidate bytes differ, first difference +0xe.

### What still differs

The key/state scan still needs the ROM's distinct volatile RMW/dead-read behavior at two sites plus its OR-chain allocation.

### Why it is close

All known faithful volatile pointer forms and both site contexts are now measured and documented.

### Already ruled out

- Faithful volatile pointer forms measured 416/412 bytes.
- A first-site overlay/barrier reached 424 but worsened allocation; applying it to the second site regressed.
- High-half OR grouping remained 420 bytes with 342 differences.

### Settled

- The two volatile sites are not interchangeable; preserve their distinct source contexts.

### Why it is parked

Wave 74 W74-C. Needs a new faithful volatile-C model.
