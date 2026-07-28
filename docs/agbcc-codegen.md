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
| `ldrb` | `u8` — **or an `s8` object read in a `u8` context**, see below |
| `ldrh` | `u16` |
| `ldrsh` | `s16` **object** (not a cast) |
| `ldr` | `u32` or pointer |
| `lsls #16; lsrs #16` | `u16` truncation |
| `lsls #24; lsrs #24` | `u8` truncation |
| `lsls #16; asrs #16` | `s16` |
| `ldrb; lsls #24; asrs #24` | `s8` **object** (not a cast) — the byte twin of the `ldrsh` row |
| `lsrs #3` vs `asrs #3` | index is `u32` vs `int` |
| `lsls #a; lsrs #b`, `a+b != 32` | **bitfield read.** Plain `(x >> 2) & 3` compiles to three instructions (`lsrs; movs; ands`); the two-instruction double shift only comes from GCC's `extract_bit_field`. Load width gives the bitfield's base type. |

Scaled index `lsls #1; adds; lsls #5` = `x * 96` — an array of 96-byte structs.
Model unknown regions with explicit `u8 filler_XX[N];`.

**Signedness is a property of the object, and must be settled across every
access in the ROM — never from the function you are matching.** A bare `ldrb`
does *not* prove the object is unsigned: read an `s8` through a `u8`-typed
expression and the truncation cancels the extension. The same byte, at +1 of
`gUnknown_03003F30`:

```
sub_0803BB44:  ldrb r0,[r0,#1]; lsls #24; asrs #24   <- s8 object, int context
sub_0803BC7C:  ldrb r0,[r0,#1]                        <- s8 object, u8 context
```

If *any* access sign-extends, the object is signed and every bare-`ldrb` reader
is a `u8`-returning accessor of a signed object. Note also that the extension
comes from the object, not the return type, so `s8 f(void)` and `int f(void)`
returning the same global are byte-identical — a function's return type is not
recoverable here. **"Here" means a leaf ending in a bare `bx lr`.** If the
function pushes `lr`, the register its epilogue pops into settles void vs
non-void outright (`pop {r0}` = void, `pop {r1}` = returns a value); see the
Workflow section. And arithmetic after a `ldrb` with *no* trailing
`lsl #24; lsr #24` proves the return is wider than the load — a `u8` return
re-narrows, an `int` return does not (`sub_08042DCC`).

**`ldrb` does not even prove the object is a byte.** A `u8`-returning read of a
**word** global narrows to `ldrb` on the clean pool word, because agbcc folds
the truncation into the load. `sub_080846F4` is `u8 f(void) { return g; }` where
`g` is the `u32 gUnknown_03005968` that five other functions load with `ldr` and
test as a whole word. So a lone `ldrb` accessor constrains the *accessor's*
return type and nothing about the global; settle the width from the widest
access in the ROM, the same way you settle signedness. The same fold applies to
`ldrh` on a word.

**A setter's argument width is recoverable — but only upward.** agbcc narrows
the incoming register whenever the *parameter* is narrower than the
*destination*, because an argument register's upper bits are undefined on entry
and the store's own truncation does not save it:

| store | parameter | prologue |
|---|---|---|
| `strb` | `int` / `u8` / `s8` / `u16` | **none — all four identical** |
| `strh` | `int` / `u32` / `u16` / `s16` | none |
| `strh` | `u8` / `s8` | `lsl #24; lsr #24` / `lsl #24; asr #24` |
| `str` | `int` / `u32` | none |
| `str` | `u8` / `u16` / `s16` | `lsl #24; lsr #24` / `lsl #16; lsr #16` / `lsl #16; asr #16` |

So a bare `strh` setter proves the parameter is **at least 16 bits** and cannot
distinguish `int`/`u32`/`u16`/`s16`; a bare `str` setter proves 32-bit; and a
bare **`strb` setter proves nothing at all** — that row belongs with the other
"not worth an attempt" entries.

**Exception, and it is the one case where a `strb` setter *does* recover the
parameter width: a `volatile` destination.** A volatile QImode MEM cannot be
combined into, so the parameter's zero-extension survives instead of being
folded away:

```c
void b1(int a, u8  b){ u8 *p = (u8 *)g;                   p[a & 0x3FF] = b; } /* strb, no narrowing  — 20 bytes */
void b2(int a, u8  b){ volatile u8 *p = (volatile u8 *)g; p[a & 0x3FF] = b; } /* lsl#24;lsr#24;strb — 24 bytes */
void b3(int a, int b){ volatile u8 *p = (volatile u8 *)g; p[a & 0x3FF] = b; } /* no narrowing       — 20 bytes */
```

So **`lsl #24; lsr #24` in front of a `strb` means the parameter is a narrow
type *and* the destination is volatile** — both, and neither alone. Ruled out as
alternative causes, all byte-identical to `b1`: `int`/`u16`/`u32`/`s8`
parameters, `b & 0xFF`, `(u8)b`, a `u8` local temp, and a `u16 *` base cast.
There is a 4-byte size signal, so it is cheap to spot once you know to look;
`sub_0801DF74` is unmatchable without it.

**Free extra discriminator: the pool `ldr` moves with the *sign* of the
narrowing.** Unsigned narrowings put `ldr rN,=gSym` *after* the shift pair,
signed ones *before* it:

```
u8  -> strh : lsl #24 ; lsr #24 ; ldr r1,=g ; strh
s8  -> strh : ldr r1,=g ; lsl #24 ; asr #24 ; strh
```

Same instructions, same registers, same length — only the address load moves. On
a near-miss where that is the only diff, flip the parameter's signedness first.

**Parameter narrowing also happens at the point of *use*, and collides with
return narrowing.** `int f(u16 a){return a+1;}` re-narrows at the use site
(`lsl #16; lsr #16; add`) because agbcc does not assume the caller did it. The
trap: `u16 f(int)` and `u16 f(u16)` are byte-identical when the body is just
`return a` — the shift is the return narrowing in one and the parameter
narrowing in the other. `sub_08021D08` is exactly this and has no callers, so
its signature is a coin flip.

**A clean pool word plus a non-zero displacement proves the symbol names an
aggregate.** This is the sharpest tool for finding a global whose declared type
is too narrow:

| codegen | source |
|---|---|
| `.4byte gSym` + `strb r0,[r1,#0x1]` | `gAggregate.member` at +1, or `gArray[1]` |
| `.4byte gSym+0x1` + `strb r0,[r1]` | `(&gScalar)[1]`, `*((u8 *)&gScalar + 1)` |

Pointer arithmetic off a *scalar* always sinks the constant into the
relocation, so a neighbouring byte is simply unreachable from a scalar
declaration. A clean pool word with a runtime displacement is therefore proof
that the header's type for that symbol is wrong, not merely narrow — that is
what forced `gUnknown_030030F0` from `s8` to a 3-byte struct. Struct vs array
is then settled separately, by whether any function indexes it with a variable.

**The return-side twin: an 8-byte function that is only `ldr r0,=gSym; bx lr`
returned an *address*.** `return arr;`, `return &arr[0];`, `return (void *)arr;`
and `return &scalar;` all give exactly that; only `return scalar;` adds the
dereference. So a scalar declaration of that symbol is wrong unless the original
wrote `&g`. This is what typed `gUnknown_080D3FE4` and `gUnknown_080913BC` as
arrays rather than scalars.

**A lone pool-loaded constant where a `movs` would have done is a float.**
`return 0;` and `return (void *)0;` both give `movs r0, #0`; only `return 0.0f;`
puts a zero in the literal pool. agbcc annotates the word `@ float 0.0` in its
own output, so `compile_probe` labels it for you. A `double` return is the
two-register `thumb_load_double_from_address` pair — the *same shape* as the
8-byte struct assignment above, so check for the `@ double` annotation before
reading one as a struct copy. `sub_0801DA78` is `float f(void) { return 0.0f; }`
and is, as far as anyone has found, the first float in the tree.

