# sub_080359A4

0x080359A4, 324 bytes, THUMB, parked.

Best score so far: not measured.

## What it does

Shows a map unit's sprite if its position is inside the visible part of the map, scrolling the camera to follow it in one mode. It skips cells whose byte in the map's unk234A plane is 0, asks sub_080255F4 whether the unit may be shown, and places the sprite with sub_0801C254.

## How close it is

Compiles 4 bytes short (320 of 324 bytes); 45.1% of bytes line up. The logic and the calls are settled; the difference is which registers hold the proc pointer, the two position pointers and the map pointer, plus one pointer copy the original makes on both sides of the optional camera call where the draft makes it once.

## What is left

First thing to try: the draft reaches the map through the compiler-made pointer word gUnknown_08090EA8 (`screen = &gUnknown_08090EA8; ... **screen`). Name the map global gMap (gUnknown_08499590) directly instead, as the matched neighbour sub_080358C4 does; that change recently fixed four of four drafts written this way.

## Already tried

- Holding the first y value in a fixed register (a `register ... asm` variable): 12 bytes better (308 to 320) and kept, but the pin stands in for an unknown construct and the rest still differs.
- Binding `px = &proc->unk42` at a different point: 24 bytes short, worse.
- Giving the private map-pointer local a longer or different lifetime: the registers rotate further from the original.
- Declaring the parameter as a typed proc pointer instead of ProcPtr: conflicts with the shared prototype and gives no improvement.
- Every compiler profile: the lower-optimisation builds score worse (21.6%), the older compiler scores 40.7%, the default ones equal the configured 45.1%. No compiler setting helps.

## Files

- `sub_080359A4.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 320/324 (-4), 45.1%, improved from 308 bytes using a private-slot local and fixed-ip y. Semantic body and indirection are settled; remaining four bytes are pointer allocation/copy placement. Broader private-slot lifetime probes regress the register rotation. WAVE 81 (D): profile sweep complete -- o1/o1-no-force worse (21.6%, +8 bytes), old-agbcc(-no-force) 40.7%, default/no-force both 45.1% (320/324); no configuration lever on this function.

</details>
