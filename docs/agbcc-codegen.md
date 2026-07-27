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

**`ldrh` plus a pool word is a plain mask; `ldrb` plus `mov`/`neg` is a
bitfield.** The width of the constant tells you nothing. `*p &= ~8` through a
`u16 *` narrows the mask to a 16-bit pool word by itself, so a `0x0000FFF7`-
shaped word is *not* evidence of a bitfield. The real bitfield store picks
QImode via `get_best_mode` and builds its mask in SImode with no pool word:
`ldrb; mov r0,#0x9; neg r0,r0; and; strb`. **`mov #N; neg` where a bare `movs`
would have done is a positive tell for a bitfield store** — the hand-rolled
equivalent emits `mov r3,#0xf3`, one instruction shorter.

**The double-shift rule is per-access, not per-function.** A plain three-
instruction read (`lsrs; movs; ands`) feeding a genuine bitfield write is a
normal hybrid — `sub_08012C30` is exactly that.

**A hidden pointer in r0 means the function returns a struct by value**, and
every real argument shifts up one register. The tell: r0 is never read, only
used as a store base for consecutive `str r1,[r0]; str r2,[r0,#4]`. This is the
return-side twin of the by-value argument rule. `sub_08015638` is
`struct UnkVec f(s16 a)` where the stub claimed `void f(int, int)`; its
neighbour `sub_0801566C` is the same body written as
`void f(s16 a, struct UnkVec *dst)`, and the two are told apart *only* by
whether r0 or r1 holds the index.

**An 8-byte struct assignment loads both words before storing either.**
`gDst = gSrc` routes through `thumb_load_double_from_address` — and agbcc emits
that phrase as a literal comment, so `compile_probe` labels it for you:

```
ldr r1,[r0,#0x4] ; ldr r0,[r0]   @ both loads first  -> struct assignment
ldr r0,[r1] ; str r0,[r2] ; ...  @ interleaved       -> element-wise source
```

Both spellings are the same length and both look obviously right; only the order
separates them. Check this before assuming a save/restore pair is a struct copy.

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

**Two globals compared in one expression hoist both address-loads.** Binding
each to a local first keeps them sequential, and costs one register fewer:

```c
if (gA != gB)                    /* ldr =gA ; ldr =gB ; ldr ; ldr ; cmp  -- 3 regs */
u32 a = gA, b = gB; if (a != b)  /* ldr =gA ; ldr ; ldr =gB ; ldr ; cmp  -- 2 regs */
```

Same instruction count and length, so this only shows up as a register
permutation. **Tell:** whether the first address register is reused for the
second address — reuse means the source used locals, a third register means the
direct compare. This points the opposite way to the usual advice: here the extra
local is what the original wrote. Eight other spellings compiled identically to
the naive form (operand order, `==` with early return, `volatile` on either
side, `const` on both, `void *`, and the bitfield-vs-mask body), so the local is
the only thing that moves it.

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

**`adds rB, #imm` after `ldr rB, =sym` has three causes and only one of them is
address-taking.** Rule out the other two before concluding anything. This has
misled more than one agent, in both directions.

1. **Displacement overflow.** THUMB immediates are narrow — `ldrb`/`strb` 0-31
   unscaled, `ldrh`/`strh` 0-62 even, `ldr`/`str` 0-124 in fours. A member past
   that range emits the add from plain `s->member`. Three functions with the
   identical shape `g[i].member` settle it: offset 0x1E folds into
   `ldrb r1,[r1,#0x1e]`, offsets 0x25 and 0x31 do not.
2. **A variable index with a word access.** For `gArray[i].member` the constant
   offset folds into the displacement **only for `ldrb`/`ldrh`**. A word access
   always hoists it onto the base, even when the displacement is legal and
   correctly scaled. Proved on one struct, stride 0x24, varying only the width:
   `u8` at 0x14 and `u16` at 0x16 both fold, `u32` at 0x1C hoists — while
   `p->member` through a plain pointer folds all three including the word. Not
   about offset divisibility, and not about the sub/add shape of the stride
   multiply; both were ruled out.