Note both of these qualify "the stub's return type carries no information" and
"a function's return type is not recoverable here". Those hold for the integer
widths. A pool-loaded constant *forces* `float`, and nothing else reaches it.

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

**`subs rD,rA,rB` followed by `asrs rD,#N` is a pointer difference** — `p - gArray`
with a 2^N-byte element. Four spellings, one probe:

| source | codegen |
|---|---|
| `p - gArray`, element size 8 | `sub; asr #3` |
| `(a - b) / 8` on signed `int` | `sub; cmp #0; bge; add #7; asr #3` |
| `(a - b) / 8` on `u32` | `sub; lsr #3` |
| `(a - b) >> 3` on signed `int` | `sub; asr #3` — **identical to the pointer form** |

The signal is the **absence of the `+7` bias correction**: no rounding fixup
rules out `/` on a signed int outright. It does *not* separate `p - q` from an
explicit `>>`, so do not spend an attempt trying. Bonus — the `asr #N` gives the
element stride for free, which is how `sub_0803F5D4` confirmed
`struct Unk02028360` is 8 bytes independently of the header.

**Binding the base pointer shows up in the pool word order, not the length.**
The base-`ldr` rule applies to a bare cast-and-mask accessor, not just to
`g[i].member` on a struct array:

```
((u8 *)g)[a & 0x3FF]            ->  ldr r1,=0x3ff ; and ; ldr r0,=g   ; add ; ldrb    pool: 0x3ff, g
u8 *p = (u8 *)g; p[a & 0x3FF]   ->  ldr r2,=g     ; ldr r1,=0x3ff ; and ; add ; ldrb  pool: g, 0x3ff
```

Same length, same instruction count — **only the pool word order differs.**
`*((u8 *)g + (a & M))` behaves as the inline form, `*(p + (a & M))` with `p`
bound as the bound form, and adding a local `int i = a & M;` changes nothing on
top of binding the base. `sub_0801DF60` turned on exactly this.

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

**`orr` operand order: `volatile` on the first operand flips it.** This is the
counterpart to the aggregate-member `|=` rule under Bitfields, and it is the
part that rule was missing. agbcc ties the OR's destination to whichever operand
is *first in the RTL*, and combine canonicalises a commutative operator by
putting the more complex operand first — so a plain register first and a
non-register expression second gets **swapped**, and the destination moves to the
second operand:

```c
v = *(vu8 *)A;  v |= a << 8;   /* orr r0, r0, r1 -- dest = the shift  */
v = *(u8  *)A;  v |= a << 8;   /* orr r1, r1, r0 -- dest = the load   */
```

Two bytes apart, same length, and only the ROM hash notices. The volatile load
cannot be folded into the OR, so it stays a bare `REG` and loses the
canonicalisation; the plain load folds to `(zero_extend (mem:QI))`, which is not
a bare object and therefore does not trigger the swap. **So `orr` with the
second operand's register as the destination is *not* proof of a struct or union
member** — a `volatile` first operand does it too, and that is what
`sub_08063980` turned out to be. Check both before concluding.

The practical form: when a diff is only the destination of an `orr`, **toggle
`volatile` on the operand being read** before trying anything else. This was
worth ~184,000 permuter iterations across two functions.

**Beyond that, no source form found controls an `orrs` destination.** Fourteen
hand-written spellings and ~100k generated ones — pointer locals, separate
result variables, `u8`/`u16`/`u32`/`s16`/`int` parameters, multiply instead of
shift, casting the shift, reordering the operands, hoisting the shift into its
own statement — all compiled identically. Operand order in the *source* is not
one of the knobs; the qualifier on the load is.

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
2. **A variable index with a word access — but only in the `g[i].member`
   spelling, and only for an ARRAY global.** For `gArray[i].member` the constant
   offset folds into the displacement for `ldrb`/`ldrh` and hoists onto the base
   for a word, even where the displacement is legal and correctly scaled. Proved
   on one struct, stride 0x24: `u8` at 0x14 and `u16` at 0x16 fold, `u32` at
   0x1C hoists.

   > **Everything in this rule is about `extern struct T g[];`. A *pointer*
   > global never hoists.** `gUnknown_08499598[a1].unk20 = a2` on
   > `extern struct T *g;` is a plain subscript with a word member at +0x20 and
   > it *folds*: `ldr r2,=g; ldr r3,[r2]; ...; str r1,[r2,#0x20]`. Structural,
   > not incidental — a pointer global's base arrives from a deref rather than
   > from a relocated symbol address, so the "add onto the base" path never
   > opens. A large fraction of this header's globals are pointers, so check
   > which kind you have before using the table or its contrapositive.

   **The hoist belongs to the spelling, not to the width.** Six spellings of a
   word member at +4 of an 8-byte array element give four outcomes:

   | codegen | source |
   |---|---|
   | `ldr rB,=g; lsl rI,#3; add rB,#4; add rI,rI,rB; ldr [rI]` — **hoisted** | `g[i].m`, and only this |
   | `lsl rI,#3; ldr rB,=g; add rI,rI,rB; ldr [rI,#4]` — folded, base `ldr` *after* the shift | `(&g[i])->m`, `(g+i)->m` |
   | `ldr rB,=g; lsl rI,#3; add rI,rI,rB; ldr [rI,#4]` — folded, base `ldr` first | `T *p = &g[i]; p->m`, `T *p = g; p[i].m` |
   | `.word g+0x4` in the pool, no runtime add | `((void **)g)[i*2 + 1]` |

   So every *arrow* spelling folds, with no pointer local required — the earlier
   claim that this needs `p->member` "through a plain pointer" was too narrow.
   Read backwards: **a folded word displacement on an array global proves the
   source did not write `g[i].member`.** And within the folding group, binding a
   pointer local moves the base `ldr` to the front, whether you bind the element
   or the base. Note that contradicts the "binding the element does nothing"
   line in the pointer-global section below — that holds for *pointer* globals;
   for an **array** global, binding the element moves the load.

   **Why this one is expensive:** hoisted is 5 instructions, folded is 4, and
   after `.align 2` and the pool word *both land at 16 bytes*. No size signal at
   all — same failure class as the `|=` operand swap.
3. **More than one variable term.** A *byte* access hoists too once the address
   has two or more variable parts. `base + 0x1E + b + 0x1A*c + 0x5C*a` puts the
   0x1E on the base despite `ldrb` having room for it.

So the offset folds into the displacement only when the address is
(one scaled index) + base + constant **and** the access is byte or halfword.
Anywhere else, the plain subscript already produces the add and it says nothing
about the source.

**What decides the pool-fold: how the constant reaches the address
expression.** It folds when it arrives as an **addend on a pointer value**; it
does not fold when it arrives as a **member offset of an aggregate type**.
Eleven spellings under the real CFLAGS give three outcomes, and they are
diagnostic:

| codegen | source |
|---|---|
| `.4byte g+0x20`, no runtime add | `((u8*)g)[i+0x20]`, `((u8*)g)[0x20+i]`, `u8 *p = (u8*)g + 0x20; p[i]`, `*((u8*)g + 0x20 + i)` |
| `ldr rB,=g; add rB,#0x20; add rI,rI,rB` — add on the **base** | `gStruct.unk20[i]`; `s = &gStruct; s->unk20[i]`; `u8 *p = (u8*)g;` **`p += 0x20;`** `p[i]` |
| `ldr rB,=g; add rI,rI,rB; add rI,#0x20` — add on the **index** | `u8 *p = (u8*)&g; p[i+0x20]` |

Two consequences, both of which this file previously had backwards. A folded
pool word (`.4byte gSym+0x12`) is evidence the source did **not** go through a
struct member — the member spelling reliably *suppresses* the fold, so it is
not evidence that the source took the member's address. And for a
**struct-typed global**, splitting `u8 *b = s->unk10;` out first changes
nothing: direct, via-pointer-local and bound-out all emit identical code. That
splitting rule applies to *pointer*-typed bases only. Note the third row: for
the pointer case a `+=` in a **separate statement** escapes the fold, while the
same arithmetic inside one expression does not.

