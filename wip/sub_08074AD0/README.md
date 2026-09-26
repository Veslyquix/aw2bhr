# sub_08074AD0

0x08074AD0, 144 bytes, THUMB, parked.

Best score so far: 53.5% (best.c).

## Files

- `sub_08074AD0.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

53.5% -- 144 bytes, candidate 140 (-4). TWO agents this wave (W38-B, W38-E), W38-E starting from scratch as the wave-37 inherited-draft rule requires. The residual is one source-level fact and all three symptoms follow from it: the original loads the gUnknown_081CC4D4 base ONCE into r5 and reuses it in both arms (`ldr r5,[r7,#0]` then `adds r0,r4,r5`), the candidate reloads it at the bottom; the original's pool word sits MID-FUNCTION at +0x54 with the code branching over it (`ldr r0,[r7,#0]; b.n 7e`) where the candidate dumps it after the epilogue -- that IS the -4 bytes; and allocation is shifted by one register throughout (r6 vs r5). Ruled out: binding the array base to a local before the loop, which is the wave-37 chapter that predicts exactly this pool movement -- it was tried and does not reproduce the mid-function dump. Not tried: the toolchain axis. WAVE 38. ---- WAVE 73 (W73-A): THE TOOLCHAIN AXIS IS RULED OUT, and without spending a probe. This entry listed 'Not tried: the toolchain axis' as the one remaining lead. It is not a lead. Wave 38's measurement was never about the 0x0807xxxx address range: the two functions that genuinely needed old_agbcc were the two WHOSE LOOP BODY CONTAINS A CALL. This loop body is 'dist -= step >> 1; gUnknown_0202FEF8[i] = step >> 1; if (step <= 0xf) step = step + 1; i++;' -- four statements, no 'bl' of any kind. The trigger mechanism is absent, so old-agbcc / old-agbcc-no-force were deliberately NOT probed; wave 56 already ran four such profile probes on mechanism-free candidates for zero positives, including one that met the documented address-range trigger exactly and changed not one byte. The ONLY open lever remains W38-E's: make r7 (the force-addr pool pointer) live BEFORE the guard without collapsing the indirection, so the zero-trip edge reaches the table through the same register instead of const-folding to its own direct pool word. Verified unchanged at 140/144 bytes this wave. WAVE 81 (W81-C): temporary-profile sweep on the unchanged draft -- configured 51.4% (NOTE the entry's recorded 53.5% was not reproduced on today's draft, re-measure before reasoning from either), no-force 51.4% identical, o1/o1-no-force 21.5%, old-agbcc pair 38.2%. The 'not tried: toolchain' gap is closed; only W38-E's lever remains.