3. **More than one variable term.** A *byte* access hoists too once the address
   has two or more variable parts. `base + 0x1E + b + 0x1A*c + 0x5C*a` puts the
   0x1E on the base despite `ldrb` having room for it.

So the offset folds into the displacement only when the address is
(one scaled index) + base + constant **and** the access is byte or halfword.
Anywhere else, the plain subscript already produces the add and it says nothing
about the source. Only after excluding all three is a folded pool word
(`.4byte gSym+0x12`) evidence that the source took the member's address.

**The pool-fold has a different cause than this file used to claim.** It is not
that "a pointer variable makes the base a pseudo, so nothing is left to fold" —
`&arr[n-1]` folds the `-1` into the relocation even through a pseudo base. What
actually prevents the fold is flattening the scale into the source: `u8 *base =
g; base + (expr - 1) * 0x20;` keeps the `subs` at runtime, while every subscript
spelling folds it. **Pool-order tell:** the base symbol loaded *first*, before
the pointer global it indexes through, is the signature of the flat-`u8 *` form.

Watch for reassociation: `&s->unk10[i]` folds to `base + (0x10 + i)`, putting
the add on the *index* register. Splitting `u8 *b = s->unk10;` out first puts it
back on the base.

**Binding an array *element* address is a diagnostic, not a prohibition.** This
entry has been wrong twice; read the target and pick the column.

For a **pointer global** `extern struct T *g;` there are two clean shapes, and
which one is correct depends entirely on what the original did:

| source | codegen |
|---|---|
| `g[i].f` repeated, or `struct T *arr = g; arr[i].f` | `ldr r2,[r1]` **deref first**, then index math, `add r1,r1,r2` — **index is the first operand** |
| `struct T *p = &g[i];` or `g + i` | index math first, **then** `ldr r2,[r2]`, `add r2,r2,r1` — **pointer is the first operand** |

Neither is "safe". Some functions need the first (`sub_080266DC`,
`sub_08028874`), some need the second (`sub_08061DA8`).

For an **array global** `extern struct T g[];` there is no deref to schedule,
and the rule is a real constraint rather than a choice: under `-fforce-addr`,
repeating `g[i].member` for *two different members of the same element*
recomputes the whole address each time — a fresh `adds` per access, which also
flips the `muls` destination as a side effect. Binding either the base or the
element collapses them into one base plus displacements, and the `muls` tie then
resolves itself with no separate massaging.

**Where the base add lands in `base + i*A + j*B`.** Every spelling produces the
same instructions; only the position of the base `ldr` and the base `add` moves,
and it follows the left-to-right association of the source (`x + y + z` is
`(x+y)+z`). Three distinct outcomes, from 20 variants across 3 probes:

| target shape | source |
|---|---|
| base loaded mid-sequence, folded into the `i` term | `&g[i][j]`, `g[i] + j`, `&g[i].ent[j]`, and every other subscript spelling |
| base loaded first, added *third* (before the mul) | `T *base = g; p = base + j + i*N;` and friends |
| base loaded first, added **last** | `p = (T *)(j*sizeof(T) + i*sizeof(Row) + (u8 *)g);` |

Only the explicit byte-offset sum puts the base add last — no pointer-subscript
form does, and the `(u8 *)` cast on the base is what stops the terms collapsing
into one scale. Near-miss: `u32 off = ...; p = (T *)(off + (u8 *)g);` gets the
add order right but loads the base late; the `ldr` only hoists when the whole
address is one expression.

**`mul r0,r0,r1` and `mul r0,r1,r0` are the same THUMB encoding** (`MUL Rd,Rm`).
agbcc prints one, the target assembly prints the other. Not a diff.

**`p + i + j*32` and `&p[i + j*32]` are different code.** The additive form gives
two independently scaled adds (`lsl #1` and `lsl #6`, 11 instructions); the
subscript form combines them (`lsl #5` then `lsl #1`, 12). **Tell:** two
*different* shift amounts whose difference is the element-size shift means the
additive form. Reach for it first.

