# agbcc codegen rules

Everything here was learned by matching functions in this ROM, and each rule is
one someone actually lost attempts to. The compiler is agbcc (Nintendo's GCC
2.95 fork) at `-O2`, C89 only.

The recurring lesson: **when a candidate is semantically right but does not
match, the cause is usually which register something lands in, and that is
decided by how the source is *phrased*, not by what it computes.**

---

## Reading types off the assembly

| assembly | meaning |
|---|---|
| `ldrb` | `u8` |
| `ldrh` | `u16` |
| `ldrsh` | `s16` **object** (not a cast) |
| `ldr` | `u32` or pointer |
| `lsls #16; lsrs #16` | `u16` truncation |
| `lsls #24; lsrs #24` | `u8` truncation |
| `lsls #16; asrs #16` | `s16` |
| `lsrs #3` vs `asrs #3` | index is `u32` vs `int` |
| `lsls #a; lsrs #b`, `a+b != 32` | **bitfield read.** Plain `(x >> 2) & 3` compiles to three instructions (`lsrs; movs; ands`); the two-instruction double shift only comes from GCC's `extract_bit_field`. Load width gives the bitfield's base type. |

Scaled index `lsls #1; adds; lsls #5` = `x * 96` — an array of 96-byte structs.
Model unknown regions with explicit `u8 filler_XX[N];`.

---

## Register-allocation rules

These decide 10% versus 100%.

**Do not mutate a parameter** where the original computes into a fresh register.
`dst += x + y*32;` and `base = (dst + x) + y*32;` mean the same thing and
compile differently. Took one function from 10.7% to a match.

**The `muls` destination tie.** THUMB `muls Rd, Rm` is `Rd = Rd*Rm`, so one
operand must be the destination. Writing `(x+2)*(x+3)` lets the optimiser
choose; writing `y = x+2; y *= x+3;` forces it. If a diff is *only* a register
permutation around a `muls`, this is why.

**This does not generalise to `orrs`.** For a commutative OR, no source form
found controls the destination — see the failure list below.

**A constant in a pushed callee-saved register**, where the original
rematerialises it at the use site, is constant CSE across the *whole body*, not
a problem with the statement that uses it. Six formulations of the offending
statement compiled byte-identically. The fix was a `volatile`-qualified read
somewhere else in the function. Do not fight it at the use site.

**Address computation for bit accessors must be separate statements**, in this
order:

```c
struct Foo *s = &gSym;      /* ldr rB,=gSym  -- addend 0, not folded */
u32 idx = id >> 3;          /* lsrs rI,r0,#3                        */
u8 *b = s->field;           /* adds rB,#OFS  -- offset on the BASE   */
u8 *p = b + idx;            /* adds rI,rI,rB -- dest ties to the IDX */
return (1 << (id & 7)) & *p;
```

Neither operand order of the naive one-liner works (both 21%): a `u8` MEM
operand forces the `ldrb` out at expansion, and the byte rather than the mask
becomes the AND's destination.

**Tell:** a bare `adds rB, #imm` right after `ldr rB, =sym` means the source did
**not** take the address of the member. When the offset is folded into the pool
word (`.4byte gSym+0x12`) instead, it did. An `ADDR_EXPR` over a constant base
folds; going through a pointer variable makes the base a pseudo, so nothing is
left to fold and the runtime add stays.

Watch for reassociation: `&s->unk10[i]` folds to `base + (0x10 + i)`, putting
the add on the *index* register. Splitting `u8 *b = s->unk10;` out first puts it
back on the base.

---

## Bitfields

**A bitfield store whose constant fills the field is OR-only.** agbcc's
`store_fixed_bit_field` sets `all_one` and omits the AND. So `AND ~mask; OR val`
where `val` is all-ones for that width is **not** a bitfield — look for a raw or
union view of the same object.

**Consecutive bitfield writes to one global collapse** into a single
load/store chain. Separate stores to the same address mean the source had
something between them.