**With split declarations, agbcc emits setup instructions in source-statement
order.** Same instructions, same registers, three positions for one `mov rN,#0`:

| source | where the `mov #0` lands |
|---|---|
| `u32 v = 0;` as an initialiser, before the pointers | first, ahead of the base `ldr` |
| no `v` — store the literal directly | last, after the cursor computation (loop-invariant motion drops it in the preheader) |
| `base = g; v = 0; p = base + 4;` as three statements | second, exactly where the source puts it |

An initialiser and an assignment are **not** interchangeable for scheduling.
This is more general than the `-fforce-addr` section's "splitting the
declaration from the assignment matches" note, and has nothing to do with
`-fforce-addr`; it decided `sub_08078740`.

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

The discriminator is narrower than that left column suggests: binding the
**deref** hoists the load, binding the **element** does nothing.

```
T *b = g; &b[i]   -> ldr r1,=g ; ldr r1,[r1] ; lsl r0,r0,#3 ; add r1,r1,r0 ; add r0,r1,#0
&g[i]  /  g+i     -> ldr r1,=g ; lsl r0,r0,#3 ; ldr r1,[r1] ; add r1,r1,r0 ; add r0,r1,#0
T *p = &g[i]; p   -> identical to &g[i]
```

So for a *pointer* global, the "binding an element address is a diagnostic"
warning above does not apply — it is a no-op there, and only binding the deref
moves anything. Also: the trailing `adds r0, r1, #0` is inherent to all four
spellings — the address lands in the index-add's destination and agbcc moves it
to r0. `sub_080413A4` is 16 bytes for what looks like 12 bytes of work. Do not
read that redundant move as a wrong return type or a wrong form; nothing
removes it.

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

**Binding the scaled index moves the `lsls` ahead of the address setup.** For
`*(u16 *)(base + C + i*2)` with `base` a pointer local and `C` a pool-sized
constant, every inline spelling loads the constant first; binding the scaled
index to a local emits the shift first, and that changes which register each add
lands in:

```
rows[y]  /  ((u16 *)rows)[y]      ldr rC,=C ; add rB,rP,rC ; lsl rI,rY,#1 ; add rI,rI,rB
t = y*2; *(u16 *)(rows + t)       lsl rI,rY,#1 ; ldr rC,=C ; add rB,rP,rC ; add rB,rB,rI
```

Same four instructions, same length. **Tell:** which register the index add
writes — the index's register means inline, the base's means the index was
bound. A second tell is the pool constant landing in the register that held the
index parameter, which is only free because the shift already consumed it.
This decided `sub_08001158`.

Do not confuse this with the `p += C` rule in the fold table above. Splitting
`rows = p + C` into `rows = p; rows += C;` was tried here and changes **nothing**
— for a base that is already a pointer *local* rather than a pointer *global*,
both spellings emit the add on the base either way. Only the index binding moves
anything.

**`mul r0,r0,r1` and `mul r0,r1,r0` are the same THUMB encoding** (`MUL Rd,Rm`).
agbcc prints one, the target assembly prints the other. Not a diff.

**`add rD, rD, #imm` and `adds rD, #imm` are likewise the same encoding**, and
that holds even for immediates ≤ 7 where a 3-bit `ADD Rd,Rn,#imm3` form also
exists. agbcc prints the three-operand spelling, the target the two-operand one.
Not a diff — do not second-guess an otherwise-correct function over it.

**A caller's `strh r0, [rN]` on a `bl` result says nothing about the callee's
return type.** The narrowing belongs to the caller. `sub_08029234` stores
`sub_08041398`'s result as a halfword, but `sub_08041398` is `ldr r0,[r0]` with
no truncation, so both the global and the return are 32-bit. A `u16` return
would carry `lsls #16; lsrs #16` *in the callee*. This is the store-side twin of
"the extension comes from the object, not the return type".

**`s->member = 0` through a struct, `((u16 *)p)[0x32] = 0`, and
`*(u16 *)(p + 0x64) = 0` are byte-identical.** So a function like
`sub_0804129C` or `sub_08049170` cannot be told apart from a raw-pointer
original; the struct spelling is *a* correct answer, not provably *the* one.

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

**A third of these:** for `sub_08014074`, `s8` fields, `u8` fields written with
`0xFE`, and a bare `u8 *` parameter indexed `p[0x3a]`/`p[0x39]` all compiled
byte-identically.

**Consecutive bitfield writes to one global collapse** into a single
load/store chain. Separate stores to the same address mean the source had
something between them.

`get_best_mode` picks the narrowest mode containing the field, so a 5-bit field
at bit 0 would be QImode — `ldrb`, not `ldrh`.

**The bitfield container type does NOT set the load width.** This doc asserted
the opposite for six waves — that `u32 priority : 2` reads with `ldr`, `u16`
with `ldrh`, `u8` with `ldrb`. That is false, and it was the more confidently
stated of two rules here that contradicted each other. Settled in wave 7 by a
controlled probe holding the field position fixed and varying only the
container:

| container | field | emitted |
|---|---|---|
| `u32` | 2 bits @ bit 0 | `ldrb [r3]` / `strb [r3]` |
| `u16` | 2 bits @ bit 0 | `ldrb [r3]` / `strb [r3]` — identical |
| `u32` | 1 bit @ bit 8 | `ldrb [r3,#1]` / `strb [r3,#1]` |
| `u16` | 1 bit @ bit 8 | `ldrb [r3,#1]` / `strb [r3,#1]` — identical |
| `u32` | 6 bits @ bit 6 (spans a byte) | `ldrh` / `strh` |
| `u16` | 6 bits @ bit 6 (spans a byte) | `ldrh` / `strh` — identical |

Pure reads are `ldr` plus the same shift pair for `u8`, `u16` and `u32` alike.

So `get_best_mode` above is the whole story: the access width comes from the
**field's own bit range** — inside one byte gives `ldrb`, crossing a byte
boundary gives `ldrh` — and the declared container is irrelevant to instruction
selection. Container width still fixes struct layout and `sizeof`, so it is not
a free choice; it simply cannot be inferred from the access instruction, in
either direction. **A bitfield struct that near-misses on the load width will
not be fixed by changing the container.**

Consequence worth knowing: `struct BgCnt` was widened `u16` -> `u32` on the
reasoning that "the shadows are read a word at a time". Reads are `ldr` for
every container, so that observation discriminated nothing and the change rests
on a false premise. It does not break the ROM, but `struct BgCnt` is all
bitfields totalling 16 bits, so `sizeof` is 2 with `u16` and 4 with `u32` —
which changes `sizeof(union BgCntBuf)` for a shadow that is 2 bytes of real
hardware state. Untested either way; do not treat the `u32` as evidence.

Probe limits, so nobody over-reads this: tested 1, 2, 6 and 16-bit fields at
bits 0, 6, 8 and 9, on globals only. Not tested — bitfields through a pointer
parameter, fields spanning a halfword boundary inside a `u32`, or volatile
bitfields.

**An aggregate-member lvalue is not interchangeable with a scalar one.** Two
ways the difference costs a match. This was first written up as a *union*
effect; it is not. A plain `struct` does it identically, at offset 0 and at
+2, and through a pointer local. The discriminator is aggregate member vs
scalar, and `union` has nothing to do with it.