**A high `ldrb` offset forces `adds rB, #imm` on its own.** THUMB `ldrb` has a
0-31 immediate range, so any byte member past +0x1F gets a runtime add whatever
the source said. Do not read that as the address-taking tell above — check the
offset first.

---

## Bitfields

**A bitfield store whose constant fills the field is OR-only.** agbcc's
`store_fixed_bit_field` sets `all_one` and omits the AND. So `AND ~mask; OR val`
where `val` is all-ones for that width is **not** a bitfield — look for a raw or
union view of the same object.

**But the converse is false: an OR-only store is not evidence of a bitfield.**
`|= 0xFFFF` on a plain `u16` field is *not* folded to a constant store — agbcc
emits `ldrh; orrs; strh` with `0xFFFF` hoisted from the pool into a callee-saved
register for the whole function, because integer promotion to `int` stops 2.95
folding it. `sub_0801F114` is exactly this.

**`s->field = v >> 14` and `s->field = (v >> 14) & 3` are byte-identical** for a
2-bit field — the store masks either way. Do not spend an attempt on the
difference.

**An AND-only store with a `movs`-sized mask is also ambiguous.** `p->u8 &= 7`
and a `u8 hi:5` bitfield at bit 3 assigned zero both give
`ldrb; mov r0,#7; and r0,r0,r1; strb`. Another one not worth an attempt.

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

**An ascending pointer with a descending counter is an ordinary ascending
loop.** `movs r2,#0x1f; ...; adds r1,#4; subs r2,#1; cmp r2,#0; bge` comes from
a plain `for (j = 0; j < 32; j++)`; GCC reverses only the counter so the exit
test is against zero. Do not rewrite the source as a reverse loop. A counter
starting at N-1 with `bge` is N iterations.

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
bitfield (`u8 x:5`) gives a long extract/mask/merge instead. Worth checking
early — it took `sub_080308B4` from 10% to 91% in one edit.

**Two conditions, both required: the loads are the same width, and the second
one is dead.** Two loads of one address are otherwise unremarkable. `ldrb` plus
`ldrsb` of the same byte is a plain `s8` with no `volatile` anywhere —
`extern s8 g; if (g != 0) g--;` compiles to exactly that, because agbcc will not
CSE reads in different machine modes. The `movs r0,#0` scratch that appears
alongside is just `ldrsb` having no immediate-offset form. `sub_08034F8C` is the
case; a `u8` there collapses to one `ldrb`, and an `s8 a:8` bitfield is
byte-identical to the plain `s8`.

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

**Where you take the address decides the allocation.** Writing that as an
initialiser, `struct Foo *const *pp = &gSym;`, held `sub_080308B4` at 96% with
`src` and `&gSym` swapped between r4 and r5. Splitting the declaration from the
assignment, and putting the assignment *after* the first real statement, matches:

```c
struct Foo *const *pp;                  /* declare with the others   */
entry = &gSym->buf->ring[gSym->buf->i]; /* first real statement      */
pp = &gSym;                             /* take the address here     */
```

Found by decomp-permuter, which reached it as `new_var = &(*pp)` — a no-op that
costs a pseudo and flips the same decision. The two forms are equivalent; the
readable one is what is committed. Worth trying by hand before reaching for the
permuter, because an initialiser is the natural way to write this and it is
wrong.

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
  writing `0x04000000`-range addresses hand-rolls the pointer cast. There are no
  `REG_SIOCNT` / `REG_RCNT` / `REG_SIODATA8` either; `sub_08062FB8` is the first
  function here to touch `0x04000128` / `0x0400012A` / `0x04000134` and casts
  them by hand. Worth adding to `hardware.h` before a second link function
  hand-rolls a different spelling. `vu16` and plain `u16` compile identically
  there, so `volatile` costs nothing and is the honest choice.
