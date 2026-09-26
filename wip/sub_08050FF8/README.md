# sub_08050FF8

0x08050FF8, 804 bytes, THUMB, parked.

Best score so far: 21.5% (best.c).

## What it does

Sets up the current sprite object (gUnknown_03001FBC) for one side and slot, taking its tile number from the other side's record, then computes the sprite's position and places it. When the other side's unit has a certain flag it also plays an alternating effect through sub_0803B48C.

## How close it is

Compiles 8 bytes too short (796 against 804). 672 of 796 bytes differ (15.4% identical), which means little because the difference starts in the first instructions and the size difference shifts everything after it.

## What is left

First try naming gUnknown_03004580, gUnknown_0300453C, gUnknown_020298E0 and gUnknown_085D6A48 directly wherever the draft reads them through the cells gUnknown_081360E4, gUnknown_081360DC, gUnknown_081360D8 and gUnknown_081360E0 (the `pE4`/`pDC`/`pD8` locals): those cells sit in the block of compiler-made address words that include/unknown-globals.h documents, and naming the global directly fixed four other drafts with this pattern. After that, the known gap is that the original keeps three addresses in registers where the draft keeps four: it reloads gUnknown_03001FBC's address from the pool at each group of uses.

## Already tried

- A `static inline` helper returning gUnknown_03001FBC, at all seven uses or only after the first call: 30 to 32 bytes shorter, because the compiler then merges the record-index computations.
- Reading gUnknown_03001FBC through a volatile pointer: the right per-use reloads, but a zero-extend and two shifts instead of the original's signed halfword load.
- A redundant mask on the record indices to keep them apart: the mask is folded into the load, which becomes a narrower load, one instruction shorter each.
- Binding `*pDC` to a local before the x sum: fixes that part, but the compiler then adds a read-only address word for gUnknown_020298E0.
- Binding the side, or `side * 8`, before the column address: the add and shift stay in the wrong order; only binding the byte offset `side * 16` puts them right (kept).
- Any inline form of the column-1 read (2-D subscript, constant in the index): the add disappears into the load.

## Files

- `sub_08050FF8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Why it is parked

Worked across several waves without a match; the full record is the draft's header comment and the notes files in work/sub_08050FF8/.

</details>