- ***`|=` swaps its operands.*** `g.member |= 0x80` emits
  `orr const, const, value`; a scalar lvalue emits `orr value, value, const`.
  Two bytes, no size change, so the link succeeds and only the ROM hash
  notices. **This is `|=` only** — `&=`, `^=` and `+=` are byte-identical for
  both forms, with movs-sized and pool-sized constants alike, and casting does
  not change it (`*(u16 *)g |= 8`, `((u16 *)g)[0] |= 8` and `g[0] |= 8` all
  give the scalar form).

  Read the other way this is a **tell, but not a proof**: `orr` with the
  *constant's* register as the destination means the source had a struct or
  union member **or** a `volatile` first operand — see "`orr` operand order"
  under Register-allocation rules, which is the same canonicalisation seen from
  the other side. The member reading is what took `sub_08003934` from a
  near-miss to a match, and why its neighbour `sub_08003948` (`&= ~8`) needed no
  such trick; the volatile reading is what `sub_08063980` was. It is also why
  the three type migrations in wave 5 were byte-neutral: none of them went
  through `|=`.

  **Do not carry the tell across to `&=` by analogy.** The paragraph above
  invites exactly that and it is wrong. `&=` puts the destination on the
  *constant* in **both** forms: `p->unk01 &= 0xfe` through a struct member
  emits `mov r1, #0xfe; and r1, r1, r2` — the same shape that is diagnostic for
  `orr` — and a scalar lvalue emits it too (`sub_0804450C`). For `&=` the
  operand order says nothing about the lvalue. The tell is `|=` only, in both
  directions.

- *The constant gets re-materialised.* A run of `g = 0` stores shares one
  `mov rN, #0`. Change any one of them to `g.raw = 0` and agbcc reloads the
  zero at that point, +2 bytes, padded to +4. `sub_080122EC` grew by four bytes
  this way and shifted 4,172 symbols downstream. This one does not bite when
  the store stands alone or ends a run — `sub_08012358` and `sub_0801237C` both
  match with `.raw`. It bites when the store *interrupts* a run of another
  type, and the fix is to cast at that one call site (`*(u16 *)&g = 0`), not to
  change the declared type of the global.

**In a set/clear accessor pair on one bit, only the *clearing* one tells you
whether the object is a bitfield.** The setters are byte-identical, down to
register allocation:

| source | codegen |
|---|---|
| `s.bit4 = 0` (1-bit field at bit 4) | `ldrb; mov #0x11; neg; and; strb` — 5 insns |
| `gU8 &= ~0x10` (plain scalar) | `ldrb; mov #0xef; and; strb` — 4 insns |
| `s.bit4 = 1` | `ldrb; mov #0x10; orr; strb` |
| `gU8 \|= 0x10` (plain scalar) | **identical to the row above** |

The consequence is the one that costs you: **a matched setter is not evidence
that the scalar model it matched under is correct.** `gUnknown_030020B4` was
declared `u8` and two promoted setters matched under it; they could not have
told you otherwise. `sub_08012A34` clears the bit and cannot match as `u8` at
all — it is the `REG_DISPSTAT` shadow and wanted `struct DispStat`.

**Consecutive bitfield writes share the load/store pair, not the mask
arithmetic.** Two adjacent 1-bit fields in one byte, both assigned zero
back-to-back, give one `ldrb`/`strb` but **two** separate `mov`/`neg`/`and`
triples — the masks are not folded together. Reading a single `and` as two
merged bitfield writes will burn attempts.

**True for two fields; from the third on the masks *are* shared, by `subs`.**
`sub_08049EE4` clears five adjacent 1-bit fields and each constant after the
second is derived from the previous one:

```
ldrb r1,[r2,#1]
mov r0,#2 ; neg r0,r0 ; and r0,r0,r1      bit 0  (~0x01)
mov r1,#3 ; neg r1,r1 ; and r0,r0,r1      bit 1  (~0x02)
sub r1,r1,#2          ; and r0,r0,r1      bit 2  (~0x04)   r1: -3 -> -5
sub r1,r1,#4          ; and r0,r0,r1      bit 3  (~0x08)   r1: -5 -> -9
sub r1,r1,#8          ; and r0,r0,r1      bit 4  (~0x10)   r1: -9 -> -0x11
strb r0,[r2,#1]
```

So the signature to recognise is **two `mov`/`neg` pairs followed by a run of
bare `subs` between the `and`s** — that is N consecutive 1-bit clears at
ascending bit positions, and each position reads off the running negative
constant by the `-N == ~(N-1)` identity below. Worth knowing on sight: the
`SetDispEnable` / `SetWinEnable` / `SetBlendTarget` family all produce it, and
there are many of them.

**Read a bitfield's position and width straight off `mov #N; neg`.** Since
`-N == ~(N-1)`, the cleared bits are exactly the bits of `N-1`:

| encoding | mask | field |
|---|---|---|
| `movs #0x20; rsbs` | `~0x1F` | 5 bits at bit 0 |
| `movs #0xd; rsbs`  | `~0x0C` | 2 bits at bit 2 |
| `movs #0x11; rsbs` | `~0x10` | **1 bit at bit 4** |
| `mov #0x9; neg`    | `~0x08` | 1 bit at bit 3 |

The `0x11` row is the trap: it reads like a two-bit mask clearing bits 0 and 4
and is not one. Note also that `mov #N; neg` is the tell only where a bare
`movs` would have sufficed — storing `-2` through a plain `s8` lvalue gives
`mov r1, #0xfe` with no `neg`, because the store is QImode and the constant
narrows before it is materialised. That carries no bitfield signal at all.

**The `mov #N; neg` tell is confirmed for the AND side, and it is the *only*
side that carries a signal.** One probe, one field, all four spellings:

| source | codegen |
|---|---|
| `s.bit4 = 0` (1-bit field at bit 4) | `ldrb; mov #0x11; neg; and; strb` — **5** |
| `gU8 &= ~0x10` (plain scalar) | `ldrb; mov #0xef; and; strb` — **4** |
| `s.bit4 = 1` | `ldrb; mov #0x10; orr; strb` |
| `gU8 \|= 0x10` (plain scalar) | `ldrb; mov #0x10; orr; strb` — **byte-identical** |

So for a set/clear pair of accessors on one bit, **only the clearing one tells
you whether the object is a bitfield**; the setting one is byte-identical either
way, down to the register allocation. Read the pair together and let the AND
decide the type for both. This is stronger than the "an OR-only store is not
evidence of a bitfield" note above, which only said the OR is ambiguous across
*different* objects — it is ambiguous for the *same field*, so a matched setter
is not evidence that a scalar model is right.

Worked example, four adjacent functions on `gUnknown_030020B4`: `sub_0801295C`
(`|= 8`) and `sub_08012A24` (`|= 0x10`) both match against the header's plain
`u8`, and `sub_08012A34` (`movs #0x11; rsbs`) and `sub_08012AD4`
(`movs #9; rsbs`) cannot. The object is a bitfield struct and the two setters
simply could not say so. See the `gUnknown_030020B4` entry in Data models —
it is `struct DispStat`, which `hardware.h` already defines.

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

**But a *descending* pointer compared against the array base is a genuine
reverse loop, and the branch condition says so.** Pointer comparison in C is
unsigned, so a **signed** conditional branch between two address registers can
only come from the source casting them to a signed integer type:

- `bcs`/`bcc` between addresses — a real pointer compare, `p >= base`
- `bge`/`blt` between addresses — `(int)p >= (int)base`

Nothing else produces the signed form. Roughly thirty spellings were tried
against `sub_08078740`: `p >= base`, `p - base >= 0` (two extra instructions,
it computes the difference), and every index-loop form — `for (i = 4; i >= 0;
i--)`, `do/while`, `while (i-- > 0)`, bounded array, struct member, `register
int`, ascending counter with descending pointer, comma-operator dual induction
— all keep a separate counter and compare against zero. Biv elimination never
fires against a static array base.

This was originally hedged as "byte-exact but unusual C; treat it as *a* correct
answer rather than certainly the original's." **Drop the hedge — it is a house
idiom.** Six independent instances now, across three address ranges, differing
in element type (`u32`, `u8`, struct), element count (4, 5, 16) and base
symbol: `sub_08078740`, `sub_0801C1F8`, `sub_0801C6E8`, `sub_0803CB8C`, and two
more recorded on the `Unk03000288` comment in `unknown-globals.h`. Several
matched first try from the recipe alone. Write it without hesitation:

```c
base = g; v = 0; p = base + N;          /* three statements, in this order */
do { p->member = v; p--; } while ((int)p >= (int)base);
```

