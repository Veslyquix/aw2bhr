# sub_08055768

0x08055768, 472 bytes, THUMB, parked.

Best score so far: 31.8%, -4 bytes (best.c).

## Files

- `sub_08055768.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at 468/472 (-4). Wave 63's opaque-store LICM barrier makes loop 1 exact; the whole residual is loop 2 cross-jumping two arm tails. Moving the barrier, addressing it through x/out/side, do-while wrapping and block-scoping x are neutral or regress allocation. Wave 70 restored and reverified the strongest draft after new lifetime probes failed. Preserve work/sub_08055768/sub_08055768.c and its evidence comment.
