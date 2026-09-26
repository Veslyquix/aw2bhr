# sub_08047190

0x08047190, 1292 bytes, THUMB, parked.

Best score so far: 77.3%.

## What it does

Builds the current army's sorted unit list in gUnknown_02028DD8 (unit numbers 1-63 within the army's 64-unit block at gUnknown_03003F2C), ending with 0xff, and stores its length in byte 0x21 of arg. Units are ordered by a per-type rank from gUnknown_081BA068, ascending or descending by the gUnknown_02028E18 toggle, then optionally by HP (a2 = 1), fuel (2) or ammo (3). Finally the list is rewritten so that units with flag 8 are skipped at the top level and each unit with flag 0x10 is followed directly by the units in its cargo bytes (7 and 8), two levels deep.

## How close it is

Compiles to the right size (1292 bytes); 293 bytes differ (77.3% line up), starting near the top. The remaining difference is register choice and instruction order; no statement is missing.

## What is left

The function makes no calls, so one different register choice in the first loop cascades through everything after it. Find the initialisation spelling that gives the original's first-loop registers without growing the function; the current best came from the permuter, so another permuter run from it is a reasonable next step.

## Already tried

- Three separate zero assignments and a bound element pointer in the scans (the older draft): right size but only 18%.
- Chaining `o` with `n` instead of `rank` in the first assignment: the first zero moves resemble the original, but 1296 bytes and 19.0%.
- Pinning `rank` to a fixed register: 1304 bytes, 10.7%.
- `list[n++] = s` as one statement: the original stores before incrementing, so two statements are used.
- A u8 second parameter: the original does not narrow it, so it is int.

## Files

- `sub_08047190.c`: the current draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at exact size 1292/1292, 77.3%. Remaining class is allocation/order after the prior permuter gain. Chained o/n grows to 1296 at 19.0%, fixed-r3 rank to 1304 at 10.7%; older low-scoring and header-regression candidates are rejected.

</details>