- **`global.h` does not include `hardware.h`.** Include it yourself.
- **Grep `src/decomp/` for the globals the scaffold lists, before drafting
  anything.** This ROM is full of template instances — routines duplicated per
  BG layer, per slot, per bit offset. One wave matched `sub_08013C54` by copying
  the promoted `sub_08013C00` and swapping two symbols; another produced
  `sub_0803CB24` from `sub_0803CAD4` with a one-line `sed` and matched first
  try. Where a promoted file already encodes the awkward part of a shape, its
  siblings are nearly free. This grep is higher-yield than reading the assembly.
  **But confirm the assembly really is a template instance before assuming it.**
  `sub_0803CBD8` sits in the bit-accessor family by name and address and is a
  completely different function (three-way range dispatch, deliberate missing
  return). Ten seconds of checking; the failure mode is silently burning
  attempts on something that only looks like its neighbour.
- **Unclaimed and near-free right now:** `sub_0803CAF0` (offset 0x08) and
  `sub_0803CB0C` (offset 0x00) sit between `sub_0803CAD4` and `sub_0803CB24` in
  `asm/code-0801D390.s` and are 28-byte getters of the same template.
- The inferred argument count in a stub is a **floor**, and it can also read
  *low*: the inference counts a read-modify-write of r0 as a write, so
  `sub_0801B768` was reported as taking no arguments while opening with
  `adds r0,#1`. Check r0-r3 use yourself regardless of what the stub says.
- A struct passed by value occupies two consecutive registers and is
  indistinguishable from two arguments by register use alone.
- **The stub's return type carries no information at all** — it is `int`
  unconditionally. Several functions scaffolded as `int f(void)` are `void`, and
  one was `struct UnkVec f(s16)`. Settle it from a caller instead: `get_function`
  on one and see what happens to r0 after the `bl`.
- **No sign extension on an argument used arithmetically means `int`, not
  `s16`.** `sub_0801B768` with `s16` compiled four bytes longer, carrying a
  `lsls #16; asrs #16` the original does not have.
- To settle a return type: `get_function` on a caller and see what happens to r0
  right after the `bl`.

---

## Known blocked functions

Both are semantically correct and blocked on register allocation. That is what
`decomp-permuter` exists to brute-force, and it is wired up:

```
python tools/permute.py sub_08063980 --seconds 600 -j 6
```

It starts from `work/<fn>/best.c`, searches, and re-checks every result with
`trymatch` — the permuter's own score diffs objdump text, which is weaker than
byte equality, so it is a search signal and not a verdict. See `vendor/README.md`.

| function | best | obstacle |
|---|---|---|
| `sub_08063980` | 80% | `orrs r1, r0` vs `orrs r0, r1`. 14 source forms tried — pointer locals, separate result variables, `u8`/`u16`/`u32`/`s16`/`int` parameters, multiply instead of shift, casting the shift, reordering operands, hoisting the shift. All produced the same. GCC coalesces the result into the parameter's register because the parameter is dead after the shift. |
| `sub_08001158` | 88.2% | 8 bytes. The original computes `y * 2` before loading the `0x417A` pool constant, killing `y`'s register early so both pool constants land in r4. Hoisting the multiply naively regresses to 29%. |

**decomp-permuter has been tried on both and failed**, at ~100,000 and ~84,000
iterations. It matched `sub_080308B4` at iteration 134, so a three-orders-of-
magnitude gap is evidence rather than bad luck: the permuter rearranges the AST
it is given, and if no rearrangement of this source reaches the answer, more
iterations will not help. For `sub_08063980` in particular — 14 hand-written
forms and ~100k generated ones all emitting `orrs r0, r1` — the thing to change
next is the **type model**, not the expression shape.

Also worth knowing before reading a permuter run's numbers: its score and byte
equality are not monotonically related. On both of these its best-scoring
candidate was a byte-level regression (80% -> 75%, 88.2% -> 55.9%).

`sub_080308B4` was the third, at 96%, and is now **matched** — decomp-permuter
found it on iteration 134 of its first run. See the address-taking rule under
`-fforce-addr` above; the fix was moving one assignment out of a declaration.

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
- `gUnknown_03001FE8` — `src/decomp/c_080122EC.c:12` says `extern u16`;
  `c_08013C54.c` needs `struct BgCnt` (char_base at bits 2-3, proved by
  `lsls #28; lsrs #30` then `<<14` added to `0x06000000`).

