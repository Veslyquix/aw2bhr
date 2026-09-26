# sub_08037A78 — parked at 27.6% (-4 bytes), wave 50, W50-L

## What the function does

For every cell of the map, take the terrain byte at
`map->unk12[map->unk417a[y] + x]`; if it is non-zero, look up a tile quad and
merge it into a destination buffer: AND four halfwords of the destination with
a four-entry mask, then OR in four halfwords of the source tile.

```
dst = (u16 *)a1 + gUnknown_03004010[x] + gUnknown_030032E0[y];
src = (u16 *)gUnknown_080A0F38
    + gUnknown_08582E74[gUnknown_030040F8[(terrain >> 6) + 1] + 0x12];
dst[0] &= mask[0];  dst[2] &= mask[1];  dst[4] &= mask[2];  dst[6] &= mask[3];
dst[0] |= src[0];   dst[2] |= src[2];   dst[4] |= src[4];   dst[6] |= src[6];
```

Everything from the first `ldrh r0,[r1]` of the AND quad to the end of the
function is **byte-exact** in the parked draft, including the inner increment,
both loop tests and the epilogue. The AND-then-OR split into two groups of four
(rather than four `dst = (dst & m) | s` statements) is confirmed: agbcc keeps
each AND result live in r2/r3/r4/r5 and the OR group reuses them.

## The residual, and why it is one fact and not three

The ROM keeps **two** copies of the map pointer:

| pseudo | loaded | used by |
|---|---|---|
| P1 | once, before the outer loop | outer condition (`unk02`), inner-loop **guard** (`unk00`), outer bottom test (`unk02`) |
| P2 | once per outer iteration, in the inner preheader | `map + 0x12`, `map + 0x417a + y*2`, inner **bottom** test (`unk00`) |

P1 and P2 are separate loads of `*gUnknown_08499590` — the pool word
`_08037B64` is referenced twice. Two locals (the parked draft) reproduce that
split; a single local, or no local at all, does not.

What no spelling has reproduced is the **placement**:

* The ROM's P1 is produced *inside* the outer condition (`ldr r1,[r2];
  ldrh r3,[r1,#2]; cmp; bge`) and spilled to `[sp,#12]` only **after** the
  guard branch. `map = gUnknown_08499590;` as a statement makes agbcc emit
  `str` immediately at the def and then `ldr` it straight back for the
  `ldrh` — one insn more, and the reason the candidate is 4 bytes short
  overall despite carrying an extra reload.
* The ROM's inner guard runs **before** P2 is loaded. Every source ordering
  puts the assignment first, because the assignment is a statement in the
  outer body and the guard comes from the `for` header after it.

The two preheader differences fall out of that and are not independent: the ROM
hoists `map + 0x12` into `[sp,#8]` and rematerialises
`gUnknown_030032E0 + y*2` from the pool inside the loop, while every candidate
does the reverse (hoists `gUnknown_030032E0 + y*2` into `sl`, recomputes
`map + 0x12`). The ROM's frame is 20 bytes, the candidate's 16 — one slot for
`map + 0x12` and one for P1. The pool order is the same fact read a third way:
the ROM's `gUnknown_030032E0` word is **last**, i.e. its pseudo is created
inside the loop; the candidate's is fourth.

## Ruled out by controlled probe

1. **`gUnknown_08499590`'s load is not LICM-hoistable.** Writing the global
   directly everywhere (no locals) leaves the `ldr`/`ldr` pair *inside* the
   inner loop, reloaded every iteration. That is `unknown_address_altered`:
   the `strh` stores through `dst` have a varying address, so agbcc's
   `invariant_p` rejects every MEM in the loop. Neither P1 nor P2 can be
   compiler output — both must be written in the source.
2. **`MEM_IN_STRUCT_P` on the stores changes nothing here.** Rewriting the
   four AND/OR pairs as `dst[n].unk00` through a two-halfword `struct Cell`
   (so the stores become COMPONENT_REFs, which in gcc 2.x
   `fixed_scalar_and_varying_struct_p` should stop them aliasing a fixed
   scalar global) produced **byte-identical** assembly to the plain
   `u16 *` spelling. So that disambiguation is either absent from agbcc or
   does not reach `invariant_p`. Worth knowing before anyone else spends a
   probe on it.
3. **Authoring the hoist backfires.** Adding `tiles = p->unk12;` before the
   inner loop to force `map + 0x12` into a slot gave agbcc a 24-byte frame
   (ROM: 20), spilled the map pointer as well and moved the loop counter into
   `ip`. This is the brief's "anything after a hoisted invariant was written by
   the loop optimiser and must not be authored", confirmed once more.
4. Single-local variants: `map` at the outer top used for everything (guard and
   bottom both read it, no P1) scored 20.9%; two locals scored 27.6%.

## Symbols — all settled, nothing left to declare

Added to `include/unknown-globals.h` this wave with evidence:
`gUnknown_030032E0`, `gUnknown_03004010` (lds-bound IWRAM u16 tables),
`gUnknown_0849D534`, `gUnknown_08582E74` (ROM const u16 tables).
Already present: `gUnknown_08499590` (`u8 *`), `gUnknown_030040F8` (`u8 []`),
`gUnknown_080A0F38` (`const u8 []`, so the tile reads cast to `const u16 *`).

`struct Map37A78` is kept local to the `.c`, exactly as the matched exemplar
`src/decomp/c_080377C4.c` keeps `struct Map377C4`. The shared
`struct Unk08499590` in the header has no member at 0x12 and **must not be
reshaped** to add one — W50-G verified two functions byte-for-byte against its
current layout this wave.

## Wave 65 closure

The configured Wave 65 recheck is unchanged: target 268 bytes, candidate 264
(-4), 27.6% positional identity.  The exact tail remains byte-identical.  The
two-source-pointer requirement and the impossible placement of P1's spill after
the outer guard still exhaust the source-level axis; authoring the missing
hoist was already measured to worsen the frame.  Closed without another
fixpoint extension.