The three-statement ordering matters — it is what puts the `mov #0` second,
between the base `ldr` and the cursor computation. The recipe is not specific
to `*p-- = v` on a word array; it transfers verbatim to a struct element type.

**`while (n--)` has its own shape:** `subs rN,#1` *before* the loop guard, then
`cmp rN,#-1` materialised as `mov #1; neg`. The post-decrement's `!= 0` test on
the old value is rewritten as `!= -1` on the new one. `while (--n)` and the
`for` forms compare against zero instead. This identified `sub_0808B6E8` as
`memcpy` on sight.

**Varargs: `push {r2,r3}` … `add sp,#8` is agbcc's pretend-args pair, and the
block starts at the register holding the *last named* parameter.** So the named
argument count is the index of the first pushed register **plus one** —
`push {r2,r3}` means *three* named args plus `...`, and `push {r0,r1,r2,r3}`
means one. A function consisting of *only* that pair is a stubbed-out varargs
debug printf, not a function with stack locals: the `add sp` releases the
pretend-args area, not a frame. `sub_08013428` is one, and there are likely
more — free matches once you know the shape.

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

**A load of the store's own address whose destination is never read means the
field is `volatile`.** `s->x++` on a volatile field compiles to
`ldrb r0,[r1]; adds r0,#1; ldrb rN,[r1]; strb r0,[r1]`. Plain fields and
full-width bitfields (`u8 x:8`, `u16 x:8`, `u32 x:8`) all give the clean
three-instruction form; a narrow bitfield (`u8 x:5`) gives a long
extract/mask/merge instead. Worth checking early — it took `sub_080308B4` from
10% to 91% in one edit.

**This is not about `++`, and the earlier "immediately before the store"
phrasing was a bad positional tell.** A plain assignment of a constant does it
too — that is the whole of `sub_08030574`:

```
u16 unk04;            g->unk04 = 5  ->  ldr; ldr; mov #5; strh         (12 bytes)
volatile u16 unk04;   g->unk04 = 5  ->  ldr; ldr; ldrh; mov #5; strh   (16 bytes)
```

With a constant RHS the dead load lands *before* the `mov` that overwrites the
register; with a non-constant RHS it lands immediately before the store, into a
scratch. Position varies — "a load of the address being stored to, into a
register nothing reads" is the reliable form.

**But `volatile` alone does not trigger it. Two conditions, both required:**

1. **The access is QImode or HImode.** `volatile u32` never gets it, at a member
   or at an array element.
2. **The lvalue is an aggregate access** — a member or an array element. A bare
   volatile scalar never gets it, and neither does `*p` through a
   `volatile u16 *`.

| lvalue | dead load? |
|---|---|
| `gPtr->vol_u16`, `gPtr->vol_u8`, `p->vol_u16` (pointer parameter) | yes |
| `gObj.vol_u16`, `gVolU16Arr[i]` | yes |
| `gVolU16Scalar = 5`, `*p = 5` where `p` is `volatile u16 *` | **no** |
| `gPtr->vol_u32`, `gVolU32Arr[i]` | **no** |

Offset is irrelevant. This is a third instance of the **aggregate-member lvalue
is not interchangeable with a scalar one** theme, alongside the `|=` operand
swap and the constant re-materialisation.

**The test is the lvalue's *type*, not its syntax — a subscript can land on
either row.** `gVolU16Arr[i]` above is an array *object*, so it gets the dead
load; `p[i] = v` through a `volatile u8 *` **local** does not, because a
subscript on a pointer-to-volatile is still the `*p = 5` row. Same `[i]`
spelling, opposite outcome. Contrast `sub_0801E17C` (`gUnknown_030024F0[index]
= 0` on a declared `volatile u8[]` global — dead load) with `b2` in the `strb`
exception above (no dead load, only the parameter narrowing). Read "an array
element" as covering both and you will chase the wrong one.

**A volatile store forces the base pointer to be reloaded for the next access.**
Three consecutive volatile member stores through `gPtr` re-emit `ldr r1,[r2]`
between them. A candidate short by exactly the reloads means the *fields* are
volatile, not that the pointer needs `const`.

**`volatile u16 x : 16` is byte-identical to `volatile u16 x`.** Not worth an
attempt; write the plain member.

**Two conditions, both required: the loads are the same width, and the second
one is dead.** Two loads of one address are otherwise unremarkable. `ldrb` plus
`ldrsb` of the same byte is a plain `s8` with no `volatile` anywhere —
`extern s8 g; if (g != 0) g--;` compiles to exactly that, because agbcc will not
CSE reads in different machine modes. The `movs r0,#0` scratch that appears
alongside is just `ldrsb` having no immediate-offset form — **`ldrsh` is the
same**, so the whole of a four-instruction getter
`ldr r0,=g; movs r1,#0; ldrsh r0,[r0,r1]; bx lr` is `return g;` on an `s16`
global and the `movs #0` is not an operand of anything (`sub_08017988`).
`sub_08034F8C` is the
case; a `u8` there collapses to one `ldrb`, and an `s8 a:8` bitfield is
byte-identical to the plain `s8`.

**`const` on the global's declaration makes its load survive intervening
stores.** `extern T *const gFoo;` read by name emits one `ldr` that GCC reuses
across later `strb`/`strh`. Reaching the same object through a pointer
(`const T *p = &g;`, or `T *const *pp; (*pp)->m`) does **not** get this. Read it
off the assembly: a global loaded once and kept live across stores wants `const`
on the declaration; one reloaded at each use does not.

**Strict aliasing is off.** A `u16` store invalidates a cached pointer load
exactly as a `u8` store does.

**But "a pointer live across stores means the source held it in a local" is too
strong — invalidation is per *address computation*, not per store.** A store
kills the cached load of the **global**; it does not kill an element address
already sitting in a register, and consecutive stores through that register need
no reload. `sub_08044178` is three plain `gUnknown_08499598[a1].unkNN = 0;`
statements with no local anywhere:

```
ldr r3,[r4] ; ... ; strb r2,[r3,#0x1e]
ldr r0,[r4] ; add r1,r1,r0 ; strh r2,[r1,#0x26] ; strh r2,[r1,#0x28]
```

The deref reloads once after the `strb`, then stays live across **both** `strh`s.
What actually requires a local is a re-read of the **global** surviving a store —
not a computed address surviving one. Taken as written, the rule sends you
hand-massaging a function that the naive spelling matches first try.

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

- **A near-miss whose only difference is a pool word's relocation may be a
  false mismatch, not a bug in your C.** `asm/` is disassembled output, so a
  pool word holding an address gets symbolized as whichever symbol happens to
  sit at that address. If your source spells the same address a different way,
  the relocation names a different symbol with the difference carried in the
  inline addend, and the linked bytes are identical. `sub_08011B34` was rejected
  at 39 of 40 bytes for this: the ROM relocates against `gUnknown_03000040` with
  addend 0, `gUnknown_03000000 + 16` relocates against the base with addend
  0x40, and `0x03000000 + 0x40 == 0x03000040`. `trymatch.py` now resolves both
  through the ELF symbol table and reports
  `relocs: name different symbols that resolve to the same address`. If you see
  that line, you have a match — stop working. Do not "fix" it; the obvious fix
  (`&gUnknown_03000040` on a symbol declared as a scalar) compiled to 52 bytes.
- **`compile_probe` is free.** Compile candidate C and read the assembly without
  spending an attempt. One agent matched four functions in one `try_match` each
  by probing locally first. Explore with `compile_probe`, spend `try_match` on
  the verdict.
- **`python tools/trymatch.py <fn> --diff` is the same check the MCP tool runs**,
  against the same `work/<fn>/<fn>.c`. Iterating locally and using `try_match`
  only to confirm costs nothing and is how the 0802 cluster was done.