**Expect eleven more of these.** `c_080122EC.c` declares **13** globals as bare
`extern u16` in one block, including both of the above. The shared header will
have to reconcile all thirteen at once rather than one at a time, so it is worth
typing them together rather than discovering each through a conflict.

---

## Data models worked out so far

```c
/* 0x60 = 96 bytes, exactly 30 entries (proved from a loop bound).
   FIVE different views of this exist across src/decomp/ -- use the merged one:
     unk00 non-zero = slot in use, and a lookup key (sub_08015BD0 scans it)
     unk08 cleared by sub_08015C30
     unk26 indexes into gUnknown_0200E438
     unk38 set to 1 by sub_08029FC4                                       */
struct UnkBar {
    u32 unk00; u8 filler_04[4]; u32 unk08; u8 filler_0C[0x1a];
    u16 unk26; u8 filler_28[0x10]; u16 unk38; u8 filler_3A[0x26];
};
extern struct UnkBar gUnknown_03001470[30];
extern s16 gUnknown_03001FBC;   /* current index; s16, proved by ldrsh */

/* The {u16;u16} pair needs a union where a caller compares one as a word:
     gUnknown_03003F24 live/scratch, gUnknown_03003100 committed source,
     gUnknown_030044A4 backup. The call sequence
        bl sub_0802C57C; bl <work>; bl sub_0802C594
   appears 7+ times -- save, work, restore. */
union Unk802C57CBuf { struct Unk802C57C pos; u32 raw; };

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

/* struct UnkVec is a real named aggregate, not two loose words -- it is passed
   by value, returned by value and assigned whole. Accessors on UnkFoo:
     unk30 (UnkVec)  08015608 set-by-value, 0801566C get-via-pointer,
                     08015638 return-by-value
     unk3c (u16)     080157A4 set, 080157D0 get
     unk3e (u16)     080157F4 set                                        */
struct UnkVec { u32 unk00; u32 unk04; };

/* 0x0200C528 -- 0x18-byte entries, >= 10, indexed by s16.
   +0x00 pointer, non-NULL = slot in use (sub_08019260 scans 0..9)
   +0x04 pointer to a list node whose `next` is at node+0x04;
         sub_08018BAC does p->unk04 = p->unk04->unk04 (advance) */

/* 0x0200F920 -- stride 0x88, >= 6 entries, fully accounted for:
   +0x00 8 bytes unknown, +0x08 array[32] of 4-byte entries whose u16 at +0
   sub_0801F114 ORs to all-ones across all 6*32 (a mark-everything init) */

/* 0x03002B80 -- a single struct, not an array. +0x0000 u8 flag set to 1,
   +0x0358 u16 set to arg+1 by sub_0801B768. At least 0x35a bytes. */

/* 0x08499598 -- ALSO reached with a second, wider layout. Four files had four
   different views of this struct before one agent merged them; the merged
   version below is verified (both its functions still match against it), but
   src/decomp/ still carries the per-file variants. Reconcile these together
   with the 13 `extern u16` globals above when the shared header lands, not
   piecemeal -- a partial merge just creates a fifth variant.
     +0x1E u8  bool-ish (sub_0804415C)   +0x20 u32 (sub_08044094)
     +0x24 u8  written 0 (sub_0804438C)  +0x25 u8  (sub_08044374)
     +0x31 u8  set to 1 (sub_0802C154)
   Entry size 0x3C, proved by `lsls #4; subs; lsls #2` (x*15*4) in all four. */

/* 0x08499598 -- pointer to 0x3C-byte records; index is (i<<4 - i)<<2.
   +0x13 u8 (written with +0x14)   +0x14 u16 from gUnknown_03004080
   +0x1b u8 guard                  +0x3a u8
   sub_080266DC(u8) is the predicate `unk1b && !unk14`.
   Distinct from gUnknown_08499590, the 0x0A22/0x417A screen struct. */

/* Four more instances of the {u16;u16} coordinate pair:
     030033E4 set from (x,y);  030033E0 the same pair <<4 (subpixel)
     03004090 current, stepped +-1 per frame toward  030032C4 target  */

