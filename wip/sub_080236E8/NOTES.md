
## W84-B (final numbers after round 3)

Chained decomp-permuter (shell tools/permute.py --seconds 280 --threads 4,
seeded each round from the updated best.c):
- round 1: 76.27 -> 78.2% (69/316 differ)
- round 2: 78.2 -> 79.4% (best-so-far internal)
- round 3: -> 79.75% recorded in best.json / 79.7% re-measured from the
  readable adopted draft (64/316 differ, size-exact, first diff +0xe).

The ACTIVE DRAFT is now the round-3 candidate verbatim (def extracted from
best.c line 20, W84-B header comment added). Snapshot history:
w84-baseline.c = pre-wave 76.27% state; w84-adopted.c = round-1 adoption.
Every round's gains were splice-form==raw-form comparable. No match yet;
residual remains low-half truncation scheduling + register permutation around
+0xe. Chain still decelerating but not exhausted (recorded for next wave).
