# sub_0802F6A0

0x0802F6A0, 604 bytes, THUMB, parked.

Best score so far: 49.8% (preprocessed form, not included).

## What it does

Reads one packet for player `slot` from that player's column of the receive ring (1024 entries) into dst. It scans for the 0x4FFF start marker, checks that enough data has arrived, reads the length (at most 0x80 halfwords), the checksum and its complement, copies the payload while recomputing both, and returns the length in bytes. Failures return -2 (not enough data yet), -3 (checksum mismatch) or -4 (no packet, too short, or too long).

## How close it is

Compiles to the right size (604 bytes); 327 bytes differ (45.9% identical). Caution: the current draft is not faithful. From the length read onward it indexes the cursor table and the ring's player column with the wrapped cursor value (t, new_var) where the original uses slot (checked against the original's instructions), so its score does not measure a correct draft.

## What is left

First restore a faithful draft (index by slot after the length read) and re-measure it. The known problem in the faithful version: the original keeps dst on the stack and expSum in a register, our build does the reverse, and it also loads the cursor-table address one more time than the original.

## Already tried

- Copying dst into a local before the loop: dst moves to the stack as in the original, but the stack frame grows and expSum still goes to the stack.
- Widening expSum from u16 to int: no change.
- Several permuter runs: no match. The highest results (49.7% and 49.8%, kept in best.c) read variables before setting them and were rejected.
- The current draft's `new_var` binding, from a permuter run, took the difference from 337 to 327 bytes, but it (and the draft before it) changed what the code does; see status.

## Files

- `sub_0802F6A0.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

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

</details>
