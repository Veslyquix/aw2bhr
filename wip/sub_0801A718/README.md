# sub_0801A718

0x0801A718, 132 bytes, THUMB, parked.

Best score so far: 59.1%.

## What it does

Inserts an entry into a linked list kept sorted by a signed 16-bit key. It takes the next free 12-byte node from the pool at gUnknown_0200C624 (indexed by the count in the list header gUnknown_030020A8), stores the pointer argument and the key in it, links it in before the first node whose key is not smaller, increments the count and refreshes the header's head pointer. Returns -1 without inserting when the pool is full (count above 0x80), otherwise 0.

## How close it is

Compiles to the right size (132 bytes), but 54 bytes differ. They all come from one extra load in the last statement: the list's sentinel node at 0x0200C618 has no symbol, so the draft reaches it through a pointer word in ROM, and the extra load moves registers through the rest of the function.

## What is left

Add a symbol for the sentinel node at 0x0200C618 to the linker script (aw2bhr.lds) and use it in the last statement. A test compile with that name gives the original's loads and the right size, but only a full build can confirm it. One small register-copy difference in how `cur` is first set may then remain.

## Already tried

- Reaching the sentinel as `gUnknown_0200C624 - 1` in the last statement: the compiler reuses the array's address and subtracts from it, so the instructions still differ.
- Declaring the sentinel in include/unknown-globals.h without adding it to the linker script: the split build fails with an undefined reference.
- Declaring the ROM pointer word `const`: still one load too many.
- Reading through the ROM pointer word gUnknown_0808E5D0 (the current draft): correct everywhere except the one extra load, because inside a loop the compiler adds its own address word on top.

## Files

- `sub_0801A718.c`: the current draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Best so far

59.1% identical, SIZE-EXACT

### What still differs

A MISSING LINKER SYMBOL, not a residual in this function's C. The ROM's third pool word must contain 0x0200C618 -- the list-head sentinel record sitting immediately before the gUnknown_0200C624 node array -- and aw2bhr.lds jumps 0x00C528 straight to 0x00C624, so no symbol exists at that address to name. The draft uses the pointer-object workaround `gUnknown_0808E5D0->unk04`, which costs ONE EXTRA `ldr`: agbcc adds its own force-addr level on top, giving `ldr r0,[r6]; ldr r0,[r0]; ldr r0,[r0,#4]` where the ROM has two loads.

### Why it is close

The shape is solved and verified against the listing, including the double `node->unk04 = cur` on the mid-insert path (the store through `prev` may alias `node`) and the loop's rotation into the middle, which is agbcc's and not source.

### Already ruled out

- `gUnknown_0200C624 - 1` for the tail -- produces no second address constant; agbcc keeps the base in a register and CSE folds the two uses, leaving `ldr; sub #8; ldr`.
- Inventing the symbol in include/unknown-globals.h alone -- fails the split build with `undefined reference` (the wave-32 lesson).
- Wave 58: qualifying the pointer-object workaround `const` (`struct Unk0808E5C8 *const gUnknown_0808E5D0`) -- does NOT remove the force-addr level, still three loads. Wave 42's `u16 *const` row, which reaches the right level count for a scalar in sub_08010EF8, does not generalise to a pointer-to-struct object. No declaration of a ROM word reaches two loads; only naming the RAM object does.

### Settled

- THE FIX IS VERIFIED BY PROBE, not proposed. With `extern struct Unk0808E5C8 gUnknown_0200C618;` declared and the tail written `gUnknown_030020A8.unk04 = gUnknown_0200C618.unk04;`, agbcc emits its own `.rodata` address constant, `ldr r6,=.LC` in the preheader and exactly `ldr r0,[r6]; ldr r0,[r0,#4]` at the tail -- the ROM's two loads. The extra indirection is gone.
- The one-line edit is: aw2bhr.lds, EWRAM section, between the 0x00C528 and 0x00C624 lines, `. = 0x00C618; gUnknown_0200C618 = .;`. NOT applied: aw2bhr.lds is upstream's file, tools/gen_lds.py consumes it, and try_match compiles one unit and cannot gate a link error, so the edit is unverifiable without one full split build.
- A residual of one instruction would remain after the symbol exists, and it is localised: `cur = gUnknown_0200C624 - 1` applies the -0xc to the base pseudo in place (`sub r2,r2,#0xc`) where the ROM copies first (`adds r3,r0,#0; subs r3,#0xc` -- THUMB's `subs rD,#imm8` is two-operand, so the copy is exactly the allocator declining to coalesce cur with the base). `cur = &gUnknown_0200C618` restores the count but substitutes `ldr r0,.LC; ldr r3,[r0]`. One try_match decides it.

### Why it is parked

Wave 58 (W58-A), carried from wave 41. Blocked on a linker symbol at 0x0200C618, not on C. The fix is verified by probe and is one line of aw2bhr.lds plus one declaration; it needs a full split build to confirm, which an agent cannot run.

</details>