`get_best_mode` picks the narrowest mode containing the field, so a 5-bit field
at bit 0 would be QImode — `ldrb`, not `ldrh`.

---

## Control flow

**Branch polarity.** For `if (C) return A; return B;` agbcc branches to the A
block and falls through into B. Read it backwards: the fallthrough value is the
*second* return in the source. Writing the logically equivalent inverse gives a
~90% near-miss with the branches swapped — a one-attempt fix, always try it
first.

**`i < N` unsigned canonicalises to `cmp #N-1; bls`.** Do not "correct" the
source to `<=` chasing the asm.

**Two-sided signed range checks** become one unsigned compare:
`cmp rN,#0x3f; bhi` after `subs #0x60` is `if (id >= 0x60 && id < 0xa0)`, with
the subtraction CSE'd into the following `id -= 0x60`.

**Cross-jumping is automatic** — write independent `return` statements with
textually identical tails and agbcc merges them.

**A function may deliberately have no final return.** `sub_0803CBD8` falls
through leaving its argument in r0, which is what the original does. UB in C,
correct here.

---

## Aliasing and `volatile`

**A global re-loaded every iteration must stay inside the loop.** If a store
might alias it, agbcc reloads; hoisting it into a local will not match.

**`volatile` to keep two loads.** Where the original reads a global twice —
once to test, once to increment — agbcc CSEs them into one without `volatile`,
and the function comes out short. `volatile` keeps both while still emitting a
plain `ldrh`; a plain `s16` global emits `ldrsh`, which is wrong.

**Do not declare bitfield globals `volatile` wholesale** — a volatile bitfield
store emits a spurious extra `ldrh` and a stray `orr`. Qualify only the access
being read-modified.

**A dead reload immediately before a store means the field is `volatile`.**
`s->x++` on a volatile field compiles to `ldrb r0,[r1]; adds r0,#1;
ldrb rN,[r1]; strb r0,[r1]` — the second load is of the same address, into a
register nothing reads. Plain fields and full-width bitfields (`u8 x:8`,
`u16 x:8`, `u32 x:8`) all give the clean three-instruction form; a narrow
bitfield (`u8 x:5`) gives a long extract/mask/merge instead. So **load, compute,
load the same address again, store** identifies a volatile field and nothing
else. Worth checking early — it took `sub_080308B4` from 10% to 91% in one edit.

**`const` on the global's declaration makes its load survive intervening
stores.** `extern T *const gFoo;` read by name emits one `ldr` that GCC reuses
across later `strb`/`strh`. Reaching the same object through a pointer
(`const T *p = &g;`, or `T *const *pp; (*pp)->m`) does **not** get this. Read it
off the assembly: a global loaded once and kept live across stores wants `const`
on the declaration; one reloaded at each use does not.

**Strict aliasing is off.** A `u16` store invalidates a cached pointer load
exactly as a `u8` store does. So when the original keeps a pointer live across
stores, the source is reusing *one evaluation* held in a local, not re-reading
the global — no aliasing rule would let the compiler do that by itself.

---

## `-fforce-addr`

This flag is in `CFLAGS` and is the least obvious thing in the build.

**It routes a symbol's address through `.rodata` when the global is used both
before and after a loop.** GCC emits `.LC0: .word gSym`, puts `.word .LC0` in
the function's pool, and every access gains an extra `ldr`, growing the function
by 4 bytes. Confirmed against minimal repros: before-only, after-only, and
either side of an `if` are all fine; before **and** after any loop — `for`,
`while`, `do`/`while`, any index type — always triggers it.

**Tell:** `R_ARM_ABS32 .rodata` where you expected `R_ARM_ABS32 gSym`, plus a
doubled `ldr rX,[rY]` at each access.

**To reproduce it in source**, bind the address to a local and use that for the
accesses *after* the loop:

```c
struct Foo *const *pp = &gSym;   /* by name before the loop is fine --   */
...                              /* CSE merges those into this pseudo    */
(*pp)->field++;                  /* after the loop, go through pp        */
```

