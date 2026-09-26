# sub_0802F588

0x0802F588, 280 bytes, THUMB, parked.

Best score so far: 55.4%, +4 bytes (best.c).

## Files

- `sub_0802F588.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

Wave 74 strongest semantic draft: exact 280/280, 40.4%, 167 differing bytes, first difference +0xe.

### What still differs

The ring-writer shape is correct but allocation remains broadly rotated across its three loops.

### Why it is close

Size and loop count are exact; the retained split-sum and reversed second-pointer equality are semantic and independently verified.

### Already ruled out

- Two clean permuter runs were drained.
- The apparent exact 45.7%/152-difference candidate used prod before initialization and was rejected.

### Settled

- Do not prefer best.json's stale 55.4% record over the verified semantic active draft.

### Why it is parked

Wave 74 W74-C. Requires a new allocation mechanism, not another unconstrained permuter adoption.
