# sub_080611D8

0x080611D8, 304 bytes, THUMB, parked.

Best score so far: 75.0% (best.c).

## Files

- `sub_080611D8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at exact size 304/304 with 76 positional bytes different and an exact instruction multiset. ROM keeps two short return-1 copies and merges the final return-0 before the epilogue; every structured spelling merges return-1 instead. Wave 70's labeled late-ret0 CFG reaches the desired tails but shifts the four-word pool barrier by 16 bytes. Residual is basic-block/pool layout only.