This costs the `&gSym` pseudo one reference and register allocation is sensitive
to that, which is what leaves `sub_080308B4` at 96%.

**Do not remove the flag.** It is tempting: `sub_080308B4` matches exactly under
`-fno-force-addr`. But the ROM builds to `14dd0b22c894…` with it, and upstream's
own matching sources — `src/proc.c` and `src/title-screen.c` — generate
different code without it. All 31 files in `src/decomp/` happen to be identical
either way, so nothing promoted so far has exercised it; `sub_080308B4` is the
first function that does, which is why this went unnoticed until now.

---

## Workflow

- **`compile_probe` is free.** Compile candidate C and read the assembly without
  spending an attempt. One agent matched four functions in one `try_match` each
  by probing locally first. Explore with `compile_probe`, spend `try_match` on
  the verdict.
- **`python tools/trymatch.py <fn> --diff` is the same check the MCP tool runs**,
  against the same `work/<fn>/<fn>.c`. Iterating locally and using `try_match`
  only to confirm costs nothing and is how the 0802 cluster was done.
- **Put several variants in one probe file.** A single compile answers a codegen
  question that would otherwise take five attempts — this is how the `volatile`
  reload tell and the `-fforce-addr` rule above were both isolated.
- **Ask of every global: is it `const`? is the field `volatile`?** The scaffold
  says nothing about either, and both are readable off the assembly by the rules
  above. For the 0802 cluster each was decisive.
- **`include/unknown-functions.h` has ~39 real prototypes.** The scaffold
  surfaces them. They are ground truth and the compiler enforces them —
  disagreeing gives `conflicting types`, not a mismatch.
- **`include/hardware.h` has struct layouts worth reusing** (`BlendCnt`,
  `WinCnt`, `SetWinEnable`, `SetDispEnable`, `ApplyPalette*`). What looks like
  arbitrary masking is often one of these.
  **But it has no `REG_*` MMIO macros** — `gDispIo` is a RAM shadow. Anything
  writing `0x04000000`-range addresses hand-rolls the pointer cast.
- **`global.h` does not include `hardware.h`.** Include it yourself.
- The inferred argument count in a stub is a **floor**. A struct passed by value
  occupies two consecutive registers and is indistinguishable from two arguments
  by register use alone.
- To settle a return type: `get_function` on a caller and see what happens to r0
  right after the `bl`.

---

## Known blocked functions

All three are semantically correct and blocked on register allocation. That is
what `decomp-permuter` exists to brute-force, and it is wired up:

```
python tools/permute.py sub_080308B4 --seconds 600 -j 6
```

It starts from `work/<fn>/best.c`, searches, and re-checks every result with
`trymatch` — the permuter's own score diffs objdump text, which is weaker than
byte equality, so it is a search signal and not a verdict. See `vendor/README.md`.

| function | best | obstacle |
|---|---|---|
| `sub_08063980` | 80% | `orrs r1, r0` vs `orrs r0, r1`. 14 source forms tried — pointer locals, separate result variables, `u8`/`u16`/`u32`/`s16`/`int` parameters, multiply instead of shift, casting the shift, reordering operands, hoisting the shift. All produced the same. GCC coalesces the result into the parameter's register because the parameter is dead after the shift. |
| `sub_08001158` | 88.2% | 8 bytes. The original computes `y * 2` before loading the `0x417A` pool constant, killing `y`'s register early so both pool constants land in r4. Hoisting the multiply naively regresses to 29%. |
| `sub_080308B4` | 96% | Size, instructions, order and offsets all identical; `src` and `&gUnknown_08090CD8` are swapped between r4 and r5. The model is provably right — drop the `pp`/`ctrl` scaffolding and compile with `-fno-force-addr` and it matches byte-for-byte with correct relocations. The scaffolding exists only to reproduce `-fforce-addr`, and it is what perturbs the allocation. |

---

## Known type conflicts, deliberately unresolved

These compile today only because they are separate translation units. A shared
header must reconcile them, and the typed model is the correct one in both
cases.

