# sub_0804CA98

0x0804CA98, 416 bytes, THUMB, parked.

Best score so far: 17.3%, -4 bytes (best.c).

## What it does

Steps one entry of the per-side animation table gUnknown_02029A10[a1].entries[a2] while the entry is active: it advances the entry's frame and position, can start a new effect through sub_08056E28, and when the animation reaches its last frame it calls sub_08015328(a3).

## How close it is

Compiles to the right size (416 bytes), but 345 of 416 bytes differ (17.1% identical) because the register assignment differs from the first few instructions on. Everything in the diff follows from one missing force-addr word.

## What is left

Make the compiler use a force-addr word for gUnknown_02029A10 in the stepping block: the original loads that address once, from a word the compiler keeps in read-only data, and holds it in a register for the four accesses there, while the frame check at the end uses a plain pool word. The draft names gUnknown_02029A10 directly but still gets only plain pool words.

## Already tried

- The stepping block's four accesses as byte offsets from `(u8 *)gUnknown_02029A10`: one shared address, but a plain pool word and 12 bytes short (taking an address never triggers force-addr).
- The same byte-offset form for the three accesses at the end as well: 36 bytes short.
- Array form in both the stepping block and the end: 4 bytes short, 17.3% identical.
- Binding the table base to a local: identical output (the compiler substitutes the constant back). Binding an entry pointer: 36 bytes short.
- Other mixes of array and byte-offset forms between the stepping block and the end, and goto or early-return forms of the two guards: the pool words do not change.
- Reading unk20 back without the volatile cast: loses the reload after the store (2 bytes).

## Files

- `sub_0804CA98.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 78 at exact size 416/416, 17.1%, 345 differing bytes, first difference +0xa. Tail array/cast and goto spellings are pool-neutral and do not force gUnknown_02029A10. Residual is the force-address choice and its allocation cascade.

</details>