/* 0x0849957C -- ROM pointer to a 0x400-entry tilemap (bound proved by
   `cmp r2,#0x3ff; bls`). NOT const: re-ldr'd every loop iteration. */

/* UnkFoo (gUnknown_0200E438, stride 0x4c) -- accessor family, now complete
   enough to guess siblings by offset:
     unk04/unk08 u32   set together from unk48[] (080156FC)
     unk14/unk18 s32   (s16 arg) << 8, i.e. 8.8 fixed point x/y (0801D96C)
     unk1c u16         zeroed (080156FC)
     unk30 UnkVec      08015608 set, 0801566C get-via-ptr, 08015638 return
     unk3c u16         080157A4 set, 080157D0 get
     unk3e u16         080157F4 set, 08015820 get
     unk40 s16         080158D4 set, 08015900 get -- SIGNED, the getter's
                       trailing `ldrsh` makes this non-negotiable
     unk44 u32         08015928
     unk48 u32 *       pointer to 4-byte elements
   Note 0801D96C indexes gUnknown_0200E438 DIRECTLY by its argument, while the
   08015xxx accessors go through gUnknown_03001470[a].unk26. */

/* struct BgCnt mirrors -- FOUR known so far, each with its own tilemap pointer
   and its own charblock base:
     gUnknown_03002B6C, gUnknown_03001FE8, gUnknown_030030B4 (+ one in
     title-screen.c). gUnknown_030030B4 pairs with u16 *gUnknown_08499580 and
     lives at 0x0600D800, not the 0x06000000 the others use.
   All are non-const tilemap pointers, re-ldr'd every loop iteration. */

/* 0x0200C420 / 0x0200C500 -- u32[2] save/restore pair, 08016E74 saves and
   08016E8C restores. Same idiom as 0x03003F24 / 0x030044A4. */

/* 0x020280C0 -- RAM, 0x1C entries, indexed by u8. NOT a pointer: the symbol
   address is added directly. +0x13 u8. */
/* 0x0849CD88 -- ROM, 0x24 entries, indexed by u16. +0x14 u32. */
/* 0x085D5ABC -- ROM, 0x5C entries. +0x1E is a [2][0x1A] byte table reached as
   unk1E[c][b] with all three indices variable. 10 trailing bytes unaccounted. */
/* 0x08090EAC -- ROM s16 array; sub_08035AE8 indexes it with (a & 1). */
/* 0x0200F720 -- stride 0x10, plain int index. +0x06/+0x08/+0x0a u16 set
   together: a 3-component tuple, not a coordinate pair. */
/* 0x08499594 -- pointer to >=256 records of stride 0x0C; +0x00 u8 cleared by a
   mark-all-free init paired with u16 gUnknown_030032C0 reset to 0. A THIRD
   distinct ROM pointer alongside 08499590 (screen) and 08499598 (0x3C). */
/* 0x0810E6E0 -- ROM table, stride 0x20, indexed by (Unk08499598.unk1a - 1);
   1-based, so 0 means "none". */
/* 0x03003FC0 -- +0x43..+0x46 u8 initialised to 0,1,2,3: an identity
   permutation over 4 slots (player/team order). At least 0x47 bytes. */
/* 0x03002B4C = 0xf0 and 0x03002B44 = 0xa0 -- u8 screen-extent pair (240x160),
   reset with u8 gUnknown_03002B40 and gUnknown_03002EFC zeroed. */

/* The Unk02028030 setter template is as free as the getter: the getter's
   four-statement address computation plus one local for the shift.
     u32 bit = id & 7;
     *p = (*p & ~(1 << bit)) | (value << bit);
   Four spellings of that last line compile byte-identically. */

/* two copies of a 16-entry pointer-list idiom */
extern void *gUnknown_03002FA0[16];      /* list A */
extern volatile u16 gUnknown_030030E8;   /* list A count, capped at 16 */
extern void *gUnknown_03000000[16];      /* list B */
```

`BLEND_EFFECT_ALPHA/BRIGHTEN/DARKEN/NONE` are referenced by macros in
`hardware.h` but never defined anywhere. Literals 2 and 3 are brighten/darken.
