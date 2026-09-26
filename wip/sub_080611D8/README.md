# sub_080611D8

0x080611D8, 304 bytes, THUMB, parked.

Best score so far: 75.0% (best.c).

## What it does

AI: picks a map cell for a unit of type gUnknown_030046C0.unk06 and writes its x and y to the caller's buffer, returning 1 on success and 0 otherwise. It first tries sub_08061308 in up to five search modes, then falls back to the first unused record in a ROM list of cells.

## How close it is

Right size (304 of 304 bytes) and every instruction is present, but 76 bytes differ because the return paths are arranged differently. The ROM keeps two separate `return 1` endings and one shared `return 0` placed last; the draft shares the `return 1` endings instead, which shifts the code around them.

## What is left

Find a spelling that gives the ROM's arrangement of return paths while leaving the four-word constant pool right after the list walk's final test, where the ROM has it.

## Already tried

- Nesting the whole chain of sub_08061308 calls in an `if` inside the unk07 test: the worst layout of all.
- Inverting the final test (`if (out[0] != 9999) { mark; return 1; } return 0;`): changes which return is shared but does not fix it.
- A single exit through a result variable: the compiler turns the last result into branch-free arithmetic, further from the ROM.
- Explicit labels for each return (a trailing `ret0:` plus separate return-1 labels): gives the ROM's endings but moves the constant pool 16 bytes later.
- Switch and do-while spellings of the same logic: come out like one of the attempts above.
- Kept from earlier attempts: `break` in the list walk and the literal 9999 in the final test, which fixed the loop.

## Files

- `sub_080611D8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 70 at exact size 304/304 with 76 positional bytes different and an exact instruction multiset. ROM keeps two short return-1 copies and merges the final return-0 before the epilogue; every structured spelling merges return-1 instead. Wave 70's labeled late-ret0 CFG reaches the desired tails but shifts the four-word pool barrier by 16 bytes. Residual is basic-block/pool layout only.

</details>