- `gUnknown_030030E0`, `gUnknown_030030A4`, `gUnknown_030030DC` —
  `src/decomp/c_08012358.c` says `extern u16`; `c_08078B08.c` says
  `union BlendCntBuf` and two `struct WinCnt`.
- `gUnknown_03002B6C` — `include/hardware.h:147` says `extern u8`, but every
  read site does a 32-bit `ldr` with bitfield extracts (it is a BGCNT mirror).
  `src/title-screen.c:162` does `|= 0x80` against the u8 declaration, so the
  read and write sites disagree. Changing the header would break a currently
  matching file.

---

## Data models worked out so far

```c
/* 0x60 = 96 bytes, exactly 30 entries (proved from a loop bound) */
struct UnkBar { u32 unk00; u8 filler_04[0x22]; u16 unk26; u8 filler_28[0x38]; };
extern struct UnkBar gUnknown_03001470[30];
/* unk00 non-zero = slot in use, and is a lookup key: sub_08015BD0 scans it */
/* unk26 indexes into gUnknown_0200E438 */

/* 0x4c bytes */
struct UnkFoo {
    u8 filler_00[0x30]; struct UnkVec unk30; u8 filler_38[4];
    u16 unk3c; u16 unk3e; u8 filler_40[4]; u32 unk44; u8 filler_48[4];
};
extern struct UnkFoo gUnknown_0200E438[];

/* sprite list: 16-byte entries, layer-head array + bump allocator */
struct SpriteEntry {
    struct SpriteEntry *next; u16 oam1; u16 oam0; u16 oam2; u16 *object;
};
extern struct SpriteEntry gUnknown_0200D510[];    /* layer heads */
extern struct SpriteEntry *gUnknown_03002B24;     /* pool cursor */

/* 0x48 bytes of bit arrays; gUnknown_02028078 is a shadow copy of the same
   type (proved by a 0x48-length memcpy in sub_0803BCA0).
   getters int f(u32 id), setters void f(u32 id, u8 value), all
   bits[id >> 3] / bit (id & 7). Offsets in use: 00 08 10 12 2A 2D 30 */
extern struct Unk02028030 gUnknown_02028030;

/* ROM pointer to a screen structure, 35 callers */
/* +0x0A22 u16 tiles[]  indexed by rowOffset[y] + x, value masked to 0x1FF */
/* +0x417A u16 rowOffset[] indexed by y                                    */
extern u8 *gUnknown_08499590;

/* 0x03003F24 / 0x030044A4 — a live pair and its backup, 7 callers each.
   sub_0802C57C saves, sub_0802C594 restores. Likely a cursor position. */
struct Unk802C57C { u16 unk00; u16 unk02; };

/* 0x0849B018 — pointer to a struct with a bitmask byte at +9. 13 callers.
   sub_0802F460(s8 index) tests bit `index` of it and returns bool8. */
struct Unk0849B018 { u8 filler_00[9]; u8 unk09; };

/* 0x08090CD8 — const pointer to a one-word wrapper whose field 0 points at a
   large RAM block holding a 32-slot ring of 0x88-byte records:
     buf+0x0006  u8            sender id
     buf+0x0020  volatile u16  sequence counter, post-incremented per record
     buf+0x012C  entry[48]     the records
     buf+0x1AAD  volatile u8   ring write index, masked to 0x1F
   entry: u8 type (0xAF) | u8 sender | u16 seq | u16 len (20) | u8 payload[20]
   Offsets confirmed by a byte-exact match under -fno-force-addr. */

/* two copies of a 16-entry pointer-list idiom */
extern void *gUnknown_03002FA0[16];      /* list A */
extern volatile u16 gUnknown_030030E8;   /* list A count, capped at 16 */
extern void *gUnknown_03000000[16];      /* list B */
```

`BLEND_EFFECT_ALPHA/BRIGHTEN/DARKEN/NONE` are referenced by macros in
`hardware.h` but never defined anywhere. Literals 2 and 3 are brighten/darken.