- **Put several variants — or your entire batch of functions — in one probe
  file.** A single compile answers a codegen question that would otherwise take
  five attempts; this is how the `volatile` reload tell and the `-fforce-addr`
  rule above were both isolated. Understated, though: in wave 5 two agents put
  their *whole batch* in one probe, read all eleven against their targets in
  one call, and spent **zero** `try_match` attempts — `trymatch.py` gave the
  verdicts. For a batch of small functions that is the entire job in one call.
- **`work/<fn>/<fn>.c` and `src/decomp/c_<fn>.c` can disagree, and the promoted
  file is the truth.** Drafts of already-promoted functions go stale — most
  carry pre-header local `extern`s and now fail with `conflicting types`. That
  is a leftover, not a regression. Run **`python tools/sync_work.py`** (all) or
  `python tools/sync_work.py <fn>` (one) to refresh the drafts from
  `src/decomp/` before reading anything into a failure there.
- **The ban on local declarations is about *globals*, not about struct types.**
  A struct that only describes a pointer *parameter* — an object no header
  declares — belongs in your `.c`. `c_08012C30.c`, `c_08013D4C.c`,
  `c_08014074.c` and `c_0801C240.c` are the existing convention. Putting such a
  type in `unknown-globals.h` would be wrong: there is no global for it to
  describe.
- **Ask of every global: is it `const`? is the field `volatile`?** The scaffold
  says nothing about either, and both are readable off the assembly by the rules
  above. For the 0802 cluster each was decisive.
- **`include/unknown-functions.h` has ~39 real prototypes.** The scaffold
  surfaces them. They are ground truth and the compiler enforces them —
  disagreeing gives `conflicting types`, not a mismatch.
- **`include/hardware.h` has struct layouts worth reusing** (`BlendCnt`,
  `WinCnt`, `SetWinEnable`, `SetDispEnable`, `ApplyPalette*`). What looks like
  arbitrary masking is often one of these. It also has the serial registers
  (`REG_SIOCNT`, `REG_RCNT`, `REG_SIODATA8` and the rest of the block) with the
  `REG_BASE`/`REG_OFFSET_*` scaffolding — if you need an MMIO address that is
  not there yet, add it in that form rather than casting inline. `vu16` and
  plain `u16` compile identically, so `volatile` costs nothing and is honest.
  The display registers are the exception: they are reached through the
  `gDispIo` RAM shadow, not a `REG_DISPCNT`.
- **`global.h` does not include `hardware.h`.** Include it yourself.
- **Never write an `extern` in your `.c` file** — see "Where the globals live"
  above for the three cases (present and right, present and wrong, absent).
  Adding a local declaration either shadows the shared type or conflicts with
  it, and it is how the tree grew eight incompatible views of
  `gUnknown_08499598` the first time. The header is extended every wave, so a
  global missing from it is not a contradiction; add it there.
- **Grep `src/decomp/` for the globals the scaffold lists, before drafting
  anything.** This ROM is full of template instances — routines duplicated per
  BG layer, per slot, per bit offset. One wave matched `sub_08013C54` by copying
  the promoted `sub_08013C00` and swapping two symbols; another produced
  `sub_0803CB24` from `sub_0803CAD4` with a one-line `sed` and matched first
  try. Where a promoted file already encodes the awkward part of a shape, its
  siblings are nearly free. This grep is higher-yield than reading the assembly.
  **But confirm the assembly really is a template instance before assuming it.**
  There are two distinct failures here, and the second is the one that bites:

  - *Not actually a family member.* `sub_0803CBD8` sits in the bit-accessor
    family by name and address and is a completely different function (three-way
    range dispatch, deliberate missing return).
  - *A genuine family member that still needs work.* `sub_0803CB74` really is one
    of the family, and copying a sibling fails anyway — it differs on two
    independent one-instruction knobs: the **shift kind** (`asrs` for a signed
    `int` index vs `lsrs` for `u32`) and the **presence of the `& 7` mask**.
    Within a family both are independent of the member offset, so diffing the
    symbol and the offset is not enough. Diff the shift and the mask too.

  Ten seconds of checking; the failure mode is silently burning attempts on
  something that only looks like its neighbour.
- **A `push {r4, lr}` in a tiny leaf accessor is a register-pressure readout,
  not a source feature.** It is the loudest visual difference between members of
  one family and it means nothing about the C. Accessors reaching a member at an
  offset (`adds r2, #0x12`) push, because the extra base add keeps one more
  value live; the offset-0 and plain-array-global members of the same family do
  not. Identically shaped source either way. Read as "the original used a temp
  variable" it will cost you attempts.
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
- **...but for any function that pushes `lr`, the epilogue gives the answer for
  free.** The register the epilogue pops into is exactly whether r0 is live:

  ```
  pop {r0} ; bx r0    ->  void
  pop {r1} ; bx r1    ->  returns a value
  ```

  `sub_080443C4` is the case: `return Proc_StartBlocking(...)` gives
  `pop {r1}; bx r1`, and dropping the `return` gives `pop {r0}; bx r0`, which is
  what the ROM has. It is liveness, not a tail call — `int f(int a){ SomeCall(a);
  return 5; }` also pops into r1, with the `mov r0, #5` emitted before the pop.
  It survives a saved-register pop: `pop {r4}; pop {r0}; bx r0` is still void
  (`sub_08044178`). So the "return type is not recoverable" claim, stated twice
  in this doc, holds only for **leaf functions ending in a bare `bx lr`**. For
  anything with a `push {lr}` the void/non-void call is certain and costs
  nothing.
- **No sign extension on an argument used arithmetically means `int`, not
  `s16`.** `sub_0801B768` with `s16` compiled four bytes longer, carrying a
  `lsls #16; asrs #16` the original does not have.
- To settle a return type: `get_function` on a caller and see what happens to r0
  right after the `bl`. Settle a **global's** type from callers too — a
  function-pointer global's setter is byte-identical to a `void *` or `u32`
  one's (`sub_080366C4` and `sub_08037B84` are the same three instructions).
  The evidence is only ever at the call sites: `ldr r0,=sub_XXXXXXXX` at the
  setter, or `bl _call_via_r0` on the loaded value at the reader.
- **Do not reflexively `const`-qualify ROM data globals.** Check whether a real
  prototype in `unknown-functions.h` already takes them non-const — under
  `-Werror` a `const u8 *` breaks `Decompress(u8 *, void *)`. That, not the
  caller, was decisive for `sub_0801F48C`/`sub_0801F494`.

---

## When the assembly is not compiler output

**Check this before drafting anything.** Some of the ROM was never compiled,
and no C will ever match it. These are not hard functions — they are the wrong
kind of thing, and they are actively attractive to a scheduler: tiny, high
fan-in, sitting next to easy matches. Ten of one wave-5 agent's sixteen targets
were in this category.

The known ones are listed in `data/asm-resident.json` with their evidence, and
the index marks them `status: "asm-resident"` so the work queue skips them.
Adding to that list is a claim that needs evidence — "I could not match it" is
not evidence. The tells:

- **Two entry points in one instruction stream.** A `thumb_func_start` whose
  body falls through into a `non_word_aligned_thumb_func_start`, with *both*
  reachable by `bl`. `sub_0806FC08` is a single `ldr r2,[r1,#0x40]` two bytes
  above `sub_0806FC0A`. No compiler emits this.
- **`bx pc; nop` followed by an `arm_func_start` holding one `b`.** A linker
  THUMB→ARM interworking veneer, synthesised when a THUMB `bl` targets an ARM
  symbol. The splitter cuts it at the mode change, so the index reports a
  4-byte "function" that is half of an 8-byte veneer. Six of these sit at
  `sub_080718E8`–`sub_08071910`.
- **A result returned in a register other than r0**, e.g. `sub_0807031C`.
- **Raw `.hword` data inside the instruction stream** the disassembler could
  not decode — `sub_0806F740` is `.hword 0xFF1E`.
- **A unit that is only a `bx r3` tail plus a literal pool** — the split drew a
  boundary mid-function, and the "function" is not one. `sub_0807003C`, and
  `sub_0806FB66`, whose pool word is `0x68736D53` — m4a's `"Smsh"` ID_NUMBER,
  the constant its "caller" `sub_0806F744` compares against.
