# sub_080303C8

0x080303C8, 428 bytes, THUMB, parked.

Best score so far: 19.6% (best.c).

## What it does

Exchanges this frame's key input with the other players in link play and returns all players' keys ORed together. When link play is off it returns the local keys; a bad word from another player makes it fall back to the local keys or return 0.

## How close it is

Compiles 8 bytes too short (420 of 428). 18.0% of bytes are identical, which means little because of the shift. Control flow, types, constants and both loops are settled.

## What is left

Two small code patterns differ. At two places the original sets the volatile field unk210 to all ones with a single read before the write, where ours reads it twice; and in the outgoing key word the original groups 0x8000 with the shifted field, where the compiler moves it. The first needs a new way to write a volatile read-modify-write; the second has a known but unnatural fix (holding 0x8000 in a local).

## Already tried

- The key word as one plain expression: the constant still moves and is widened, costing an extra pool word.
- Other groupings of the key word (three `|=` statements, OR before the shift, `+` instead of `|`): the constant still moves, or the wrong instruction appears.
- Holding 0x8000 in a local (`int hi = 0x8000`): reproduces the grouping exactly but the total stays 420 bytes. Left out of the draft as unlikely original source.
- `x |= c`, `x = x | c`, and going through a bound struct pointer for unk210: all still read twice.
- volatile pointer forms for the two read-modify-writes: 416 or 412 bytes; they lose the wanted instructions.
- A non-volatile overlay plus an asm barrier: gives the first site's instructions (424 bytes) but spoils the registers; at both sites it builds a second 0xFFFF and gets worse.

## Files

- `sub_080303C8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

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

</details>
