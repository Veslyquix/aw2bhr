# sub_0801A7D8

0x0801A7D8, 1056 bytes, THUMB, parked.

Best score so far: 23.2%, +12 bytes (best.c).

## What it does

Saves a block of game data (a3 bytes from gUnknown_0200CC2C) to backup memory in 4 KiB sectors. It sorts the free sector slots by their generation counters, splits the data into pieces of at most 0xFAD bytes, and for each piece fills the 0x02002000 buffer with a header (signature word, flags, generation, piece number and count, offset, the slot-generation table, length), the data and a checksum byte plus its complement, then writes and checks the sector, moving to another slot if the check fails. Returns 1 if it runs out of slots, otherwise 0; when a1 is non-zero it repeats the whole job once more with a1 = 0 and a new size from a function pointer.

## How close it is

Compiles 12 bytes too long (1068 against 1056). Because every byte after the first extra instruction is shifted, most of the function compares as different; the real differences are in how the buffer's address is built and in the stack spills that follow from it.

## What is left

Make the compiler build the 0x02002000 buffer address as the original does (load a nearby address and subtract, then reach byte 0xFFF by adding a constant) instead of creating its own address constant for byte 0xFFF and working back from it. The spill differences are expected to follow from that.

## Already tried

- Writing the success flags as `| (idx << 4)` directly: 8 bytes worse, because the OR widens to a full word. A `u8 tag` set inside the byte-0xC store and reused later (the current draft) saves 4 bytes; `u16` or `int` for that local are 4 and 12 bytes worse.
- `if (retry == 0 || retry == 4)` instead of a switch with a fall-through: 8 bytes worse.
- Indexing `gUnknown_0200CC88[16 + x]` instead of taking the address of the second array: about 12 bytes worse.
- Copying a3 into its own local before the loop: 8 bytes worse, and a1 loses its register.
- `list[n++] = i` in one statement: increments before storing, where the original stores first.
- The plain member spelling `gUnknown_0200CC88.slotGeneration[x]` (kept in best.c): same size, a few more bytes line up; not adopted until the 12 bytes are solved.

## Files

- `sub_0801A7D8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 1068/1056 (+12), 20.0%. A narrow block-local u8 tag improved +16 to +12; the remaining 0x02002000 address-hub choice and spill cascade survive. Switch/retry CFG, folded-address forms, direct narrow OR, and wider tag spellings are settled in the draft comment.

</details>
