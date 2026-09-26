# sub_0801C090

0x0801C090, 360 bytes, THUMB, parked.

Best score so far: 45.8% (preprocessed form, not included).

## Files

- `sub_0801C090.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 344/360 (-16), 14.2%. The authoritative readable draft is retained; best.c is contaminated preprocessed output. Count self-assignment is inert and memory-index self-assignments rotate registers without producing the ROM's spill slot. Residual is loop allocation/frame placement.

WAVE86: WAVE 86 (W86-F, vocabulary-twin axis): twin sub_0801BD00 (src/decomp/c_0801BD00.c) is a TRUE SHAPE TWIN and names three constructs the park never tried: (a) `s16 n` for the counter -- REFUTED FROM THE ROM without a probe: the decrement is `lsls #16 / adds 0xFFFF0000 / lsrs #16`, i.e. UNSIGNED, so `u16 count` is correct and the twin's declaration is a real difference between the functions (method note: the ROM's own shift settles signedness in ten seconds; do not transplant a twin's declarations wholesale); (b) walking the `void *a3` PARAMETER itself, cast at each use, instead of a fresh `u16 *src` local, and (c) `*dst++; *dst++; *dst = ...; dst += 2;` -- both transplanted in one probe: ALLOCATION-NEUTRAL, byte-identical in every figure. Configured, 344/360, 14.2%, draft unchanged (w86-start.c).
