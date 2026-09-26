# sub_0802F6A0

0x0802F6A0, 604 bytes, THUMB, parked.

Best score so far: 49.8% (preprocessed form, not included).

## Files

- `sub_0802F6A0.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

Wave 74 strongest semantic draft: exact 604/604, 45.9%, 327 differing bytes, first difference +0xc.

### What still differs

The three-loop ring reader remains blocked on the dst/expSum register-versus-stack inversion.

### Why it is close

The retained nested cursor binding is the strongest independently verified semantic source and is size-exact.

### Already ruled out

- Two clean permuter runs were drained.
- The apparent 49.7/49.8% candidates assign locals after an unconditional return while earlier goto paths read them; both were rejected.

### Settled

- Do not quote or install the semantically invalid best.c candidates.

### Why it is parked

Wave 74 W74-C. Resume at the dst/expSum live-set inversion.