- **ARM instructions cut out as THUMB, *between* two `arm_func_start`s.** The
  giveaway is a two-instruction unit with no `bx`/`pop` that reads a register it
  never set, sitting in the gap between one `arm_func_start` and the next.
  `sub_0806F9A8` is `movs r0, #4; lsls r0, r4, #0xe` — reassemble those two
  halfwords as one ARM word and you get `0x03A02004`, `moveq r2, #4`, which is
  what the m4a mixer actually executes. Its neighbour `sub_0806F9A4` is the same
  thing. Note this is *not* caught by grepping for `non_word_aligned_...`: both
  are word-aligned and declared `thumb_func_start`. Grep for `arm_func_start`
  and check whether your target lies between two of them.
- **Inter-function alignment padding.** A 2-byte "function" whose whole body is
  `movs r0, r0` — that is the halfword `0x0000` the assembler emits for
  `.align 2, 0` — with zero callers, immediately before a 4-byte-aligned
  `thumb_func_start`. `sub_0802C62A` is padding between `sub_0802C604` and
  `sub_0802C62C`. Not a function, not asm the game runs, nothing to match.

The 0x0806F734–0x0807031C block is the m4a/MP2K sound driver, hand-written
assembly in every GBA game that uses it. `sub_0806F744` loads
`gUnknown_03007FF0` and compares `[r0]` against `0x68736D53` — that is the
canonical `SOUND_INFO_PTR` and m4a's `"Smsh"` ID_NUMBER. This driver is already
solved in other decomps and should be lifted rather than re-derived.

Cheap pre-filter when scoping a batch:

```
grep -n "arm_func_start\|non_word_aligned_thumb_func_start" asm/<file>.s
```

---

## Formerly blocked functions -- all three are now matched

**Nothing in this repo is currently known to be blocked on register
allocation.** The three that were are `sub_080308B4`, `sub_08063980` and
`sub_08001158`; the first fell to decomp-permuter, the other two did not fall to
it at ~100,000 and ~84,000 iterations and then fell to one free `compile_probe`
each once the *type model* changed. Both fixes are recorded above -- the
non-volatile read under "`orr` operand order" and the bound index under
"Binding the scaled index". Neither is reachable by rearranging an AST, which is
why the permuter could not find them and why the iteration counts were evidence
rather than bad luck.

The transferable lesson, since it has now paid twice: **when a diff is a pure
register permutation and the expression shape is already right, the next move is
to change a type or bind a subexpression to a local, not to search harder.** A
sweep of 16 spellings in one probe costs one tool call and no attempts.

`decomp-permuter` is still wired up and is still the right tool when the
obstacle really is allocation:

```
python tools/permute.py sub_08063980 --seconds 600 -j 6
```

It starts from `work/<fn>/best.c`, searches, and re-checks every result with
`trymatch` — the permuter's own score diffs objdump text, which is weaker than
byte equality, so it is a search signal and not a verdict. See `vendor/README.md`.

| function | was | what it actually was |
|---|---|---|
| `sub_080308B4` | 96% | `-fforce-addr` address-taking: one assignment moved out of a declaration. Found by decomp-permuter on iteration 134 of its first run. |
| `sub_08063980` | 80% | A **volatile** byte read where the original's was plain. `orrs r1, r0` vs `orrs r0, r1` was a symptom, not the problem. |
| `sub_08001158` | 88.2% | The scaled index needed to be **bound to a local**. The reported "8 bytes" and the story about `y * 2` killing a register early were both descriptions of the symptom. |

Two things to carry forward from how the last two read *before* they were
solved. First, the recorded obstacles were accurate descriptions of the diff and
useless as directions — "GCC coalesces the result into the parameter's register"
and "the original computes `y * 2` early" are both true, and neither points at
the edit. Second, both entries listed the spellings already tried, and in both
cases the answer was one line away from that list (`vu8` -> `u8`; the `y * 2`
the note itself named, just bound to a variable). **A long list of failed
spellings is evidence that the axis is wrong, not that the axis is exhausted.**

Also worth knowing before reading a permuter run's numbers: its score and byte
equality are not monotonically related. On both of the late two its best-scoring
candidate was a byte-level regression (80% -> 75%, 88.2% -> 55.9%).

---

## Where the globals live

**Never declare a global in your `.c` file.** The declarations live in one of
two headers:

- `include/unknown-globals.h` — the bulk of them, with their structs. Reached
  through `global.h`, so it needs no `#include`.
- `include/hardware.h` — the nine display-register shadows
  (`gUnknown_03002B6C`, `gUnknown_030030A4`, `gUnknown_030030E0` and
  neighbours), because they need the register types defined there. Add
  `#include "hardware.h"` if you touch one.

Every struct there is a **superset**: the variants that preceded it disagreed
only about which bytes they had bothered to name, never about offsets, member
types or total size. So adding a field is normal — narrow a `filler_XX` into an
`unkXX` and leave everything around it alone. Moving a field, changing a member
type, or changing the total size will silently break a match in a file you are
not looking at, because agbcc picks the instruction from the member type and the
index stride from `sizeof`.

**The header covers the globals promoted functions reach, not every global in
the ROM.** In an unworked address range, finding your global absent is the
normal case, not a sign you are confused — one wave-5 agent hit it nine times
out of ten. It is also not the "wrong merged type" case. **Add the declaration
to `include/unknown-globals.h`, in address order, and put nothing in your
`.c`.** The prohibition is on declaring locally, not on extending the header. A
new struct or a new extern is a pure addition and cannot break an existing
match.

If the merged type is genuinely **wrong**, widen it — but check the union
first (`gUnknown_03002B6C` is reached as a word, a halfword *and* a byte, and
all three spellings exist on it), and then run the check, which is cheap and
complete:

```
grep -rl <global> src/        # every promoted file that could break
python tools/sync_work.py     # REQUIRED FIRST -- see below
python tools/trymatch.py <fn> # the verdict, one per file listed
```

**Do not skip the sync step.** `trymatch` compiles `work/<fn>/<fn>.c`, and the
draft for an already-promoted function is usually stale — most predate the
shared headers and still carry their own `extern`, so you get

```
COMPILE FAILED ... conflicting types for `gUnknown_XXXXXXXX'
```

on a file that is perfectly healthy. That fires during exactly this check, which
is the one place it is most likely to be misread as "my widening broke
something". `tools/sync_work.py` refreshes the drafts from `src/decomp/`, which
is the truth. It leaves multi-function files alone; for those the check is
`make SPLIT=1 compare`, which covers every promoted file at once and cannot be
fooled.

That is usually one file and about thirty seconds, and it is the difference
between reporting a blocker and landing four more matches. Widening is safe
*when you run it*. Three globals were widened this way in wave 5 —
`gUnknown_030030F0` (`s8` → 3-byte struct), `gUnknown_0200B0B0` (`u16 *` →
struct pointer), `gUnknown_0200C420` (`u32[2]` → 0xe0-byte struct) — touching
five already-matching files, all still byte-exact.

Two practical notes. The headers are edited **concurrently** during a wave, so
re-grep for your anchor immediately before editing and never trust a line
number from earlier in the session. And when a global's type changes, the
stale `work/<fn>/<fn>.c` drafts of already-promoted functions will fail to
compile with `conflicting types` — see the Workflow note on that; it is not a
regression.

---

## Data models worked out so far

**The layouts are in `include/unknown-globals.h`, not here.** This section is
what the layouts do not record: what a field means, which function proved it,
and which globals belong together. When the two disagree, the header is right —
it is the one the compiler reads.

```c
/* gUnknown_03001470 (struct Unk03001470) -- 0x60 bytes, exactly 30 entries
   (proved from a loop bound). Four views of this existed before the merge:
     unk00 non-zero = slot in use, and a lookup key (sub_08015BD0 scans it)
     unk08 cleared by sub_08015C30
     unk26 indexes into gUnknown_0200E438
     unk38 set to 1 by sub_08029FC4
   gUnknown_03001FBC is the current index -- s16, proved by ldrsh. */

/* The {u16;u16} pair needs a union where a caller compares one as a word:
     gUnknown_03003F24 live/scratch, gUnknown_03003100 committed source,
     gUnknown_030044A4 backup. The call sequence
        bl sub_0802C57C; bl <work>; bl sub_0802C594
   appears 7+ times -- save, work, restore. Only 03003F24 and 03003100 are
   declared as union Unk802C57CBuf; the rest are the bare struct. */

/* sprite list: 16-byte entries, layer-head array + bump allocator.
     gUnknown_0200D510  layer heads
     gUnknown_03002B24  pool cursor */

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

/* 0x0849B018 — pointer to a struct with a bitmask byte at +9. 13 callers.
   sub_0802F460(s8 index) tests bit `index` of it and returns bool8. */

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

/* 0x0200C528 -- 0x18-byte entries, >= 10, indexed by s16.
   +0x00 pointer, non-NULL = slot in use (sub_08019260 scans 0..9)
   +0x04 pointer to a list node whose `next` is at node+0x04;
         sub_08018BAC does p->unk04 = p->unk04->unk04 (advance) */

/* 0x0200F920 -- stride 0x88, >= 6 entries, fully accounted for:
   +0x00 8 bytes unknown, +0x08 array[32] of 4-byte entries whose u16 at +0
   sub_0801F114 ORs to all-ones across all 6*32 (a mark-everything init) */

/* 0x03002B80 -- a single struct, not an array. +0x0000 u8 flag set to 1,
   +0x0358 u16 set to arg+1 by sub_0801B768. At least 0x35a bytes. */

/* 0x08499598 -- eight different views of this existed before the merge, the
   widest disagreement in the tree. They all agreed on 0x3C, proved by
   `lsls #4; subs; lsls #2` (x*15*4). Fields and who proved them:
     +0x1e u8  bool-ish (sub_0804415C)   +0x20 u32 (sub_08044094)
     +0x24 u8  written 0 (sub_0804438C)  +0x25 u8  (sub_08044374)
     +0x31 u8  set to 1 (sub_0802C154) */

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

/* struct BgCnt mirrors -- THREE, each with its own tilemap pointer and its own
   charblock base. All are union BgCntBuf in hardware.h:
     gUnknown_03002B6C + u16 *gUnknown_08499578
     gUnknown_03001FE8 + u16 *gUnknown_0849957C
     gUnknown_030030B4 + u16 *gUnknown_08499580, which writes 0x0600D800
                         rather than the 0x06000000 the other two use.
   The tilemap pointers are non-const, re-ldr'd every loop iteration.
   title-screen.c is a fourth *user* of gUnknown_03002B6C, not a fourth mirror
   -- it sets bit 7 as a byte. */

/* 0x0200C420 / 0x0200C500 -- 08016E74 saves and 08016E8C restores, same idiom
   as 0x03003F24 / 0x030044A4. But only the FIRST TWO WORDS are the pair:
   gUnknown_0200C500 really is 8 bytes, while gUnknown_0200C420 runs 0xe0 bytes
   to it (per the map) and the rest is unrelated. unk20 is a 0x18-byte array
   indexed by `a % 24` (sub_08017860, via __modsi3 in sub_08043AA0). */

/* These three read "N entries" in an earlier revision. N is the STRIDE in each
   case, matching the size annotation on the struct in unknown-globals.h; the
   extents are unproved. Watch for the same slip elsewhere in this section.
   0x020280C0 -- RAM, stride 0x1C, indexed by u8. NOT a pointer: the symbol
     address is added directly. +0x13 u8.
   0x0849CD88 -- ROM, stride 0x24, indexed by u16. +0x14 u32.
   0x085D5ABC -- ROM, stride 0x5C. +0x1E is a [2][0x1A] byte table reached as
     unk1E[c][b] with all three indices variable; +0x06 (u16), +0x0a, +0x0c and
     +0x0f are u8 accessors added in wave 6. 10 trailing bytes unaccounted. */
/* 0x08090EAC -- ROM s16 array; sub_08035AE8 indexes it with (a & 1). */
/* 0x0200F720 -- stride 0x10, plain int index. +0x06/+0x08/+0x0a u16 set
   together: a 3-component tuple, not a coordinate pair. */
/* 0x08499594 -- pointer to >=256 records of stride 0x0C; +0x00 u8 cleared by a
   mark-all-free init paired with u16 gUnknown_030032C0 reset to 0. A THIRD
   distinct ROM pointer alongside 08499590 (screen) and 08499598 (0x3C). */
/* 0x0810E6E0 -- ROM table, stride 0x20, indexed by (Unk08499598.unk1a - 1);
   1-based, so 0 means "none". */
/* 0x030020B4 -- the REG_DISPSTAT IWRAM shadow. `struct DispStat` in
   hardware.h already has the right layout; the header still declares it `u8`,
   which is too narrow in TWO directions and needs a union:
     byte view      sub_0801295C/sub_08012AD4 toggle vblank_int_enable (bit 3),
                    sub_08012A24/sub_08012A34 toggle hblank_int_enable (bit 4)
     halfword view  sub_08012AAC and sub_08012AD4 finish with
                    `ldrh r0,[shadow]; strh r0,[0x04000004]` -- push to the
                    register. sub_08012410 zeroes it with `strh`, and
                    sub_08012500/sub_08012750 copy it out with `ldrh`.
   sub_08012AD4 reads it `ldrb` and then `ldrh` in the same function, which is
   the union proved in one place. Probed: all four bit accessors reproduce
   through `struct DispStat`, so the migration is byte-neutral for the two
   already-matched setters -- but read the set/clear asymmetry in Bitfields
   before assuming the setters vouched for the current `u8`. */

/* Two callback globals, both proved by `bl _call_via_r0` on the loaded value,
   both null-checked first, and both saved/restored as a pair by
   sub_080171B4 / sub_08017540 into a caller struct at +0xBA0 / +0xBA4:
     03002F20  void (*)(void)   result discarded (sub_080183C0)
     03001FF0  bool8 (*)(void)  result tested with `lsls #24` (sub_080198F0)
   Setters sub_080198A0 / (none) and clearers sub_080198AC / sub_080198C4. */

/* 0x03002F50 -- an 8-byte-entry stack; 0x03002F24 is its cursor.
     +0x00..+0x03  four s8 (`ldrb; lsls #24; asrs #24` on the way out)
     +0x04         u32, copied from another struct's +0x20
   sub_0801A604 resets the cursor to the base, sub_0801A614 fills an entry and
   bumps by 8, sub_0801A664 pops -- and its empty test is a pointer compare of
   the cursor against the array base, which is what fixes 03002F50 as the
   array itself rather than a pointer to one. */

/* 0x03003FC0 -- +0x43..+0x46 u8 initialised to 0,1,2,3: an identity
   permutation over 4 slots (player/team order). At least 0x47 bytes. */
/* 0x03002B4C = 0xf0 and 0x03002B44 = 0xa0 -- u8 screen-extent pair (240x160),
   reset with u8 gUnknown_03002B40 and gUnknown_03002EFC zeroed. */

/* The Unk02028030 setter template is as free as the getter: the getter's
   four-statement address computation plus one local for the shift.
     u32 bit = id & 7;
     *p = (*p & ~(1 << bit)) | (value << bit);
   Four spellings of that last line compile byte-identically. */

/* two copies of a 16-entry pointer-list idiom. The header declares the arrays
   without a bound; 16 is the cap the code enforces, not a proved extent.
     gUnknown_03002FA0  list A, counted by volatile u16 gUnknown_030030E8
     gUnknown_03000000  list B                                            */
```

`BLEND_EFFECT_ALPHA/BRIGHTEN/DARKEN/NONE` are referenced by macros in
`hardware.h` but never defined anywhere. Literals 2 and 3 are brighten/darken.
