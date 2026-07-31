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
| `ldrsh` | `s16` **object** (not a cast) — **unless the value feeds a narrowing context**, see below |
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

**That table is about a store *adjacent* to the entry. Put the store in a loop
and the narrowing comes back.** The "none" rows exist because combine folds the
truncation into the store; combine works within a basic block, so once the store
sits in the loop body and the parameter arrives in the entry block the fold
cannot happen and the `lsl; lsr` pair survives at the top of the function:

```
void f(u16 *d, u32 n, u16 v){ *d = v; }                   /* strh, no narrowing */
void f(u16 *d, u32 n, u16 v){ u32 i; for (i=0;i<n;i++) *d++ = v; }
                                    /* lsl #16; lsr #16 before the loop, then strh */
```

So a **`lsl #16; lsr #16` on an argument register in the prologue of a fill loop
is a `u16` parameter, not a cast** — read it the way the table's `strh` row
would forbid, because the table does not apply. `sub_08072C28` (a `u16` memset)
is the case, and the same reasoning covers `lsl #24; lsr #24` on a `u8` value
filled through `strb`.

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
The **second** carve-out is the epilogue: for any function that pushes `lr`,
`pop {r0}` means `void` and `pop {r1}` means it returns a value, so the
unrecoverable claim survives only for leaf functions ending in a bare `bx lr`.

The **third** carve-out is a caller that *forwards* the result. `return f(x);`
re-narrows when `f` is declared to return `u8` — `bl f; lsls #24; lsrs #24` —
and emits nothing when `f` returns `int`. Four bytes, so it is impossible to
miss. It **overrules the accessor's own body**: `sub_08042E18` is `ldrb` and
nothing else, was promoted as `u8`, and is byte-identical as `int` — but its one
caller `sub_08042DFC` has no narrowing, so `int` is the answer. When you promote
a `ldrb`/`ldrh` accessor, check what its callers do with the result before
picking the narrow type; if any of them narrows, that is evidence and the
accessor's own bytes are not.

**The forwarding carve-out is one-directional, and wave 12 found the hole.** A
narrowing that IS present proves a narrow return. A narrowing that is ABSENT
proves `int` only when the forwarded value is still *used* after the `bl`. When
the `bl` is the last instruction before the epilogue — which is every 12-byte
forwarder in family F001 — a **missing `return` keyword** produces the identical
bytes, because the callee's result is already sitting in r0:

```c
int f(void) { return g(); }   /* g declared int */   ->  bl g ; pop {r1} ; bx r1
s8  f(void) {        g(); }   /* g declared s8  */   ->  bl g ; pop {r1} ; bx r1
```

Both compile clean under `-Werror`: **agbcc does not warn about control reaching
the end of a non-void function.** `sub_0801A168` (`bl sub_0801537C`, sixteen
bytes, no shift) is the case, and it is why `sub_0801537C`'s return width is
recorded in `include/unknown-functions.h` as undecidable rather than fixed at
`int`. Probed three ways — `int` caller with `s8` callee, `s8` caller with `s8`
callee, and an `s8` local in between — all three emit `lsl #0x18; asr #0x18`
after the `bl`, so the re-narrowing is driven by the CALLEE's declaration and
not the caller's: agbcc never trusts a callee to have narrowed its own result.

So the usable form of the rule is: *narrowing present at a caller* ⇒ narrow
return; *narrowing absent at a caller that stores, compares or re-passes the
value* ⇒ `int` return; *narrowing absent at a bare tail forwarder* ⇒ **nothing
proved**. Check which one you have before claiming a width.

**The `sub_08042E18` reading three paragraphs up cites the wrong caller, and
this is what that mistake looks like.** `sub_08042DFC` is itself a bare
`bl sub_08042E18; pop {r1}; bx r1` tail forwarder — the third case, worth
nothing. The conclusion is right anyway, but the evidence for it is
`sub_0807F630`, the *other* caller, which does `bl sub_08042E18; adds r1, r0,
#0; bl sub_08026AC0` — it re-passes the value as an argument with no narrowing,
which is the second case and is decisive. Two callers, one informative; the
uninformative one is the one that got written down.

**Forwarding is *not* the only such call site — a caller that merely TESTS the
result exposes the width just as well, and that shape is far more common.**
`if (f(x))` on a `u8`-returning `f` is `bl f; lsls r0, r0, #0x18; cmp r0, #0`,
with **no `lsrs`**: only zero-ness is wanted, so the truncating left shift alone
does the job. On an `int`-returning `f` the same source is a bare
`bl f; cmp r0, #0`. Wave 11's 0x0803C354–0x0803C670 predicate block is a
controlled experiment for this, because both callees appear inside one matched
function: `sub_0803C48C` tests `sub_0803CAB8` *with* the `lsls #24` and
`sub_0803CBD8` *without*, four instructions apart. So a lone `lsls #24` after a
`bl`, with no `lsrs` and a `cmp` behind it, is not a mask, a bitfield or a
`s8`/`u8` object load — it is the callee's declared return type, and prototyping
that callee `int` makes the shift vanish and the function unmatchable. Sixteen
functions in that block turned on exactly this and fell in one probe once the
prototypes said `u8`.

**One qualifier on that, measured in the same wave, and it matters because it
turns a blocked function into a free one: `bl f; lsls #24; cmp #0` does NOT
prove the *callee* is 8 bits wide. A caller that puts an `int`-returning
result into a `u8`/`bool8` LOCAL before testing it is byte-identical.** One
probe, two prototypes (`u8 nu8(u32)` and `int nint(u32)`), five call shapes:

| source | codegen after the `bl` |
|---|---|
| `if (nint(a))` | `cmp r0, #0` — nothing |
| `if (nu8(a))` | `lsl #24 ; cmp #0` |
| `if (nu8(a) != 0)` | byte-identical to the row above |
| `u8 v = nint(a); if (v)` | **byte-identical to the two rows above** |
| `if (nu8(a) == 4)` | `lsl #24 ; lsr #24 ; cmp #4` — the `lsrs` comes back |

So read the shift as "eight bits *somewhere on this path*", not as a fact about
the callee, and note the last row separately: the `lsrs` is dropped only because
a zero test does not need the value, so **`lsls #24` with a `lsrs #24` behind it
is the value being kept** (a compare against a non-zero constant, or a forwarded
return) while the bare `lsls` is a truth test. The practical consequence is the
useful half: when the callee is already promoted with an `int` return and
re-typing it would mean editing a file someone else is holding, a `u8` local at
the call site reaches exactly the same bytes and needs no header change at all.

Two corollaries worth carrying:

- **The callee side is free, so the call site is the *only* evidence.** Changing
  `sub_0803CA9C`/`CAB8`/`CAD4` from `int` to `u8` left all three byte-identical:
  their value is `(1 << (id & 7)) & *ldrb_p`, whose `nonzero_bits` is already
  `<= 0xff`, so gcc drops the return narrowing as a no-op. A promoted accessor
  matching as `int` is therefore *not* evidence that `int` is right — re-check it
  the moment a caller shows up.
- Fixing this may mean editing an already-promoted `src/decomp/` file, since a
  prototype in `unknown-functions.h` that disagrees with a definition is a
  `conflicting types` build error rather than a mismatch. Re-run `trymatch` on the
  retyped definitions; if the value is `ldrb`-derived they will still match.

**So settle a return width by COUNTING every call site in `asm/`, not by reading
one — and it is a one-line grep (wave 14).** The section above proves that a
single `bl f; lsls #24; cmp #0` does not pin `f` at eight bits, because a `u8`
local at that one call site is byte-identical. The way out is population, and it
is free:

```
grep -rn -A2 "bl sub_XXXXXXXX$" asm/
```

`sub_08019260` was promoted `int` and every one of its **twenty** call sites
narrows to eight bits. Twenty independent authors each choosing a `bool8` local
is not a hypothesis; the callee is `bool8`. Two things make this cheap and
sharp:

- **Look for the `lsrs`, not just the `lsls`.** Two of the twenty are
  `lsls #0x18; lsrs r4, #0x18` — the value is KEPT, not truth-tested, which is
  the "compare against a non-zero constant or forward the result" row of the
  table above and does not have the `u8`-local explanation. One such site
  upgrades the whole population from suggestive to decisive.
- **Unanimity is the signal; a single dissenting bare `cmp r0, #0` refutes it**
  and sends you back to a local at the narrowing sites, which needs no header
  change at all.

The retype itself was byte-neutral in the definition (the body returns literal
0/1, so `nonzero_bits <= 1` and gcc drops the narrowing) and no caller was
promoted yet, so it cost one `trymatch`. Check that second part before
retyping — a promoted caller that already spells the narrowing with a local
would double-narrow.

**Corollary that cost wave 14 a probe round: a function can be PROMOTED and
still have no prototype.** `src/decomp/c_08019260.c`, `c_08019850.c`,
`c_0804018C.c` and `c_08074AAC.c` were all matched and none of the four was
declared in `include/unknown-functions.h`, because nothing had called them
across a file boundary yet. The next caller gets
`warning: implicit declaration of function` — fatal under `-Werror`, and it
reads like a missing function rather than a missing line. `grep -rn "^[a-z].*
sub_XXXXXXXX(" src/decomp/` before assuming a callee is unknown, and when you
add the prototype, copy the definition's types rather than re-deriving them.

**The argument side has the exact same property, and it is the sharper half:
a callee's declared PARAMETER width is visible at its call sites, and it
overrules the callee's own prologue.** The three carve-outs above are all about
a return value; this is the mirror image, and it costs a whole load instruction
rather than a shift. Feeding a `u16` value into a differently-declared
parameter, one probe, the same call site each time:

| declared parameter | the caller emits |
|---|---|
| `int` / `u32` / `u16` | `ldrh r0, [r0, #4]` — no conversion, 2 bytes |
| `s16` | `movs r1, #4; ldrsh r0, [r0, r1]` — **4 bytes**, the load itself changes |

The conversion never survives as a separate `lsl`/`asr` pair: combine folds
`(sign_extend (subreg:HI (zero_extend (mem:HI))))` straight back into the load,
so a narrow *signed* parameter rewrites the caller's `ldrh` into `ldrsh` and a
narrow *unsigned* one rewrites an `ldrsh` into `ldrh`. There is a size signal
(`ldrsh` has no immediate-offset form, hence the extra `movs`), so this is free
to spot.

Read backwards, **a prologue narrowing is not proof of a narrow parameter when
the narrowed value feeds another call.** `sub_0803B524` opens
`lsls r0,#0x10; lsrs r4,r0,#0x10` — textbook "`u16` parameter widened for a
`bl`" by the Proc-wrappers table below — and `u16` is impossible: `src/proc.c`,
a matching source, passes it an `s16` member and gets `ldrsh`, which only an
`int`-wide parameter produces. Its neighbour `sub_0803B4DC` opens
`lsls r0,#0x10; asrs r0,#0x10` and is `int` for the same reason from the other
direction. In both the shift pair belongs to a **cast at a use inside the
body**, not to the parameter. Two callers with differently-typed arguments pin
the declaration between them where one caller cannot; here `sub_08016104` /
`sub_08016130` (a `u16` out of a script stream) excluded `s16` and proc.c
excluded `u16`, leaving `int`. Both prototypes had said `s16` since wave 7 and
the correction is byte-neutral for every file that already matched — verified by
recompiling `src/proc.c` and `src/title-screen.c` and comparing against
`build/src/*.o`.

**But check that the narrowed value really does feed the call before applying
that. "There is a `bl` after the prologue" is not the condition — the condition
is that the call CONSUMES the value, and a `(void)` callee does not.** Family
F041 (`sub_08017E8C`, `sub_08017EBC`, `sub_08018F04`, `sub_0801903C`) opens
`adds r4,r0,#0; lsls r4,#0x10; lsrs r4,#0x10; bl f` and looks exactly like the
paragraph above, but all four `f`s take no arguments — r0 is simply left alone
across the `bl` — so the narrowing belongs to the parameter after all and `int`
is 4 bytes short. **Tell: no argument register is written between the prologue
and the `bl`.** Where a value *is* being set up for the call you will see the
copy into r0 (`adds r0, r4, #0`); its absence means the incoming r0 is dead at
the call and the shift pair is PROMOTE_MODE, not a cast at a use.

**And when it is the parameter, the shift pair does not carry the SIGN — a
second pair at the point of use does.** agbcc's `PROMOTE_MODE` forces
`UNSIGNEDP = 1` for every sub-word parameter, so an `s16` parameter is
zero-extended at entry and then sign-extended again wherever it is used as an
`s16`. Same family, one probe:

```
push {r4,lr} ; adds r4,r0,#0 ; lsls r4,#0x10 ; lsrs r4,#0x10   <- entry: ALWAYS lsr
bl f
ldr r0,=g ; lsls r4,#0x10 ; asrs r4,#0x10 ; <index math>       <- use: asr => s16
```

`s16 a` with `g[a]`, and `u16 a` with `g[(s16)a]`, are byte-identical, so the
declaration is a free choice and the *object's* index type is what settles it
(here `gUnknown_0200C528` is documented as s16-indexed). Read backwards: **a
`lsls #16; lsrs #16` in the prologue followed later by a `lsls #16; asrs #16` on
the same register is one narrow parameter, not a narrowing plus a cast** — the
proc-wrapper table's `u16` row is only the first pair and does not distinguish
`u16` from `s16`.

**The mirror of that, at a CALL: `lsls #16; asrs #16` in front of a `bl`
collapses FOUR different type assignments into one instruction stream, and the
wrapper cannot separate them (wave 15).** The `ldrh`/`ldrsh` table above is
about an argument coming out of *memory*, where the load itself changes and the
signal is 2 bytes wide. For a value already in a register there is no such
signal — the conversion is the same two shifts no matter which side of the call
owns it. One probe, a 16-byte forwarder, all four byte-identical:

| source | |
|---|---|
| `void f(int a){ g_int((s16)a); }` | cast at the call, wide callee |
| `void f(s16 a){ g_int(a); }` | **narrow parameter, no cast** |
| `void f(int a){ g_s16(a); }` | wide parameter, **narrow callee**, no cast |
| `void f(s16 a){ g_s16(a); }` | narrow on both sides |
| `void f(u16 a){ g_int(a); }` | the ONE that differs — `lsr`, not `asr` |

So the pair proves exactly one thing: *something* on this path is signed and 16
bits. Which thing is decided **callee-side and only callee-side**: a callee
whose own prologue carries `lsls #16; lsrs #16` has a narrow parameter (that is
PROMOTE_MODE, per the rule above), and a callee that opens with a bare
`adds rN, r0, #0` straight into word arithmetic does not, which forces the
conversion back onto the caller as a cast or a narrow parameter — and *those*
two remain indistinguishable forever. Family F066 has one member of each kind:
`sub_0803B4DC` forwards to `sub_0803B48C` (prologue narrows ⇒ `s16` parameter
⇒ the conversion is implicit and the source has no cast), while `sub_08015568`
forwards to `sub_0801D84C` (no prologue narrowing, and its other caller passes
a bare `adds r0,r3,#0` ⇒ `int` parameter ⇒ the source must have spelled
something). **Do not spend an attempt choosing between the last two; declare the
weaker one and say in the header that it is byte-neutral.**

**Read the CONTRAPOSITIVE of that sentence too — it is the half everyone
misses.** "Prologue narrows ⇒ narrow parameter" has a converse that also holds:
**a BARE prologue is positive evidence for a WIDE parameter**, and it holds even
when every use of the parameter is a narrow store, because agbcc emits the
PROMOTE_MODE extension unconditionally and never deletes it as dead. Two
prototypes in this tree were wrong for nine and for part of one wave because
only the forward direction was being read. Worked measurements, including the
20-vs-16-byte one that settles it: *"A BARE PROLOGUE is positive evidence for a
WIDE parameter"*, near the end of this file.

The sign is worth chasing even so, because it is free from the caller
population: `sub_0803B48C` has five call sites and every one is signed — a sum
of three ints put through `lsls #0x10; asrs #0x10`, and four `ldrsh` reads of
struct members. The `lsls/asrs` site is the decisive one: with an `int`
parameter that call needs an explicit `(s16)` cast on a three-term sum, which
nobody writes, and with `s16` all five are cast-free.

**`ldrh` plus a pool word is a plain mask; `ldrb` plus `mov`/`neg` is a
bitfield.** The width of the constant tells you nothing. `*p &= ~8` through a
`u16 *` narrows the mask to a 16-bit pool word by itself, so a `0x0000FFF7`-
shaped word is *not* evidence of a bitfield. The real bitfield store picks
QImode via `get_best_mode` and builds its mask in SImode with no pool word:
`ldrb; mov r0,#0x9; neg r0,r0; and; strb`. **`mov #N; neg` where a bare `movs`
would have done is a positive tell for a bitfield store** — the hand-rolled
equivalent emits `mov r3,#0xf3`, one instruction shorter. **The tell only runs
one way: a bitfield whose complement mask has bit 7 clear emits a bare `movs`
too, so `movs #M; ands` is not evidence against a bitfield.** See "Read a
bitfield's position and width straight off `mov #N; neg`" under Bitfields —
`sub_08011588`'s `ldrb; movs #0x3f; ands; movs #0x80; orrs; strb` looks exactly
like a scalar `(x & 0x3f) | 0x80` and is a two-bit field at bit 6.

**On the READ side the two are cleanly separable, and the separator is the
ACCESS WIDTH rather than how the mask was built (wave 15).** A brief told a
wave-15 agent that `if (gU16 & 0x200)` and a one-bit field test were
byte-identical and could not be discriminated. They are not: `get_best_mode`
picks the narrowest mode containing the field, so bit 9 of a `u16` lives in
byte 1 and a bitfield read of it is `ldrb [p,#1]` plus a double shift. Family
F057 does `ldrh [p]; movs r0,#0x80; lsls r0,#2; ands r0,r1; cmp r0,#0` — it
reads the **whole halfword** and ANDs a constant materialised by shift, which
no single-byte-resident field can produce. So **a load wider than the field's
own byte is positive evidence of a plain mask**, and `movs #imm8; lsls #n`
building the constant is just how THUMB materialises 0x200 — it is not a pool
word and carries no signal of its own. The `mov #N; neg` tell above is the
store-side twin and stays store-side.

**Two `ands` with two pool-sized masks in a row is TWO source statements, and
the constants will never fold.** On THUMB a mask that does not fit `movs #imm8`
is a `(mem (label_ref))` load, so combine has no bare `CONST_INT` to substitute
and `(and (and x c1) c2)` is never simplified — while tree-level `fold` merges
`x & c1 & c2` inside one expression before RTL ever sees it. So the two are a
clean readout of the source:

```
ldrh ; ldr =0xFFE0 ; ands ; ldr =0xE0FF ; ands ; ... ; strh   <- two statements
ldrh ; ldr =0xE0E0 ; ands ;                     ... ; strh   <- one expression
```

`sub_08067F5C` is the two-statement form (`g.raw &= 0xffe0;` then
`g.raw = (g.raw & 0xe0ff) | 0xf00;`), and only one `strh` survives because the
first store is dead and DSE removes it while store-forwarding keeps the value.
Read backwards: **a single load/store pair wrapped round more mask arithmetic
than one expression could have produced is a run of read-modify-writes on the
same object**, not evidence of a wide bitfield.

**`fold` reassociates `|`, so `A | (B | C)` does not survive to RTL.** It splits
each operand into variable and constant parts and recombines them, which moves a
constant inward past a variable term. Three groupings, one target:

```
(x & M) | ((v << 4) | 0xf)   ->  and ; mov #0xf ; orr ; lsl ; orr   -- reassociated
(x & M) | (v << 4) | 0xf     ->  and ; lsl ; orr ; mov #0xf ; orr   -- reassociated
x &= M; t = (v << 4) | 0xf; x |= t;
                             ->  and ; lsl ; mov #0xf ; orr ; orr   -- ROM
```

Only binding the inner group to a local in a statement of its own keeps it
together, and only masking in a *separate earlier* statement keeps the load and
mask ahead of the value. `sub_08067300` needs both. Note the second row is the
one an author would naturally write and it is one `orr` operand away from the
first — the two differ only in where the `movs #0xf` sits, so this presents as a
pure instruction-order diff with nothing in the expression to blame.

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

**A large struct assignment is `ldmia`/`stmia`, and that is a hard tell against
the whole-struct spelling.** At 0x30 bytes `*dst = *src` compiles to four
`ldmia rSrc!, {r2, r3, r4}` / `stmia rDst!, {r2, r3, r4}` pairs wrapped in a
`push {r4, lr}` frame — agbcc's block-move path, which needs the third
callee-saved register. Twelve interleaved `ldr rT,[rSrc,#N]; str rT,[rDst,#N]`
with no frame at all is the **element-wise** source, one statement per member.
`sub_08063FB8` is the element-wise form; it copies a 4x3 matrix and there is no
whole-struct spelling that reaches it. Cheap to tell apart on sight, and the
size difference is large, so this costs an attempt only if you never look.

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

**At a CALL, argument setup is grouped by operand class, not by argument
order: parameter copies first, then every literal-pool `ldr`, then every
`mov #imm8` — each group internally in argument order.** So an argument register
written out of numerical sequence is the pool-loaded one, and that is a free
readout of which argument the source spelled as a symbol or a wide constant.
One probe, five spellings of the same four-argument call, all with the third
argument coming straight from the wrapper's own r0:

```c
g4 (1, 4,      p, hh);    /* add r2,r0,#0 ; ldr r3,=hh    ; mov r0,#1 ; mov r1,#4  */
g4 (1, 4,      p, NULL);  /* add r2,r0,#0 ; mov r0,#1 ; mov r1,#4 ; mov r3,#0      */
g4i(1, 4,      p, 0x1234);/* add r2,r0,#0 ; ldr r3,=0x1234; mov r0,#1 ; mov r1,#4  */
g4 (1, 0x1234, p, hh);    /* add r2,r0,#0 ; ldr r1,=0x1234; ldr r3,=hh ; mov r0,#1 */
g4i(0x1234, 4, p, 0);     /* add r2,r0,#0 ; ldr r0,=0x1234; mov r1,#4 ; mov r3,#0  */
```

Two consequences. **A NULL function-pointer argument and a named one are
separated by *where* r3 is written, not only by the pool word** — second versus
last, a 4-byte size difference, so it is impossible to misread once you look.
That is what splits the 41-wrapper family at 0x08071F88–0x08072288 into its
20-byte and 24-byte halves, and it is the reason the fourth parameter of
`sub_080722B8` has to be declared `void (*)(void)`: an `int` parameter reaches
the identical instruction *sequence* (row 3), so only the relocation on the pool
word tells them apart, and only a function-pointer type produces one.
**Conversely, the pool `ldr` does NOT distinguish a symbol from a >255 integer
constant** — rows 1 and 3 are byte-identical apart from that relocation — so do
not read `ldr rN,=` at a call site as evidence of a symbol on its own.

**"Parameter copies first" is a register conflict, not a grouping rule, and
wave 16 found where the difference shows.** Every row of the probe above has the
copy's source still sitting in `r0`, which is also where argument 0's pool `ldr`
is about to land — so the copy *has* to go first and the ordering is forced.
Move the same value into a callee-saved register (any call in between does it)
and the conflict disappears; the setup then comes out in plain argument-number
order, pool `ldr` for r0 ahead of the copy into r1:

```c
void a(ProcPtr p){ f();  g(gSym, p); }   /* ldr r0,=gSym ; add r1,r4,#0  <- pool FIRST */
void b(ProcPtr p){       g(gSym, p); }   /* add r1,r0,#0 ; ldr r0,=gSym  <- copy FIRST */
```

Family F075 (`sub_0802C4B8` and siblings) is the first row and is unmatchable if
you read the rule as unconditional. The same holds for a narrowing rather than a
copy: `f(); h((u16)p, 0x1234)` gives `lsl;lsr;ldr r1,=0x1234; add r0,r4,#0`. So
the readout "an argument register written out of numerical sequence is the
pool-loaded one" is only valid when the copied value is still live in an
argument register at the call — check that first.

**Pool word order is expansion order, and a store expands its destination
address *before* its value.** That is the lever for `gPtr = gArray;` next to
stores into `gArray`, where the direct spelling cannot produce the ROM's shape
in either statement order. Four spellings of "seed two bytes of the array, then
point the cursor at it", all the same length:

| source | pool | where the `str` lands |
|---|---|---|
| bytes first, then `gPtr = gArr;` | `gArr`, `gPtr` | last |
| `gPtr = gArr;` first, then bytes | `gPtr`, `gArr` | **first** |
| `pp = &gPtr;` first, bytes via `gArr`, then `*pp = gArr;` | `gPtr`, `gArr` | last |
| `pp = &gPtr; p = gArr;` bytes via `p`, then `*pp = p;` | `gPtr`, `gArr` | last |

Only the last two get both halves, because taking `&gPtr` creates its pool word
without emitting the store. The bottom two are separated by one more thing: with
the array base *also* bound to a local, the stored `0` is re-materialised at
each use (`mov r0,#0x40; strb; mov r0,#0; strb`); reaching the array by name
instead hoists one zero into a register of its own and holds it live. So
**`ldr rB,=gPtr` ahead of `ldr rB,=gArr` with the `str rArr,[rPtr]` last means
the source took the address of the pointer global into a local**, and a
re-materialised constant alongside it means the array base was bound too.
`sub_0805CDF0` and `sub_0805CE20` need all of it.

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

**`mem++` under a guard keeps a copy of the loaded value; `v = mem; ... mem =
v + 1;` coalesces it away.** Same statement, same semantics, one extra
instruction — and the two are *the same size*, because the spare halfword is
padding the pool alignment would have inserted anyway. So there is no size
signal at all, only the diff:

```c
if (g[i].m != 0xff) g[i].m++;              /* ldrb r2 ; adds r0,r2,#0 ; cmp r0
                                              ; beq ; adds r0,r2,#1 ; strb r0 */
v = g[i].m; if (v != 0xff) g[i].m = v + 1; /* ldrb r0 ;               cmp r0
                                              ; beq ; adds r0,r0,#1 ; strb r0 */
```

The read-modify-write on a MEM materialises the incremented value in its own
pseudo, and the loaded value stays live across the branch to feed it; naming a
local instead lets the allocator put everything in one register, and it picks
r0. **Tell: `ldrb` into a register that is *not* r0 followed by a bare
`adds r0, rN, #0`.** Both `sub_08025D20` and `sub_08025D40` are the `++` form.
Ruled out as alternative causes of that copy, all of which compiled to the
short version: an explicit second local (`r = v; if (r != 0xff) r = v + 1;`),
mixing `u8`/`int` between the two locals, an `if`/`else` assigning both arms,
and returning the value rather than `void`. Re-reading the member for the
return (`... ; return g[i].m;`) does not do it either — that adds a whole
second address computation and a `push {r4, lr}`.

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

**A commutative op between a symbol address and a constant ties its destination
to whichever operand is *dead* afterwards, and reload picks that, not the
source.** Same `%0` tie as the `orr` rule above, seen from the liveness side:

```
ldr rS,=Sym ; movs rC,#1 ; eors rS,rC   <- the symbol is dead after the eor
ldr rS,=Sym ; movs rC,#1 ; eors rC,rS   <- the symbol is used again later
```

Reload swaps the operands rather than clobber a value it still needs, so the
second shape is the one you get whenever the source names the symbol twice. Read
backwards: **`eors`/`orrs` writing the symbol's own register proves the symbol is
not referenced again in that function.**

**Corollary: two source references to one symbol collapse to one pool load —
and that is `-fforce-addr` doing it, not CSE.** With the flag on, the second
reference becomes either a reuse of the first register or an
`adds rN, rSym, #0` copy when the first register has been clobbered in between.
So **a pool word loaded twice, into two registers, in one basic block is not
reachable by writing the symbol twice in C** — under our CFLAGS. Drop
`-fforce-addr` and the two references *do* become two pool loads.
`sub_0808AD6C` was parked on exactly this for several waves:

```
ldr r3,=sub_0808AD68 ; movs r0,#1 ; eors r3,r0      <- ROM, and -fno-force-addr
ldr r0,=sub_0808AD6C ; ldr r1,=sub_0808AD68 ; subs r0,r0,r1
ldr r3,=sub_0808AD68 ; adds r1,r3,#0 ; movs r0,#1 ; eors r3,r0   <- -fforce-addr
```

Twenty-three spellings over five probes and a permuter run all produced the copy
or the reuse, because no source spelling can do it: it is a flag. The function
matches byte-for-byte with `-fforce-addr` removed and nothing else changed —
see "Per-file compiler and flags".

**The effect is narrower than "force-addr unifies repeated symbols", so do not
over-read it.** Negative control, one probe, identical with and without the
flag:

```c
u32 f(void)  { u32 a = (u32)gArr ^ 1; u32 b = (u32)gArr; return a - b; }
u32 g(u32 k) { return ((u32)gArr ^ k) - (u32)gArr; }
```

Both emit **one** pool load either way. The doubling only appears when one of
the references is also used as a **memory address** — that is the reference
`-fforce-addr` forces into a pseudo, and it is the pseudo the integer use then
shares. `sub_0808AD6C` qualifies because its xor'd copy is the source pointer
of a copy loop.

**Reusing a loop's pointer local for the code AFTER the loop permutes the whole
loop's allocation, at identical length.** This is a third axis alongside "change
a type" and "bind a subexpression", and it is the cheapest of the three to
check: a local written again after the loop has one web spanning both, so the
allocator's priority ordering changes and every register in the loop moves.
Giving the tail its own variable is the fix, and nothing else about the source
changes:

```c
do { p->next = q; p->object = nul; q--; p--; i--; } while (i >= 0);
p = *pp;  p[15].next = NULL;      /* p = r2, q = r0, nul = r3, i = r1 */
r = *pp;  r[15].next = NULL;      /* p = r0, q = r1, nul = r2, i = r3 */
```

Same instructions, same order, same 68 bytes — only the register numbers, and
in the second form they come out in declaration order. `sub_0801BE78` needed it.
**Tell: an otherwise-exact loop whose registers are a pure permutation, where
one of the permuted values is a pointer the tail also assigns.** Worth reaching
for before the permuter.

**A loop-invariant constant only lands in the MIDDLE of the preheader if the
source gave it a statement.** Written as a literal in the loop body it is
loop-invariant motion's, and LICM appends to the preheader — so it comes out
*after* the induction-variable setup, sharing a register with a constant that
has just died. Bound to a local before the cursors, it is emitted where the
source put it and gets a register of its own, which costs one more callee-saved
push:

```c
p = g; q = p + 16; p += 15;              /* ldr; ldr; movs 0x80; lsl; add; add; MOVS #0 */
    do { ...; p->object = NULL;  ... }   /*   -- 5 registers, push {r4, lr}             */

p = g; nul = NULL; q = p + 16; p += 15;  /* ldr; ldr; MOVS #0; movs 0x80; lsl; add; add */
    do { ...; p->object = nul;   ... }   /*   -- 6 registers, push {r4, r5, lr}         */
```

Same instruction multiset, same length, and the push list is the visible half.
`sub_0801BE78` again.

**A pointer local reaching a constant offset > 7 needs the `+=` spelling to
avoid a copy.** THUMB's wide add is `adds rD, #imm8`, two-operand, so the
destination must already hold the base; whether it does is decided the same way
the `p = g + a*4` / `p = g; p += a*4` rule decides it for a variable index. This
is a *size* difference, not a permutation:

```c
p = base + 15;      /* adds rD, rB, #0 ; adds rD, #0xf0  -- copy, 4 bytes */
p = base;  p += 15; /* adds rB, #0xf0                    -- in place       */
```

Note this contradicts nothing in "Binding the scaled index" below, which says
the two spellings are equivalent for a pointer *local* base: that measurement
was on a pool-sized constant reached through `add rD, rB, rC`, where either
register can be the destination. Once the offset fits `#imm8` the encoding
removes the choice.

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

**"Two globals" is narrower than the rule is. It fires whenever one side of a
compare needs a pool `ldr` and the other does not — a pointer *parameter's*
member against a global does it too, and there only ONE local is needed.**
Same mechanism, same lack of a size signal, and it presents as the two loads
having swapped places rather than as a register permutation:

```c
if (p->unk20 != *(u32 *)(g + 4))   /* ldr =g ; ldr rD,[rD] ; ldr [p,#0x20] ; cmp */
u32 v = p->unk20;                  /* ldr [p,#0x20] ; ldr =g ; ldr rD,[rD] ; cmp */
if (v != *(u32 *)(g + 4))
```

The parameter's load needs no setup, so with both sides inline agbcc schedules
the global's two-instruction address-and-deref first and the parameter's member
read lands *between* them and the compare. Naming the member first is what
pins it to the top. `sub_0802C480` is the second row and the inline spelling
misses on exactly those three instructions. Binding the global as well is
byte-identical to binding only the member, so reach for the one local.

**A constant in a pushed callee-saved register**, where the original
rematerialises it at the use site, is constant CSE across the *whole body*, not
a problem with the statement that uses it. Six formulations of the offending
statement compiled byte-identically. The fix was a `volatile`-qualified read
somewhere else in the function. Do not fight it at the use site.

**Which of two loop-carried values gets the lower callee-saved register is
decided by liveness *after* the loop, and by nothing else that has been found.**
The case is a fill loop carrying a base pointer and a hoisted zero. Both land in
r3/r4; which way round is the whole difference between 98% and a match:

```
ldr r5,=g ; ldr r4,[r5] ; movs r3,#0     <- zero in the LOWER register
ldr r5,=g ; ldr r3,[r5] ; movs r4,#0     <- base in the lower register
```

The second is what you get from every ordinary spelling. The **only** lever
found is giving the zero a reference that outlives the loop; the moment it has
one, the pair swaps. Everything cheaper is a no-op — probed on `sub_0801A6C0`,
all leaving the pair alone: declaring the zero's local before the pointers
(declaration order is not the tie-break, so it is not simply pseudo numbering),
assigning it as the first statement, `i = v` or `for (i = v; ...)` to add a
pre-loop reference, a duplicated store in the loop body, and moving `v = 0`
either side of the pointer's assignment — that last one moves *where* the `mov`
is emitted, per the source-statement order rule, and leaves the registers
untouched.

So the rule is usable but expensive: **to move a loop-carried value into the
lower register, make it live past the loop** — and then live with wherever that
post-loop reference lands, because there is no post-loop use that emits no
instruction. Dead stores and dead assignments are deleted before liveness is
computed, `volatile` forces a stack slot, and returning the value costs a `mov`.
`sub_0801A6C0` is parked at one byte on exactly that shortage: it needs the
swap, and all three statements after its loop are already spoken for.

**There is a second lever, and unlike the first it costs nothing: put the loop
body's *last* statement in `do { … } while (0)`.** That swaps the same pair,
emits no code, and needs no post-loop reference. `sub_0806DDF4` is the case; it
went from 94.1% to a match on this alone, found by the permuter after ~25 hand
spellings across the type-and-binding axes had all come back flat.

**The condition is the one that decides whether it is available to you: the two
competing values must fall on OPPOSITE sides of the inner loop.** In
`sub_0806DDF4` they do — `rec = g->unk00;` (the loop-carried pointer) is left
outside and `rec->arr[i]->m = 0;` (the loop-carried zero) goes inside, so only
the zero gets the depth bonus. Wrap a body where **one statement uses both** and
nothing moves, because both are promoted together. That is why this does not
unpark `sub_0801A6C0`, whose loop body is the single store `p[i].unk00 = v`:
wrapping it whole is a no-op, and splitting the address into its own statement
first buys the swap but costs two bytes elsewhere. Details in that function's
parked draft — do not re-derive them.

**The nesting is the whole mechanism, and a bare block is NOT a substitute.**
Six spellings of the same loop body, one probe, and only the first reaches it:

```c
for (...) { rec = g->unk00; do { rec->arr[i]->m = 0; } while (0); }  /* swaps  */
for (...) { rec = g->unk00; { rec->arr[i]->m = 0; } }                /* no-op  */
for (...) { rec = g->unk00; rec->arr[i]->m = 0; }                    /* no-op  */
for (...) (rec = g->unk00)->arr[i]->m = 0;                           /* no-op  */
for (...) rec = g->unk00, rec->arr[i]->m = 0;                        /* no-op  */
rec = g->unk00; for (...) { rec = g->unk00; rec->arr[i]->m = 0; }    /* no-op  */
```

`do/while(0)` is a degenerate *loop*, so the front end raises the loop depth of
everything inside it, and loop depth is a multiplier in the allocation priority
`global_alloc` sorts allocnos by. The value used inside the inner loop is
promoted above the invariant that merely lives across the outer one, is
processed first, and takes the lower register. A compound statement carries no
depth and changes nothing — which also means this is *not* a statement-boundary
or pseudo-numbering effect, and it is a different axis from the wave-8 dead
store (that one buys liveness; this one buys priority at the same liveness).

Read backwards, it is weak evidence about the original: `do { … } while (0)` is
the standard multi-statement-macro idiom, so a body that only matches with it
probably *was* a macro. Do not read it as a trick — but do not delete it from a
matching draft either.

**The same construct has a second, unrelated use, and there is no loop in sight
for it: wrapped round a straight-line statement it stops a LATER statement's
constant being materialised early.** The symptom is the "constant in a pushed
callee-saved register" case two paragraphs up, and the recorded fix there — a
`volatile` read elsewhere — is not the only one. Wave 10 hit it twice in one
batch: a run of stores to display-register shadows, then a halfword
read-modify-write, then `proc->member = 0`. The zero for that last store gets
materialised *inside* the read-modify-write, into r4/r5, which costs a
`push`/`pop` pair the ROM does not have. Wrapping the read-modify-write pins it
back to its own store:

```c
g.raw = (g.raw & 0xffe0) | 0x1f;                   /* movs r4,#0 lands HERE, +4 bytes */
g.bits.bit5 = 1;
proc->unk58 = 0;

do { g.raw = (g.raw & 0xffe0) | 0x1f; } while (0); /* movs r1,#0 lands at its store   */
g.bits.bit5 = 1;
proc->unk58 = 0;
```

`sub_08067410` and `sub_08067300` both need it, and note **which** statement to
wrap: the one the constant is being hoisted *into*, not the store that wants it
and not the one before. Wrapping the store itself, or the first statement of the
function, both leave it exactly where it was. Ruled out on the same function,
all still hoisting: a local for the zero, `s32`/`void *` for the member,
`x = x * 0`, `&=`/`|=` split into two statements, the bitfield write spelled as
a raw `|= 0x20`, and the effect write spelled as a raw mask.

Mechanism is the same loop-depth multiplier as above, seen from the other side —
the constant is no longer free to be scheduled into a region that now sits at a
higher loop depth than the statement it belongs to. Two consequences worth
carrying: this axis is invisible to the permuter for anything that includes
`hardware.h` (see Workflow), and a near-miss that is *only* `push {r4}` /
`pop {r4}` plus one `movs #N` in the wrong place is this and not a type problem.

**One `mov #N` serves every store of that constant in the body, and the only
thing that splits it is routing one store through a local variable.** A
straight-line function storing the same constant to two different objects always
shares the register — the qualifier on the destination, its aggregate-ness and
its volatility are all irrelevant (ten spellings, one probe; the list is under
Bitfields). So **a second `movs #N` where one would have done is positive
evidence that the original had a local**, not evidence about the destination's
type. `sub_0801298C` writes `0` to an IWRAM shadow and to `REG_BLDALPHA` and is
4 bytes longer than the all-literals spelling for exactly this reason.

**Interleave a store of a DIFFERENT constant and that tell inverts — the
literals split and the local is what shares.** The rule above holds for an
uninterrupted run; once another constant lands in the middle, its `mov` takes
the register the shared one was living in and the literal spelling has to
re-materialise. Same four statements, two spellings:

```c
g1 = 0; g2 = 2; g3 = 0; g4 = 0;        /* mov #0 ; mov #2 ; mov #0  -- TWO zeroes */
z = 0; g1 = z; g2 = 2; g3 = z; g4 = z; /* mov #0 ; mov #2           -- ONE, in its
                                          own register, ahead of the whole run  */
```

So **a single `movs #N` sitting *before* the first address `ldr` of a run that
is broken up by another constant is the local**, and a second `movs #N` inside
the run is the literal spelling — exactly the opposite polarity from the
uninterrupted case. `sub_08085AF4` needs the local for its three trailing zero
stores and is two instructions shorter than the all-literals version; the local
also has to be assigned in a statement of its own, per the source-statement
ordering rule, or its `mov` lands in the wrong slot.

**Where the local's `mov` lands then follows the source-statement order rule
above, and "one slot too early" is a real near-miss.** For
`g = 0; v = 0; REG = 0x8f; REG2 = v;` the `mov` for `v` is emitted *before* the
`ldr` that sets up the `REG` statement. To land it *inside* that statement —
between its address `ldr` and its value `mov`, which is where `sub_0801298C`
has it — the assignment has to become part of that statement. Two spellings do
it and are byte-identical to each other:

```c
REG_BLDCNT = (alpha = 0, 0x8f);        /* comma-fold into the next statement */

p = (vu16 *)(REG_BASE + REG_OFFSET_BLDCNT);   /* or split the address out  */
alpha = 0;                                    /* so the assignment becomes */
*p = 0x8f;                                    /* a whole statement earlier */
```

Ruled out, all one slot early or worse: the assignment before or after the
neighbouring statement, an initialiser (hoists to the very top), `register`,
`int` instead of `u16`, a nested block, `REG2 = (alpha = 0)`, and a second local
for the other constant.

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

**A runtime `adds rB, #imm` where `imm` is larger than the struct is `g[i + k]`,
not a member you are missing.** `g[i + 1].member` never emits an `adds #1` on
the index: `fold` distributes the stride over the `+ 1` before expansion, so the
element offset and the member offset arrive as one constant and you get a single
`adds rB, #(sizeof(T) + offsetof(member))`. On the 0x3c-byte `Unk08499598` both
`sub_08026F9C` and `sub_08026FD0` reach `unk2a` of element `n + 1` and emit
`adds r2, #0x66` — 0x3c + 0x2a. Read the wrong way that says "there is a member
at +0x66", which is impossible in a 0x3c struct and sends you widening the
type. **Tell: the constant is >= the stride.** Sibling access in the same
function pins it — `sub_08026FD0` reaches the same member at `+0x2a` through a
different index two instructions later. The `+ 1` is the usual 1-based-id
convention here, the same one `gUnknown_0810E6E0` uses.

**But that rule is for a straight-line access. Put the biased index in a LOOP
and `g[i + k]` stops being a folded constant and becomes a different loop.**
This matters because it is the only way to tell "one array, indexed from k" from
"a second array based at k elements in" — two models that describe the same
bytes and are otherwise indistinguishable. Same seven stores, same addresses,
one probe:

```
p->arr[i]      (arr based at +0x54)  lsl rI,rN,#2 ; add rB,#0x54 ; add rB,rB,rI
                                     ... add rN,#1 ; cmp rN,#6 ; ble   <- counter kept
p->arr[i + 4]  (arr based at +0x44)  mov rO,#0x10 ; ... ; add rO,#4
                                     mov rC,#6 ; sub rC,#1 ; cmp rC,#0 ; bge
```

With the bias inside the subscript, strength reduction turns the whole address
into a running byte offset stepped by the element size and reverses the counter
against it; with the array based where the source based it, the index stays
`i * 4` recomputed from the loop counter. Different instructions, not a
register permutation, so **a surviving `lsls rI, rCounter, #2` proves the source
did not write a biased index** — the array really starts where the `adds #imm`
says. `sub_0806DDF4` is the case, and it is what re-based
`struct Unk08580934`'s pointer table: what had been declared as one
`unk44[0xc]` is `unk44[4]` plus a separate `unk54[7]`.

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

**That table is about a constant added to the *byte address*. A constant added
to a *subscript* on a typed array global folds too, and escaping it costs a
different spelling — one of only three, and they are three different
instruction orders of the same four instructions.** For
`extern const u8 g[][32];` and `g[b + 8]`, i.e. a runtime index plus a constant
scaled by the element size:

| codegen | source |
|---|---|
| `lsl rI,rB,#5 ; ldr rD,=g+0x100 ; add` — **no runtime add at all**, 0x100 = 8*32 folded into the relocation | `g[b + 8]`, `&g[b + 8][0]` |
| `add rB,#8 ; ldr rD,=g ; lsl rB,#5 ; add` — runtime add **before** the base `ldr` | `b += 8;` (or `i = b + 8;`) as its **own statement**, then `g[b]` |
| `ldr rD,=g ; add rB,#8 ; lsl rB,#5 ; add` — runtime add **after** the base `ldr` | `g[b += 8]` — the assignment **embedded in the subscript** |

All three are the same length, so only the ROM hash notices; the middle and
bottom rows differ by one instruction's position. `sub_0802A8AC` is the bottom
row and neither of the natural spellings reaches it. Read backwards: **a folded
`.word g+0xNN` on an array global proves the constant was written inside the
subscript expression, and a runtime add sitting *after* the base `ldr` proves
the source assigned to the index inside the subscript.** Binding the base to a
pointer local instead (`const u8 (*p)[32] = g;`) is worse than any of them — it
materialises the 0x100 as `mov #0x80; lsl #1` and costs two instructions.

Note the contrast with `sub_0802A880` next door, which is the *same* family and
needs no trick: its index carries a `& 0x3ff` mask, and a mask anywhere in the
subscript blocks the fold on its own.

**With split declarations, agbcc emits setup instructions in source-statement
order.** Same instructions, same registers, three positions for one `mov rN,#0`:

| source | where the `mov #0` lands |
|---|---|
| `u32 v = 0;` as an initialiser, before the pointers | first, ahead of the base `ldr` |
| no `v` — store the literal directly | last, after the cursor computation (loop-invariant motion drops it in the preheader) |
| `base = g; v = 0; p = base + 4;` as three statements | second, exactly where the source puts it |
| `p = g; for (i = 0; i < N; i++) p[i] = 0;` | **between the address `ldr` and its deref** |

An initialiser and an assignment are **not** interchangeable for scheduling.
This is more general than the `-fforce-addr` section's "splitting the
declaration from the assignment matches" note, and has nothing to do with
`-fforce-addr`; it decided `sub_08078740`.

**Splitting a side effect out of an expression matters just as much, and for a
`u16` running value it changes the whole representation.** For a straight-line
run of `*p = v; v++;` on a `u16` local, folding the increment into the store as
`*p++ = v++` makes agbcc keep the value pre-shifted by 16 and step it by
`0x10000`, extracting each stored halfword with a fresh `lsr #16`:

```
*d = v; d++; v++;     lsr r1,r1,#0x10 once, then per step: add r1,#1 ; lsl #16 ; lsr #16
*d++ = v++;           mov r3,#0x80 ; lsl r3,#9  (=0x10000), then per step:
                      lsr r2,r1,#0x10 ; add r1,r1,r3       -- 4 bytes longer, needs a
                                                              second live register
```

Both are correct and the shorter one is what the ROM has, so **read a
`lsr #16` appearing once, followed by `add #1; lsl #16; lsr #16` per step, as
separate statements** — and a `+0x10000` induction constant as the fused form.
`sub_08075F1C` (a 2x2 tile block, four ascending tile ids) is the case; the same
probe also shows the pointer walk is only reproduced by advancing the pointer in
its own statement, since `d[0]`/`d[1]`/`d[0x20]`/`d[0x21]` folds the offsets into
displacements instead.

The fourth row is `sub_08019C24`, a 0x400-halfword clear through a *pointer*
global. Strength reduction collapses `p[i] = 0` and `*p++ = 0` to the same
`strh; adds #2; subs #1; cmp #0; bne` loop, so the whole 28 bytes are identical
except where the invariant zero sits. Four spellings, four positions:

```
p = g; for (i=0;i<N;i++)  p[i] = 0;   ldr rB,=g ; mov rV,#0 ; ldr rB,[rB] ; <count>
p = g; for (i=0;i<N;i++) *p++ = 0;    ldr rB,=g ; ldr rB,[rB] ; mov rV,#0 ; <count>
v = 0; p = g; ...       *p++ = v;     mov rV,#0 ; ldr rB,=g ; ldr rB,[rB] ; <count>
p = g; for (i=N;i!=0;i--) *p++ = 0;   ldr rB,=g ; ldr rB,[rB] ; <count> ; mov rV,#0
```
(`do { *p++ = 0; } while (--i);` is byte-identical to the last row.) The
subscript form is the only one that splits the pointer global's `ldr rB,=g`
from its `ldr rB,[rB]` — the deref belongs to the induction variable GCC
invented in the preheader, while the symbol address does not.

**In a loop, whether a pointer's initial copy lands in the *prologue* or in the
*loop preheader* says whether the source indexed the pointer or advanced it.**
Same instructions, same length, different order — so the only symptom is the
`adds rN, rP, #0` moving past the preheader constants:

```
push {...} ; add r4,r0,#0 ; add r7,r1,#0 ; mov r5,#0 ; mov r6,#0xf   <- src += 2 in the body
push {...} ; add r7,r1,#0 ; mov r5,#0 ; mov r6,#0xf ; add r4,r0,#0   <- src[i*2] / src[i*2+1]
```

A pointer the source *mutates* is a variable in its own right and its copy is
emitted with the other parameter copies, before anything belonging to the loop.
A pointer the source only *subscripts* has no such variable — the walking
register is a derived induction variable GCC invented, and its initialisation
belongs to the preheader, after the loop's own constants. `sub_08034400` is the
case: the `src += 2` spelling and the `src[i*2]` spelling both compile to 44
bytes and differ in exactly one instruction's position. Reading the mutation
into the source because the assembly walks a pointer is the wrong direction —
check where the copy sits first.

**Corollary, and it is the sharper half: `p[C + i]` strength-reduces the source
pointer away; `s->memberArray[i]` does not.** Three spellings of "copy five
bytes from `param + 0x4C4` into a byte array", all 40 bytes, all seven
instructions in the loop:

| source | codegen |
|---|---|
| `src[0x4c4 + i]` on a `u8 *` | `add r2,r0,rC` in the preheader, then `ldrb r0,[r2] ; add r2,r2,#1` — **the source pointer becomes a second walking biv** |
| `p = src + 0x4c4; p[i]` | base add first, `add r1,r3,r2 ; ldrb r1,[r1]` — index recomputed, pool order **constant, then the global** |
| `s->unk4c4[i]` on a struct pointer | identical body to the row above, pool order **global, then the constant** |

So a loop that recomputes `base + i` for *both* arrays and carries only one
induction variable did **not** write the offset inside the subscript; and the
last two rows are told apart only by which pool word comes first. `sub_0803D6FC`
is the member-array row. No size signal anywhere in the three — same failure
class as the `|=` operand swap.

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

**All of that is about an expression whose *value* is the address. The moment
the same expression is dereferenced for a member, `g + i` changes columns and
splitting the address into its own statement becomes load-bearing.** The probe
above never dereferences, so it does not cover the common case, and the table's
second row reads as though `(g + i)->f` were safe. It is not — that spelling
and plain `g[i].f` are byte-identical, both deref-first:

| source | codegen |
|---|---|
| `g[i].f` / `(g + i)->f` / `(&g[i])->f`, all inline in the statement that uses the member | `ldr rB,=g; ldr rI,[rB]; <index math into rB>; add rB,rB,rI; ldrb` — deref first, **index add writes the index's register** |
| `p = &g[i];` as its **own statement**, then `p->f` | `ldr rB,=g; <index math into rI>; ldr rB,[rB]; add rB,rB,rI; ldrb` — deref after the index math, **add writes the pointer's register** |

Same instructions, same length; only the position of `ldr rB,[rB]` and which
register the add writes. `sub_08008B70` needs the second row and neither inline
spelling reaches it. The mechanism is just expansion order — inside one address
expression the PLUS expands its pointer operand (the deref) before its index
operand, and only a statement boundary forces the address to be built first.
Read backwards: **an index multiply sitting between a pointer global's pool
`ldr` and its `ldr [rB]` means the original bound the element address to a
local in a statement of its own.**

**`p[X + C]` and `*(p + X + C)` are NOT the same code, and the difference is a
whole register.** `a[b]` is `*(a + b)` in the C front end, so the two look
interchangeable and this file's fold table happily lists a subscript and an
explicit deref in the same row — that table is about which constants reach the
*pool*, and it does not cover this. When a pointer global's deref is used
**twice** in one address expression — once as the base and once to load the
index — the two spellings differ in which register the deref lands in, at
identical length and identical instruction order:

```c
p = g;  *(p + *(u16 *)(p + 0x4184) + 0x143f)   /* ldr r0,=g ; ldr r0,[r0] ; ldr r2,=0x4184
                                                  ; add r1,r0,r2 ; ldrh r1,[r1] ; add r0,r0,r1
                                                  ; ldr r1,=0x143f ; add r0,r0,r1  -- deref in r0 */

p = g;   p[*(u16 *)(p + 0x4184) + 0x143f]      /* ldr r0,=g ; ldr r1,[r0] ; ldr r2,=0x4184
                                                  ; add r0,r1,r2 ; ldrh r0,[r0] ; add r0,r0,r1
                                                  ; ldr r1,=0x143f ; add r0,r0,r1  -- deref in r1 */
```

The subscript groups `X + C` as an integer add *inside* the pointer add, and
writing the constant before the variable (`*(p + C + X)`) does the same thing
— `fold` reassociates both back to `(p + X) + C`, so all three end up with the
identical instruction sequence and only the allocation differs. **The deref
reaches r0 only when the source's leftmost pointer add is `p + <the variable
term>`, with the constant trailing as its own `+ C`.**

One probe, ten spellings, split 4/6 on exactly that. In r0: `*(p + X + C)`,
and the same with no local at all. In r1: `p[X + C]`, `g[X + C]`, `(p + C)[X]`,
`*(p + C + X)`, and binding the halfword, the shifted result or the loaded byte
to a `u16`/`u32`/`int`/`u8` local first — the usual type-and-binding sweep is
flat here, which is what makes this worth knowing rather than guessing at.
`sub_08045848` and its three siblings are the r0 row and the natural subscript
spelling misses all four.

**Its fifth sibling splits off on a second, independent axis: binding `p + C`
to its own pointer local moves the constant's add ahead of the `ldrh`.** Same
44 bytes, same instruction multiset, only the order:

```c
p = g;  q = p + 0x1432;                  /* ldr r0,[r0] ; ldr r2,=0x418c ; add r1,r0,r2
        *(q + *(u16 *)(p + 0x418c))         ; ldr r2,=0x1432 ; add r0,r0,r2 ; ldrh r1,[r1]
                                            ; add r0,r0,r1   -- the constant is added FIRST */

p = g;  *(p + *(u16 *)(p + 0x418c) + 0x1432)   /* ... ldrh r1,[r1] ; add r0,r0,r1
                                                  ; ldr r1,=0x1432 ; add r0,r0,r1 */
```

`sub_080458F8` is the first row and its four siblings are the second. Read
backwards: **a pointer global's constant offset added before the load that
produces the index means the source bound the biased base to a local**; added
after it, the source wrote one expression. There is no size signal on either
axis, so both have to be read off the target before drafting.

For an **array global** `extern struct T g[];` there is no deref to schedule,
and the rule is a real constraint rather than a choice: under `-fforce-addr`,
repeating `g[i].member` for *two different members of the same element*
recomputes the whole address each time — a fresh `adds` per access, which also
flips the `muls` destination as a side effect. Binding either the base or the
element collapses them into one base plus displacements, and the `muls` tie then
resolves itself with no separate massaging.

**Repeat *one* member of an array global's element instead of two, and there are
three outcomes, not two — and the honest repeated spelling is the one that wins,
which inverts the "bind `p + C` to a local" advice two paragraphs up.** Same
function, same 44 bytes, wave 16's F067 (`sub_08015E80`, read-modify-write of
`gUnknown_03001470[i].unk04` where the member is a pointer):

```c
g[i].m used twice        /* ldr r1,=g ; lsl/add/lsl (i*0x60) ; add r1,r1,#0x4
                            ; add r4,r4,r1     -- CLEAN pool word, run-time +C */

T **p = &g[i].m;         /* lsl/add/lsl ; ldr r0,.L ; add r4,r4,r0
                            .word g+0x4        -- +C SINKS INTO THE RELOCATION */

struct S *p = &g[i];     /* ldr r1,=g ; lsl/add/lsl ; add r4,r4,r1
                            ; ldr r0,[r4,#0x4] -- displacement form */
```

The mechanism is that CSE has to materialise `&g[i].m` as a *value* either way,
and what decides where the `+ C` goes is whether the constant is still visible
to the address-constant folder at expand time. Naming the member twice hides it
behind the common subexpression, so it becomes a run-time `adds`; binding the
member's address hands it to the folder as `symbol + 4`, which is a legal
relocation addend and is taken. Read backwards: **`ldr rB,=gSym` followed by
`adds rB,#C` and only then the index add means the source repeated
`gSym[i].member` in two statements** — a pool word carrying `+C` in the
relocation means it bound the member's address, and a `[rB,#C]` displacement
means it bound the element. All three spellings probed; only the first is the
ROM's, and all three of F067's members are it.

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

**That table is about where the base `add` sits. Which register it *writes* is
a separate knob, and the only thing found to move it is naming the address
twice — a pointer local plus a following `+=`.** Same instructions, same
order, only the destination differs, and on a register-tight function that
difference is a whole extra `push`:

```c
p = g + a * 4;              /* ldr rB,=g ; lsl rI,#3 ; add rI,rI,rB -- dest = INDEX */
p = g; p += a * 4;          /* ldr rB,=g ; lsl rI,#3 ; add rB,rI,rB -- dest = BASE  */
```

`sub_0801E0C8` needs the second. Under the first spelling the pointer inherits
the index's register, the pool `ldr` takes the register the second parameter
arrived in, and the parameter has to be copied out of the way — `push {r4, lr}`,
two extra `adds rD, rS, #0` copies, and a five-register body where the ROM has
four. Ruled out, all identical to the one-expression form: `&g[a * 4]`,
`a * 4 + g`, `g + (a << 2)`, `(T *)((u8 *)g + a * 8)`, an initialiser instead of
an assignment, declaring the index local before the pointer, and an extra unused
parameter. This is the same "a `+=` in a separate statement escapes the fold"
split the pool-fold table records for a *constant* offset; it holds for a
variable index too, and there it changes allocation rather than the pool.

**Naming the stored VALUE in its own statement inverts the expansion order, and
that costs a whole callee-saved register.** A store expands its destination
address before its value, so in a run of `g[i][j].m = p->f;` statements the load
of `p->f` is emitted *after* the address arithmetic — which is free, because by
then the arithmetic has finished with `p` and the load can reuse its register.
Binding the value to a local first forces it live across that arithmetic:

```c
g[i][j].m = p->unk0c;          /* address math clobbers p, then ldrh into r0 */
v = p->unk0c;                  /* ldrh into r5 FIRST, ...                    */
g[i][j].m = v;                 /* ... then the address math clobbers p       */
```

Same instructions, same order otherwise; the second needs one more live
register and therefore one more entry in the `push`. **Tell: a value loaded into
a high callee-saved register ahead of an address computation that overwrites the
pointer it was loaded from.** `sub_08056E28` writes five members through the
same doubly-subscripted address and only the *last* carries it — `push {r4, r5}`
rather than `push {r4}` is the entire signal — so the local belongs to that one
statement and not to the run. `u16` and `int` for the local are byte-identical.
This is the value-side counterpart of the pool-order rule above, and it is a
liveness edit wearing an ordinary-looking source form, like the result variable
under Control flow.

**A shared address that CSE builds across several store statements is not the
same code as one assigned to a pointer local.** With a local, expansion
interleaves each term's shift with its add and accumulates into the base's
register. Written out as N full store expressions with no local, GCC emits
*both* shifts first, then both adds, and threads the result through the index
registers instead:

```c
p = g + cx * 2 + cy * 64;                 /* ldr rB,[rB] ; lsl rX,#2 ; add rB,rB,rX
   p[0] = 0; p[1] = 0; p[0x20] = 0;          ; lsl rY,#7 ; add rB,rB,rY   */

*(g + cx * 2 + cy * 64) = 0;              /* ldr rB,[rB] ; lsl rY,#7 ; lsl rX,#2
*(g + cx * 2 + cy * 64 + 1) = 0;             ; add rX,rX,rB ; add rY,rY,rX */
*(g + cx * 2 + cy * 64 + 0x20) = 0;
```

Same length, same instruction multiset — a pure register permutation, so only
the ROM hash notices. `sub_080223E0` and `sub_080225CC` are the second form.
Ruled out, all producing the interleaved shape: binding the deref to a local
first, `&g[cx*2]` then `p += cy*64` (or `p = &p[cy*64]`), `(u16 *)((u8 *)g +
cx*4 + cy*128)` in one or two statements, `<<` instead of `*`, both operand
orders of the sum, and every parenthesisation of the three terms. A 2D-array
spelling (`u16 (*)[32]`, `map[cy*2][cx*2]`) *does* produce the two-shifts-first
shape but with the two coordinates mirrored — the base folds into the outer
subscript's term there and into the *first-added* term here — so it is a useful
tell that you are on the right axis and not the answer.

Note the coordinates still have to be locals: inline them into the store
expressions and the tilemap's pool `ldr` hoists to the top of the function,
which is the "the `ldr` only hoists when the whole address is one expression"
row above.

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

**Two `return`s versus one result local swaps the array base and the scaled
index between r0 and r1.** Same instructions, same order, same length — the only
thing that moves is which register each half of `g[i]`'s address lands in, so
this presents as a pure register permutation with nothing in the expression to
blame:

```
if (c) return g[i] + K; return v;   ldr r1,=g ; lsl r0,rI,#1 ; add r0,r0,r1 ; ldrh r0,[r0]
r = v; if (c) r = g[i] + K;         ldr r0,=g ; lsl r1,rI,#1 ; add r1,r1,r0 ; ldrh r0,[r1]
return r;
```

The second row is `sub_0804B830`. Read it as: **the base register is r0 when the
loaded value has to be moved into a variable that already exists, and r1 when
the load *is* the return value.** Ruled out as alternative causes, all
byte-identical to the two-return form: inverting the condition and returning
early, a `u16` local for the loaded element, a pointer local for the array base,
`*(g + i)` instead of `g[i]`, an `int` return with a `(u16)` cast, and a `u32`
index local. Worth reaching for whenever an `if`-with-two-exits near-misses on
exactly this permutation, and it belongs on the type-and-binding checklist
alongside "does a value need to stay live longer?" — a result variable is a
liveness edit wearing an ordinary-looking source form.

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
  notices. **This is `|=` only** among the compound operators — `&=`, `^=` and
  `+=` are byte-identical for both forms, with movs-sized and pool-sized
  constants alike, and casting does not change it (`*(u16 *)g |= 8`,
  `((u16 *)g)[0] |= 8` and `g[0] |= 8` all give the scalar form).

  **But it is not compound-assignment-only. A plain `=` whose RHS is
  `<value> | <const>` swaps the same way**, so the aggregate-member reading has
  to be checked on every OR, not just on read-modify-writes. `sub_0805741C` has
  the two spellings side by side in one function, three lines apart, over the
  same expression shape:

  ```c
  gUnknown_030030B4.raw     = gUnknown_085538AE[a ^ 1] | 0x608; /* orr const, const, value */
  *(u16 *)&gUnknown_030030B4 = gUnknown_085538AE[a ^ 1] | 0x608; /* orr value, value, const */
  gUnknown_0300251C         = gUnknown_085538AE[a]     | 0x70C; /* orr value, value, const */
  ```

  The ROM has the *value* as the destination in both statements, so the union
  shadow had to be written through a scalar cast while its scalar neighbour
  needed none. Controlled: only the lvalue changed, and the flip reaches back
  through the whole statement — it also moves which register the feeding `ldrh`
  targets, so the diff presents as a register permutation and not as an operand
  swap. Ruled out as alternative causes, both byte-identical to the plain
  member form: writing the constant first (`0x608 | x`), and binding the OR's
  result to a `u16` local before the store.

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

  **The damage from the wrong lvalue is not confined to the `orr`, and that is
  worth knowing because it makes the diff unrecognisable.** For a mask-and-set
  pair on a `union` shadow — `g = (g & M) | C` written twice — the aggregate
  spelling can reach out and change code that has nothing to do with the
  statement. `sub_08085F40` writes `(x & 0xFFE0) | 4` and then
  `(x & 0xE0FF) | 0x200` on `gUnknown_030030E0`, three statements after an
  unrelated `gUnknown_03001FFC = 0`, and the three spellings split three ways:

  | lvalue | result |
  |---|---|
  | `*(u16 *)&g` | **exact** |
  | `g.raw` | keeps the zero from the *unrelated* neighbouring store alive and ORs it in — a spurious `orr r0, r0, r2`, plus the `push {r4, lr}` the extra live value costs |
  | `*(vu16 *)&g` | correct operands, but the intermediate `strh` survives instead of being store-forwarded into the second statement |

  So a near-miss here does not present as an operand swap at all; it presents
  as an extra instruction and a frame. Both cast spellings are already in the
  tree (`c_08078B08.c` uses `.raw`, `c_08078C54.c` uses `vu16`) and neither is
  the default — the three are genuinely different code and the choice has to be
  read off the target every time.

  **There is a FOURTH spelling, it is the one an author would naturally write,
  and it is the most expensive of the four by a wide margin: routing the pair
  through a `u16` TEMP (wave 19, W19-B).** The three rows above all store to the
  object twice and let DSE drop the first store. Compute into a local instead —

  ```c
  u16 v;
  v = (gUnknown_030030E0.raw & 0xFFE0) | 2;      /* the natural spelling */
  v = (v & 0xE0FF) | 0x800;
  gUnknown_030030E0.raw = v;
  ```

  — and the temp is **one pseudo spanning both statements**, which outranks the
  function's own parameter in the allocator's order and takes its callee-saved
  register. On a 544-byte proc setup that is a **whole-function register
  permutation**: the proc pointer moved from r4 to r5, the run of short-lived
  constants moved from r5 to r4, and a later `movs #0` was materialised five
  instructions early and absorbed a store that in the ROM shares the *earlier*
  zero. 38 of 544 bytes, size-exact, and **not one byte of the diff is in the
  read-modify-write itself**. `sub_0806EB5C` and `sub_0806BB08` were both parked
  at 93.0% and 94.2% on this for a wave, diagnosed as an allocno tie-break and
  as a shared-zero CSE respectively; both closed on the one two-line edit to the
  cast spelling, with nothing else changed and no `do { } while (0)` anywhere.

  Two things to carry, because the second is a decision rule:

  - **Read backwards: a size-exact residual that is a pure r4/r5 swap across an
    entire straight-line function, on a body that contains a two-step
    `(x & M1) | C1` / `(x & M2) | C2` on one object, is this.** Do not look for a
    register-allocation lever, and do not look at the statement the swapped
    registers appear in — the temp is upstream of all of it. This is the wave-18
    "suspect the type before the allocation" lesson with the aggregate type
    replaced by a binding local: **a residual shaped like allocation can have a
    spelling as its cause, and the spelling can be nowhere near the diff.**
  - **`.raw` versus the cast is decided by the number of STATEMENTS, not by the
    object.** `c_08067410` and `c_0806717C` write the pair as ONE statement and
    need `.raw` plus a `do { } while (0)`; `c_08085F40`, `c_0806EB5C` and
    `c_0806BB08` write it as TWO and need `*(u16 *)&g` and no wrapper. Measured
    on `sub_0806EB5C` both ways: with the cast, adding the `do { } while (0)`
    is byte-neutral (both match), and with `.raw` the wrapper does **not** save
    it — 73.3%, with the spurious `orrs r0, r3` the `g.raw` row above predicts.
    So on a two-statement pair the wrapper is not the lever and the lvalue is.

- *The constant gets re-materialised.* A run of `g = 0` stores shares one
  `mov rN, #0`. Change any one of them to `g.raw = 0` and agbcc reloads the
  zero at that point, +2 bytes, padded to +4. `sub_080122EC` grew by four bytes
  this way and shifted 4,172 symbols downstream. This one does not bite when
  the store stands alone or ends a run — `sub_08012358` and `sub_0801237C` both
  match with `.raw`. It bites when the store *interrupts* a run of another
  type, and the fix is to cast at that one call site (`*(u16 *)&g = 0`), not to
  change the declared type of the global.

  **The same split decides how a 16-bit constant is materialised, and there the
  member form is the *cheap* one.** Storing `-1` into a halfword, three
  spellings, three lengths — and only the first is what the ROM has:

  | source | codegen |
  |---|---|
  | `g.s16member = -1` (aggregate member) | `ldr rD,=0xffff; strh` — **2 insns** |
  | `*(u16 *)p = 0xFFFF` (scalar via pointer) | `ldr r1,=0xffff; add r0,r1,#0; strh` — 3 |
  | `*(s16 *)p = -1` (scalar via pointer) | `mov r1,#1; neg r1,r1; add r0,r1,#0; strh` — 4 |

  The trap is that the member form is often unavailable — you may need the
  address in a register for other reasons, and going through the member reloads
  the base. The way out is to keep the pointer and give it an aggregate *type*:
  cast to a one-member struct and store through the member. That is what makes
  `sub_080745C0` exact, and the struct is a pointer-parameter type so it belongs
  in the `.c` rather than the header.

  **This is about a run of stores to ONE object. Do not carry it across to
  stores to *different* objects — there the member lvalue does nothing.** Wave 8
  probed ten spellings of two zero stores to two unrelated halfwords (an IWRAM
  global, then `REG_BLDALPHA`) and every one of them shared a single `mov #0`:
  scalar, `volatile` scalar, aggregate member, array element, volatile array
  element, `volatile` cast away, a subscript on `&scalar`, and a non-volatile
  destination. See the constant-sharing rule under Register-allocation rules for
  the one thing that does split them.

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

**"Consecutive" and "adjacent" in that paragraph are both too strong** — read
them as descriptions of `sub_08049EE4`, not as conditions. The sharing is plain
constant CSE across the whole byte's worth of writes, so neither the bit
positions nor the statements need be contiguous. `sub_080546BC` writes seven of
eight bits of `gUnknown_03004504` in one `ldrb`/`strb` pair as
`0,1,0,0,1,1,1` — the clears land on bits 0, 2 and 3 with *sets interleaved
between them*, and the third clear still derives its mask from the second by
`subs r1, #4` (-5 -> -9), one `mov`/`neg` pair apiece for the first two. So the
signature is: **more `and`s than `mov`/`neg` pairs, with bare `subs` making up
the difference** — count those, not the gaps. The all-ones sets contribute
`mov #bit; orr` and no `and` at all, which is the OR-only rule above and is what
makes the pattern readable straight off: one `orr` per field set to 1, one `and`
per field cleared, in source order.

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

**And the `neg` only appears when the QImode complement mask has bit 7 set.
A bitfield store can equally well emit a bare `movs`, so the absence of a
`mov #N; neg` pair is NOT evidence against a bitfield.** `mask_rtx` builds the
complement in the access mode and hands it to `immed_double_const`, which
keeps the value negative only when its top bit and the discarded high bits
agree — i.e. only when bit 7 of the byte mask is set. Every row above happens
to clear a bit in the top half of the byte; a field in the *bottom* half goes
the other way:

| field | complement, QImode | emitted |
|---|---|---|
| 1 bit at bit 4 | `0xEF` — bit 7 set | `mov #0x11; neg` |
| 1 bit at bit 3 | `0xF7` — bit 7 set | `mov #0x9; neg` |
| **2 bits at bit 6** | **`0x3F` — bit 7 clear** | **`movs #0x3f`** |

`sub_08011588` (and its three siblings) is `gUnknown_030030E0.bits.effect = 2`
and compiles to `ldrb; movs #0x3f; ands; movs #0x80; orrs; strb` — the exact
shape the "`ldrh` plus a pool word is a plain mask" rule above would have you
read as a scalar `(x & 0x3f) | 0x80`. Both spellings are available here, and
the bitfield one is the one that is right; the discriminator is the mask's
sign, not its shape. Read the two rules together: `mov #N; neg` proves a
bitfield, a bare `movs #M` proves nothing either way.

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

**But the AND side loses its signal too, for exactly one class of field: one
that touches the top bit of the access mode.** Then the clear is
`movs #<positive>; ands`, four instructions, and is **byte-identical to the
plain scalar `&= ~mask`** — the same collapse the OR side always has. Wave 9
probe, twelve spellings through a pointer parameter, `u8` container throughout:

| source | codegen |
|---|---|
| `p->b7 = 0` (1 bit @ bit 7) | `ldrb; mov #0x7f; and; strb` — **4** |
| `*p &= ~0x80` (plain `u8`) | `ldrb; mov #0x7f; and; strb` — **byte-identical** |
| `p->b6 = 0` (1 bit @ bit 6) | `ldrb; mov #0x41; neg; and; strb` — 5 |
| `*p &= ~0x40` (plain `u8`) | `ldrb; mov #0xbf; and; strb` — 4 |
| `p->hi = 0` (2 bits @ 6..7) | `ldrb; mov #0x3f; and; strb` — 4 |
| `p->hi = 0` (3 bits @ 5..7) | `ldrb; mov #0x1f; and; strb` — 4 |
| `p->lo = 0` (6 bits @ 0..5) | `ldrb; mov #0x40; neg; and; strb` — 5 |
| `u16 hi:4` @ bits 12..15 | `ldrb [r0,#1]; mov #0xf; and; strb [r0,#1]` — 4 |
| `u16 mid:6` @ bits 6..11 | `ldrh; ldr =-0xfc1; and; strh` — HImode, pool word |

Mechanism, so the boundary is predictable rather than remembered: `mask_rtx`
builds the complement in SImode, then `immed_double_const` truncates it to the
access mode **unless its in-mode sign bit is 1**. Clearing any field that
excludes the mode's top bit leaves that bit set, the constant stays negative
(`0xFFFFFFxx`), and THUMB needs `mov #N; neg`. Clearing a field that *includes*
the top bit zeroes it, the constant truncates to a positive 8-bit value, and a
bare `movs` suffices. The mode is `get_best_mode`'s, so "top bit" means bit 7 of
the byte the field lives in — including byte 1 of a `u16` container, per the
`hi:4` row.

Two consequences. **A `movs #0x7f`-shaped mask next to `mov #N; neg` masks in
one function is not a scalar `&=` mixed in with bitfield writes** — it is the
top-bit field of the same bitfield struct, and reading it as a raw `&=` will
cost you the whole function. `sub_0805319C` writes all eight bits of
`gUnknown_03004504` and bit 7's clear is the odd one out for this reason alone.
And **for a field at the mode's top bit, neither accessor of a set/clear pair
distinguishes bitfield from scalar** — the paragraph above holds only for
fields that do not reach bit 7.

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

**But first settle whether the source branched at all. `if (C) return A;
return B;`, `return C ? A : B;` and `return C;` are three different shapes, and
the paragraph above only describes the first.** All three are the obvious way
to write a two-valued function and the choice is not cosmetic. One probe, two
globals, measured on the four functions this came from:

| source | codegen | length |
|---|---|---|
| `if (c) return 2; return 1;` | `cmp; bne L; mov r0,#1; b E;` **pool**; `L: mov r0,#2; E: bx lr` | 24 |
| `return c ? 2 : 1;` | `mov r1,#1; cmp; beq L; mov r1,#2; L: add r0,r1,#0; bx lr;` **pool** | 24 |
| `if (c) return 1; return 0;` | `cmp; bne L; mov r0,#0; b E;` **pool**; `L: mov r0,#1; E: bx lr` | 20 |
| `return c;` (0/1 result) | `cmp; beq L; mov r0,#1; L: bx lr;` **pool** | 16 |

Two things fall out. **The ternary is the same length as the `if`/`return`
pair** — no size signal at all, same failure class as the `|=` operand swap —
and the tells are that the ternary computes into **r1** and ends with a
redundant `adds r0, r1, #0`, and that its literal pool lands **after** the
`bx lr` instead of in the middle of the function. Read a pool sitting between
the two return blocks as the `if`/`return` form. **The boolean form, by
contrast, does have a 4-byte signal**, because it keeps the true-value block as
a fallthrough and never materialises the zero: a function that visibly stores
both constants did not write `return c;`.

`sub_0803BB44`/`sub_0803BB5C`/`sub_0803BB74` are the first row and
`sub_0803BB90` is the third — so even a leaf returning a plain 0/1 can want the
long spelling.

**This paragraph used to end "reaching for `return x != 0;` because it is the
natural C costs four bytes". That is wrong, and wave 10 measured it.** `!= 0` is
not a fourth spelling with a cost of its own; it is a synonym for row 4. Four
spellings over one `Proc_Find` call, one probe, agbcc -O2:

| source | codegen |
|---|---|
| `return f() != 0;` | `cmp; beq L; mov r0,#1; L: pop; bx` — **24 bytes** |
| `return f() ? 1 : 0;` | byte-identical to the above |
| `return !!f();` | byte-identical to the above |
| `if (f()) return 1; return 0;` | `cmp; bne L; mov r0,#0; b E;` **pool**; `L: mov r0,#1; E:` — **28 bytes** |

So the real fork is **explicit `if`/`return` pair versus everything else**, not
the presence of `!= 0`. Any expression that has to normalise a non-0/1 value to
a boolean collapses to the short fallthrough form, and the three short spellings
are indistinguishable in the output — pick whichever reads best. Note the
ternary does NOT get the r1-and-`adds r0, r1, #0` treatment described above when
its arms are literally 1 and 0; that tell belongs to a ternary over two *other*
constants.

Corollary, and the reason this matters: when the callee returns a pointer, `!= 0`
is the only one of the four that is also correct C. The 13-member
`Proc_Find` existence-predicate family at 0x08078150-0x0808AA88 is all short
form, and `src/decomp/c_080457A4.c` already recorded this correctly.

**Both of those tables are the `bl f; cmp; beq; mov #1` shape. There is a
THIRD, BRANCHLESS shape for a returned `!=`, and it is not a different source
spelling — the same `return x != K;` produces one or the other depending on `x`
and `K`.** It is `(t | -t) >> 31` with `t = x ^ K`, i.e.

```
mvn r0, r0 ; neg r1, r0 ; orr r1, r1, r0 ; lsr r1, r1, #0x1f   <- x != -1
mov r1,#5 ; eor r0,r0,r1 ; neg r1,r0 ; orr r1,r1,r0 ; lsr #0x1f <- x != 5
lsl r1,#0x18 ; lsr r1,#0x18 ; neg r0,r1 ; orr r0,r0,r1 ; lsr #0x1f  <- (u8)x != 0
```

Two independent triggers, one probe, fourteen spellings, agbcc `-O2`:

| `return … ;` | shape |
|---|---|
| `x != 0`, `x` a plain `int` — parameter, local, or a `bl` result | **branching** |
| `!!x`, `x ? 1 : 0` on the same `int` | branching — identical to the row above |
| `(x & 0xff) != 0`, `(x ^ y) != 0`, `(x - 1) != 0`, `(x >> 3) != 0` | branching — *computing* the operand is NOT the trigger |
| `x != -1`, `x != 1`, `x != 5` — any **non-zero** constant | **branchless** |
| `(u8)x != 0`, `(s8)x != 0`, or `x != 0` on a `u8` **parameter** | **branchless** |
| `x == 0`, `x == -1` — `==` in any form | branching, and it costs an extra `mov rD, #0` |
| `x < 0` | neither: a lone `lsr r0, r0, #0x1f` |

So the triggers are **a non-zero compare constant** or **a narrowing conversion
on the operand** — and an explicit mask that computes the same value as the cast
is *not* one of them, which is the counter-intuitive half. `mvn` rather than
`eor` is just `x ^ -1` peepholed, so **`mvns` followed by `neg`/`orr`/`lsr #31`
reads directly as `!= -1`.**

Family F020 (seven 32-byte leaves: `sub_08019850`, `sub_0803ACD0`,
`sub_0803B16C`, `sub_0803C2FC`, `sub_0804B160`, `sub_080670D8`, `sub_0806E198`)
is the whole shape in one line — `return <lookup>(script) != -1;` — with the
`lsls #N; asrs #N` in front of the `mvns` being the callee's signed return width
re-extended at the call site (`#0x18` for an `s8`-returning callee, `#0x10` for
an `s16` one). Probed and byte-identical there, so none of them is evidence:
`bool8` vs `int` return, and binding the call result to an `s8`/`s16` local
before the compare. The explicit `if (…) return TRUE; return FALSE;` spelling is
*not* — it emits the branching four-block form from the table above and is four
bytes longer.

**"Branching" in that table does NOT mean "both arms and an unconditional
`b`".** Two waves have now misread it that way, so state it positively: a
*returned* comparison — `==` included — goes through `do_store_flag`, which
presets the false value in a scratch register and conditionally overwrites it.
There is no unconditional branch and the result arrives via `add r0, r1, #0`:

```
bl f ; mov r1,#0 ; lsl r0,#0x18 ; lsr r0,#0x18 ; cmp r0,#2
bne .L ; mov r1,#1 ; .L: add r0, r1, #0        <- return f() == 2;   (20 B)

bl f ; lsl r0,#0x18 ; lsr r0,#0x18 ; cmp r0,#2 ; beq .L1
mov r0,#0 ; b .L2 ; .L1: mov r0,#1 ; .L2:      <- if (…) return 1;
                                                  else return 0;    (24 B)
```

**So `movs rD,#0`/`movs rD,#1` split across an unconditional `b` is the
if/else, and it is the one spelling `return <cmp>;` cannot produce.** Read the
`b` as the discriminator, not the `beq`. Wave 16's F081 (`sub_0803BAFC`,
`sub_0803BB14`, `sub_0803BB2C`) is the 24-byte form, and `src/decomp/
c_0803BB44.c` had already recorded the same 4-byte gap from the callee side —
the two shapes differ by exactly the presets that the branch-free rewrite
saves. The `beq`-to-the-`1`-arm polarity falls out of writing the `1` in the
`then`: gcc lays the else arm down first.

**A `while` loop that opens with a bare `b` to the bottom test, rather than a
duplicated entry guard, had a SIDE EFFECT in its condition.** GCC rotates a
`while` by copying the exit test into the preheader, and `duplicate_loop_exit_
test` refuses when the test block modifies anything. So the two shapes are a
direct readout of the source, and `sub_08012B00` and `sub_080130C8` are the two
of them sitting 0x5c8 bytes apart with otherwise identical bodies:

```c
while (n != 0)      { *p += d; p++; n -= 2; }   /* cmp; beq end -- guard COPIED
                                                   to the top, then body, then
                                                   the same cmp at the bottom */
while ((n -= 2) != 0) { *p += d; p++; }         /* b .Ltest -- no guard at all,
                                                   body, then the decrement and
                                                   the test at .Ltest */
```

Read backwards: **an unconditional `b` into the middle of the loop means the
decrement (or whatever else the condition mutates) belongs *inside* the
condition.** Writing the side effect as the last statement of the body instead
produces the duplicated guard and misses by four bytes.

**But a side effect is only ONE of the causes, and reading the bare `b` as
proof of one will make you invent a `++` the source never had.** A condition
that merely *loads memory* suppresses the duplication too. `sub_0808B678`
(strcpy) is `while (*src != 0) { *d++ = *src++; }` — its test block is a plain
`ldrb; cmp` that modifies nothing — and it still opens with `b` to the bottom
test; three spellings of it, including one with the increments written out as
separate body statements, all produce that shape. One probe, four loops:

| source | entry guard? |
|---|---|
| `while (k != 0) { *d++ = *s++; k--; }` — condition on a **local** | **duplicated** |
| `while (*s != 0) { *d = 1; s++; d++; }` — condition loads, body stores a constant | **duplicated** |
| `while (*s != 0) { n++; s++; }` — condition loads, body touches no memory | bare `b` |
| `while (*s != 0) { n += *s; s++; }` — condition loads, body re-loads | bare `b` |

Note rows 2 and 3 rule out both of the tidy one-line explanations: "the
condition reads memory" is not sufficient (row 2 duplicates anyway) and "the
body stores" is not necessary (row 3 has no store). So the shape is **not** a
clean readout of the source in general, and the only rule that survives is the
one anchored at both ends: a condition on a **local** duplicates
(`sub_08012B00`), a condition that dereferences a pointer the loop is walking
usually does not (`sub_0808B678`, `sub_0808B6B0`). Write the natural source
first and read the shape off the probe; do not run the inference backwards.

**A mutating condition is not the only thing that suppresses the guard copy:
`break` does it too, and an early `return` out of the same loop does not.**
Same loop, same two exits, four bytes apart:

```c
while (*p != 7) { if (*p == 8) break;    p += 8; } return p;  /* 16 bytes */
while (*p != 7) { if (*p == 8) return p; p += 8; } return p;  /* 20 bytes */
```

With `break` the two exits stay distinct, GCC pulls the body's test up into the
loop's own test block, and what is left is one bottom block holding *both*
compares, entered by an unconditional `b`, with `add r0, #8` as the entire body.
With the early `return` the in-loop exit cross-jumps into the function's single
tail, the loop test goes back to being a plain compare, and
`duplicate_loop_exit_test` copies it — **load included** — into the preheader:

```
ldrb r1,[r0] ; cmp r1,#7 ; beq END          <- the copied guard, load and all
L: cmp r1,#8 ; beq END ; adds r0,#8
   ldrb r1,[r0] ; cmp r1,#7 ; bne L
```

`sub_08074570` is the second row and neither `break` spelling reaches it (an
explicit entry `if` wrapped round a `do`/`while` does not either — that still
loses the guard copy, in both the direct and the local-for-the-value form).
Read backwards: **a `load; cmp` pair duplicated into the preheader, with the
back edge landing after it, means the in-loop exit was a `return`.**

And do not reach for the obvious `while (*p != 7 && *p != 8) p += 8;` here —
GCC folds a pair of `!=` against adjacent constants into the range test
`(u8)(*p - 7) <= 1`, which is one compare and 16 bytes. That fold happens before
the `&&`-versus-two-`if`s distinction two rules below ever applies, so no
spelling of the conjunction recovers the two compares.

**In the same pair: `*p += v` puts a *narrow* `v` first and a *word* `v`
second.** `adds rD, rV, rLoaded` versus `adds rD, rLoaded, rV` — the value's
own register leads when the parameter is `u16`, the loaded halfword leads when
it is `int`/`u32`. There is a size signal too (the `u16` carries the
`lsl #16; lsr #16` pair the fill-loop rule predicts), but the operand order is
the cheaper check and it settles the type on its own:

```
adds r0, r2, r0   <- u16 delta (sub_08012B00)
adds r0, r0, r1   <- int delta (sub_080130C8)
```

**Two guards: `&&` and two separate `if`s are different code, and the block
order tells you which.** Both compute the same thing and both are 60 bytes; the
difference is which return block sits between the compares and the pool:

```c
if (C1 && C2) return A; return B;   /* branch to B on !C1; INVERT C2, branch to
                                       B; A first, then the pool, then B */
if (!C1) return B;                  /* branch to B on !C1; keep C2's polarity
if (C2) return A; return B;            and branch to A; B falls through right
                                       after the compare, A lives past the pool */
```

The second form's two `return B`s cross-jump into the one block, and that block
is the fallthrough of the *second* compare — so **a shared early-out block
placed immediately after the last compare means separate `if`s, and `&&` will
near-miss with that one branch inverted.** `sub_08026FD0` is the case.

**`i < N` unsigned canonicalises to `cmp #N-1; bls`.** Do not "correct" the
source to `<=` chasing the asm.

**A two-sided clamp: whether the second compare reads the *offset* register or
the *result* register says whether the source had a result variable.** Two
spellings of `clamp(a - C, 0, M)`, both 20 bytes, same instruction count, and
they differ in two registers and the branch polarity:

```c
v = a - C; if (v < 0) return 0;      /* sub r0,r0,#C ; cmp r0,#0 ; bge L    */
           if (v > M) return M;      /* mov r0,#0 ; b END ; L: cmp r0,#M    */
           return v;                 /*    -- parameter mutated in place    */

v = a - C; r = 0;                    /* add r1,r0,#0 ; sub r1,#C ; mov r0,#0 */
if (v >= 0) { r = v;                 /* cmp r1,#0 ; blt END ; add r0,r1,#0   */
              if (r > M) r = M; }    /* cmp r0,#M ; ble END ; mov r0,#M      */
return r;                            /*    -- ROM shape                      */
```

The early-return form has nothing to keep the pre-clamp value in, so it
subtracts into the parameter's own register and the zero becomes a separate
block reached by an unconditional `b`. The result-variable form gives the
subtraction a register of its own, materialises the `0` **before** the first
compare, and — the sharpest tell — makes the *second* `cmp` read the copy
(`r0`) rather than the offset (`r1`). Read backwards: **`movs rD, #0` sitting
ahead of the first `cmp`, with a redundant-looking `adds rD, rS, #0` between the
two compares, is a result variable seeded to the out-of-range value.**
`sub_08074C5C` and `sub_08074C70` are the pair, and this is a different case
from the missing-return rule below — here both paths do return.

**Two-sided signed range checks** become one unsigned compare:
`cmp rN,#0x3f; bhi` after `subs #0x60` is `if (id >= 0x60 && id < 0xa0)`, with
the subtraction CSE'd into the following `id -= 0x60`.

**Cross-jumping is automatic** — write independent `return` statements with
textually identical tails and agbcc merges them.

**But not when the tail returns a symbol address: each `return gSym;` block
builds its own pool entry, so the two `ldr`s are not identical insns and the
merge never fires.** Two `return gUnknown_0810A3E8;` statements — one under
`case 3:` and one after the `switch` as the fallthrough — compile to two
separate `ldr rD, <own pool word>; b` blocks, eight bytes longer than the ROM.
Only stacking the labels on **one** arm reaches the shared block:

```c
switch (a) {
case 3:
default:  return gUnknown_0810A3E8;   /* one block, one pool word */
case 4:   return gUnknown_0810AFC8;
}
```

`sub_0803F128` is the case and `sub_0803F110` immediately above it is the same
shape over a different pair. Read backwards: **a symbol-returning switch with
more arms than pool words had those labels stacked on one arm**, and the shared
arm is the one the dispatch falls through into.

**A two-case switch never produces a range test, so `cmp #N; bls` guarding a
single equality test is an `if`-chain on an UNSIGNED value.** All three
spellings below are 36 bytes and compute the same thing, so there is no size
signal at all — same failure class as the `|=` operand swap:

| source | codegen |
|---|---|
| `switch (v) { case 0: … case 1: … default: … }`, **any** case order | `cmp #0; beq; cmp #1; beq` — two equality tests, **no range test** |
| `int v; if (v > 1) …; if (v == 1) …;` | `cmp #1; ble; …; cmp #1; beq` |
| `u32 v; if (v > 1) …; if (v == 1) …;` | `cmp #1; bls; …; cmp #1; beq` |

`expand_end_case` only reaches the range-checked path via a tablejump, which a
case count below `case_values_threshold()` never takes; below it,
`emit_case_nodes` emits a balanced tree of plain equality tests. So read a range
test over a small dense set as an explicit `if`-chain and let the
signed/unsigned bit of the first branch pick the local's type — the value being
a `u8` member is not enough, since integer promotion makes the expression `int`
and `ble` is what you get. `sub_080432E0` is the third row; four switch
spellings (both case orders, `default` first, a `u32` index) all came out as the
linear pair.

**Picking one of two constants: a `?:` inside an expression and an `if`/`else`
statement are different code, and the presence of an unconditional `b` says
which.** This is the one-value analogue of the branch-polarity rule and it costs
a whole instruction plus a register role, so read it before drafting. One probe,
one body (`track->flags |= <0xc or 0x3, on a byte test>`), three spellings:

| source | codegen |
|---|---|
| `x = c ? A : B;` **as its own statement**, then `mem \|= x` | `mov rX,#B ; cmp ; bne L ; mov rX,#A ; L:` — **one arm, no `b`**, and the `mem` load lands *after* the merge |
| `mem \|= (c ? A : B)` — the `?:` **inside** the expression | `cmp ; bne L1 ; mov rX,#A ; b L2 ; L1: mov rX,#B ; L2:` — **both arms**, and the `mem` load is hoisted *above* the `cmp` |
| `if (c) mem \|= A; else mem \|= B;` | both arms, and the `mem` load is **duplicated inside each arm** |

So an unconditional `b` between two `mov`s of different constants rules out the
statement form outright — agbcc rewrites that one into "store the else value,
then conditionally overwrite it", which is one instruction shorter. Going the
other way, a *single* `mov` before the `cmp` means the source assigned a local in
a statement of its own. `switch` with one `case` plus `default` is byte-identical
to the `if`/`else` statement, and so is initialising the local to 0 first.

Two consequences that are easy to misread. **The position of the memory operand's
load is decided by this choice, not by operand order in the source** — writing
`(c ? A : B) | mem` rather than `mem | (c ? A : B)` does not move it, and neither
does binding the load to a local in an earlier statement. And **the `if`/`else`
form emits a second `movs #0`** where the expression form shares one with the
neighbouring zero stores, which is the constant-splitting rule under
Register-allocation rules showing up without any local being involved.

`sub_08071564` (m4a `ClearModM`) wants the *third* shape's dead `movs` and the
*first* shape's single post-merge load at the same time, and no spelling found
reaches both — see the parked draft in `work/sub_08071564/`.

**A jump table proves the source wrote its arms SEPARATELY, even when every
entry points at the same label.** agbcc decides between a tablejump and a chain
of compares in `expand_end_case`, on the number of case nodes *surviving*
`group_case_nodes` — which merges value-adjacent cases whose labels resolve to
the same insn, or to two simple jumps with the same target. So the obvious
spelling of "codes 0-3 do nothing, code 4 stops" collapses to two nodes, drops
below the threshold, and comes out as three compares:

```c
switch (*p++) {                     /* cmp #0; blt L ; cmp #3; ble L        */
case 0: case 1: case 2: case 3:     /*   ; cmp #4; bne L  -- NO table       */
    break;
case 4:
    return;
}

switch (*p++) {                     /* ldr rT,=table ; cmp #4; bhi L        */
case 0: x = 1; break;               /*   ; lsl #2; add; ldr; mov pc,r0      */
case 1: x = 2; break;               /* five-entry table, entries 0-3 all    */
case 2: x = 3; break;               /* pointing at L                        */
case 3: x = 4; break;
case 4: return;
}
```

`x` is dead and every store to it is deleted; the four arms are then
cross-jumped into one and the table entries redirected to the loop head. The
table survives because it was built before any of that happened. Read
backwards: **N table entries sharing one target means N source arms, and the
arms' contents are unrecoverable** — only their separateness is evidence.
`sub_08020680` is the case, and its two leading parameters are dead for the
same reason the case bodies are.

**A loop whose entry test and bottom test read the same value through
*different* expressions had two different expressions in the source.** GCC
rotates a `for`/`while` by copying the guard into the preheader, and it does
not re-CSE that copy against the body — so both tests come out of one source
expression and must look alike. When they do not, the source split them by
hand. `sub_080215FC` is the case: the entry test loads the pointer global
(`ldr r2,=g ; ldr r0,[r2] ; ldrh r0,[r0,#2]`) and the bottom test re-reads the
same halfword through the *body's local* (`ldrh r2,[r2,#2]`, on the `r2` the
body loaded at the top of the iteration). Only this reaches it:

```c
i = 0;
if (i < *(u16 *)(g + 2))          /* entry test names the GLOBAL */
{
    do { p = g; ... *(u16 *)(rows + t) = ...; i++; }
    while (i < *(u16 *)(p + 2));  /* bottom test names the LOCAL  */
}
```

Six `for`/`while` spellings were tried and split two ways, neither of them the
target. Naming the global in the condition reloads it at the bottom — the
body's `strh` goes through a pointer GCC cannot see through and kills the
cached load, costing an extra `ldr` **and**, because the freed register is then
stolen by the `muls`, shifting the whole callee-saved allocation
(`push {r4,r5,lr}` instead of `push {r4,r5,r6,lr}`). Naming the local removes
the reload and gets the loop body exactly right, but the entry test is then on
the local too and the preheader's two registers come out swapped. The split is
what fixes both at once; an early `if (...) return;` ahead of the `do/while` is
byte-identical to the nested form.

Worth generalising: **a preheader whose registers are a pure permutation of
yours, with the loop body already exact, means the entry test's source
expression is wrong — not the loop's.**

**An ascending pointer with a descending counter is an ordinary ascending
loop.** `movs r2,#0x1f; ...; adds r1,#4; subs r2,#1; cmp r2,#0; bge` comes from
a plain `for (j = 0; j < 32; j++)`; GCC reverses only the counter so the exit
test is against zero. Do not rewrite the source as a reverse loop. A counter
starting at N-1 with `bge` is N iterations.

**When GCC reverses a loop it reverses the addresses too, so a *descending*
cursor with a descending counter came from a source that ascends — write the
source the opposite way round from what you see.** The rule above says the
counter carries no direction information; this is the sharper form, and it costs
attempts because the natural instinct is to mirror the assembly. Both spellings
in one probe, same array, same 42 stores of a constant:

| source | emitted cursor |
|---|---|
| `for (i = 0; i < N; i++) p[i - N] = 0;` — addresses ascend | starts at `p-1`, `subs #1` — **descends** |
| `for (i = 0; i < N; i++) p[-1 - i] = 0;` — addresses descend | starts at `p-N`, `adds #1` — **ascends** |

The stores are independent, so the reversal is legal and GCC always takes it;
the counter runs N-1..0 with `bge` either way. `sub_080745C0` is the case.

**A counter surviving to the exit test versus a pointer-vs-base compare says
which of the two the source indexed — and this file had the two the wrong way
round.** It read "an ascending `p[i]` over an array with a *known bound* is
turned into a pointer-vs-base compare with no counter at all, which is the tell
that the source indexed a sized array member rather than a bare pointer." It is
the **bare pointer** that loses the counter. One probe, ten `s32` stores of
zero, three spellings, identical loop bodies otherwise:

| source | exit test |
|---|---|
| `p->arr[i] = 0` — sized member `s32 arr[10]` through a pointer **parameter** | `mov r1,#9` … `sub r1,#1; cmp r1,#0; bge` — **counter kept** |
| `gStruct.arr[i] = 0` — the same member on a **global** | counter kept, identical but for the base `ldr` |
| `q[i] = 0` — bare `s32 *` parameter | `add r1,r0,#0; add r1,#0x24` … `sub r1,#4;` **`cmp r1,r0; bge`** |

Biv elimination needs a base value that is still live in a register at the exit
test. A bare pointer parameter is exactly that, so the counter is eliminated
against it; a member address is a base *plus a constant* the source never names,
and a global's base is a relocated address, so both keep the counter. This is
the same boundary as "biv elimination never fires against a static array base"
in the reverse-loop section below — that section had it right. Read backwards:
**`cmp rCursor, rBase; bge` means the source subscripted a bare pointer; a
counter compared against zero means it subscripted an array member.**
`sub_080750A4` is the member row and matched first try from it.

**That "member arrays keep the counter" half is only true for a member loop
standing alone. Put a SECOND loop over the same pointer parameter in the
function and the member spelling loses its counter — while `p[C + i]` keeps
it.** This is the reverse of what the table above predicts and it is what
`sub_080328C0` (two 10-element `u16` fills through one pointer, at +0x00 and
+0x40) misses on. Wave 10, three probes, all loops written as plain ascending
`for (i = 0; i < 10; i++)` and reversed by GCC as usual:

| function shape, second loop's spelling | second loop's exit test |
|---|---|
| **one** loop only, `p->b[i]` at +0x40 | `mov r1,#9` … `sub #1; cmp #0; bge` — counter kept |
| **one** loop only, `p[0x20 + i]` | **byte-identical to the row above** |
| one loop, preceded by a non-loop `p->a[0] = 1;` | counter kept — a plain earlier use does nothing |
| two loops, second `p->b[i]` at +0x40 | `add r2,r0,#0; add r2,r2,#0x40` … `cmp r0,r2; bge` — **counter gone, base materialised** |
| two loops, second `p[0x20 + i]` | counter kept — **the ROM's shape** |

Three things fall out. The two spellings are byte-identical in isolation, so
this only ever shows up in a multi-loop function — and there is **no size
signal**, because materialising the base costs exactly the instruction the
counter's `subs` gave back (nine instructions either way). It takes a preceding
*loop*, not merely a preceding use of the pointer. And it does not matter where
the first loop is: a first loop at +0x54 flips the second one exactly as a
first loop at +0x00 does.

**Related, and it cuts the same way: a member array at OFFSET 0 through a
pointer parameter is the bare-pointer row, not the member row.** `p->a[i]` on
`u16 a[10]` at +0x00 eliminates its counter against the parameter itself
(`cmp r1, r0; bge`) whether or not anything follows it, because the member's
address *is* the parameter. So "a member address is a base plus a constant the
source never names" only holds for a **non-zero** constant.

Practical order for a multi-loop pointer-walking function: write every array as
`p[C + i]` first and only reach for the struct-member spelling if the counter
is missing from the assembly.

**The counter's initial value and its branch condition together say which of
three source loops it was, and the difference is not cosmetic — it is two
different bytes in the `movs` and in the branch.** Same body (`*dst++ = *src++`
sixteen times), three spellings, three outcomes:

| source | codegen |
|---|---|
| `for (i = 0; i < 16; i++)` | `mov r3,#0xf` … `sub #1; cmp #0; bge` — GCC-reversed counter, init **N-1** |
| `for (i = 16; i > 0; i--)` | `mov r3,#0x10` … `sub #1; cmp #0; bgt` — genuine count-down, init **N** |
| `for (i = 16; i != 0; i--)` | `mov r3,#0x10` … `sub #1; cmp #0; bne`, **and** the now-zero counter gets reused as the source of any following `= 0` store |

So `bgt` against a counter is a positive tell that the *source* counted down;
the "ascending loop" reading above belongs to `bge` with init N-1 only. Do not
reach for the reversed-ascending form when the init is N — it is one probe to
check and `sub_08031B6C` is exactly this. `do { … } while (--i > 0);` is
byte-identical to the `for` count-down, so that difference is not recoverable.

**A third shape exists and it is not in that table: an *ascending* counter
compared against the source's own bound. It means the loop's address base had a
runtime-variable term, and it is not a count-down.** The table above invites
reading `add rC,#1 ; cmp rC,#0x32 ; ble` as something exotic, or as the `bgt`
count-down row misread; it is the plainest possible `for`. What decides it is
not the initial value and not the bound — it is whether the strength-reduced
cursor's starting address is a bare symbol/deref or a symbol plus a computed
offset. One probe, one body (count the non-zero `unk00` over 50 elements of a
0x0c-stride pointer global), four spellings:

| source | counter |
|---|---|
| `for (i = 0; i < 50; i++) g[i].m` | `mov rC,#0x31` … `sub #1; cmp #0; bge` — **reversed** |
| `for (i = 1; i <= 50; i++) g[i].m` | `mov rC,#0x31` … `sub #1; cmp #0; bge` — **reversed**, cursor pre-biased by one element |
| `for (i = 0; i < 50; i++) g[(a - 1) * 64 + i].m` | `mov rC,#0` … `add #1; cmp #0x31; ble` — **ascending** |
| `for (i = 1; i <= 50; i++) g[(a - 1) * 64 + i].m` | `mov rC,#1` … `add #1; cmp #0x32; ble` — **ascending** |

So the start value carries no signal on its own — rows 1 and 2 are the same
code. Once the base is variable, `check_dbra_loop` declines the reversal and the
counter is emitted verbatim, which makes the source *fully* readable off the
two constants: the `movs` is the source's initial value and the `cmp` is the
source's literal bound, with `ble` for `<=`/`<` and the bound already adjusted
by GCC's `i < N` -> `cmp #N-1` canonicalisation. `sub_08025308` is the last row
(`mov r3,#1 ; cmp r3,#0x32 ; ble`, i.e. `for (i = 1; i <= 50; i++)`) and matched
first try once read this way. `sub_08026340` is the same shape one width down —
a `u8` counter, so `cmp #4; bls` and the `lsl #24; lsr #24` re-narrowing of both
the counter and the accumulator every iteration.

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

**The same three-statement recipe is what strength-reduces a reverse fill whose
guard is on the *counter*, not on a pointer compare.** `sub_0803D6B8` writes
`g[i] = i` for `i = 4 … 0` and the ROM walks a descending pointer:

```
ldr r0,=g ; mov r1,#4 ; add r0,#4      <- base, counter, cursor: source order
strb r1,[r0] ; sub r0,#1 ; sub r1,#1 ; cmp r1,#0 ; bge
```

Neither natural spelling reaches it. `for (i = 4; i >= 0; i--) g[i] = i;`
recomputes `add r0,r1,r2` inside the loop (one instruction shorter, so it is a
size miss, not a permutation), and binding a pointer local
`u8 *p = g; p[i] = i;` changes only where the base `ldr` lands. What matches is
the recipe with the counter carried alongside:

```c
base = g; i = N; p = base + N;
do { *p = i; p--; i--; } while (i >= 0);
```

Note `p = g + 4` written as an *initialiser* on the declaration folds the
constant into the pool word (`.word g+0x4`) and loses the `adds r0,#4`, so the
three separate statements are load-bearing here for the same reason they are
above.

**`while (n--)` has its own shape:** `subs rN,#1` *before* the loop guard, then
`cmp rN,#-1` materialised as `mov #1; neg`. The post-decrement's `!= 0` test on
the old value is rewritten as `!= -1` on the new one. `while (--n)` and the
`for` forms compare against zero instead. This identified `sub_0808B6E8` as
`memcpy` on sight.

**That shape belongs to `while (n--)` written on the PARAMETER, and there is a
two-byte-shorter twin that mutates nothing.** `while (n--)` decrements `n` in
place, so the `-1` sentinel has to exist before the entry guard and the guard
compares against *it*; splitting the count out first lets the guard test the
untouched `n` against zero and defers the sentinel into the preheader:

```
while (n--) { … }                    sub r2,r2,#1 ; mov r0,#1 ; neg r0,r0
                                     ; cmp r2,r0 ; beq ; add r4,r0,#0   <- 4 insns
                                                                           before the loop
i = n - 1;                           sub r3,r2,#1 ; cmp r2,#0 ; beq
if (n != 0)                          ; mov r2,#1 ; neg r2,r2            <- 3, and no copy
    do { … } while (i-- != 0);
```

**Tell: what the entry guard compares against.** `cmp rN, #0` on the incoming
argument register is the split form; `cmp rN, rSentinel` is `while (n--)`.
`sub_0808AE30` (a byte copy with the operands in `(src, dst, n)` order) is the
split form and is 36 bytes; `while (n--)`, `while (n-- != 0)`, `u32 n`,
`int i = n; while (i--)` and `for (i = n; i--; )` are all 38 and byte-identical
to each other — copying the parameter into a local does *not* buy the split,
because copy propagation puts it straight back. Only naming `n - 1` does.

**Varargs: `push {r2,r3}` … `add sp,#8` is agbcc's pretend-args pair, and the
block starts at the register holding the *last named* parameter.** So the named
argument count is the index of the first pushed register **plus one** —
`push {r2,r3}` means *three* named args plus `...`, and `push {r0,r1,r2,r3}`
means one. A function consisting of *only* that pair is a stubbed-out varargs
debug printf, not a function with stack locals: the `add sp` releases the
pretend-args area, not a frame. `sub_08013428` is one, and there are likely
more — free matches once you know the shape.

**A spin loop on a loop-invariant condition only comes out right as
`while (1) { if (c) break; }`.** The shape is a hoisted computation followed by
a two-instruction self-branch:

```
ldr r1,=gpKeySt ; ldr r1,[r1] ; ldrh r1,[r1,#4] ; ands r1, r0
L: cmp r1, #0 ; beq L
bx lr
```

The two natural spellings both come out **four bytes longer**, and identically
to each other: `while ((x & k) == 0) ;` and `do ; while ((x & k) == 0);` are
rotated into an entry guard plus a loop that tests a *different* register,
because on the back edge agbcc knows the AND is zero and propagates the
constant, materialising a fresh `mov rN, #0` to compare against. Writing the
exit test at the loop head instead gives the test block two predecessors, which
blocks the propagation and removes the guard, and the `cmp` keeps the original
register. `sub_0805C114` is the case. The parameter type is not recoverable —
`u16` and `int` are byte-identical here.

**A function may deliberately have no final return.** `sub_0803CBD8` falls
through leaving its argument in r0, which is what the original does. UB in C,
correct here.

**And the missing return is *readable off the assembly*, by two independent
tells — it is not something you have to guess at.** `sub_08017704` is
`if (g < a) return 0; g -= a;` on a `u32`-returning function, and adding the
obvious `return a;` breaks it twice over:

| | `... g -= a; return a;` | `... g -= a;` (no return) |
|---|---|---|
| layout | branch to the **return-0** block, fall through into the body | branch to the **body**, fall through into `return 0` |
| registers | param in r1, global's value in **r0**, trailing `add r0, r1, #0` | param copied to r2, global's value in r1, **r0 never written** |

So on a leaf with an early `return 0`:

- **`movs r0, #0` sitting in the fall-through position** — i.e. the conditional
  branch jumps *over* it to the real work — means the real work's path has no
  return statement. With a return on both paths agbcc puts the constant block
  last, past the literal pool.
- **r0 untouched from entry, with the parameter copied into r2 and a scratch
  taking r1**, is the allocator saying r0 is live-out-undefined. A genuine
  `return <param>` cannot produce it: the parameter's pseudo does not get r0,
  and the function ends with `add r0, rN, #0`.

Both survive `-O2` and neither costs an attempt to check. Note this cuts against
the branch-polarity rule above, which assumes both arms return: here it is the
*absence* of the second return that picks the layout, and inverting the
condition does not reproduce it — `if (g >= a) g -= a; else return 0;` gets the
allocation right and the layout wrong.

**The register tell carries to a body with no branch at all, and there it is the
whole story.** `sub_0803E0D0` is one `while` loop walking a cursor over an
8-byte record array; there is no early `return 0` and so no layout tell, but r0
is never written and the epilogue is `pop {r4}; pop {r1}; bx r1`. That alone
pins the source, because r0 being live-out is what pushes the cursor into r3 —
a `void` function has r0 free and walks it directly, with no `adds r3, r0, #0`
to explain. Both obvious repairs cost exactly one instruction: `return p;` adds
a trailing `adds r0, r3, #0`, and keeping the parameter intact behind a second
local for the cursor adds a second copy at the top. So **a mutated-pointer loop
carrying a parameter copy that nothing needs is a non-void function with no
return statement**, not one that returns its argument — and its caller
(`sub_08040200` here) discarding the result is consistent with either, so it is
not evidence.

---

## Aliasing and `volatile`

**A global re-loaded every iteration must stay inside the loop.** If a store
might alias it, agbcc reloads; hoisting it into a local will not match.

**`volatile` to keep two loads.** Where the original reads a global twice —
once to test, once to increment — agbcc CSEs them into one without `volatile`,
and the function comes out short. `volatile` keeps both while still emitting a
plain `ldrh`; a plain `s16` global emits `ldrsh`, which is wrong.

> **Two extra `volatile` tells live in the "Large functions" section below,
> because both were found on a 364-byte register flush and both are easier to
> spot there.** In brief: (a) *n* reads of one global with its address held in
> one callee-saved register across stores to absolute `0x040000xx` addresses is
> volatile, because agbcc CAN prove a constant hardware address does not alias a
> symbol and will otherwise CSE the load down to one; and (b) an absolute
> address loaded as a fresh pool word where `adds rN, #k` off a live cursor
> would have reached it is volatile too — a volatile MEM sets `do_not_record` in
> `cse_insn` and takes the address equivalences with it. (b) is the only
> `volatile` tell found so far that shows up as a *size* difference (4 bytes per
> broken chain) rather than as a register or an instruction diff.

**The store-forwarding twin of that rule, and it is the commoner shape: a read
of a scalar global that follows a *store* to it reloads only if the global is
`volatile`.** The rule above is about two reads; here the first access writes,
and without `volatile` GCC forwards the value it just stored instead of
re-reading. Two instructions, so there is a clear size signal:

```c
g++;  if (tbl[g] == 0) g = 0;    /* volatile u32 g */
      ldr r0,[r2] ; add r0,#1 ; str r0,[r2]
      ldr r1,=tbl ; ldr r0,[r2] ; lsl r0,#2 ; add r0,r0,r1 ; ldr r0,[r0]

g++;  if (tbl[g] == 0) g = 0;    /* plain u32 g -- the reload is gone */
      ldr r0,[r2] ; add r0,#1 ; str r0,[r2]
      ldr r1,=tbl ;              lsl r0,#2 ; add r0,r0,r1 ; ldr r0,[r0]
```

Read backwards: **`ldr rN,[rB]` on an address that was just `str`ed to, with no
intervening call or opaque store, is a `volatile` global.** `sub_0802EC64` is
the case, and this is the whole difference between it matching and coming out
four bytes short. Note the `ldr rB,=tbl` for the *next* statement is emitted
before the reload in both, so the reload's position is not the tell — its
presence is.

**The read-modify-write-and-test case has a THIRD load, and getting rid of it
moves the narrowing rather than removing it.** For a `volatile u16` counter
guarded before it is decremented, every spelling that keeps the decrement in
the condition re-reads the object to evaluate it — three `ldrh`s where the ROM
has two. Naming the new value is what fixes it, and then the local's *type*
decides whether the `u16` truncation lands on the store or on the compare:

| source, `g` a `volatile u16` | after the guard's `ldrh` |
|---|---|
| `if (--g == 0)`, `(g -= 1) == 0`, `(g = g - 1) == 0` | `ldrh; sub; strh;` **`ldrh;`** `cmp` |
| `u16 v = g - 1; g = v; if (v == 0)` | `ldrh; sub;` **`lsl #16; lsr #16;`** `strh; cmp` |
| `int v = g - 1; g = v; if ((u16)v == 0)` | `ldrh; sub; strh;` **`lsl #16;`** `cmp` |

Only the third has the narrowing *after* the store, and `sub_0808AC20` is it.
Read backwards: **a lone `lsls rN, #16` between a `strh` and a `cmp rN, #0` is a
`u16` test on an `int` temp** — the truncation belongs to the comparison, not to
the value that was stored, and a `u16` local cannot produce it because it
narrows at the assignment instead.

**A load and a store of the same address, storing back exactly what was
loaded, is a self-assignment — and it only survives on a `volatile` lvalue.**
`g = g;` on a plain global emits *nothing at all*: the whole load/store pair is
gone from the output, not just the load. So a trailing

```
ldr r1,=gSym ; ldrh r0,[r1] ; strh r0,[r1]
```

with nothing else reading r0 is `g = g;` and it settles the object as
`volatile`. This is *not* the "dead load" tell two paragraphs down — that one
needs an **aggregate** lvalue and leaves a load whose destination nothing reads.
Here the lvalue is a bare scalar and the loaded value *is* the stored value.
`sub_0804BA4C` is the case; the plain-`u16` spelling compiles to just the delay
loop and is 8 bytes short. Two equivalent spellings, both byte-exact:
`volatile` on the declaration, or `*(vu16 *)&g = *(vu16 *)&g`. The declaration
is the honest one — check `grep -rl <global> src/` first, since it is a change
to a shared type (the other `sub_0804BA4C` user, `sub_080122EC`, is a bare
scalar store and is byte-identical either way).

While there: **an empty delay loop is not deleted.** `for (i = 0; i < 40; i++);`
on a `u16` counter survives `-O2` intact and re-emits `lsl #16; lsr #16` every
iteration, so a five-instruction loop that computes nothing is ordinary source,
not something to explain away.

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

**But `ldrsh` is NOT the `s16`-object tell when the loaded value feeds a
narrowing context (wave 17, W17-A).** A `u16` struct member handed to an `s16`
*parameter* compiles to a bare `ldrsh` too: the conversion is
`sign_extend (truncate (zero_extend (mem:HI)))` and `combine` collapses it to a
single sign-extending load, leaving nothing behind. `sub_0804FA2C` reads
`gUnknown_02029A10[i].entries[j].x` — a `u16` member, fixed independently by
five other functions — with `movs r3,#8; ldrsh r1,[r2,r3]` before
`sub_080155C0(s16, s16, s16)`, and compiling it both ways is byte-identical. So
the table row means "`s16` object" **only where the value is used at its own
width**; at a call site taking a narrow signed parameter, `ldrsh` says nothing
about the object and the `ldrh`/`ldrsh` caller signal in the parameter-width
section above is the one that applies.

`sub_08034F8C` is the
case; a `u8` there collapses to one `ldrb`, and an `s8 a:8` bitfield is
byte-identical to the plain `s8`.

**The read-modify-write twin at halfword width behaves identically, so read
`ldrh` + `ldrsh` of one address the same way.** `sub_08034FC0` is
`extern s16 g; if (g != 0) g--;` and compiles to
`ldr r1,=g; ldrh r2,[r1]; movs r3,#0; ldrsh r0,[r1,r3]; cmp r0,#0; beq;
subs r0,r2,#1; strh r0,[r1]` — the guard reads the object in HImode-signed, the
decrement's operand comes off the plain `ldrh`, and neither `volatile` nor a
local is involved anywhere. Two loads of the same halfword in *different* modes
is therefore the `s16` signature, not a `volatile` tell; the `volatile` rule
above needs the two loads to be the **same** width.

**`const` on the global's declaration makes its load survive intervening
stores.** `extern T *const gFoo;` read by name emits one `ldr` that GCC reuses
across later `strb`/`strh`. Reaching the same object through a pointer
(`const T *p = &g;`, or `T *const *pp; (*pp)->m`) does **not** get this. Read it
off the assembly: a global loaded once and kept live across stores wants `const`
on the declaration; one reloaded at each use does not.

**A `volatile` shift COUNT is loaded before the shifted constant; a plain one
after it.** One instruction's position, no size change, and it is the whole
difference between `sub_0808AD24` matching and not:

```
ldrb r0,[r0] ; movs r1,#8 ; lsls r1,r0    <- volatile u8 count
movs r1,#8 ; ldrb r0,[r0] ; lsls r1,r0    <- plain u8 count
```

The mechanism is `expand_binop`, and knowing it saves guessing: the shifted
operand is a `CONST_INT`, so it gets `copy_to_mode_reg`'d first, and a plain
global's load is still a bare MEM at that point and is only forced into a
register *after*. A volatile MEM cannot be carried that far — it is loaded at
the point of the read — so its `ldrb` lands ahead of the constant's `movs`.

Ruled out, all identical to the plain form: `REG_IE = REG_IE & ~(8 << g)`
spelled out, `~(8 << g) & REG_IE`, a `(u16)` cast on the mask, a `(u32)` cast on
the count, `8 * (1 << g)`, binding the mask to a `u16` local, and binding the
count to a `u8` local (copy propagation puts the MEM straight back — the local
buys nothing here, which is the same lesson as the `while (n--)` split under
Control flow). Two things *do* move it and both cost bytes: `1 << (g + 3)`
loads the count first but pays an `adds #3`, and a separate statement that uses
the count twice keeps it in a register but hoists the pool word.

Read backwards: **a `ldrb`/`ldrh` of a shift count sitting immediately after its
own address `ldr`, ahead of the `movs` for the shifted constant, says the count
is `volatile`.** That is what typed `gUnknown_03000F70`.

**Strict aliasing is off.** A `u16` store invalidates a cached pointer load
exactly as a `u8` store does.

**But a *word* store does not, and that is the whole difference between
`sub_08044178` and `sub_08064BC8`.** This entry previously read as though every
store width behaved alike, which sends you reaching for `const` on a
declaration that does not want it. One probe, one global, one struct, the same
second access (`g->unk2d++`, `ldrb`/`strb`) in every case — only the
intervening store varies:

| intervening store through the deref | the deref |
|---|---|
| `g->unk44[i] = ptr` (SImode) | **survives** — one `ldr [r2]`, reused via `add r3, r3, #0x2d` |
| `g->filler_00[i] = 1` (QImode, variable index) | reloaded — a second `ldr r1, [r2]` |
| `g->filler_00[0] = 1` (QImode, no index) | reloaded |

So the reload is decided by the **mode of the store**, not by the index, not by
the spelling, and not by `const`. `g->m[i]` and `g[0].m[i]` compile identically,
and nothing here is `const`. Read backwards: **a pointer global whose deref
stays live across a `str` is telling you the store was a word, not that the
declaration wants `const`.** `sub_08044178` reloads because its store is a
`strb`; `sub_08064BC8` and `sub_08064D44` keep the value because theirs is a
`str`. Both are the naive spelling with no local anywhere.

This narrows the `const` tell two paragraphs above rather than contradicting
it: that tell is about a re-read of the **global's own word** surviving a
store, which is still real. It was being misapplied to a deref result already
sitting in a register. HImode was not probed here, so the `u16` row above still
rests on its original evidence.

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

**Read positively, that is the discriminator between the two rows of the
pointer-global table under Register-allocation rules — but only for a body that
stores.** Both spellings put the deref first, so with no store between the
accesses nothing separates `g[i].f` repeated from `T *arr = g; arr[i].f`. Add a
store and they split cleanly:

| codegen | source |
|---|---|
| the deref `ldr` reappears after each store, index math redone | `g[i].f` repeated |
| one deref, one index computation, reused with displacements across the stores | `T *arr = g; arr[i].f` |

`sub_08044178` is the first row; `sub_08025B28` and `sub_08025B58` are the
second, and they need the local — the address register surviving is not enough,
because the *global* is re-read to recompute it. Count the derefs against the
number of statements before drafting.

**Sharper still: a store to a *sibling member at a known constant offset* does
not kill the cached load at all.** "Strict aliasing is off" is not "every store
kills every load" — GCC 2.95 still disambiguates two MEMs that share a base and
differ by a compile-time constant, and both members of `g[a].unkNN` do. So
counting the reloads of one member tells you whether the source bound a local,
and that is the *only* thing separating two spellings that are otherwise
identical:

```
g[a].unk08 = *(u32 *)g[a].unk04;      ldr r0,[r1] ; ldr r2,[r0] ; str r2,[r3]
g[a].unk04 = (u32 *)g[a].unk04 + 2;   adds r0,#8  ; str r0,[r1]     <- ONE load
```

Two mentions of `g[a].unk04` in the source, one `ldr` in the output: the
intervening `str` to `.unk08` is provably a different address, so CSE keeps the
pointer live across it. That is `sub_08015D78`, and the bound-local spelling of
the same thing (`p = g[a].unk04; ... ; g[a].unk04 = p + 2;`) does *not* match —
it costs a `push {r4, lr}`.

The store that does kill it is one through a pointer the compiler cannot see
through:

```
*(u8 *)g[a].unk04->unk04 = ...;       ldr r0,[r1] ; ... ; strb r0,[r2]
g[a].unk04++;                         ldr r0,[r1] ; adds r0,#0x10 ; str r0,[r1]
```

`p->unk04` is an opaque address, so it conflicts and the cursor is re-read —
`sub_08017B64`.

**But do not turn the reload count into the discriminator — it is not one.**
An earlier revision closed this block with "two reloads means the source
repeated the global expression; one means it bound a local", which contradicts
this block's own `sub_08015D78` example (two mentions, one `ldr`) and is false
in both directions. What the second `ldr` actually tracks is whether the
*field read clobbered the cursor's register*, which is a register-allocation
outcome, not a source feature. Four adjacent members of the 0x0200C528 family,
all the plain repeated spelling `g[a].m = g[a].unk04->f; g[a].unk04++;`:

```
sub_08018B18   ldr r0,[r1] ; ldr  r2,[r0,#4] ; str  r2,[r3]      -> ONE load
sub_08018C54   ldr r0,[r1] ; ldrh r0,[r0,#8] ; strb r0,[r3,#4]   -> TWO loads
sub_08018D90   ldrh r0,[r0,#8] then ldrh r0,[r0,#0xa]            -> THREE loads
```

The field read lands in `r0` and kills the cursor whenever nothing else is
competing for a scratch; where a free register exists (`ldr r2,...` above) the
cursor survives and the reload never appears. `sub_08017A58` is the two-load
member of the same set and is also the naive spelling — `src/decomp/` has all
of them.

**The discriminator that does hold is the order of the address loads.** The
repeated spelling emits *both* pool `ldr`s at the top of the first statement,
destination global first; binding `p = g[a].unk04;` as its own statement emits
the source's address first and defers the destination's to the statement that
uses it. Same 40 bytes either way, so the pool word order and the position of
the second `ldr` are the whole signal. `sub_08018B18` is the repeated form and
the bound form misses on exactly that.

**When the target wants the destination address computed first *and* a single
cursor load, the spelling is an embedded assignment.** `sub_08018B40` needs
both and neither plain form reaches it:

```c
g[a].unk08 = (p = g[a].unk04)->unk04;   /* dest address first, one load  */
g[a].unk04 = p + 1;
```

A separate `p = g[a].unk04;` statement puts the source address first and costs
a `push {r4, lr}`; the plain `g[a].unk04++` form costs the reload. Both are
40-byte-adjacent near-misses of a 40-byte function.

---

## `-fforce-addr`

This flag is in `CFLAGS` and is the least obvious thing in the build.

**Its cheapest symptom is a DEAD pool load, and it is free: do not try to
explain it, and do not read it as a missing statement (wave 15).** Where a
nested member's constant offset ends up folded into the pool word, force-addr's
own `ldr rN, =gSym` for the base survives into the output with nothing reading
it. Family F049 opens `ldr r7, =gUnknown_085D3DD0` and then overwrites r7 four
instructions later without ever using it, while every real access goes through
a second word `gUnknown_085D3DD0 + 0x5c` (which `asm/` symbolises as
`gUnknown_085D3E2C`, a distinct name at that address — see the false-mismatch
bullet in Workflow). Both fall straight out of the plain
`g[a].sub[b].arr[i]` spelling with no locals and no tricks. **Tell: a pool word
loaded into a callee-saved register at the top of a function that nothing
reads, next to a second pool word for the same symbol carrying an addend.** A
draft that lacks the dead `ldr` is missing a whole *reference*, not a
statement — the useful question is which sub-object the address arithmetic
starts from, not what the register was for.

**It routes a symbol's address through `.rodata` when the global is used both
before and after a loop.** GCC emits `.LC0: .word gSym`, puts `.word .LC0` in
the function's pool, and every access gains an extra `ldr`, growing the function
by 4 bytes. Confirmed against minimal repros: before-only, after-only, and
either side of an `if` are all fine; before **and** after any loop — `for`,
`while`, `do`/`while`, any index type — always triggers it.

**Tell:** `R_ARM_ABS32 .rodata` where you expected `R_ARM_ABS32 gSym`, plus a
doubled `ldr rX,[rY]` at each access.

**CORRECTION (wave 13): the loop is not the trigger, and "my target is
straight-line" is not proof it has no pool word.** The paragraph above is right
that a loop always fires it and wrong that nothing else does. Controlled probe,
no loop of any kind, one `if`-chain, agbcc `-O2` with the ROM's flags:

```c
extern u8 **gNC;                    /* also run with `u8 **const gC` -- identical */
int qA(int x, int y) {
    u8 *p; int r = 0;
    if (y > 0) {
        if (sub_080015E4(x, y-1)) { p = *gNC; r += *(u16*)(p + 0x417A + y*2); }
        if (sub_080015E4(x, y))   { p = *gNC; r += *(u16*)(p + 0x417A + y*2); }
        if (x < *(u16*)*gNC - 1 && sub_080015E4(x+1, y)) {
            p = *gNC; r += *(u16*)(p + 0xA22 + y*2); }
    }
    return r;
}
```

-> `.section .rodata / .LC0: .word gNC`, `.word .LC0` in the text pool, and the
doubled `ldr` at every access. The same body in the same probe with a **single**
reference to `gNC` does not. `const` changes nothing either way.

So the real trigger is **the symbol being referenced by name from more than one
basic block**, and a loop is only the most reliable way to arrange that. Two
independent confirmations in the same wave: `sub_080081E0` (512 bytes,
`backward_branches == 0`, eight references across an `if`-chain) gets one, and
so does `sub_0805DB70` (308 bytes, `backward_branches == 0`, pool word
0x0816DA4C holding 0x030033EC).

The distinction that survives: **the PAIRED entries in the 0x0816D9E0 block are
loop-driven** — that is what the two loopless family members at 0x0805CDF0 /
0x0805CE20 having no pair proves, and it still stands. A **single** pool word
does not need a loop. Read the negative control for what it is: it says a
function with no loop gets no `.LC` *pair*, not that it gets no `.LC` *word*.

**That tell is for code you compiled. In the ROM the indirection words survived
the original link, and you can find them in the baserom by their duplication.**
This matters because such a word disassembles as an ordinary
`ldr rN, =gUnknown_<addr>` and reads exactly like a pointer-to-pointer global —
and the two models are indistinguishable from one function. The block is what
separates them: GCC emits one word per (function, symbol) pair, so a run of
consecutive 4-byte symbols holding the **same value** is a `.LC` block, and a
table of distinct globals is not. Dump the words before modelling anything:

```
0x0816E19C -> 0x08580934      0x08090CC8 -> 0x0849B018
0x0816E1A4 -> 0x08580934      0x08090CCC -> 0x0849B018
0x0816E1A8 -> 0x08580934      0x08090CD0 -> 0x0849B018
0x0816E1AC -> 0x08580934        ... ten slots, all 0x0849B018
0x0816E1B0 -> 0x03002EE0
0x0816E1B8 -> 0x08580934      seven slots hold 0x08580934,
0x0816E1BC -> 0x08580934      three hold 0x03002EE0
0x0816E1C0 -> 0x08580934
```

Both targets are already declared globals in `unknown-globals.h`
(`gUnknown_08580934`, `gUnknown_0849B018`), which is the confirmation.

**Model it as a real global anyway — do not try to make the compiler synthesise
the word.** `gUnknown_08090CD8` is the precedent and it is matched: declare
`extern struct Unk<addr> *const gUnknown_<addr>;` with a one-member wrapper
`struct Unk<addr> { struct Real *unk00; };` and write the extra deref out as
`->unk00`. Naming the real symbol instead and letting `-fforce-addr` emit its
own `.rodata` word cannot work here — the split already owns those bytes as
`incbin` data, so the compiler's word would be a duplicate at a different
address and the pool relocation would not resolve to the ROM's.

**LIMIT ON THAT WORKAROUND (wave 13, A6): it only works when force-addr fired
on the ORIGINAL for the loop reason. When it fired for the reference-count
reason it fires AGAIN on the workaround's own symbol, and then nothing you can
write in C reaches the ROM's bytes.** The two reasons are separated above; this
is the consequence. `sub_08002298` (632 bytes, `backward_branches == 0`, ~40
references to one pointer global) is the worked example, eight probes deep:

| declaration, all with the same body | result |
|---|---|
| `extern struct Real **g;` — `(*g)->f` | `.LC0` |
| `extern struct W *const g;` + wrapper `->unk00` (the workaround above) | `.LC0` |
| `extern struct Real **const g;` — `(*g)->f` | `.LC0` |
| `extern struct W g;` with a `const` member — `(*g.unk00)->f` | `.LC0` |
| `struct W *const *pp = &g;` — `(*pp)->unk00->f` | **no `.LC0`** |

The workaround rows are the ROM **instruction for instruction with exactly one
extra `ldr` per region** — the model is right and unreachable. The reason is
that my C necessarily has the same reference count as the original, so whatever
tripped force-addr there trips it here.

**And the escape hatch is mutually exclusive with the CSE the ROM shows, which
is what makes this a genuine blocker rather than a spelling problem.** Binding
`pp = &g` suppresses the `.LC0` (last row) but `TREE_READONLY` does not survive
into `RTX_UNCHANGING_P` through a local pointer, so the outer load stops being
reused across calls — and the ROM does reuse it. Five-variant control probe, one
file, each function reading a pointer global twice around one call:

| spelling | `.LC0`? | outer load survives the call? |
|---|---|---|
| `extern T *const g;` — `g->a` by name | no | **yes** |
| `extern T **const g;` — `(*g)->a` by name | no | **yes**, inner reloaded |
| `T *const *pp = &g;` — `(*pp)->a` | no | **no** |
| `extern T *g;` — `pp = &g`, `(*pp)->a` | no | no |
| `T *p = g;` (value bound to a local) | no | one load only |

**So you can have the right pool word or the right CSE, never both.** If a
candidate's `.LC` word is reference-count-driven rather than loop-driven, park
it — do not spend probes looking for a sixth spelling.

**Screening for this before drafting costs one command and is the highest-value
thing to know about a candidate above 512 bytes.** A `.LC` word is a 4-byte
`data/rodata.s` symbol, holding a RAM or ROM address, referenced by exactly one
function, with a neighbour holding the same value. Over a 21-target list it
flagged 9 and every flag held up under probing. The cleanest confirmation, since
it comes with its own control: **four functions reach `gUnknown_08499590` — a
global that `src/decomp/c_08001158.c` already reaches with a single pool word —
through ROM words at 0x0808D810, 0x0808D820, 0x0808D834 and 0x0808D858 that all
hold `0x08499590`.** Same symbol, same source idiom, different pool shape.
`sub_0801659C` shows both shapes inside one function: it reads the array through
the `.LC` word at 0x0808E538 in its first half and names `gUnknown_03001470`
directly in its second.

### The `.rodata` address-constant reroute — what those words really are

**The advice above is a workaround, not a model of the source, and it is NOT
always byte-reachable. Measure before committing to it.** The third `.LC` block
is at **0x0816D9E0-0x0816DA37** and it is the one that settles what these words
are, because it comes with its own negative control:

```
0x0816D9E0 -> 0x030046B0   0x0816D9E4 -> 0x030045F0    sub_0805CA60
0x0816D9E8 -> 0x030046B0   0x0816D9EC -> 0x030045F0    sub_0805CB1C
0x0816D9F0 -> 0x030046B0   0x0816D9F4 -> 0x030045F0    sub_0805CBCC
   ... thirteen PAIRS, in function address order, all the same two values
```

Thirteen builders at 0x0805CA60-0x0805D1F0 each get one pair; the two members of
the same family that have **no loop**, `sub_0805CDF0` and `sub_0805CE20`, get no
pair at all. That is the rule's own prediction, so these words are the
compiler's `.LC` pool and the source is the plain
`gUnknown_030046B0 = gUnknown_030045F0;` — which the header for those addresses
now records instead of a declaration.

Both models were compiled against the same 188-byte target, one probe each:

| model | result |
|---|---|
| direct: `gUnknown_030046B0 = gUnknown_030045F0` | **every instruction and every register identical**; 99.5%, one byte, the `.rodata`+4 addend in the pool |
| workaround: `u8 **const gUnknown_0816D9E0` + `pp = &g` | 95.7%, 8 bytes — the `adds r6, r3, #0` copy sits **4th** in the loop preheader where the ROM has it **last** |

**No source spelling moves that copy**, and the controlled probe says why: add
the workaround's extra locals, its tail temp, an explicit `if` guard round the
loop, a `do { … } while (0)` body and a `**pp` spelling with no locals at all to
the *direct* version and the copy stays last in every one of them. The preheader
order is decided by whether the address word is a **constant-pool entry**
(unchanging, `CONSTANT_POOL_ADDRESS_P`) or a named symbol, and C cannot ask for
the former. So when the workaround stalls at a preheader or scheduling diff,
stop — you are not looking at a source problem, and the direct spelling is both
the truth and unverifiable per-function. Park it with the direct draft; see
`data/parked.json` for the seven at 0x0805CA60-0x0805D134.

Two corollaries worth carrying:

- **A near-miss whose relocations read `R_ARM_ABS32 .rodata` with addends 0, 4,
  8 … is this, and `trymatch` cannot bless it.** `reloc_equivalent` needs both
  symbol names to appear in `nm aw2bhr.elf`, and a section symbol never does.
  Do not read the addend byte as a codegen diff.
- The workaround's relocation *is* checkable and *does* rebuild the ROM, so the
  functions already matched that way (`sub_0806DDF4`, `sub_08066D30`, the
  `gUnknown_08090CD8` users) are genuine matches. It is only the claim "a global
  lives at that address" that is wrong, and it is wrong in `unknown-globals.h`
  wherever a `.LC` block is declared.

Two consequences for reading such a function. The `const` is not decoration:
it is what lets LICM hoist the outer load into a loop preheader while the inner
deref stays in the body, and an unqualified declaration leaves both in the loop.
And the address still has to be taken into a local (`pp = &g`) for any reference
after the loop, or force-addr fires *again*, on top of the word that is already
there. `sub_0806DDF4` needs all three.

**"Used" means used as a *scalar*. A struct member does not trigger it.** This
is the escape hatch, and the paragraph above reads as if there were none. Same
loop, same two uses either side of it, one probe:

| before the loop | after the loop | `.rodata` indirection? |
|---|---|---|
| `&gScalar` | `gScalar = v` | **yes** |
| `gStruct.member[i]` | `gStruct.other = v` | **yes** |
| `&gStruct.member` | `gStruct.member = v` | **no** |

So when force-addr is costing you 4 bytes and a doubled `ldr`, the fix is not
only "bind the address to a local" — it is to make the surviving references go
through *one* member of an aggregate. Reaching the same bytes through a bare
`extern u8 gArr[]` plus a neighbouring `extern s16 gVal` cannot do that, because
two symbols also cost two pool words; that is how `sub_080745C0` proved its 42
bytes and the halfword after them are one record and not three globals.

**That aggregate escape hatch does NOT transfer to a pointer global, and neither
does `const`.** Wrapping the same `extern T *g;` and re-running the identical
loop, five declarations, one probe (`sub_0801A6C0`, which reads `g` inside a
loop and again after it):

| declaration, and how the two accesses are spelled | `.rodata`? |
|---|---|
| `extern T *g;` — `g[i].m` in the loop, `g->m` after | **yes** |
| `extern T *const g;` — same | **yes** |
| `extern struct { T *p; } g;` — `g.p[i].m` / `g.p->m` | **yes** |
| `extern T *g[];` — `g[0][i].m` / `g[0]->m` | **yes** |
| `T **pp = &g;` — `g[i].m` in the loop, `(*pp)->m` after | **no** |

The member spelling escapes only when the *object itself* is the aggregate
(`gStruct.member` above); a one-member wrapper around a pointer does not,
because the load that must survive is still a scalar `ldr` of a symbol. For a
pointer global the pointer local is the only fix. Read the last row the useful
way round: **`&gSym` is not a "use" for force-addr purposes** — taking the
address is fine on either side of the loop, and it is only a memory reference
by name that counts.

Worth knowing while you are here: **the `.rodata` word is itself re-read after
an intervening store**, exactly like an ordinary global, even though GCC marks
it unchanging and will happily hoist it out of a loop. So a doubled
`ldr; ldr` reappearing *after* the loop is force-addr behaving normally and
says nothing about `const` — which is the inference `gUnknown_0808E5C8`'s
header comment originally got wrong.

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

**Two limits on the `pp` workaround, both found in wave 13. Check them before
committing to it, because the second one is fatal and silent.**

**(1) `*pp` is NOT unchanging, however you spell the `const`, so it will not
survive a call the way the ROM's own `.LC` word does.** GCC's constant-pool MEM
carries `RTX_UNCHANGING_P` by construction; a declared `const` global reached
through a pointer local does not inherit it. Three declarations, one probe, one
call in the middle:

| spelling | across the call |
|---|---|
| `extern u8 **const gK;` `pp = &gK;` … `**pp` | reloads **both** levels |
| `extern struct W *const gW;` `pp = &gW;` … `(*pp)->unk00` | reloads **both** levels |
| `pp = &gK;` `q = *pp;` … `*q` | keeps `q`, reloads only `*q` — **the ROM's shape** |

So when the ROM keeps the middle value in a callee-saved register across a `bl`
and re-derefs it afterwards, **bind that middle level to a local explicitly**.
That single change took `sub_080081E0` from 28.5% to 46.1% and made it a
tractable permuter candidate; no amount of `const` reaches it.

**(2) The workaround cannot reproduce a HOISTED member offset, which rules it
out for any `.LC`-routed `g[i].member` on an array global.** The hoist
(`ldr rB,=g; lsl rI,#k; add rB,#off; add rI,rI,rB`) belongs to the array-global
subscript and *only* to it — see the three-cause `adds rB, #imm` rule above,
whose own note says a pointer global never hoists, structurally, because its
base arrives from a deref rather than from a relocated symbol address. A `.LC`
word is a pointer, so every workaround spelling folds. `sub_0804E8F0` is the
worked case: the direct `gUnknown_03001470[a].unk30` reproduces the ROM
instruction-for-instruction *and* emits its own `.LC` word (unusable), while the
`struct Unk03001470 *const gUnknown_08136090` workaround is correct in every
other respect and folds the +0x30/+0x34 offsets into the displacement. There is
no third spelling. **Park it.**

> **CORRECTION (wave 18): there IS a third spelling, and the hoist is not an
> array-global property — it is an AGGREGATE-MEMBER property.** Wrap the array
> in a struct and point at *that*:
>
> ```c
> struct Unk08136090 { struct Unk03001470 unk00[30]; };
> extern struct Unk08136090 *const gUnknown_08136090;   /* the .LC word */
> q = gUnknown_08136090;  c = q->unk00[a].unk30;  e = q->unk00[a].unk34;
> ```
>
> `p->arr[i].m` is the `gStruct.unk20[i]` row of the fold table — an aggregate
> member reached through a pointer — and it emits `adds rB,#0x30; adds rB,rI,rB`
> exactly as the array global does, while `p[i].m` on a `struct T *const` folds
> the offset into the load's displacement. Six spellings were probed side by
> side against `sub_0804E8F0` and only this one hoists. So the decision rule
> below is wrong as stated: **a hoisted `g[i].member` does not by itself rule
> the workaround out.**
>
> It still does not close this function, for a *different* reason that is worth
> more than the fix: the workaround stalls at **304 of 308, size exact, 98.7%**,
> and all four bytes are the same commutative operand slot. The ROM emits
> `adds rD, rIndex, rBase` and every pointer-based spelling emits
> `adds rD, rBase, rIndex`, because **`fold` canonicalises a PLUS with a
> CONSTANT operand so the constant goes second — and `&gArray + 0x30` is a
> constant, while a runtime pointer base has nothing to move.** Probed and all
> four behave the same way: `(a + q->unk00)->m`, `(&q->unk00[a])->m`,
> `*(u32 *)(a*0x60 + ((u8 *)q + 0x30))`, `*(u32 *)((u8 *)q + a*0x60 + 0x30)` —
> every one gets the index-first order *and* folds the constant into the load
> displacement, so the hoist and the operand order cannot be had separately.
> `old_agbcc` and `-fno-force-addr` were both measured and neither helps.
>
> **Read it as a new decision rule.** For a `.LC`-routed `g[i].member`: reach for
> the wrapper struct, and expect to land within a few bytes; whether you close it
> depends on whether the ROM's address adds are index-first (an address-constant
> base, unreachable) or base-first (reachable). That is one look at the listing
> before drafting.
>
> **Second data point, and it makes the add-order test NECESSARY BUT NOT
> SUFFICIENT (wave 18, W18-B).** `sub_080081E0` / `sub_080083E0` / `sub_0800977C`
> were scanned mechanically, every register-register `adds` in each whole
> function classified by how its operands were defined: **32 of 32 base-first in
> each twin, 22 of 22 in `sub_0800977C`, zero index-first** (the remainder are
> runtime+runtime and carry no signal). So the pre-check says "reachable" — and
> all three are still open, at 75.2% and 38.6%, on register allocation. The
> add-order read is a genuine *veto*: index-first does rule the workaround out.
> It is not a green light. **Do not read base-first as "drafting toward a
> match".**
>
> Note also what these three are NOT: the wrapper-struct spelling has nothing to
> attach to here. `gUnknown_08499590` is a `u8 *` **pointer** global, so `**pp`
> yields a runtime pointer and every read is plain arithmetic on it
> (`p + 0x417A + t`) — there is no aggregate, no `g[i].member`, and no member
> offset to hoist. That is also *why* they are uniformly base-first, which is the
> corroboration the rule predicts: a runtime pointer base has nothing to move.
> And their relocation is already correct — `objdump -r` on the c_local draft
> shows the single `.text` relocation `R_ARM_ABS32 gUnknown_0808D7F8`, not
> `.rodata`. **When the workaround already carries the ROM's relocation and is
> size-exact, the relocation is not the remaining fight; allocation is.**

Read the two together as a decision rule: the workaround is byte-reachable when
the `.LC`-routed symbol is used for pointer arithmetic or `->` (as in
`sub_0806DDF4`, `sub_08066D30`, the `gUnknown_08090CD8` users), and — subject to
the wave-18 correction above — is harder when the ROM shows a hoisted
`g[i].member`.

**Do not remove the flag globally.** It is tempting: `sub_080308B4` matches
exactly under `-fno-force-addr`, and so does `sub_0808AD6C`. But the ROM builds
to `14dd0b22c894…` with it, and upstream's own matching sources — `src/proc.c`
and `src/title-screen.c` — generate different code without it. When this
paragraph was first written only 31 files were promoted and all were identical
either way; **at 520 files, 17 of them now change**, so removing the flag from
`CFLAGS` would break seventeen verified functions. The right shape for the
functions that need it off is a per-file override — see the next section.

### How common the `.rodata` reroute is, and the one-line screen for it (wave 13)

The reroute was previously described as something that happens when two
absolute addresses are **live across a loop**. That understates it badly, and
the understatement is expensive: it makes agents pick targets that cannot be
closed and then spend probes discovering why.

**Measured on one wave-13 batch of forty straight-line functions
(`backward_branches == 0` for every one of them, addresses 0x0800272C to
0x0802DCB4): twenty-three carry a `.LC` pool reference. That is 57%.** So the
trigger is not a loop. It is **a pointer global read on more than one path with
a call or a control-flow join between the reads** — which is precisely what a
straight-line dispatcher does, and why the "no backward branch" screen selects
*for* this hazard rather than against it.

The blocks are contiguous and per-unit, which is what makes the screen cheap:

```
code.s          0x0808D6DC .. 0x0808D89x
code-0801D390.s 0x0809092C .. 0x08090C2x
```

The words in them are plain addresses of real globals, and `asm/` symbolises
each one as a `gUnknown_0808xxxx` / `gUnknown_0809xxxx` that is **not a
global**:

```
0808D794 -> 08499590      080909F0 -> 08499590
0808D7E8 -> …             080909F4 -> 08499C7C
0808D824 -> …             080909F8 -> 030033E4
```

Note the duplication — 08499590 appears at four consecutive slots around
0x080909F0 and again at 0x0808D794 — which is the same give-away the section
above describes for 0x0808D6DC.

**The screen, and it should be run before a target list is written, not after:**

```python
import json, re
fns = json.load(open('data/functions.json'))
blocked = [f['name'] for f in fns
           if any(re.match(r'gUnknown_0808[C-F]|gUnknown_0809[01]', r)
                  for r in f.get('data_refs', []))]
```

A hit is a park. It costs one command and it is worth more than any per-target
reasoning, because **the C is not the problem and no amount of probing will
show you that.** Worked case, `sub_08003DC4` (268 bytes): the direct spelling
`gUnknown_08499590` compiles to the ROM's exact two-load shape
(`ldr r1,=.LC0; ldr r0,[r1]; ldr r2,[r0]`), the exact `push {r4,r5,r6,lr}`
frame, the fall-through into `case 7`, and the cross-jump that shares case 7's
`x-1` call tail with case 1's. Every instruction is right. Only the pool word's
relocation differs — `.LC0` in this unit's own `.rodata` against the
`gUnknown_0808D794` that `data/data.s` emits — which is the split problem this
section already describes, not a codegen problem. The draft is kept in
`work/sub_08003DC4/sub_08003DC4.c` for whenever the split can express it.

**The `**const` workaround was re-tested on a second symbol and fails the same
way.** Declaring `extern u8 **gUnknown_0808D794` and writing
`*gUnknown_0808D794` makes `-fforce-addr` fire on *that* symbol in turn and
emit a THIRD `ldr` at every access:

```c
p = gUnknown_08499590;      /* ldr r6,=.LC0 ; ldr r0,[r6] ; ldr r2,[r0]        -- ROM's shape */
p = *gUnknown_0808D794;     /* ldr r6,=.LC0 ; ldr r0,[r6] ; ldr r0,[r0] ; ldr r2,[r0] */
```

This reproduces the wave-13 A4 finding on `gUnknown_0808D6DC` independently, on
a different symbol in a different function, so it is a property of the flag and
not of one declaration. **Do not re-derive it a third time; do not add users of
these symbols.**

---

### The reroute IS reachable from source — bind the pool word's ADDRESS to a local (wave 13, agent A2)

**The two sections above are right that dereferencing a `.LC` word in place
fails, and wrong that the workaround therefore fails. The distinction is where
you put the `&`.** Evidence is a byte-exact *and relocation-exact* match, not a
probe: `sub_080345C8` (308 bytes, `relocs: match`) goes through
`gUnknown_08090D88`, which is a `.LC` word of exactly the kind the screen above
flags as an automatic park. `sub_080359A4`'s draft reaches `gUnknown_08499590`
through `gUnknown_08090EA8` the same way, and its pool word likewise relocates
against the real symbol on both sides of the diff.

The three spellings, in a probe that has the cross-call liveness the flag needs
(a leaf function does not trigger force-addr at all, so a probe without a `bl`
between the two reads measures nothing):

```c
extern u16 *const gUnknown_08090D88;   /* the .LC word; the ROM stores
                                        * &gUnknown_030032D8 in it */

int a_direct(void)   /* the honest source */
{
    if (gUnknown_030032D8 == 1) sub_08024454();
    return gUnknown_030032D8 == 14;
}
int b_inplace(void)  /* the pool word dereferenced in place */
{
    if (*gUnknown_08090D88 == 1) sub_08024454();
    return *gUnknown_08090D88 == 14;
}
int c_local(void)    /* the pool word's ADDRESS bound to a local first */
{
    u16 *const *pp = &gUnknown_08090D88;
    if (**pp == 1) sub_08024454();
    return **pp == 14;
}
```

| | pool word | per-use shape |
|---|---|---|
| `a_direct` | `.LC0` in this unit's `.rodata`, unplaceable | `ldr r4,=.LC0; ldr r0,[r4]; ldrh` |
| `b_inplace` | `gUnknown_08090D88` ✓ | **caches the loaded pointer in r4 across the `bl`** and re-reads only the `ldrh` — one `ldr` short per later use |
| `c_local` | `gUnknown_08090D88` ✓ | `ldr r4,=sym` once, then `ldr r0,[r4]; ldrh r0,[r0]` **at every use** — the ROM's shape |

So `b_inplace` does not "emit a third `ldr`" in this shape — it emits one too
*few*, because `u16 *const` makes the load unchanging and CSE keeps it across
the call. Inside a real function the in-place spelling fails the other way as
well: force-addr fires again on the pool symbol itself and the count goes up. In
`sub_080345C8` the two failures cost 45 bytes and 4 bytes respectively; only
`c_local` matched.

**Why the `&` placement decides it:** a local's initialiser is a plain SET of an
address constant, which agbcc materialises with an ordinary `.text` pool load.
An in-place `*gSym` is a MEM whose address force-addr must force — and forcing
it is what creates the second `.rodata` level. This is the same lever the
`pp = &gSym` advice two sections up already uses; what is new is that it works
when the object behind the word is a **scalar or a pointer read on several
paths**, not only in the loop-preheader case that advice was written for.

Two boundaries, so this does not get over-read:

- **It does not rescue the 0x0805CA60 family.** Those park on a loop-preheader
  *ordering* diff (`adds r6, r3, #0` fourth vs last), which no source spelling
  moves. That failure mode is unrelated and still real.
- **The screen above is still worth running — but a hit is now a triage, not an
  automatic park.** If the `.LC` word points at a global the function reads on
  more than one path, try `c_local` before parking. If the function has a loop
  and the diff is preheader ordering, park.

Read backwards, the tell that you want this spelling is: **the ROM loads a pool
word, dereferences it once to get an address, and then dereferences that at
every single use without ever caching the middle value.** A real pointer global
would be cached; a `.LC` word behaves like this because each use re-expands the
forced address.

---

### The boundary on that fix: it needs a SCALAR behind the word, not an array (wave 13, agent A7)

**`c_local` works when the `.LC` word holds the address of a scalar or pointer
global, and there is no source form at all when it holds the address of an
ARRAY.** The distinction is not about the function; it is about what the word
points at, and it is decidable before you write a line of C.

The reason is mechanical. `c_local` wins by supplying, in the source, the extra
level of indirection that force-addr would otherwise invent:

```
scalar case   source `gScalar`         = 1 level; ROM has 2; `**pp` supplies the 2nd  -> fixable
array case    source `gArray[i][j]`    = 1 level; ROM has 1; the array's address IS
                                         the word's content, so there is no second
                                         `&` to move                                 -> not fixable
```

Measured on `sub_0804CEF8` (516 bytes; its word 0x08136068 holds 0x02029668,
which is the `s16 [][5]` declared as `gUnknown_02029668`). All three spellings,
same function, nothing else changed:

| spelling | size | bytes differing | pool word relocates against |
|---|---|---|---|
| `gUnknown_02029668[a][2]` — the honest source | exact | **0 of 516** | `.rodata` ✗ |
| `gUnknown_08136068[a][2]` — `b_inplace`, `const` **and** non-`const` | exact | 9 | `.rodata` ✗ |
| `p = &gUnknown_08136068; (*p)[a][2]` — `c_local`, four pointer shapes | **−20** | 424 | — |

So the honest spelling already reproduces **every byte of the function** and
only the relocation is wrong; `b_inplace` does *not* give the real symbol here
(contrast the table above, where it does); and `c_local` overshoots by 20 bytes
because `*p` gets CSEd across the calls and the extra local shifts the whole
allocation. `const` on the pointer changes nothing in either direction — the
`const`/non-`const` split that matters in the scalar case does not arise here.

**The one-line triage, and it is cheap because you already have the word's
contents from the screen:** resolve the address the `.LC` word holds and look up
that symbol's declaration.

- points at a **scalar or pointer** global → A2's `c_local`, try it before parking
- points at an **array or aggregate** → park, and do not spend probes

Worked confirmation of the readable side, from the same batch. `sub_0804F18C`'s
three `.LC` words all hold scalar addresses (0x03001FBC, 0x0300451C,
0x0300453C), and its ROM text is A2's signature exactly — the word's address
loaded once into a high register, dereferenced to a symbol address that IS
cached, and the scalar re-read through it at every use, with the middle value
re-derived after the control-flow join:

```
ldr r0, =gUnknown_081360A0 ; mov sl, r0 ; ldr r6, [r0] ; ldrsh r0, [r6, r1]
...
mov r6, sb ; ldr r6, [r6] ; ldrh r3, [r6]      @ re-derived after the join
```

`sub_0804CEF8` has no such middle value: `ldr r4, =gUnknown_08136068;
ldr r1, [r4]` and the loaded word is already the base being indexed.

Applied to one 21-target list this splits ten parked functions into **one**
worth re-attempting (`sub_0804F18C`, all three words scalar) and **nine** that
stay parked because at least one word points at an array — `sub_0804CEF8`,
`sub_0804E584`, `sub_0804EB78`, `sub_0804F3C8`, `sub_0804F658`, `sub_080506B0`,
`sub_080553C8`, `sub_080831FC`, `sub_08083484`. Mixed functions are parked by
their worst word, not rescued by their best.

**`-fno-force-addr` is not a way out of any of this, and it has now been tested
rather than assumed.** On `sub_0804CEF8` the flag-off build gives 496 bytes and
18.0% against 516 and 100% with the flag on. The ROM was built *with*
`-fforce-addr` here; this is not a `data/compiler-overrides.json` candidate, and
`sub_0808AD6C`'s entry does not generalise.

### The trigger is a CONTROL-FLOW MERGE, not a loop (wave 13, agent A4)

**The section head at the top of this chapter says force-addr fires "when the
global is used both before and after a loop". That is a special case of the real
rule, and the general one is:** a reference on **both sides of a control-flow
merge**. A plain `if` does it with no loop and no call.

This matters because it is what decides, before you write anything, whether
`c_local` / `b_inplace` will themselves get force-addr'd. Ten shapes, one
`extern struct Unk0200B0B0 **const gTP;`, probes in
`work/wave13/probes/fa.c`, `fa2.c`, `fa3.c`, `fa5.c`:

```c
void fg_flat(void)        { (*gTP)->unk02 = 1; (*gTP)->unk04 = 2; (*gTP)->unk0c = 3; }   /* no  */
void fb_2(int a)          { if (a) (*gTP)->unk02 = 1; else (*gTP)->unk04 = 2; }          /* no  */
void fe_call_only(int a)  { if (a) sub_08003948(); (*gTP)->unk04 = 2; }                  /* no  */
void fg_before(int a)     { (*gTP)->unk02 = 1; if (a) sub_08003948(); }                  /* no  */
void fe_join(int a)       { if (a) (*gTP)->unk02 = 1; (*gTP)->unk04 = 2; }               /* YES */
void fg_across(int a)     { (*gTP)->unk02 = 1; if (a) sub_08003948();
                            else sub_08003934(); (*gTP)->unk04 = 2; }                    /* YES */
void fg_both_after(int a) { if (a) (*gTP)->unk02 = 1; else (*gTP)->unk04 = 2;
                            (*gTP)->unk0c = 3; }                                         /* YES */
```

`fe_call_only` against `fe_join` is the controlled pair: identical except for
one extra reference inside the arm. Four references in four switch arms with
none after the join do not fire; two references either side of one `if` do.
Neither a call nor a loop is necessary or sufficient — only the merge is.

Three consequences worth carrying:

- **`b_inplace` is unavoidable, and therefore the function is parked, whenever
  the pool word is referenced on both sides of a merge.** That is most large
  functions, which is why the class is not generally rescuable even though
  `c_local` genuinely closes the shapes above.
- **The complement of A2's backwards-tell.** A2 reads "the ROM dereferences the
  word at every use *without caching the middle value*" as the signal to write
  `c_local`. The negative is just as usable: **if the ROM CACHES the middle
  value across a call, `c_local` is wrong and will lose.** `sub_08000694` holds
  `&gUnknown_0200B0B0` in r4 for its whole body; `c_local` costs **+16 bytes**
  there, `b_inplace` +8, and the honest direct spelling is 392 of 392 bytes with
  0 differing and only the `.rodata` relocation against it. Measure the caching
  before choosing the spelling.
- The "a *pair* of pool words is loop-driven, a *single* one is not" note
  elsewhere in this file is the same fact seen from the data side: a single word
  needs only a merge, and pairs need the extra liveness a loop provides.

### `c_local` generalises: write out by hand the CSE the original got free (wave 14, C)

**A `.LC` word is not one decision, it is one decision PER READ SITE, and the
right spelling differs between sites of the same function.** A2's `c_local` and
A4's "if the ROM caches the middle value, `c_local` is wrong" read as a
per-function choice between three spellings. On four functions in the
0x08009000–0x0800C000 map cluster it is per-site, and getting it right is
mechanical once you look at the ROM the right way. Three matched byte-exact
*and* relocation-exact this way (`sub_0800AA30` 416 B, `sub_0800A3D4` 436 B,
`sub_0800BF78` 428 B).

The vocabulary, for `extern u8 **const gLC;` (the pool word) over a pointer
global `g` (here `u8 *gUnknown_08499590`), with `pp = &gLC` bound to a local:

| ROM at the read site | write |
|---|---|
| `mov rL, rPP ; ldr r0,[rL] ; ldr r0,[r0] ; ldrh` — both levels re-derived | `**pp` |
| `mov rL, rQ ; ldr r0,[rL] ; ldrh` — one level, middle held in a **callee-saved** register across calls | bind it: `q = *pp;` … `*q` |
| the middle value in a register *and* reused after a `bl` | same — `**pp` cannot do it, because a `const` global reached through a local pointer is not `RTX_UNCHANGING_P` |

**Count the `ldr`s at each site before writing anything; that count IS the
spelling.** `sub_0800BF78` needs all three inside one function: `q` bound at the
top (in `sb`) for the tile fetch and exactly one later read, `s = *pp` rebound
after each of two `if` merges (r7, each binding then serving three reads across
intervening calls), and plain `**pp` at exactly one site where the ROM
re-derives. Getting any one of them wrong is 8–44 bytes.

**The honest spelling is the oracle, and it costs one iteration.** On all four,
naming `gUnknown_08499590` directly gave *every byte* — one of them on the first
try, with `bytes: match, but relocations differ` as the entire verdict. Do that
first: it separates "my semantics are wrong" from "my pool spelling is wrong",
and the byte-exact honest draft is then a fixed target the `c_local` conversion
can be diffed against instead of the ROM. Going straight to `pp` inverts the
work — every semantic error and every CSE error arrives in the same diff.

**Where `pp = &gLC` is assigned is load-bearing, and the tell is where the ROM
copies the pool register into its callee-saved home.** agbcc emits setup in
source-statement order, so `mov sb, r1` sitting several instructions *after* the
pool load means the assignment is not the first statement of that region:

```
ldr r1,=gLC ; ldr r0,[r1] ; mov r8,r0 ; ldr r0,[r0] ; ldrh r0,[r0] ; subs r0,#1
mov sb, r1                       <- pp's copy, AFTER the bound is computed
cmp r4, r0
```

Two spellings reach that and nothing else tried does: read the word by name
first (`q = gLC;`, which also gives you the middle-level local), give the bound
its own statement (`lim = *(u16 *)*q - 1;`), and only then `pp = &gLC;`. In
`sub_0800AA30` that `lim` local is worth 4 bytes in each of two switch arms and
has no other effect; in `sub_0800BF78` the same reading puts `pp`'s assignment
after a `bl`, three statements below the pool load. **Reading the word by name
in the same function that takes its address does NOT re-trigger force-addr** —
that is the `b_inplace` hazard the sections above warn about, and it does not
fire when the only by-name read is a single one feeding a local.

**One `pp` per function, assigned per region — not one local per region.**
Per-region locals give different arms different hard registers, and two arms
that share a tail in the ROM then fail to cross-jump: `sub_0800AA30`'s cases 2
and 4 share two blocks, which needs both arms holding `pp` in `sb`. Declaring
`pp` once at function scope and assigning it separately in each arm gives one
pseudo, one register, and the ROM's four pool words. Getting this wrong is
**-44 bytes** and presents as the candidate being mysteriously *short*.

### The branchless `!= 0` also fires on a narrowing at the ASSIGNMENT (wave 14, C)

The "returned `!=`" table above lists the triggers for
`(t | -t) >> 31` as a non-zero compare constant or a narrowing conversion **on
the operand**. There is a third, it is not on that list, and it is the one that
appears in ordinary code: **a narrow assignment TARGET.** One probe, six
spellings, one `int`-returning callee:

| source | shape |
|---|---|
| `int ok; ok = f() != 0;` | branching — `cmp #0; beq; mov #1` |
| `int ok; ok = !!f();` / `ok = f() ? 1 : 0;` | branching, byte-identical |
| **`u8 ok; ok = f() != 0;`** | **branchless, and with NO shift pair in front** |
| `int ok; ok = (u8)f() != 0;` | branchless, **plus** `lsl #0x18; lsr #0x18` |
| `int ok; ok = f() != -1;` | branchless, via `mvn` |

The third and fourth rows are the ones to tell apart, because both are
"branchless `!= 0`" and they differ by 4 bytes: a cast on the *operand* keeps
the truncation as real instructions, while a narrow *destination* just picks
`do_store_flag`'s QImode path and emits nothing extra. **Read
`rsbs; orrs; lsrs #0x1f` with no shift pair in front as a `u8`/`bool8` local
being assigned, not as a cast and not as a narrow-returning callee.**
`sub_0800977C` turns on exactly this, and `int ok` there is 4 bytes long and
also branches.

---

## Per-file compiler and flags

**The original build did not use one compiler with one flag set.** This is the
finding of wave 10, it is what unparked three functions that had each survived
a permuter run, and it is the first thing to check on a near-miss that is
size-exact with correct instruction selection and wrong registers.

`tools/agbcc/bin/` holds **two** compilers. The Makefile defines both and uses
only one:

```make
CC1_OLD := $(AGBCC_HOME)/bin/old_agbcc$(EXE)   # defined, never referenced
CC1     := $(AGBCC_HOME)/bin/agbcc$(EXE)
```

`old_agbcc` rejects `-fprologue-bugfix` outright, so its flag set is our
`CFLAGS` minus that option.

Three functions, three different configurations, all verified byte-for-byte
against the assembled original:

| function | what it is | configuration that matches |
|---|---|---|
| `sub_080713F8` | `MPlayTempoControl` | **`old_agbcc`**, `-fforce-addr` irrelevant |
| `sub_08071564` | `MP_clear_modM` | **`old_agbcc`**, `-fforce-addr` irrelevant |
| `sub_0808AD6C` | `SetReadFlash1` | either compiler, **`-fno-force-addr`** |

So the compiler binary and the flag are independent axes, and the m4a pair is
the binary while the flash routine is the flag. This is the same layout every
other GBA tree has: the sound library and the flash library came out of the SDK
prebuilt with their own toolchain settings and were dropped into the game's
build.

**How much each axis moves.** Recompiling all 520 promoted files both ways and
comparing the emitted code:

| change | promoted files whose code changes |
|---|---|
| `agbcc` → `old_agbcc` | **100 of 520** |
| drop `-fforce-addr` | **17 of 520** |

Neither is a candidate for a global change; both are cheap as a per-file
override. And the neighbourhoods are clean: **no promoted file between
0x0806F710 and 0x080745C0 differs under `old_agbcc`**, and **no promoted file
above 0x08063A3C differs without `-fforce-addr`**, so an override covering
either library costs nothing that is already matched.

**What `old_agbcc` does differently**, from the two m4a functions:

- **It does not do the `if`/`else` → "store the else value, conditionally
  overwrite" rewrite.** Under `agbcc` a two-armed `if`/`else` assigning one
  object collapses to one arm with no unconditional `b`, one instruction
  shorter. Under `old_agbcc` both arms and the `b` survive, the shared operand
  is loaded *after* the merge, and the branchless arm's constant stays as a
  second, dead `movs`. `sub_08071564`'s entire 4-byte deficit was that one
  rewrite, and eighteen source spellings had been probed against it.
- **It keeps a member re-read live instead of coalescing it with the value just
  stored there, and substitutes the stored register rather than emitting a
  reload.** `mplayInfo->tempoU = tempo; ... mplayInfo->tempoD *
  mplayInfo->tempoU` emits a second `ldrh` under `agbcc` and reuses the
  register under `old_agbcc`. That extra live value is what forces the
  `adds r0, r1, #0` copy, the r4 allocation and the `push {r4, lr}` frame in
  `sub_080713F8` — all three of which the earlier draft was missing at once.

Read that second bullet the useful way round: **a function that carries one
more live value, one more callee-saved register and one more copy than any
spelling can justify is a candidate for `old_agbcc`, not for more AST
rearrangement.** Both m4a functions presented exactly that way, and both had
had their source axis declared exhausted — correctly, because the source axis
was not the axis.

**How to probe another compiler or flag set without touching the build.**
`agbenv.flags()` is the single place both `trymatch.py` and `compile_probe`
read `CC1` and `CFLAGS` from, so monkeypatching it in a throwaway script gives
a full verdict against the real target with nothing in the repo modified:

```python
import agbenv, trymatch
_orig = agbenv.flags
agbenv.flags = lambda: dict(_orig(), CC1="tools/agbcc/bin/old_agbcc",
                            CFLAGS=_orig()["CFLAGS"].replace(" -fprologue-bugfix", ""))
trymatch.check("sub_080713F8", want_diff=True)
```

**Promoting any of these needs a Makefile decision, so it is not a side effect
of matching one.** The functions above sit in `work/` with matching C and a
header comment naming the configuration each one needs; `try_match` will keep
reporting them as failures until the build carries a per-file rule, because it
compiles with the default flags. That rule is one line per file of the form
`$(BUILD_DIR)/src/decomp/c_XXXXXXXX.o: CC1 := ...`, and it changes nothing
outside the files it names.

**What this axis does *not* explain.** `sub_0801A6C0` is one byte from a match
on a register tie-break and is unaffected by every configuration tried:
`old_agbcc` rewrites it out of recognition, `-fno-force-addr` costs it a third
callee-saved register, and eleven other options toggled one at a time leave the
allocation exactly where it is. Not every allocation near-miss is a build-flag
problem — check, and if the check is negative, record that it was.

---

## Working a function of 150+ bytes

Every rule above was found under 128 bytes. Wave 12 took the first family over
150 (seven 188-byte list builders at 0x0805CA60-0x0805D134) and the method that
worked is different enough to write down, because the >256-byte band is 356
functions and 126KB and this is the only account of it.

**Size is not difficulty; the number of *distinct decisions* is.** Those 188
bytes are 75 instructions and only about eight decisions: two pointer levels,
one loop shape, one compare constant, one callee. The whole function fell out of
a first draft that was structurally right, and then took nine probes to settle a
single question. A 40-byte bitfield accessor can be harder. So do not budget by
byte count — skim the target and count the things you would have to guess.

**Read the assembly into a line-by-line C sketch BEFORE writing any C.** Not a
paraphrase — annotate every instruction with what it computes, in the target's
own order, and only then collapse it into statements. At 75 instructions the
alternative is drafting from a remembered impression of the shape, and a wrong
loop makes every byte after it differ and tells you nothing.

**Outside-in is right, but the useful cut is entry block / preheader / loop body
/ tail, not "prologue then body".** Those four regions fail independently and
each has its own cause:

| region | what it is deciding | what moves it |
|---|---|---|
| entry block | which values must survive the loop | the number of live pointer locals |
| preheader | LICM hoists, then strength reduction's biv init | almost nothing in the source — see below |
| loop body | instruction selection, the real content | types, bindings, statement order |
| tail | whether a global is re-read after the loop | `const`, and aliasing |

**The preheader is where you find out whether the function is winnable.** Its
contents are emitted by passes, not by statements: LICM appends its hoists in
loop order, then `strength_reduce` appends the induction-variable setup, so the
biv init is normally *last*. Anything after the biv init was emitted by a later
pass and **you cannot reach it by rewriting statements** — that is exactly what
stalled the 0x0805CA60 workaround at 95.7% (see `-fforce-addr`). If a candidate
is otherwise exact and the only diff is a preheader permutation, spend one probe
on a controlled test — take the *feature you suspect* and add it to a spelling
that already gets the preheader right — rather than a dozen on rephrasing.

**The high-register prologue is a register-pressure readout and nothing more.**
`mov r7, sb; mov r6, r8; push {r6, r7}` says the function needs eight or more
simultaneously live values, so expect a genuine loop with several carried
pointers. It says nothing about the source shape, and it is not a hint that the
function is hard: here r8/sb held two *symbol addresses* that `-fforce-addr` was
keeping alive across the loop, which is the least interesting thing they could
have been. Read it as "count the live values, then check your draft carries the
same number" — a draft one live value short or long shows up as a different
`push` list before you diff anything else.

**Do the whole batch's constant-substitution pass in one shot at the end, and
verify with `trymatch.py` in a shell loop, not with seven MCP calls.** Once the
representative is right the siblings are a table (compare constant, callee,
global) and a 20-line Python script that writes seven files; the seven verdicts
come back in one command. Getting all seven to the identical percentage with the
identical first-difference offset is also the check that you read the table
right — a sibling that lands somewhere else has a constant wrong.

**What wasted time, so you can skip it:** trying to fix a near-miss by adding
locals. At this size the instinct is that a stubborn instruction order wants one
more binding, and five of the nine probes were variants of that. Every one of
them changed the register *assignment* and none changed the instruction *order*.
Binding a subexpression is a register-allocation lever; it is not a scheduling
lever, and above ~100 bytes most of what is left is scheduling.

---

## Large functions — 256 bytes and up

The section above stops at 188 bytes and warns that the >256 band is unexplored.
It is not any more. Four functions in the 280–368 byte band were matched in one
sitting:

| function | bytes | probe rounds | `try_match` attempts |
|---|---|---|---|
| `sub_0804D928` | 280 | 5 | 2 |
| `sub_0804E3B4` | 280 | 0 | 1 |
| `sub_08012420` | 364 | 3 | 1 |
| `sub_08063E28` | 368 | 1 | 1 |

1292 bytes for five attempts. Before this the largest matched function in the
tree was 124 bytes, so every number below is the first measurement of its kind
and should be re-checked rather than trusted.

**The headline result is that the large band is CHEAPER per byte, not dearer.**
1292 bytes is more than the twenty-odd sub-64-byte accessors the same effort
buys, and one of the four (`sub_08063E28`, the biggest) matched off its first
probe with no register fighting at all. The reason is structural and it
generalises:

**Three of the four have no loop. A large straight-line function is N
INDEPENDENT decisions, and independent decisions are cheap.** `sub_08012420` is
27 statements, each of which fails on its own and whose diff points straight at
itself; getting 26 right and one wrong leaves 26 right. A 60-byte loop is one
coupled decision where a wrong shape makes every later byte differ and teaches
nothing. So **size is anti-correlated with difficulty once you condition on
control flow**, and the practical rule is: prefer a big straight-line function
to a small loopy one. You can tell which you have in ten seconds — look for a
branch whose target label is numerically *below* it. `sub_08063E28` at 368 bytes
has two forward branches and no backward one.

### Attack order for a straight-line function

The entry / preheader / body / tail cut in the section above is for loops. For
straight-line code the useful cut is different, and the middle step is the one
nobody would think to do:

1. **The frame.** `sub sp, #N` is the size of the locals and `push` is the live
   count. `sub sp, #8` plus `mov r4, sp` before a call means one 8-byte local
   whose address is taken and survives the call.
2. **The address arithmetic, before you understand a single statement.** agbcc
   CSEs absolute addresses, so a run of stores to fixed addresses comes out as
   one pool word followed by `adds rN, #k` / `subs rN, #k` steps. That chain is
   a **direct readout of the source's statement order**. In `sub_08012420` the
   four BGxCNT writes (0x04000008..0x0400000E) hang off the MOSAIC pool word
   with `subs r1, #0x44` and three `adds r1, #2`, which is only reachable if
   MOSAIC is written *first* — an ordering that looks arbitrary in the listing
   and is not guessable. Do this before drafting: it costs nothing and it is the
   one thing at this size that a draft cannot recover from getting wrong.
3. Then the statements, one at a time, in that order.

Two freebies that come with the territory: a store to a `volatile` lvalue may
not be reordered, so for any register-flush routine the emitted store order *is*
the source order; and a stack local reached as `[r4, #N]` rather than `[sp, #N]`
is not a hint about the source — THUMB has no SP-relative `ldrb`/`strb`/`ldrh`,
so any byte or halfword access to a stack local needs the frame in a low
register and that is the whole reason `r4` is pushed.

**The high-register prologue does not appear in this band, and expecting it is a
mis-set expectation worth correcting.** None of the four needs `mov r7, sb;
mov r6, r8`; the biggest uses `push {r4, r5, r6, lr}` and the 364-byte one uses
`push {r4, lr}`. `sb`/`r8` are bought by *simultaneously live* values, which is
a loop property — a straight-line function of any length needs about three
registers because nothing lives across statements. Read a high-register prologue
as "there is a loop carrying five-plus pointers", never as "this function is
big".

**Wave 13 correction: that paragraph is wrong for CONSTANT-heavy straight-line
code, and believing it costs a round.** `sub_08037260` is 400 bytes, has zero
loops, and pushes `r8`, `sb` *and* `sl`; `sub_080876B4` (420 bytes) and
`sub_08073B00` (392 bytes) each push three high registers too. In every case
the high registers hold **CSEd bitfield AND/OR masks** — `-2`, `-3`, `-5`,
`-9`, `-0x11`, `-0x21` — not pointers. The underlying rule still holds ("five
or more simultaneously live values"), but the values need not be loop-carried:
a register-flush routine that clears the same five bit positions on four
different byte-sized shadows keeps five mask constants live across the whole
body. So read a high-register prologue as "five-plus simultaneously live
values", and in a bitfield flush **count the distinct masks reused across
groups to predict how many.** Read backwards, this is a source-order signal:
if your candidate pushes one FEWER high register than the ROM while the body is
otherwise right, you have one fewer *shared constant* than the original, which
means two groups that share a mask in the ROM do not share one in your draft.

### Rules found in this band

Each was isolated with a controlled `compile_probe` and each one alone was the
whole difference between a near-miss and a match.

**`x * 0x100` and `x << 8` are DIFFERENT CODE when `x` is a narrow global, and
the difference is whether the global gets re-read.** The C front end's
`shorten_binary_op` applies to `MULT_EXPR` and not to shifts, so `g * 0x100`
stays a HImode multiply with a real `(mem:HI)` operand while `g << 8` promotes
to `int` first and its load becomes an ordinary SImode pseudo — which CSE will
then satisfy from an earlier load of the same global several statements back.

```c
oam.tileNum = (gUnknown_0300453C << 8) + 0x60;   /* lsl r1, r3, #8   -- reuses r3 from 3 statements up */
oam.tileNum = gUnknown_0300453C * 0x100 + 0x60;  /* ldrh r1,[r5]; lsl r1,r1,#8 -- reloads */
```

Two bytes, and `sub_0804D928`/`sub_0804E3B4` turn on exactly this and nothing
else. **Read backwards: a global that is re-read where an identical earlier
value was still live tells you the source used `*` and not `<<`.** This is the
first case found where the *arithmetic operator* rather than a type or a binding
is the discriminator, so add it to the checklist next to "toggle `volatile` on
the operand" — it is the same class of one-token fix.

**A third symptom of the same difference, on signedness rather than on reloads
(wave 13, A7).** When the operand is a *signed* narrow field and the result is
truncated back to 16 bits, `<< 8` lets combine narrow the load itself:
`proc->unk4e << 8` on an `s16` member emits `ldrh` — the sign bits cannot
survive the truncation, so nothing needs them — while `proc->unk4e * 0x100`
keeps the HImode multiply and therefore the declared-signed load,
`movs r2, #0; ldrsh r1, [r6, r2]`. That is two extra bytes, because THUMB has no
immediate-offset `ldrsh` and the register-offset form needs a zero register.
`sub_080867BC` turns on exactly this. **So `ldrsh` on a value that is about to
be truncated to 16 bits is positive evidence for `*`, the same way a redundant
reload is** — check both symptoms before concluding the operand's type is wrong.

**Binding a table element to a local blocks the `ldrh` -> `ldrb` narrowing at a
bitfield store.** Assigning a `u16` array element into a bitfield narrower than
16 bits lets `force_to_mode` push the store's byte mask back through the shift
and into the load itself:

```c
oam.paletteNum = tbl[i];            /* mov r0,#0xf ; ldrb r1,[r0] ; ...  -- narrowed, mask hoisted */
v = tbl[i]; oam.paletteNum = v;     /* ldrh r1,[r0] ; mov r0,#0xf ; ...  -- kept */
```

Identical length, so it is a pure opcode-and-order diff with nothing in the
expression to blame. Ten spellings in one probe: `const`, non-`const`, a
`u16 t[][3]` row, a 6-byte struct member, an `int` temp and a `u16` temp — only
the *presence of a temp* matters, and `int` and `u16` temps behave the same.
`volatile` on the table also keeps the `ldrh`, so check the cheaper cause first.

**`u16 ^ u16` keeps its zero-extension only while BOTH operands are memory.**
`shorten_binary_op` computes the xor in HImode, and extending a HImode *value*
to SImode for use as an array index is a real `lsl #16; lsr #16` (merged with
the index scaling into `lsl #16; lsr #15`). Bind either operand to a local and
combine deletes the extension, because `reg_nonzero_bits` on a pseudo loaded by
`ldrh` already proves the high half is zero:

```c
tbl[gA ^ gB]            /* eors ; lsl #0x10 ; lsr #0xf ; adds  */
t = gA; ... tbl[t ^ gB] /* eors ; lsl #0x1  ;             adds  */
```

So **the shift pair in front of an array index is positive evidence that both
sides are spelled as direct global reads** — one of the few places where the
absence of a local is provable.

**A broken absolute-address chain is a `volatile` tell, and unlike every other
volatile tell it costs BYTES.** With the source globals non-volatile, agbcc
reaches 0x04000052 as `adds r2, #0x34` off the 0x0400001E left in the BGxOFS
cursor, and 0x04000020 as `subs r2, #0x32` off that. Make the globals volatile
and both become fresh pool words. A volatile MEM sets `do_not_record` in
`cse_insn`, and the address equivalences go with it. That is 8 bytes across two
chains in `sub_08012420`, i.e. impossible to misread once you know to look for
it — **so when a large register-flush candidate is short by a multiple of 4 and
the missing instructions are pool words, suspect volatile before anything
else.**

**The classic volatile tell — a value reloaded while its address stays in a
callee-saved register — is worth 16 bytes in this band.** `sub_08012420`
subtracts one of two scroll origins from eight different globals in eight
consecutive statements and reloads the subtrahend every time. It has to be
`volatile`: nothing between the reads writes IWRAM, and agbcc *can* prove that a
`strh` to an absolute 0x040000xx address does not alias a symbol, so a plain
`u16` is CSEd down to one `ldrh` each. Both this and the paragraph above are now
recorded on the globals themselves in `hardware.h` and `unknown-globals.h`.

**`mul rD, rD, rS` in agbcc's output and `muls rD, rS, rD` in `asm/` are one
encoding.** THUMB MUL is destination-tied and has a single form; the two are
just gas's input syntax and objdump's output syntax. `sub_08063E28` has 36 of
them and they all read backwards. Do not spend an attempt on it.

### Four more rules from the 256–384 band (wave 13, agent A1)

Each was isolated with a controlled `compile_probe` — two spellings of one
statement in one file, everything else held fixed.

**A block-scoped temp and a function-scope temp compile to the SAME
instructions in a DIFFERENT register.** This was the whole of `sub_0800272C`
(280 bytes, one `try_match`). Two copies of the function differing only in
where the temp is declared:

```c
/* A: one temp at function scope   -> a1=r4 a2=r8 attr1=r5 a3=r6 a4=r7 */
int attr1;
if (a5) { attr1 = a2 & 0x1FF; if (a6) attr1 |= 0x1000; f(attr1, …); }
else    { attr1 = a2 & 0x1FF; if (a6) attr1 |= 0x1000; f(attr1, …); }

/* B: a temp inside each branch    -> a1=r4 a2=r8 a3=r5  a4=r6 t=r7  == ROM */
if (a5) { int t; t = a2 & 0x1FF; if (a6) t |= 0x1000; f(t, …); }
else    { int t; t = a2 & 0x1FF; if (a6) t |= 0x1000; f(t, …); }
```

Identical instruction stream, identical pool layout, identical length — a pure
opcode-and-register diff with nothing in the expression to blame. The
function-scope temp's live range spans both arms and outranks the parameters in
the allocator's priority order; the block-scoped ones do not and land after
them. **Read a temp that sorts AFTER the parameters in register order as
positive evidence that the original declared it inside the branch.** This is
the same class of one-token fix as the `volatile` toggle and `* 0x100` vs
`<< 8`, and it is the second case (after the `u16 ^ u16` shift pair) where the
*absence or scope* of a local is provable from the bytes.

**A `±1` folded into an index reassociates, and it must be given its own
statement.** `fold` rewrites `(ro + 1) + x` into `(ro + x) + 1`, and cse then
satisfies `ro + x` from a load two statements up — so the source's two adds
collapse into one, or worse into a `ldrh [rN,#2]` off the previous address.
Three spellings of one index, from `sub_08003DC4` and `sub_0800E9F4`:

```c
idx = *(u16 *)(rows + t) + 1 + x;           /* add r4,r3,#1 ; add r0,r5,r4   -- reassociated */
idx = *(u16 *)(rows + t) + 1;  idx += x;    /* add r1,r0,#1 ; add r1,r1,r4   -- ROM shape   */
idx = *(u16 *)(rows + t);  idx++;  idx += x;/* ldrh r1,[r0] ; add r1,r1,#1   -- ROM, in place */
```

The last two are the same length; only the third coalesces the load's register
with the increment, which is what `adds r1, #1` (the `Rd == Rn` imm8 encoding)
in the ROM means. **So a `±1` that appears as its own instruction on the loaded
value, rather than folded into the index add, tells you the source split the
statement** — and if the same `x ± 1` is also a call argument, the collapsed
form is what you get for free and the split form is what you have to write.

**A switch case whose body immediately follows the dispatch tree loses a
branch, and case order in the source is recoverable from that.** In
`sub_0801C2DC`, source order `case 0, case 1, case 0xFF` emits
`cmp #0xff; beq Lbody; b Ldefault` with the body placed after the other arms;
source order `case 0xFF, case 1, case 0` emits `cmp #0xff; bne Ldefault` and
falls straight through into the body. Two bytes, and it fixes the layout of
every block after it. **Read the case body sitting directly under the last
comparison of the tree as the case the source wrote first.**

**A forward branch that jumps PAST a block which is later in the source is a
`goto` in the original.** gcc 2.9 emits basic blocks in source order and does
no block reordering, so a `bhi` that clears an intervening switch body *and* a
shared tail to land on a block further down cannot come from any if/else
nesting. `sub_0801C2DC`'s expansion block is reached that way; writing the
branch as `if (a->unk1c > 0xFF) goto expand;` with `expand:` placed after the
tail took the candidate from +16 bytes to size-exact in a single probe. The
`goto` is not a decompiler artefact to be cleaned up — it is what the layout
says, and removing it costs bytes.

**TWO empty switch cases collapse; THREE survive — so a compare tree with more
comparisons than the code has bodies is a readout of the full case list.**
`sub_0800C124`'s else arm dispatches on a terrain byte and executes code for
exactly one value, yet the ROM emits a three-comparison balanced tree:

```
cmp r0, #0xd ; beq OUT      <- OUT is also where the default goes
cmp r0, #0xd ; bgt OUT
cmp r0, #7   ; bne OUT
<case 7 body falls through>
```

Five spellings in one probe, all over the same `ldrb`, all with the same single
body:

```c
switch (*c) { case 7: body(); break; case 0xD: break; }                    /* cmp #7; bne  */
switch (*c) { case 0xD: break; case 7: body(); break; }                    /* cmp #7; bne  */
switch (*c) { case 7: body(); break; case 0xD: break; default: break; }    /* cmp #7; bne  */
if (*c == 7) body();                                                       /* cmp #7; bne  */
switch (*c) { case 7: body(); break; case 0xD: break; case 0x13: break; }  /* the 3-cmp tree */
```

Only the three-case form survives. `expand_end_case` prunes a case node whose
label resolves to the default label, and with two cases the pruning leaves one
node and the tree degenerates to a single compare; with three it leaves two and
the balanced tree is built anyway. **So do not read "one body" as "one case".
Count the comparisons: an `N`-comparison tree over values you can read off the
immediates is the source's case list, empty arms included.** Here it recovered
`case 0x13:` — a case that generates no code at all — and 0x13 is exactly the
third value the guard `sub_0800164C` accepts, which is the independent
confirmation that the recovered list is right.

**One variable used in two arms of an if/else gets ONE global register; two
variables get two local ones, and the difference is visible.** `sub_0800C124`
computes `y * 2` in both arms. Written as a single local it goes to global
allocation and lands in one callee-saved register for both; the ROM uses
`lsls r2, r5, #1` in the arm with no call after it and `lsls r6, r5, #1` in the
arm that has one — two different registers, one call-clobbered, which a single
pseudo cannot produce because gcc 2.9 does not split live ranges. Splitting the
source into two locals moved the candidate from 89.0% to 90.2% and, as a side
effect, put the `0x417A` pool constant in the right register:

```c
int t;              /* both arms  -> t in r6 throughout, 0x417A in r3 */
int t; int u;       /* one each   -> r2 / r6, 0x417A in r6  == ROM    */
```

**Read a value computed identically in two arms but living in two different
registers — especially when one is call-clobbered and the other is not — as two
separate locals in the source.** Inlining the expression instead of splitting it
does *not* work: it reorders the statement against the neighbouring pointer
arithmetic.

**Byte fields at offset 0x20 and beyond force an address into a register, and
that is not a source feature.** `adds r2, r3, #0; adds r2, #0x20; ldrb r1,[r2]`
reads exactly like `p->unk20` on a plain `u8` field: THUMB `ldrb rD,[rN,#imm5]`
tops out at offset 31, so any byte or halfword field past that needs the base
in a scratch. Same class as the `[r4,#N]`-vs-`[sp,#N]` note in the
straight-line attack order above — do not read it as a bitfield, a union, or a
separate pointer variable.

**Dead-store elimination on a global's byte is NOT adjacency-limited, and the
long live range is the tell.** The instinct (from `flow.c`'s one-element
`last_mem_set`) is that two writes to the same byte collapse only when nothing
reads memory between them. Measured, they collapse across ~30 intervening
statements and dozens of unrelated loads. Controlled probe — same function,
only the placement of the third statement moved:

```c
/* A: three adjacent */                 /* B: two at top, third ~30 stmts later */
gDispIo.disp_ct.mode = 0;               gDispIo.disp_ct.mode = 0;
gDispIo.disp_ct.forced_blank = 0;       gDispIo.disp_ct.forced_blank = 0;
*(u8 *)&gDispIo.disp_ct &= 0x38;        /* ... 30 other statements ... */
                                        *(u8 *)&gDispIo.disp_ct &= 0x38;
```

A emits the load, all three ANDs and the `strb` together at the top. B emits
**one** `strb`, at the later position, with the partially-masked value parked in
a callee-saved register for the whole function and one extra high register
pushed. So: **a masked value carried in a callee-saved register across a long
stretch with a single store at the end means the writes to that byte are
separated in the source, and the store sits at the LAST one.** This is a direct
readout of statement order in the same way the absolute-address chain is, and it
is the single thing that took `sub_08037260` from a wrong prologue and a wrong
register file to byte-exact everywhere except one constant.

**The bitfield AND mask is `mask_rtx` computed in QImode and SIGN-EXTENDED, and
that gives a decisive NEGATIVE test.** One probe over `struct DispCnt`,
`struct WinCnt`, `struct BlendCnt` and `struct BgCnt` fixes the whole table:

```
~0x01 -> -2      ~0x02 -> -3      ~0x04 -> -5      ~0x08 -> -9
~0x10 -> -0x11   ~0x20 -> -0x21   ~0x03 -> -4      ~0x07 -> -8
~0x40 -> -0x41   but  ~0x80 -> 0x7f   and  ~0xC0 -> 0x3f
```

The two positive results are exactly the fields that include **bit 7 of the
containing byte**: `immed_double_const` truncates to 8 bits only when the
complement's bit 7 is clear, and sign-extends otherwise. Hence **the only
positive AND constants a bitfield store can ever produce are 0x7F, 0x3F, 0x1F,
0x0F, 0x07, 0x03 and 0x01.** Anything else positive is not a bitfield write.
`movs r0, #0x38; ands r4, r0` in `sub_08037260` is therefore *not*
`disp_ct.obj_mapping = 0` — that spelling emits `-0x41`, probed both ways — it
is a scalar `*(u8 *)&gDispIo.disp_ct &= 0x38;`. This screen is free and it
replaces several rounds of guessing which field is being cleared.

**agbcc chains a 2-instruction constant off any live constant within +/-255, and
that decides whether combine can narrow it.** `movs #N; neg` costs two
instructions, so CSE rewrites such a constant as `subs rX, #k` off one already
in a register: probed, `-0x21` came out as `subs r0, #0xa0` off the live `0x7f`,
and `-0x41` as `sub r7, r7, #0x30` off the live `-0x11`. A 1-instruction
constant (0..255) is **never** chained, because chaining saves nothing. The
consequence is not cosmetic: a chained constant has a second use, so combine
cannot substitute it into the AND and no `nonzero_bits` narrowing happens to it.
Read backwards: **a mask materialised with a bare `movs` is single-use; one
built with `subs`/`adds` off another constant is not.** This is why the same
source statement emits different constants depending only on what else is live.

**Binding an array element's ADDRESS inside the expression flips the commutative
operand order of the address `add`, and it is worth 3 bytes.**

```c
X = pos[i].x;            /* adds r1, r1, r0  -- index first   */
X = (e = &pos[i])->x;    /* adds r1, r0, r1  -- pointer first */
```

Identical instruction count, different encoding, so the diff shows a bare
register permutation with no size change. With the plain form combine folds the
index shift into the plus, canonicalises complex-operand-first, and then splits
back with the operands swapped; giving the address a second use blocks the
combination and the order expand produced survives. This was the last 3 bytes of
`sub_0804EEFC`. **The separate-statement form `e = &pos[i]; ... = e->x;` does
NOT work** — it makes `e` live across statements and re-allocates the entire
tail (one `try_match` spent proving that). The binding has to be *inside* the
expression. decomp-permuter found the identical fix independently, spelled
`*(new_var = &pos[i])`.

**A global stored the same constant twice with code in between, where the ROM
keeps BOTH stores, is a `volatile` proof on its own.** Non-volatile, CSE knows
the memory already holds the value and deletes the second store outright, so the
candidate comes out short. `sub_08037260` stores 0 into `gUnknown_03002B28` and
`gUnknown_03001FFC`, runs the BLDCNT read-modify-writes, and stores 0 into both
again; all four stores are in the ROM. That is a third and much simpler proof of
the `volatile` on those two than the two already recorded in `hardware.h`
(`sub_08078F00`'s reload and `sub_08012420`'s broken address chain).

**Where a shared constant's register is CREATED is a source feature, and the
lever is whether its initialisation is its own statement.** This is the rule
that closed `sub_08037260`, whose only remaining defect was one surplus
`movs r3, #0`. Five volatile `strh`s store zero — three, then unrelated
read-modify-writes, then two more — and the ROM materialises the constant once
for all five. Three spellings, one probe each, all with identical semantics:

```c
/* 1 */ gUnknown_03002020 = 0;      /* ... */  gUnknown_03002B28 = 0;
/* 2 */ v = 0;  gUnknown_03002020 = v;         gUnknown_03002B28 = v;
/* 3 */ gUnknown_03002020 = v = 0;             gUnknown_03002B28 = v;
```

1. **Two `movs #0`.** With a bare literal in every store, expand creates a fresh
   pseudo per store and CSE unifies them only within a run of *adjacent* stores;
   a group split by unrelated code gets a second one. Note this is the opposite
   of the dead-store rule above — value CSE stops at the interruption where
   store elimination does not.
2. **One `movs #0`, in the wrong place.** The local gives one pseudo for all
   five uses, but `v = 0` is its own statement, so the `mov` is scheduled as a
   free-standing insn *before* the first address `ldr`.
3. **One `movs #0`, between the first `ldr` and its `strh` — the ROM.** Folding
   the initialisation into the first store keeps the pseudo single but attaches
   its definition to that statement.

Read backwards, and this is the useful direction: **a constant register whose
`mov` sits between an address load and the store that uses it, and which is then
reused after intervening code, was initialised inside the first assignment that
used it.** A leading free-standing `mov` means a separate initialising
statement; one `mov` per run means plain literals. Declaring the local at the
top of the function but assigning it at the point of first use is what keeps
earlier unrelated stores of the same constant from being folded into it — a
whole-function `u16 v = 0;` over-unifies and drags eight unrelated `u8` global
stores onto the same register.

**`(A - 1) + x` and `A + (x - 1)` are different code once `x - 1` is already
live, and one expression cannot express the first.** Written in a single
expression, `fold` reassociates and CSE then satisfies it from the existing
pseudo:

```c
off = (*(u16 *)(rows + t) - 1 + x) * 2;   /* adds r0,r0,r4   -- r4 is the live x-1 */
idx = *(u16 *)(rows + t) - 1;             /* subs r0,#1                            */
off = (idx + x) * 2;                      /* adds r0,r0,r4   -- r4 is x            */
```

Identical length, so there is no size signal. Read it backwards: **a `subs #1`
(or `adds #1`) on a loaded value followed by an add of the UNADJUSTED variable,
where the adjusted one is sitting in a register for a nearby call, proves the
source split the statement.** `sub_080081E0` computes `x - 1` into r7 for two
calls and still emits `subs r0, #1; adds r0, r0, r4` with r4 = `x`; that is the
whole tell, and it holds identically for the `+ 1` neighbours.

**A two-dimensional subscript scales each index separately; the flat form scales
once, and with two variable indices the two are distinguishable.**

```c
t[a][b]        /* u16 t[][2]: lsl b,#1 ; lsl a,#2 ; add        */
t[a * 2 + b]   /* u16 t[]   : lsl a,#1 ; add b ; lsl #1  <- ROM */
```

Same size, different bytes, and it also changes which global is loaded first.
This narrows the existing note on `gUnknown_08551D0C`, which records `u16 t[][3]`
and `u16 t[]` indexed `[i*3]` as byte-identical: that holds only because the
index there is a **single** variable, where the row scaling and the element
scaling collapse into one shift. **With two variable indices the row/flat split
stops being free and becomes a claim you can check** — `sub_0804DCA8`'s
`gUnknown_0855239C` turned on exactly this.

**The 0x08068xxx–0x0806Bxxx screen-setup family is the cheapest work in the
band.** Four functions of one shape — take a ticket from `sub_080674F4`, rebuild
the display state, load palette and graphics, start a follow-up proc — matched
on their first `try_match` with zero probes each (`sub_0806A054` 260 B,
`sub_080688E4` 284 B, `sub_08068AC4` 288 B, `sub_0806B708` 288 B; 1120 bytes for
four attempts). The whole body is `hardware.h` macros plus a `.c`-local struct
for the proc pointer, and the two readings that look like traps are not:

- **A missing AND mask does not mean `|=`.** `gUnknown_03001FE8.bits.priority = 3`
  compiles to a bare `orrs #3` because `(x & ~3) | 3` folds. The three siblings
  in the same run (`= 0`, `= 1`, `= 2`) all carry the `movs #4; rsbs` clear. Read
  the group, not the statement.
- **A bitfield store need not carry `mov #N; neg`.** `forced_blank = 0` is a bare
  `movs r0, #0x7f; ands` — the field is the byte's top bit, so its complement
  already fits an 8-bit immediate. The `neg` tell is a sufficient condition, not
  a necessary one.

**The family extends past that address range and the prediction was tested, not
just asserted.** `sub_08080498` (324 B, `code-0806CFC8.s`) was picked off the
candidate list above and matched on its first `try_match` with zero probes, as
did two neighbours of a different shape but the same character —
`sub_080852A8` (264 B, three near-identical guarded emitter calls) and
`sub_080737EC` (276 B, an Interpolate-driven window wipe with a DMA0 block).
Seven functions, 1984 bytes, seven attempts, no probes and no permuter.

**The generalisation is not "screen setup" but "straight-line, call-dense, no
loop".** All seven have `backward_branches == 0` and between 3 and 13 calls, and
in every one the body is *entirely* calls, `hardware.h` macros and constant
stores — there is no arithmetic to get wrong, so the only failure modes are a
wrong argument type and a wrong bitfield name, and both are checkable before
compiling. **`calls` high and `data_refs` high with `backward_branches == 0` is
a better cheap screen for this than size or difficulty**, and `data/functions.json`
already carries all three. `sub_0806C52C` and `sub_0807898C` remain on the list
untried; **`sub_08075F44` was also on it and should not be — the fan-in screen
below flags it as `.LC`-blocked.** Run that screen over any candidate list
before spending an attempt on it; it is one query against `data/functions.json`
and it costs nothing.

One caveat found the hard way on `sub_0807898C` and `sub_0808A47C`: **when a
flush routine writes several bitfields of the SAME byte in statements that are
not adjacent, agbcc merges them into one read-modify-write and sinks the store
past everything in between** — including intervening `volatile` stores, which do
not break it. That produces an interleaving no straightforward statement order
reproduces, and it is what separates the cheap members of this family from the
expensive ones. Count the `strb`s per shadow before drafting: fewer stores than
field groups means a merge, and the source order has to be recovered from which
groups share a store rather than from the instruction order.

### Four more rules from the 256–384 band (wave 13, agent A2)

Four matches, 1340 bytes, one `try_match` each (`sub_0802E4B4` 344,
`sub_0802EB28` 316, `sub_080345C8` 308, `sub_080355CC` 372). Each rule below
was the whole difference between a near-miss and a match, and each has the
controlled probe that isolated it.

**`/ 16` and `>> 4` build the AND with its operands the other way round.** Both
compile to one `asrs` once `nonzero_bits` proves the masked value non-negative,
but they differ in which register the AND's result is tied to — and that is a
byte:

```c
int v = REG_SIOCNT;
g = (v & 0x30) >> 4;   /* mov r0,#0x30 ; and r1,r1,r0 ; asr r0,r1,#4 */
g = (v & 0x30) / 16;   /* mov r0,#0x30 ; and r0,r0,r1 ; asr r0,r0,#4   <- ROM */
g = (v >> 4) & 3;      /* asr r0,r1,#4 ; mov r1,#3 ; and r0,r0,r1  -- wrong shape */
{ int t = v & 0x30; g = t >> 4; }   /* identical to the shift form */
```

`(0x30 & v)`, an intermediate temp, separate locals per switch arm and
reordering the declarations all leave the shift form unchanged; only the
operator flips it. This is the second member of the "the arithmetic *operator*
is the discriminator" class, next to `x * 0x100` vs `x << 8` above — and note it
points the opposite way, so do not generalise either one into "prefer the
multiply".

**`x * 0x1000` keeps a narrow return's sign extension; `x << 12` loses it.**
Same family, and the reason it goes the other way is that the shift form lets
combine see the store's truncation:

```c
p->unk22 = (slot * 9 + 0x29A) | (sub_08035AE8(slot) << 12);
                             /* lsls r0,#12 -- the s16 return's extension is
                              * dropped, because the strh discards it anyway */
p->unk22 = (slot * 9 + 0x29A) | (sub_08035AE8(slot) * 0x1000);
                             /* lsls r0,#0x10 ; asrs r0,#4     <- ROM */
```

Read backwards: **a surviving `lsl #16; asr #k` pair in front of a value that is
only ever stored with `strh` means the source used `*`, not `<<`.**

**`p += idx` and `p[idx]` pick different registers.** Same instruction,
different destination, and nothing in the expression hints at which — both
operands are dead:

```c
p += 0x12; g = p[idx];          /* adds r0, r1, r0 ; ldrb r0, [r0] */
p += 0x12; p += idx; g = *p;    /* adds r1, r1, r0 ; ldrb r0, [r1]   <- ROM */
```

The compound assignment accumulates into the pointer's own register; the
subscript picks the index's. Worth four bytes in `sub_0802E4B4`, twice.

**`-fforce-addr` expands an assignment's LHS before its RHS, so the destination
global's pool word comes first — and splitting the RHS into locals inverts
that.** In `sub_0802E4B4` the cell fetch needs three locals (the `+ 0x12` fold
and the `p + 0x417A` grouping both require them, see the `c_08008B70` family),
but the moment any of them is a statement of its own the store's own
`ldr rN, =sym` stops leading and the whole pool reorders — 45 bytes. The fix is
to name the destination's address instead of the value:

```c
sel = &gUnknown_03003F38;      /* first statement; parks the address in r8 */
...
gUnknown_03003F38 = *p;        /* still a plain store */
... *sel >> 6 ...              /* later reads go through sel */
```

So **the pool-word order is a readout of which addresses were expanded first**,
and at this size it is worth checking before the instructions: a candidate whose
pool is permuted against the ROM's has a statement-order problem, not a
register-allocation one.

**A `case N:` that does nothing still moves the jump table's base.**
`sub_080345C8`'s table has 21 entries starting at case 0, entry 0 pointing at
the default label. Drop the `case 0: break;` and agbcc bases the table at 1 and
adds a `subs r0, #1`, shifting every following pool offset. Two corollaries for
reading a jump table: **the table's length and base tell you the lowest and
highest case labels the source wrote**, including ones whose body is empty; and
GCC lays case *bodies* out in source order, so the ROM's body order is the
source's — `sub_080345C8` has case 19's body between case 14's and case 16's.

Two type tells from the same batch, both call-site-side:

- **A `s8`/`u8` return narrows at the CALL SITE.** `sub_08034F6C`'s two call
  sites in `sub_080345C8` test the result with a bare `cmp r0, #0`; declaring it
  `s8` puts a `lsls r0, #0x18` in front of each. Its own body is byte-identical
  under `s8` and `int` — the `ldrb; lsls #0x18; asrs #0x18` there is the `s8`
  *member* read, not the return conversion — so **the callee cannot settle its
  own return width and the caller can**. `src/decomp/c_08034F6C.c` was retyped
  to `int` on this evidence and still matches.
- **A reload of a word with nothing between the `str` and the `ldr` is
  `volatile`, and one lone read-modify-write can never show it.**
  `gUnknown_03000564` was documented "Not volatile either: no dead load precedes
  any of the stores" on the evidence of `sub_0802EAFC`, which does a single
  `&= ~3`. `sub_0802EB28` does three RMWs back to back and re-`ldr`s after every
  `str`; a plain `u32` folds all three into one load and one store and comes out
  eight bytes short. `c_0802EAFC.c` is unaffected and still matches. **So
  "not volatile" inferred from a single-access function is not a finding, and
  should not be written down as one.**

### `backward_branches` has a blind spot: `blo` and `bhs` (wave 13, agent A2)

`awlib.BRANCH_TARGET_RE` lists `bcs` and `bcc` but not their aliases `bhs` and
`blo`, and `asm/` is objdump output, which emits the alias spellings. **A loop
whose back edge is `blo` or `bhs` is therefore invisible to the index and the
function is reported `backward_branches == 0`.** That is the exact shape of an
unsigned counter compared against an unsigned bound — `cmp r4, r6; blo <top>` —
i.e. `for (i = 0; i < n; i++)` with `i` unsigned.

```python
>>> awlib.BRANCH_TARGET_RE.match('blo _08037926')   # None
>>> awlib.BRANCH_TARGET_RE.match('bhs _080379E8')   # None
>>> awlib.BRANCH_TARGET_RE.match('bls _080364A0')   # matches
```

Measured ROM-wide: of the **3572** functions the index calls
`backward_branches == 0`, **16 actually have a back edge** (0.4%); 13 are still
unmatched, 3960 bytes, and **four are ≥256 bytes** and so land in exactly the
pool a large-straight-line wave selects from:

```
sub_08049360  1480      sub_08074038   396
sub_08047740   480      sub_080378A8   376
```

`sub_080378A8` was handed out as a straight-line target in wave 13 and has two
*nested* loops. The fix is one token — add `bhs|blo` to the alternation in
`tools/awlib.py:232` and re-run `tools/index_functions.py`. Until then, **spend
the ten seconds to confirm the screen yourself** on any target you are told is
straight-line: grep the body for a branch whose target label is numerically
below it, and do not trust `backward_branches` alone. 0.4% is small, but the
cost of the miss is a whole function's worth of work spent under the wrong
method.

### Families survive into the large band, and they are still free

`sub_0804D928` and `sub_0804E3B4` are 280-byte twins differing in exactly two
things: one immediate (`+0x60` vs `+0xc0`) and one pool symbol. The second cost
one `try_match` and zero probes. **So the wave 5–11 family method is not a
small-function method** — if anything the payoff scales with size, because the
per-member cost stays at one substitution while the bytes per member go up.
Diff the siblings' assembly against the representative first, exactly as at
small sizes; here `data/functions.json` flagged them by having identical size,
difficulty, call count and data-ref count, which is a cheap screen worth
running over the rest of the >256 band.

#### Wave 13: the screen run over the >256 band, and what it actually selects

That screen was run, and six pairs came back. The discount is real where the
pair is real, and the screen's failure mode is systematic rather than random.

| pair | bytes each | member 1 | member 2 | what varies |
|---|---|---|---|---|
| `sub_0804C6DC` / `sub_0804CC38` | 332 | 0 probes, 1 attempt | 0 probes, 1 attempt | one immediate, one pool symbol |
| `sub_0804D290` / `sub_0804DCA8` | 600 | 3 probe rounds, 2 permuter runs -> 96.3% | 1 local iteration -> 96.3% | one pool symbol **and the index SHAPE** |
| `sub_080081E0` / `sub_080083E0` | 512 | — | — | **nothing — same source** |
| `sub_0804E8F0` / `sub_0804FE10` | 308 | — | — | **nothing — same source** |
| `sub_08076494` / `sub_0807662C` | 324 | 0 probes, 3 local iterations | 0 probes, **1 substitution, first try** | **five** axes: two argument triples, one OR-mask, one limit, one tail CALL |

**The discount survives into a near-miss, which is the strongest form of the
claim.** `sub_0804DCA8` was produced from `sub_0804D290` by one substitution and
reproduced its residual to the byte — 22 of 600, same instruction, same place.
So a stuck representative does not cost you the sibling's work; it banks it. Fix
one, both land.

**Two of six pairs are not families at all, and it is one cause.**
`sub_080081E0`/`sub_080083E0` differ in exactly one pool symbol across 512
bytes, and `sub_0804E8F0`/`sub_0804FE10` in exactly one across 308 — but in both
cases the two words hold the *same value* (`&gUnknown_08499590` at
0x0808D7F8/0x0808D7FC; `&gUnknown_03001470` at 0x08136090/0x081360C8). They are
`-fforce-addr` `.LC` slots, one per (function, symbol) pair, so **the two
functions have identical source and the "discriminator" is a compiler
artefact.** See the `.rodata` reroute section above for the block dumps.

This is not bad luck: **the size / difficulty / call-count / data-ref screen
selects for duplicated bodies precisely, because a duplicated body matches on
every column.** Expect a share of any such screen's output to be this. The check
costs one Python call — dump the differing pool word out of `baserom.gba`, and
if the two hold the same value you have one function twice.

**What varies between siblings is not predictable in advance, so diff, do not
guess.** The wave brief listed the known axes as symbol, immediate offset, shift
kind (`asrs`/`lsrs`) and the presence of an `& 7` mask. Across these six pairs
the axes that actually varied were: symbol, immediate, *the index expression's
shape* (`t[a ^ b]` against `t[a * 2 + b]` on overlapping memory — see the
array-subscript rule below), and *nothing at all*. Not one pair varied on shift
kind or on a mask. Diffing is reliable; a list of expected differences is not,
and reading the diff through the list is how a real axis gets missed.

### The permuter — measured, and the previous verdict does not hold here

The benchmark note that decomp-permuter underperforms on ARM/GBA was taken on
small functions. It is wrong at this size, and by a wide margin.

Controlled experiment, because a random flail proves nothing: take the real
near-miss that blocked `sub_0804D928` — 276 of 280 bytes, 60.7% byte identity,
permuter base score 360, one missing instruction plus an r4/r5 swap — and run
`tools/permute.py` from it. The correct fix is known (`<< 8` -> `* 0x100`), so
"did it find something" has a ground truth. Three independent runs, 600-second
budget, 4 threads:

| run | iterations to score 0 | wall clock | verdict |
|---|---|---|---|
| 1 | 26 | a few seconds | **byte-exact match** |
| 2 | ~196 | 5 s | **byte-exact match** |
| 3 | 39 | 2 s | **byte-exact match** |

Three for three, every one inside 1% of the budget. And it did **not** find my
fix — it found a different one:

```c
int new_var;
new_var = 8;
oam.tileNum = (gUnknown_0300453C << new_var) + 0x60;
```

Hiding the shift amount in a variable defeats the same constant-folding that
`* 0x100` defeats, and reaches the identical bytes. That is worth noting twice
over: the permuter is not limited to permuting register pressure, and a
permuter win is **not** the original source. Take the bytes, then find the
spelling a human would have written — `* 0x100` is what shipped in the work
file, not `new_var`.

Why it works here and not on the 40-byte accessors: the randomizer's edits are
per-statement, so its search space grows with the statement count while the
number of *wrong* statements stays at one. A 280-byte straight-line function is
close to the best case it has. **Recommendation: on a >256-byte near-miss above
about 50%, run the permuter for 300 s BEFORE the third hand rewrite.** On a
small function the existing advice still stands.

Caveats that cost nothing to respect: it starts from `work/<fn>/best.c`, so get
the score up by hand first; it re-checks with `trymatch`, so a score of 0 that
`trymatch` rejects is a real and expected outcome; and it overwrites
`work/<fn>/<fn>.c` on a win, so back up a curated source before running it on a
function you have already matched.

#### Re-measured in wave 13: 0 for 2, on the cases this section calls its best

The recommendation above ("on a >256-byte near-miss above about 50%, run the
permuter for 300 s") did not survive contact with two more near-misses, and
both were textbook cases for it — size already exact, same instructions, same
order:

| function | bytes | starting point | budget | iterations | outcome |
|---|---|---|---|---|---|
| `sub_08002844` | 288 | 98.6%, size exact, 4 bytes differ | 240 s × 4 | 22,353 | **no improvement at all** |
| `sub_0800E9F4` | 256 | 86.7%, size exact, pure register permutation | 300 s × 4 | 22,709 | 87.1% (**one byte**) |

`sub_0800E9F4` is the case this section describes as close to the randomiser's
best: identical instruction stream with three call-clobbered registers rotated
(`x`/`p`/`rows` = r2/r1/r3 in the ROM, r3/r2/r1 in the candidate). 22,709
iterations moved one byte. `sub_08002844` needed one constant to be
materialised as `movs r0,#6; lsls r3,r0,#0xc` instead of
`movs r3,#0xc0; lsls r3,r3,#0x7` — same length, four bytes apart — and the
search never touched it.

The reason is structural and it bounds the tool: **the randomiser's edits are
statement-level** (bind a subexpression to a temp, unbind one, reorder, change
a temp's type, insert a no-op variable). It has no operator that renames a hard
register and none that rewrites a constant's decomposition, which is exactly
what both of these needed. The wave-12 result that opened this section is not
contradicted — there the fix *was* expressible as a statement edit
(`(g << new_var)`), and the permuter found it in 26 iterations.

**Revised rule: run the permuter when the near-miss is a whole missing or extra
INSTRUCTION — that is a statement-shaped defect and the search space contains
the fix. Do not spend 300 s on a candidate whose size already matches;** a
size-exact near-miss is a register or an encoding, and neither is in the
randomiser's vocabulary. This also restores consistency with the "get the
instruction COUNT right, then look at registers" rule below: the permuter helps
on the first half of that sentence and not the second.

**Independent confirmation from a third and fourth function in the same wave,
and one axis to add.** Three runs on two functions, and the split falls exactly
where the revised rule predicts — every win started from a size MISMATCH, every
failure from a size-exact candidate:

| function | starting point | budget | outcome |
|---|---|---|---|
| `sub_0804D290` | 45.3%, **-8 bytes** | 420 s × 4 | 95.8%, **size exact** — found `do { … } while (0)` round two statements |
| `sub_0804D290` | 95.8%, size exact | 500 s × 4 | 96.2% (**two bytes**) — found `*(new_var = &p[n].unk02)` |
| `sub_0804D290` | 96.3%, size exact | 540 s × 4, 45,057 iters | **no improvement at all** |
| `sub_080081E0` | 46.1%, **+4 bytes** | 420 s × 4 | 65.0%, **size exact** |

The first row is worth reading twice, because it names a lever the prose here
warns against elsewhere: **the winning edit was a `do { … } while (0)` wrapper,
and it worked as a register-allocation lever**, which is the one thing "what
wasted time" already credits it with. Raising loop depth reprioritised the
callee-saved allocation and recovered eight bytes. So list it as an allocation
lever to try, not only as a CSE non-breaker to avoid.

**The axis to add is instruction PLACEMENT.** The 45,057-iteration failure was
not a register permutation and not an encoding: every instruction, register and
constant already matched, and the sole defect was *where* `-fforce-addr`
materialises one symbol (`ldr r6, =gSym` before the shared index rather than at
its own operand's expansion), which also swaps two pool words and shifts every
`[pc, #N]`. No statement-level edit moves an address materialisation, so this
belongs next to registers and constant decomposition on the list of things
outside the search space. **Diagnostic: if the diff is "the same instruction,
somewhere else", stop — that is not a permuter problem.**

**The permuter cannot parse `include/hardware.h` at all**, so any candidate
that includes it dies before it is ever scored:

```
error: the permuter could not score the starting point.
  Syntax error in base.c.
  before: 4 at approximately line 1592, column 31 (after PERM expansion)
  struct __attribute__((aligned(4))) DispCnt
```

pycparser does not accept `__attribute__((aligned(4)))` between `struct` and
the tag. The workaround that works today is to rewrite `work/<fn>/best.c`
without the include — call `ApplyPaletteExt(src, 0x2C0, 0x20)` in place of the
`ApplyPalette(src, 22)` macro, and so on — run the permuter, then restore the
readable spelling and re-verify with `trymatch`. The permanent fixes are a
`fake_libc` shim for `tools/permute.py` or moving the attribute after the tag
in `hardware.h`; neither is a wave-time edit.

### The permuter cannot start from a file that includes `hardware.h` (wave 13, agent A2)

```
error: the permuter could not score the starting point.
  Syntax error in base.c.
  before: 4 at approximately line 1628, column 31 (after PERM expansion)
  struct __attribute__((aligned(4))) DispCnt
```

`pycparser` cannot parse `__attribute__((aligned(4)))` in `struct DispCnt`, so
**every MMIO function in the ROM is currently cut off from the permuter** — it
fails before iteration 1, on the base source, whatever the candidate looks like.
Workaround, measured and it works:

1. replace `#include "hardware.h"` with local `#define REG_x (*(vu16 *)0x040000xx)`
   lines for the registers the function uses — byte-identical expansion, confirm
   with `trymatch.py` before and after;
2. **delete `work/<fn>/best.c` and `best.json`** and re-run `trymatch.py`, or the
   permuter re-reads the old `hardware.h` copy and fails again with the same
   message;
3. permute, then port the winning source change back onto the `hardware.h`
   version.

Worth fixing properly in the permuter's fake headers, because the workaround is
three steps and step 2 is easy to miss.

### Read a losing permuter run for its diff, not its verdict

`sub_0802E4B4`: 344 bytes, hand-written to 85.8% with the size already exact,
one 300 s run — `matched: false`, best 98.8%. The verdict was useless and the
run was decisive, because the edit it found was the insight:

```c
new_var = &gUnknown_03003F38;      /* hoisted above everything */
... gUnknown_08499594[*new_var] ... (*new_var >> 6) ...
```

That is the "LHS is expanded first" rule above, discovered mechanically. Hand-
finishing from there took one more change (`p[idx]` -> `p += idx`) and matched.
So on a large near-miss, budget one permuter run *for information* even when you
expect it to fail — and inspect `work/<fn>/permuter/output-*/source.c`, not just
the score. The corollary is the existing one restated: a permuter win is not the
original source, and neither is a permuter near-miss; both are evidence about
which decision agbcc is making.

### What wasted time

- **Reasoning about CSE and alias-analysis internals instead of probing the
  source axis.** Four probe rounds went on working out *why* one load of a
  global was CSEd and another was not. The answer was a one-token source change
  that a three-variant probe found immediately. At this size the compiler's
  behaviour is not derivable from first principles in less time than it takes to
  measure it — put three spellings of the suspect statement in one file and read
  the answer off. The internals are worth writing down *after* the probe, not
  before.
- **`do { … } while (0)` used as a CSE breaker. It is not one.** Wrapped round a
  statement it does not force that statement's own global read to be reloaded;
  it only raises loop depth and moves register-allocation priority, and it can
  add a stray `mov rN, sp` in the statement *after* it. Two rounds lost. Use it
  for the allocation-priority problem it is documented for and nothing else.
- **Chasing a register permutation while the instruction COUNT was still
  wrong.** `sub_0804D928` had an r4/r5 swap through the whole body and one
  missing instruction; the swap corrected itself the moment the instruction
  appeared. At this size a permutation sitting next to a size difference is
  almost always a symptom of the size difference. Get the count right, then look
  at registers — and note this is the opposite of the small-function instinct,
  where a permutation usually is the whole problem.

### The 384-512 band, measured (wave 13)

One notch past the numbers above, same method, `backward_branches == 0`
throughout. Six functions closed, 2500 bytes.

| | wave 12 (280-368 B) | wave 13 (384-512 B) |
|---|---|---|
| functions closed | 4 | 6 |
| bytes | 1292 | 2500 |
| `try_match` spent on those | 5 | 9 |
| **bytes per attempt** | **258** | **278** |
| probe rounds per closed function | 2.25 | 2.5 |

| function | bytes | probe rounds | `try_match` |
|---|---|---|---|
| `sub_0807D918` | 384 | 1 | 1 |
| `sub_08073B00` | 392 | 2 | 1 |
| `sub_08037260` | 400 | 8 | 2 |
| `sub_080876B4` | 420 | 1 | 1 |
| `sub_08069B90` | 428 | 1 | 1 |
| `sub_0804EEFC` | 476 | 3 + one permuter run | 3 |

Four of the six matched on the first attempt.

**The honest reading is that cost per byte is FLAT across 280-512, not falling.**
278 against 258 is inside the noise of a six-function sample — one function
going the other way moves it further than that. An interim figure of 350 was
circulated mid-wave; it was arithmetic error (attempts undercounted while two
functions were still open) and should not be used. The band boundary at 368 is
not a real discontinuity: 280-368 and 384-512 are the same regime.

That matters because the next band is not. The 768+ band measured 811 bytes per
attempt in the same wave, which is 3x — so the curve is flat and then steps,
rather than rising smoothly with size, and the useful question for a wave plan
is which side of that step a target sits on, not how many bytes it has.

**What did vary inside this band, by a factor of eight, is probe rounds — and it
tracked NEW TYPE VOCABULARY, not byte count.** The four one-attempt matches
needed no new structs at all: `hardware.h`'s shadow unions, `struct
Unk02029A10`, `gUnknown_03004580[][8]` and `PROC_HEADER` already described
everything they touched, so the whole job was reading statement order off the
listing. `sub_08037260` took eight probe rounds and `sub_080524C0` was abandoned
- and `sub_080524C0` is 400 bytes, *smaller* than three of the matches. It is
expensive only because it needs three new ROM tables plus a retype of an
existing struct's filler. **In this band size is free and new types are the
entire cost.** Sort candidates by "how many `data_refs` have no declaration
yet", which is derivable from `data/functions.json` plus
`include/unknown-globals.h` without opening a listing; on a 26-target list it
picked the winners up front.

Corollary for batching: prefer a target whose globals are already declared even
if it is 100 bytes bigger, and prefer targets that share a vocabulary with each
other. `sub_080876B4` cost one probe purely because `sub_08037260` had already
established the display-shadow vocabulary — the family effect described below
applies to *type vocabulary* as much as to twinned bodies.

**But the causal claim above needs correcting, and this is the part that should
change how a wave is picked.** Cost did not track byte count — it tracked **how
much new type vocabulary the function needed**. The four one-attempt matches
needed none: `hardware.h`'s shadow unions, `struct Unk02029A10`,
`gUnknown_03004580[][8]` and `PROC_HEADER` already described everything they
touched, so the whole job was reading statement order off the assembly. The one
target parked as too expensive, `sub_080524C0`, is *smaller* than three of the
matches at 400 bytes and is expensive only because it needs three new ROM tables
plus a retype of an existing struct's filler. **In this band size is free and
new types are the entire cost.** Sort candidates by "how many `data_refs` have
no declaration yet", not by size; that number is derivable from
`data/functions.json` and `include/unknown-globals.h` without opening a
listing, and it would have picked my five winners out of the 26 up front.

Corollary for a batch: prefer a target whose globals are already declared even
if it is 100 bytes bigger, and prefer targets that share a vocabulary with each
other. `sub_080876B4` cost one probe purely because `sub_08037260` had already
established the display-shadow vocabulary an hour earlier — the family effect
described below applies to *type vocabulary* as much as to twinned bodies.

### Is the band tractable with the current method?

Yes, for the straight-line part of it, with no new tooling — that is what these
four demonstrate. Three things would make the rest cheaper, in order of value:

1. **A branch-shape screen in `tools/functions.py`/`families.py`.** The single
   best predictor found here is "no backward branch", and nothing currently
   surfaces it. `data/functions.json` carries size, difficulty, calls and
   data-refs but not loop count, so picking straight-line targets out of the 357
   unmatched functions in the 257–512 band is manual today. Adding
   `backward_branches` and `basic_blocks` to the index is a small change and
   would let a wave sort the whole band by tractability.
2. ~~**The `>512` band is 172 functions and 152KB and is untested.**~~ **Both
   halves of it are measured now — see "The 512–768 byte band" and "The
   768-byte-and-up band" below.** The worry recorded here, that at that size a
   function almost certainly has loops and so falls back under the 150+
   section's rules, **did not materialise in either band**: 249 functions above
   512 bytes have `backward_branches == 0`, and the ones that were reachable at
   all were cheaper per attempt than 280–368, not dearer. What actually gates
   512–768 is `-fforce-addr`, and it gates it hard; what gates 768+ is type
   vocabulary. Neither is a control-flow problem.
3. **Nothing about the C or the compiler blocked me** — no parked diff, no
   unreachable codegen, no flag override needed. The blockers were all "which
   spelling", and the permuter now demonstrably closes that class in seconds at
   this size. If a large function does stall, the honest next step is the
   permuter and not a fourth hand rewrite.

### The 512–768 byte band — measured (wave 13, A6)

Five functions between 536 and 684 bytes, **3,064 bytes for 7 `try_match`
attempts and 9 probe rounds** — 438 bytes per attempt against 258 at 280–368.
Four fell in one or two attempts; `sub_08040CA4` (592 bytes, 8 calls, 6 data
refs) matched off its **first probe** with no near-miss at all.

| function | bytes | probes | attempts |
|---|---|---|---|
| `sub_0800B244` | 684 | 3 | 2 (+ one 300 s permuter run) |
| `sub_0800F564` | 536 | 2 | 2 |
| `sub_0801172C` | 628 | 2 | 1 |
| `sub_08021DD8` | 624 | 1 | 1 |
| `sub_08040CA4` | 592 | 1 | 1 |

**Size is not the cost driver in this band and neither is control flow.** Every
one of these is straight-line, none needed a shape argument, and no failure in
the batch traced to length. Two things are worth carrying forward:

**`backward_branches == 0` still discriminates here.** The 768+ section reports
that it stops discriminating at that size; it had not started to at 512–768.
Every reachable function on a 21-target no-back-edge list was cheap.

**Type vocabulary is NOT the cost driver here either, which is the other half of
the 768+ finding and it does not transfer down.** Across these five matches only
**two** new aggregates were invented, both single-pointer-parameter shapes that
belong in the `.c` rather than the shared header. Everything else reused types
already declared (`struct Unk08499598`, `struct Unk0801C210`) or the raw
`u8 *gUnknown_08499590` screen-descriptor idiom the promoted exemplars
(`c_08001158.c`, `c_080094EC.c`, `c_0800B4F0.c`) already establish. **So the
crossover the 768+ section describes starts above 768, not inside this band.**

#### What gates this band instead: `-fforce-addr`, and it is address-correlated

**Eight of 21 targets were parked for one cause — a `.rodata`
address-constant word — and all eight are in the 0x08002000-0x08017000 map and
screen-state cluster.** See the `-fforce-addr` section above, which this batch
also corrects on the trigger. The practical consequences for picking targets:

- **Screen for it before drafting; it costs one command and it is the single
  highest-value thing to know about a candidate in this band.** A `.LC` word is
  a 4-byte `data/rodata.s` symbol holding a RAM or ROM address, referenced by
  exactly one function, with a neighbour holding the same value. On a 21-target
  list this flagged 9 and every flag held up under probing. Without the screen
  the discovery cost is 6–8 probes per function.
- The decisive confirmation, because it comes with its own control: **four of
  these targets reach `gUnknown_08499590` — a global that `c_08001158.c`
  already reaches with a single pool word — through ROM words at 0x0808D810,
  0x0808D820, 0x0808D834 and 0x0808D858 that all hold `0x08499590`.** Same
  symbol, same source idiom, different pool shape. That is force-addr, not a
  second global.
- **`sub_0801659C` shows both halves in one function**: it reads the array
  through the `.LC` word at 0x0808E538 in its first half and names
  `gUnknown_03001470` directly in its second.

#### Rules found in this band

Each was isolated by a controlled `compile_probe`, and each was the whole
difference between a near-miss and a match.

**`y - 1` written out at every use and `yy = y - 1` bound to a local are
different code, and the inline form is the LONGER one.** Same function, one
change:

```c
yy = y - 1;  f(x, yy, 1); ... f(x, yy, 3) ...  /* subs r6, r7, #1                        */
f(x, y - 1, 1); ... f(x, y - 1, 3) ...         /* subs r4, r7, #1 ; bl ; adds r6, r4, #0 */
```

CSE gives the inline form one temp and then copies it into the variable's
register *after* the intervening call. `sub_0800B244` has three such sites, 6
bytes, and this is the opposite of the usual "bind the subexpression to a local"
instinct — **read a `subs rA, rB, #k` … `bl` … `adds rC, rA, #0` triple as
positive evidence that the source did NOT use a local.**

**`tiles += off`, `*(u16 *)(tiles + off)` and `p + 0xA22 + off` are three
different codegens.**

```c
tile = *(u16 *)(tiles + off);        /* adds r0, r1, r0   -- sum lands in off's register */
tiles = p + 0xA22 + off;             /* reassociates to p + (0xA22 + off)                */
tiles += off; tile = *(u16 *)tiles;  /* add r1, r8 ; adds r1, r1, r0  -- the ROM         */
```

Only the compound assignment leaves the sum in the *pointer's* register. This
was the last 5 bytes of `sub_0800B244`, and 300 s of permuter could not find it
— it is a source fact, not an allocation one.

**`a + b + C1 + C2` folds its constants; `a + (b + C1) + C2` does not.** `fold`
only rewrites `(X + C1) + C2` when operand 1 of the inner `PLUS_EXPR` is an
`INTEGER_CST`. So `t + r + 1 + 0x400` becomes one pool word `0x401`, while
`t + (r + 1) + 0x400` stays `adds r0, r6, #1 ; adds r0, r5, r0 ; add r0, r8`
with the 0x400 CSEd into a register. **A large constant sitting in a register
next to a small `adds #k` tells you the source parenthesised; a single folded
pool word tells you it did not.**

**`fold` merges an adjacent equality pair into an unsigned range test only for
the two operands of ONE `||`.** In a 14-term chain in `sub_0800F564` only the
first pair (`0x142`, `0x143`) becomes `(unsigned)(t - 0x142) <= 1`; left
association makes every later term an OR against a *tree* rather than against a
comparison, so no other adjacent pair merges even though three more exist. Every
remaining constant is then reached by `adds`/`subs` off the previous one. **The
emitted order of such a chain IS the source order, and the one folded pair tells
you which two terms the author wrote first.**

**Duplicated switch bodies: a shared value temp lets cross-jumping merge them, a
per-case call does not.** `sub_0801172C` has four cases assigning the same tile
0x3FD. With `t = 0x3FD; break;` the four bodies are identical RTL and collapse
into one block; with `f(x, y, 0x3FD); return 1;` in each case they survive as
four blocks with four separate pool words, which is what the ROM's jump table
shows. **A jump table with several entries pointing at distinct blocks holding
the same constant is positive evidence against a shared temp.**

**Cross-jumping is partial, and the surviving block order is a readable
fingerprint of the source order.** `sub_08021DD8` writes twelve switch cases in
ascending order, six of which duplicate an earlier argument. The merge folds 22
into 86, 36 into 72 and 37 into 73 but leaves 23 and 87 alone; the ROM's
surviving block order `0, 1, 3, 6, 7, 4, 5, 2, 3` is exactly what that partial
merge leaves from ascending source order. Writing the duplicates as shared case
labels instead gives a different order. **Reconstruct the source order by
simulating the merge, not by reading the blocks off in address order.**

**A global reloaded immediately after its own `str`, with no call and nothing
that can alias in between, is `volatile`.** `gUnknown_030043F0++;` followed by
`switch (gUnknown_030043F0 % 0x70)` gives `ldr; add; str` and nothing more
unless the global is volatile, in which case the ROM's extra `ldr rN, [rM]`
appears. Two bytes each, twice in `sub_08021DD8`.

**`Div(x, y) ? Div(x, y) : 2` really is the divisor spelled twice.**
`sub_08040CA4` calls `Div`, tests the result, and calls it again on the
non-zero path. agbcc cannot CSE the two because `Div` is an ordinary call, so
**the duplicated call is the source and not a codegen artefact** — do not try to
hoist it into a temp.

#### What wasted time

**Eight probes spent discovering the force-addr blocker on one function,**
because the brief asserted straight-line targets would not have one. The screen
above answers it in one command. Measure the pool shape before modelling
anything.

#### The same band from the other end of the address space (wave 13, A7)

**Read the screen first — it is the most reusable thing in this section, and it
is worth more than any individual match in the wave.** Proposed here from
fan-in, refined by A5 with the density test, validated by the orchestrator over
the whole 249-function straight-line set. **Neither half is sufficient alone.**

```
fan-in(sym) == 1  AND  run_density(sym) >= 4
  run_density = count of fan-in-1 gUnknown_08XXXXXX neighbours
                on the 4-byte grid within +/-0x20
```

Controls, reproduced independently: `gUnknown_08555450` (a real table, behind
the already-promoted `c_08057D44.c`) density 0; `gUnknown_084C38BC` (documented
list script) 0; `gUnknown_08580CB4` (documented proc script) 0;
`gUnknown_0816D9E0` (known agbcc pool) **14**. Separation is 0–2 against 9–16,
so the threshold is not delicate. Over the band the screen flags **66 of 249
functions, 34,432 bytes, 28% of band bytes.**

**Failure mode 1 — fan-in alone OVER-flags, and expensively.** Single-use ROM
data is completely normal, and proc scripts are the worst case: wave 8's
fourteen free wrappers each name their own script exactly once. Fan-in with no
density test would have parked the cheapest family in the tree. Adding density
frees **7 functions / 4,308 bytes** back out of the flagged set.

**Failure mode 2 — density alone UNDER-flags.** One of those 7 is
`sub_080085E0`, which was parked on direct probe evidence (one extra `ldr` at
thirteen use sites). Density freed it; it is still blocked.

**So the screen is a prioritisation heuristic and never a verdict.** The
authority is ROM-side relocation behaviour. And **diagnose on the ROM side, not
the candidate side**: a draft carrying more live values than the original can
emit a `.rodata` pool on a function whose ROM is clean. ROM has it → genuine
blocker, park. ROM clean, draft has it → register pressure in your C, fixable,
do not park.

**Precision depends on where the pooled value points, and only one half is
settled.** Restricted to IWRAM/EWRAM values the screen is high-precision and
safe to act on (the 66/249 above). Widening "address-like" to include ROM
values is *necessary* — it is the only way to catch `sub_080831FC` and
`sub_08083484`, whose words hold 0x0861696C and 0x08615C04 — but it takes the
flag rate to **121/249 and 55% of band bytes**, and a genuine low-fan-in
`const u8 *` ROM pointer is not distinguishable from a pool word under that
rule alone. **Treat the ROM-valued half as a suspicion list requiring the
relocation check, not as a rule. Validating it is an open question for wave 14.**

**One case where this screen beat an inference and the inference was wrong.**
`sub_08050FF8` and `sub_08051454` (1,676 bytes together) were handed off as
explicitly *not* the `.LC` class, reasoned from the load shape — one
indirection, `ldr rN,=sym; ldr rM,[rN]`, which is what a real pointer global
does. The screen flags both. Dumping the block settles it:
0x08136050–0x081360EC is **40 consecutive words, every one fan-in 1, every one
an address**, and the values are that family's globals repeating —
0x03001FBC, 0x0300453C, 0x03004580, 0x03001470, 0x02029A10. That is one TU's
pool, not forty pointer globals. This is the "**address adjacency is not
evidence of what a ROM blob is — type it from a discriminating use**" hazard in
its exact predicted form: the load shape is identical either way, and the
discriminating evidence is the experiment (naming `gUnknown_02029668` directly
took `sub_0804CEF8` from 98.3% to zero bytes differing), not the disassembly.

A6's batch ran 0x08000000–0x08040000; this one ran 0x0804CEF8–0x0808B710, on a
21-target no-back-edge list. **Five matches, 2,872 bytes, five `try_match`
calls, every one first-try** — 574 bytes per attempt against A6's 438 and wave
12's 258 at 280–368. Three of the five (`sub_08057464` 624 B, `sub_0806E240`
636 B, `sub_08085410` 552 B) matched off the **first draft with no iteration at
all**. `sub_0808B710` is the ROM's `sinf`.

| function | bytes | probe rounds | attempts |
|---|---|---|---|
| `sub_0808B710` | 524 | 2 | 1 |
| `sub_08085410` | 552 | 1 | 1 |
| `sub_08057464` | 624 | 1 | 1 |
| `sub_0806E240` | 636 | 1 | 1 |
| `sub_08068BE4` | 636 | 2 | 1 |

**Two independent halves of the band agree on all three headline claims**, which
is worth more than either measurement alone: size is not the cost driver,
`backward_branches == 0` still discriminates here (it had not yet stopped, as it
does above 768), and `-fforce-addr` is what actually gates the band — A6 parked
8–9 of 21, this batch parked **10 of 21**, in a completely disjoint address
range. Both batches converged on the screen at the top of this subsection from
different directions — A6 keys on "a neighbour holding the same value", this
batch on fan-in — and those two turn out to be the density test and the fan-in
test that the validated form needs together.

Fan-in is what separates a `.LC` word from a real pointer global and it is not
close: `gUnknown_08136068` has fan-in 1, while `gUnknown_0849957C`,
`gUnknown_08499598` and `gUnknown_084C3F78` — all genuine pointer globals in the
same batch, all dereferenced the same way — have 39, 217 and 20. **Blockage
clusters by address because the pool is per-unit**: `sub_0804E584` through
`sub_0804F658` are consecutive family members and every one of them is parked.

**Keep the predicate's wording as "a value that looks like an address" and do
NOT narrow it to "an IWRAM/EWRAM value".** The pooled symbol is often itself in
ROM, and then the pool word holds a ROM address, which a RAM-only filter throws
away. Worked case: `sub_08022618` (400 bytes, `backward_branches == 0`)
references `gUnknown_080909A8` and `gUnknown_080909AC`, both fan-in 1, holding
0x08499580 and 0x085D5ABC — ROM addresses, and both are already declared globals
(`gUnknown_08499580`, `gUnknown_085D5ABC`). Dumping the neighbourhood settles it:

```
0x0809099C -> 0x08499590      0x080909A8 -> 0x08499580
0x080909A0 -> 0x08499594      0x080909AC -> 0x085D5ABC
0x080909A4 -> 0x08499590      0x080909B0 -> 0x08499590
                              0x080909B4 -> 0x08499590
```

Seven consecutive fan-in-1 symbols holding address words, with
`&gUnknown_08499590` appearing four times, bracketed by ordinary data
(0x00060005 above, 0x000AFFE6 below). Both entries score **density 8** on the
fan-in + run-density screen, comfortably over its threshold of 4, so the RAM-only
wording is the only thing that would have missed this one.

Two controls measured at the same time, both behaving: `gUnknown_08555450` — a
genuine global, behind the already-promoted `c_08057D44.c` — is fan-in 1 but
density **1**; `gUnknown_086144C0`, an ordinary OAM sprite blob, is fan-in 3 and
density **1**. Fan-in alone would have flagged the first of those wrongly, which
is the documented over-flagging failure mode.

**So the two halves are complementary and neither is the verdict.** Fan-in plus
run-density is one query over `data/functions.json` and needs no ROM read; the
neighbourhood dump costs one Python call and is what actually shows you the
duplication. The authority is still the relocation signature (`R_ARM_ABS32
.rodata` with addends 0, 4, 8 …), read **ROM-side**: a draft carrying more live
values than the original can grow a pool the ROM does not have.

**One refinement to the type-vocabulary half.** A6 reports type vocabulary is
not the driver at 512–768, and that holds here, but the metric needs sharpening
before wave 14 sorts on it: the predictor is **new AGGREGATE types, not new
symbols.** `sub_08057464` needed twenty-four previously undeclared symbols and
matched off the first draft, because every one was a scalar or a flat array; the
two hardest near-misses in the batch (`sub_0804FA2C`, `sub_080867BC`) needed
three and four new struct layouts each. Sort by "distinct new struct layouts
required", which is ~0 for register-flush and call-sequence functions at any
size.

**Where this batch disagrees with the section above it: the high-register
prologue.** "Do not expect a high-register prologue … read it as 'there is a
loop', never as 'this function is big'" is wrong at this size. `sub_0804CEF8`
(516 bytes, `backward_branches == 0`) opens `mov r7, sl; mov r6, sb;
mov r5, r8; push {r5, r6, r7}`, and **seven of the ten straight-line functions
opened in this batch buy at least one high register**. The stated mechanism is
right — high registers are bought by simultaneously-live values — but the
inference is not: above roughly 500 bytes a long call sequence has enough
addresses and constants live across calls to exhaust r4–r7 with no loop
anywhere. Read a high-register prologue as "many values live across calls".

**The revised permuter rule holds up, from the failure side.** Two near-misses
here were size-exact with the same instructions in the same order —
`sub_0806EB5C` at 93.0% (a single r4/r5 swap of the proc parameter, 20 source
spellings tried, every one exactly 93.0%) and `sub_0806BB08` at 94.2% (one CSE
decision on the constant `0`). Both are precisely the "size already matches, so
it is a register" case the revised rule says not to spend 300 s on, and neither
was attempted with the permuter on that advice. `sub_080867BC` is the
complementary case: **−4 bytes**, because agbcc cross-jumps two `strh r0, [r4]`
tails that the ROM keeps separate — a size mismatch, and therefore the one of
the three worth a permuter run.

#### Two more rules from this band

**A constant array index folds into the symbol's address; a struct member or a
row pointer bound to a local keeps it as a load displacement.** Worth 4 bytes,
and it is how you tell a ROM table of structs from a 2-D array:

```c
extern u16 tbl[][12];
u16 f1(int k) { return tbl[k][9]; }              /* ldr rB; add rB,#0x12; add; ldrh [rB]  -- 6 insns */
u16 f6(int k) { u16 *p = tbl[k]; return p[9]; }  /* ldr rB; add; ldrh [rB, #0x12]         -- 5 insns */
u16 g1(int k) { return st[k].unk12; }            /* identical to f6                                 */
```

`*(tbl[k] + 9)`, `(&tbl[k][0])[9]`, `((u16 *)tbl)[k * 12 + 9]` and a `(u8 *)`
cast **all** behave like `f1` — they bake the offset into the pool word's
addend. Only a real `COMPONENT_REF` or a bound row pointer produces the
displacement. **Read `ldrh rD, [rB, #k]` after a base-plus-index add as positive
evidence for a struct table**, and `add rB, #k` before the index as evidence
against one.

**A read-modify-write that sets two bit groups of a `union …Buf` goes through a
`u16` local, not one nested expression.** One `ldrh` and one `strh` around two
`&`/`|` pairs is not reachable by writing `.raw` twice — that gives two of each
— and it is not reachable by nesting either:

```c
gUnknown_030030E0.raw = (((gUnknown_030030E0.raw & 0xFFE0) | 2) & 0xE0FF) | 0x800;  /* 72.6% */

v = (gUnknown_030030E0.raw & 0xFFE0) | 2;   /* u16 v -- the ROM */
v = (v & 0xE0FF) | 0x800;
gUnknown_030030E0.raw = v;                                                          /* 93.0% */
```

**Twenty percentage points on `sub_0806EB5C` for that one change.** The temp
must be `u16`: `int` or `u32` costs 4 bytes by adding the re-narrowing. This is
the counterpart to the "`ldrh` with a pool mask means `.raw`" note on
`gUnknown_030030E0` in `hardware.h` — that note tells you which union member,
this one tells you the statement shape.

**One thing that is a register-pressure readout and not a source feature**, so
that nobody else spends a round on it: `-fforce-addr` hoists a store's
destination address *before* the call in low-pressure code, always, and
`volatile` on the destination changes nothing —
`void t(void) { gv = f(); }` gives `ldr r4, pool; bl f; strh r0, [r4]`. So the
ROM's `bl f; ldr r1, pool; strh r0, [r1]` shape does not mean the source did
anything different; it means no callee-saved register was free and reload
rematerialised the constant after the call. Chase the pressure, not the source.

### The 768-byte-and-up band — measured (wave 13)

The `>512` band was listed above as "172 functions and 152KB and untested". It
is tested now. Six functions between 776 and 856 bytes were matched in **six
`try_match` attempts, one each**:

| function | bytes | probe rounds | `try_match` |
|---|---|---|---|
| `sub_0801258C` | 824 | 3 | 1 |
| `sub_08053860` | 856 | 1 | 1 |
| `sub_08053BB8` | 852 | 0 (twin) | 1 |
| `sub_08065990` | 780 | 1 | 1 |
| `sub_0806D944` | 780 | 0 (twin) | 1 |
| `sub_080012DC` | 776 | 1 | 1 |

4868 bytes for six attempts — **811 bytes per attempt against the 280–368 band's
258**, so the trend the section above reports does not merely continue, it
steepens. The worry in point 2 above ("at that size a function almost certainly
has loops") did not materialise: 249 functions in the ROM have no back edge and
the giants are well represented among them.

**Correction to the difficulty model.** "No backward branch" remains necessary
but it stopped discriminating in this band — every function tried, matched and
parked alike, had `backward_branches == 0`. What actually separated them was
**how many new aggregate types the function forces you to invent**:

| new types needed | outcome |
|---|---|
| 0–2 | one attempt, every time |
| ~8 (`sub_08050FF8`/`sub_08051454`) | parked on cost, not on codegen |

`sub_0801258C` is the clean demonstration: 88 data refs, 43 statements, and one
attempt, because every symbol was a scalar. Data-ref count is close to
worthless as a difficulty proxy at this size; **"referenced symbols that have no
declaration yet" is the number to sort by.**

**The address-arithmetic readout can legitimately come back empty, and that is
a result.** The step is described above as "the one thing at this size that a
draft cannot recover from getting wrong", which is true when the addresses are
raw constants — `sub_08012420`'s MMIO block. When every address is a distinct
*relocation*, as in `sub_0801258C`'s 88, agbcc cannot chain any of them and
there is nothing to read. Do not go looking for a chain that cannot exist:
a null readout means the emitted store order simply *is* the source order.

#### Jump tables match, and they are a readout of source order

agbcc emits `casesi` tables inline in `.text` as `.word` entries behind a
one-word pointer, and they assemble byte-for-byte. `sub_080012DC` is 776 bytes
of which most is a 137-entry table; it matched on the first attempt with no
rewriting. Two `.align 2, 0` directives appear between the table pointer and the
table and emit nothing.

**Case bodies are laid out in SOURCE order, not in case-value order**, so the
block order is direct evidence about the original. `sub_080012DC`'s 26 live
cases come out 6, 38, 70, 102, 134, 8, 40, 72, 104, 136, 10, … — five runs of
five keys 32 apart whose results also step by 5, which recovers the source's
grouping and the `key = something * 32 + kind` structure behind it. Read the
block order before writing anything; putting the cases in numeric order would
have missed by hundreds of bytes.

Two further readouts from the same function: `movs r2, #0` *ahead of* the range
check plus every arm falling into one shared `adds r0, r2, #0; bx lr` means a
local (`int r = 0; switch … return r;`) and not `return` in each arm; and a
`movs rN, #0xe1; lsls rN, #1` pair next to a pool word for a neighbouring
constant is just how agbcc builds an even constant above 255 — nothing in the
source distinguishes them.

#### A run of bitfield writes into one container byte is ONE read-modify-write

Eleven consecutive `.bits` assignments in `sub_08065990` compile to exactly two
`ldrb`/`strb` pairs, one per container byte: agbcc forwards each store into the
next statement's load and dead-store elimination removes the intermediates. The
AND masks are then CSE-chained, so `~4`, `~8`, `~0x10` come out as
`movs r1, #5; rsbs r1, r1, #0` then `subs r1, #4` then `subs r1, #8`. Read the
fields back off the masks in the order they apply; the arithmetic between the
constants is not in the source.

#### Two new `volatile` tells, both cheap and both proved by probe

**1. `volatile` on the LOW operand of `lo | (hi << 16)` flips which register the
`orr` accumulates into, and costs no bytes.** This makes it a free type
discriminator wherever two narrow globals are packed into a word:

```c
extern u16 gP1, gP2; extern volatile u16 gV1, gV2; extern u32 gDst;
void o_pp(void){ gDst = gP1 | (gP2 << 16); }  /* ldrh r1; ldrh r0; lsl; orr r1,r1,r0 */
void o_vp(void){ gDst = gV1 | (gP2 << 16); }  /* ldrh r1; ldrh r0; lsl; orr r0,r0,r1 */
void o_pv(void){ gDst = gP1 | (gV2 << 16); }  /* == o_pp: HI volatility is invisible */
```

Same mechanism as the `REG_DISPSTAT_LO` note in `hardware.h` — combine cannot
fold a volatile MEM into the `ior`, so commutative canonicalisation picks the
other operand as the destination. Cheaper causes ruled out in the same probe:
`(gP2 << 16) | gP1` and `(gP2 * 0x10000) | gP1` both reorder the two `ldrh`s
(so they are visible for free), `(u32)` casts and extra parens change nothing,
and `+` gives `add`. This is what proved `gUnknown_03001FF8` and
`gUnknown_03002B34` volatile in `sub_0801258C`.

**2. `volatile` on a `u16` widened to `u64` costs 2 bytes PER TERM, and buys a
high-register prologue.** The section above says a straight-line function of any
length needs about three registers and that `mov r7, sb` means a loop. That is
right about the cause but the cause is not only loops — a wide enough
*expression* does it too:

```c
void d_pppp(void){ gD64 = (u64)gP1 | ((u64)gP2<<16) | ((u64)gP1<<32) | ((u64)gP2<<48); }
   /* ldrh r2, [r0] ; mov r3, #0                     -- load folded into the DI lowpart */
void d_vvvv(void){ gD64 = (u64)gV1 | ((u64)gV2<<16) | ((u64)gV1<<32) | ((u64)gV2<<48); }
   /* ldrh r4, [r0] ; add r0, r4, #0 ; mov r1, #0    -- volatile MEM cannot be folded */
```

Four terms, four surviving copies, and the extra pressure spills a fifth address
into `r8` — which is the whole reason `sub_0801258C` has a three-high-register
prologue with no loop anywhere in it. Byte-identical and therefore useless as
discriminators: `(u64)x`, `(s64)x`, `(u64)(u32)x`, and leaving the first term
uncast. Only volatility moves it.

#### A word `ldr` on a two-byte shadow is a union tell

`sub_08065990` reads `gUnknown_0300251C` with `ldr` plus `lsls #0x1c; lsrs #0x1e`
— the `chr_block` bitfield — three instructions before doing the identical thing
to `gUnknown_030030B4`, which was already `union BgCntBuf`. Consistent with the
container note in `hardware.h` ("`ldr` plus a shift pair for every pure read,
whatever the container"), and it settled the fourth BG-control shadow, which had
been a bare `u16` for twelve waves. The three promoted scalar writers keep their
bytes by spelling it `*(u16 *)&gUnknown_0300251C`, which is what those same
files already did for the other three shadows on the lines above.

#### CORRECTION: `-fforce-addr` is triggered by live range, not by loops

The `-fforce-addr` section and the "one structural blocker" note in the wave
brief both say the reroute fires when a symbol's address must live **across a
loop**. That is too narrow and it sends you looking for the wrong screen.
`sub_080085E0` has **zero backward branches** and hits it squarely; so do
`sub_0800F8D4` and `sub_0800CFDC`. Nineteen consecutive calls keep an address
live just as effectively as a loop does. In a controlled probe the *same source*
compiled with one call did **not** fire the reroute and the full function did.
**Read the trigger as "long live range", and expect the blocker anywhere in
`code.s`'s 0x0800xxxx band regardless of control flow.**

Corroborated independently and from the opposite direction in the same wave:
`sub_0805DB70` also has `backward_branches == 0` and also carries a `.rodata`
pool word (`gUnknown_0816DA4C`, holding `0x030033EC`). Two derivations, two
different functions, one conclusion. Of the two the probe above is the stronger
evidence because it isolates the variable — same source, one call versus
nineteen — while `sub_0805DB70` is an existence proof; but a claim that
overturns a standing rule is worth having twice.

#### CORRECTION: the `T **` workaround is a one-level offset, not a fix

The `gUnknown_0808D6DC` note records that the `**const` workaround "adds one
`ldr` at the entry and one in case 60". The general form is sharper, and which
way it errs is decided entirely by the qualifier:

```
direct  `T *g`         ldr r6,=g ; ldr r3,[r6]        …  ldr r0,[r6]                  -- 1 deref/use
const   `T **const g`  ldr r0,=g ; ldr r6,[r0] ; …    …  ldr r0,[r6]                  -- 1 deref/use (outer hoisted)
ROM                                                   …  ldr r0,[r4] ; ldr r0,[r0]    -- 2 derefs/use
plain   `T **g`                                       …  ldr r0,[r5] ; ldr r0,[r0] ; ldr r0,[r0]  -- 3 derefs/use
```

`const` lets agbcc hoist the outer read and you come out one `ldr` short per use
site; drop the `const` to stop the hoist and force-addr fires on the workaround
symbol in turn and you come out one `ldr` long. Nothing brackets the ROM.
**Do not spend an attempt cycling the qualifier — if the direct spelling is one
level short, the function is parked.**

**Two different failures share this trigger, and only one of them is
closable — do not conflate them.** A candidate's own `.rodata` is fully
symbolic through `.rel.rodata`, so its value can be resolved and compared
against `baserom.gba`; that makes a pool word whose *relocation names a
different symbol for the same address* decidable per-function, and it is what
unparks the 0x0805CA60 group sitting at 99.5% with only the addend differing.
It does **not** reach `sub_080085E0`, which is one `ldr` longer at each of
thirteen use sites — a genuine SIZE difference, not a naming one. Same trigger,
different failure. Before assuming a force-addr park is now closable, check
which of the two you have: identical byte count means look at the relocation,
a byte-count difference means the level of indirection is wrong and no
relocation machinery will help.

### REFUTED: "new aggregate types predict cost" does not discriminate (wave 14, C)

Wave 13's headline finding — three agents converging on *new aggregate types,
not size and not new symbols, predict cost* — was handed to wave 14 as the basis
for target selection, with the instruction to "sort by distinct new struct
layouts". It was tested with a batch designed to be a controlled experiment for
it: four map/tile functions of 412–436 bytes, all `backward_branches == 0`, all
in `code.s`, all reaching the same global family. **The prediction that they
would need one new layout between them rather than four was correct. The claim
that this predicts cost is not — it is true and vacuous.**

| | bytes | callees | new layouts | iterations | outcome |
|---|---|---|---|---|---|
| `sub_0800AA30` | 416 | 1 | **0** | 7 | matched |
| `sub_0800A3D4` | 436 | 6 | **0** | 3 + one 4-way sweep | matched |
| `sub_0800BF78` | 428 | 8 | **0** | 3 | matched |
| `sub_0800977C` | 412 | 2 | **0** | 14 + a 300 s permuter run | **parked** |

All four needed **zero** new struct layouts and zero new aggregates of any kind:
the whole batch is the `u8 *gUnknown_08499590` screen-descriptor idiom that
`c_08001158.c` and `c_08008B70.c` already establish (`u16` width at +0, `u16`
height at +2, `u16` tiles at +0xA22, `u8` terrain at +0x1432, `u16` rowOffset[]
at +0x417A), plus one `unk20` that `struct Unk0200B0B0` already had. Thirteen
new *symbols* were declared — four pool words and nine prototypes — every one a
scalar or a pointer. On the wave-13 metric all four score identically, and their
costs range from three iterations to not closable.

**The half that survives is the negative half, and it is worth keeping:** cost
did not track byte count (the cheapest and the parked one are the two smallest,
and the largest was the second cheapest) and did not track callee count (the
8-callee function was the cheapest of the four, the 2-callee one is parked).
Both of those are real and both are the opposite of the intuitive ordering.

**The acceptance test passed on its own terms and the conclusion still does not
follow.** Functions 2 and 3 each cost materially fewer iterations than function
1 (3 against 7) at the same size, exactly as predicted. But the discount was not
"no new layouts" — it was the **family effect**: function 1 spent four of its
seven iterations working out the `.LC` read-site vocabulary above, and functions
2 and 3 inherited it and were then read straight off the ROM's `ldr` counts.
That is the wave-13 "prefer targets that share a vocabulary with each other"
corollary, and it is doing all the work the layout metric was being credited
with.

**What actually discriminated, on this batch: the number of distinct CSE regions
around the `.LC` word** — i.e. how many *different* read-site spellings the
function needs, which is one query against the listing and is visible before
drafting. `sub_0800A3D4` needs one (`**pp` everywhere); `sub_0800BF78` needs
three but they are individually readable; `sub_0800977C` needs a shape no source
spelling produces, and is parked at 412 of 412 bytes for it. **Sort by that, not
by struct layouts** — and note it only matters at all for functions the `.LC`
screen flags, which is where this batch lived and is a large fraction of
`code.s`.

> **Wave 15 (C) CONFIRMS the replacement metric, on a batch that was selected
> to be a control for it and turned out to be a much sharper test than either
> wave intended.** See "The `.LC` count is the whole cost curve" below: four
> functions, `.LC` word counts 0/1/2/2, outcomes matched / +8 / −8 / −28, in
> that order. Nothing else in the batch ordered that way. Read the paragraph
> above as established rather than as a one-batch proposal.

**One selection-level warning this batch is evidence for.** The batch was chosen
because its four members "share a global family" — `gUnknown_0808D854`,
`gUnknown_0808D83C`, `gUnknown_0808D86C`, `gUnknown_0808D81C`, all
pointer-to-pointer and all dereferenced twice. They are not globals: they are
four slots of the same `-fforce-addr` pool block, all holding `0x08499590`, and
the screen at the top of this chapter flags every one of them. Under the
standing wave-13 reading that made the whole batch an automatic park. It was
right to attack them anyway — three of four closed — but the reason is A2's
`c_local`, not anything about the family, and a batch selected on "shared
globals" from `data/functions.json` will keep selecting pool slots, because
`asm/` symbolises them exactly like globals. **Resolve `data_refs` in the
0x0808C000–0x08091000 range against the ROM before calling two functions
related.**

### The `.LC` count is the whole cost curve, measured (wave 15, C)

Wave 14 proposed "the number of distinct `.LC` read-site spellings" as the
replacement for the refuted layout metric and flagged it as thin — one batch,
four functions that all scored the same. Wave 15's C batch was handed over as a
control for it, on the stated premise that **none of its four functions goes
through a `.LC` pool word, so the metric scores all four at zero**. That premise
is false: three of the four do, and one of them (`sub_08022618`) is already a
worked example in the `-fforce-addr` chapter of this file, with its pool block
dumped and its density computed. Ten seconds of `data_refs` against the
0x0808C000-0x08091000 screen would have caught it before the batch was written.

Because the premise was wrong the batch is not a control, it is the sharpest
test the metric has had — the four functions span 0, 1, 2 and 2 pool words while
holding everything else fixed, and the cost is monotone in that number and in
nothing else:

| | bytes | `.LC` words | distinct `.LC` spellings | new symbols | new layouts | rounds | outcome |
|---|---|---|---|---|---|---|---|
| `sub_08024ABC` | 412 | **0** | 0 | 3 protos | 0 shared, 2 local | 3 + permuter | **matched** |
| `sub_08058A2C` | 392 | **1** | 1 | 1 global, 2 protos | 0 | 6 + permuter | parked, **+8** |
| `sub_08022618` | 400 | **2** | 2 | 2 globals, 2 protos | 0 | 5 | parked, **−8** |
| `sub_08042998` | 472 | **2** | **3** | 3 globals, 4 protos | 0 | 4 | parked, **−28** |
| F059 x3 | 124 ea | **0** | 0 | 1 global, 2 protos | 0 | **1, no probe** | **all matched** |

Every other candidate ordering is wrong on this batch, and two of them are
exactly backwards: byte count (the biggest is the worst but the smallest is the
second worst), new symbols (the only match declared the fewest globals — none —
and is also the only one that needed a new aggregate), callee count, and
`difficulty` from the index (35.7 / 46.7 / 32.1 / 35.5 against the outcome
order). **Sort a large-band target list by `.LC` word count, and treat a
function needing three different spellings of one word as a different class from
one needing one.**

The negative half of the wave-13/14 findings survives untouched and is now three
batches deep: cost tracks neither size nor callee count.

The screen that produces this column is the fan-in + run-density one already in
this file, and on this batch it separates cleanly with nothing in between —
`(symbol, value, fan-in, density)` for every `gUnknown_08xxxxxx` data ref:

```
sub_08024ABC  08499594 0x2022684 167 0 | 08499598 0x2023284 217 0 | 085D5ABC 0x8d208bd 100 0
sub_08058A2C  0816D948 0x30013b0   1 13 | 08499590 ... 327 0 | 085D5ABC ... 100 0
sub_08022618  080909A8 0x8499580   1  8 | 080909AC 0x85d5abc 1 8 | 08499590 ... 327 0 | ...
sub_08042998  08091364 0x30040d8   1 17 | 08091368 0x85d5abc 1 17 | 08499590 ... 327 0 | ...
```

Fan-in is 1 or 100+ with nothing between, and density is 8-17 or 0 with nothing
between. **One query over `data/functions.json` plus a ROM read orders the whole
batch by outcome before a line of C is written**, and it is what should be run
against a candidate list rather than after the fact.

Family F059 (`sub_080055B8`, `sub_08005634`, `sub_080056B0`, 124 bytes each) was
taken from the same wave as the spare item and is the control the batch lacked:
zero flagged refs, and all three matched on the **first** `try_match` with no
probe round at all, 372 bytes for three attempts. Its whole content is one
`if`/`else` where both arms call the same two functions with the same six
arguments — the ROM keeps both copies because the `0` bound for `[sp, #4]` is
CSEd with the then-arm's two `strh` zeroes and so lands in `r4` there and `r1`
in the else-arm, which is enough to defeat cross-jumping.

#### The family effect is "the vocabulary is already written down", and it is small

Wave 14's stronger claim was that function 1 pays for the shared vocabulary and
functions 2 and 3 inherit it. This batch is the clean version of that
experiment, because the vocabulary — the `u8 *gUnknown_08499590` screen
descriptor, `struct Unk08499594`, `struct Unk085D5ABC`, `struct Unk08499598` —
was **already in `include/unknown-globals.h` before the batch started**, some of
it derived from `sub_08042998` itself in an earlier wave.

**The first function attempted was the cheapest, not the dearest, and it is the
only one that matched.** So the wave-14 discount is not a first-mover cost that
someone has to pay; it is the absence of a cost when the types are already
recorded. Concretely, the whole type-vocabulary bill for four functions and
1,676 bytes was about fifteen minutes of header edits: **zero new struct
layouts**, six fields split out of existing `filler_` runs (`Unk08499594`
unk02/unk03/unk07/unk08, `Unk085D5ABC` unk0b, `Unk03003FC0` unk0d), and five new
globals, every one of them a pool word rather than a real global. None of that
predicted or explained a single one of the three near-misses.

**The actionable form of the claim: prefer targets whose types are already in
the header, and expect that to buy setup time, not iterations.** It is not a
reason to batch by shared globals — and `data/functions.json`'s `data_refs`
cannot tell a shared global from a shared pool word, which is how this batch
came to be described as `.LC`-free in the first place.

### Two uses of a `pp = &<pool word>` local is not enough to keep it live

A boundary on wave-13 A2's `c_local` that no wave has recorded, and it is worth
2–6 bytes every time it bites. `&gUnknown_0816D948` is an address constant, so
CSE will **const-propagate it into its uses** and the pool word gets emitted
again at each one; the `mov sl, r1` that the ROM uses to carry it never appears.
Measured on two functions in one batch, same idiom, same header shape:

- `sub_08022618` — `pp` read at **four** sites: kept in `sl`, one pool word,
  exactly as the ROM has it, first try.
- `sub_08058A2C` — `pp` read at **two** sites: const-propagated, two pool words,
  no `mov sl`. Five spellings were tried and none moved it — `pp` assigned
  before vs after the first read, `**pp` at both sites vs a by-name read plus
  `pp = &gLC`, a third artificial use, and naming the word twice with no `pp` at
  all. A 300 s permuter run did not move it either.

So the wave-14 read-site vocabulary is right about *which* spelling each site
wants and silent about whether the local survives at all. **Count the sites
before choosing the target**: one or two `.LC` reads is a worse prospect than
four, which is the opposite of the intuitive ordering and the opposite of what
the `.LC`-count metric above says about the *number of words*. The two are not
in conflict — more words is worse, more reads of one word is better.

### `u16 v` and `int v` with an explicit `(u16)` cast are DIFFERENT CODE

Worth 16 of `sub_08022618`'s 24 missing bytes, and the largest source-level lever
found in this batch.

A `u16` local is a PROMOTE_MODE'd SImode pseudo, so reading it as an `int` costs
nothing and combine is then free to fold the definition's arithmetic into the
use's. An `int` local with an explicit `(u16)` cast at the use expands to a real
`lsl #16; lsr #16` pair, and combine leaves it alone:

```c
u16 ax;  ax = ((x - cx) & 0xF) * 2;   tile = base + ax;
                    /* lsls rN, rCELL, #2   -- one shift, the *2 and the
                     * pointer scaling folded together, and the definition
                     * CSEd at its PRE-shift value                     */
int ax;  ax = ((x - cx) & 0xF) * 2;   tile = base + (u16)ax;
                    /* lsls rN, rAX, #0x10  (once, CSEd across the uses)
                     * lsrs rM, rN, #0xf    (at every use) -- the ROM   */
```

Read backwards: **`lsls #0x10` on a value that is provably 16-bit clean, with the
matching `lsr` at the use rather than beside it, is positive evidence for an
`int` local plus a cast and against a `u16` local.**

**A straight-line probe cannot tell the two apart — both fold there.** Four
spellings were probed in one call (`u16` local, `int` + cast, two-assignment,
byte-pointer cast) and all four collapsed to the same two shifts; the difference
only appears once the uses sit behind branches, because folding the definition
into a use is a per-basic-block combine substitution. This is the first case in
this file where a probe reproduced the *wrong* answer confidently, so: **when the
question is about a narrowing, the probe has to carry the target's control flow,
not just its expression.**

Two things ruled out on the same question, both cheap and both negative:

- **`old_agbcc` is not the axis.** All three of this batch's near-misses compile
  to byte-identical *sizes* under `old_agbcc` with `-fprologue-bugfix` removed
  (444, 392, 400). Test it without touching `data/compiler-overrides.json` by
  monkeypatching `agbenv._OVERRIDES` from a throwaway script — that file is read
  by every concurrent agent and a stray entry left in it is worse than the
  answer is worth.
- **A dead parameter overwritten on entry does not defeat `nonzero_bits`.** The
  theory was that a pseudo live at function entry gets `reg_nonzero_bits` set to
  all-ones and so keeps its extensions. Declaring `ax`/`by` as extra parameters
  and assigning over them produced *byte-identical* output: flow deletes the dead
  incoming copy and the promotion survives it.

### `(t + 1) + f()` does not survive `fold`; it needs two statements

Two of this batch's four turn on it, so it is not a one-off. `n = t + 1 + d;` —
with `d` already a plain local, so no evaluation-order question — folds to
`t + (d + 1)` and emits

```
bl Div ; add r0, r0, #1 ; add rN, r4, r0        /* what the source says */
bl Div ; adds r1, r4, #1 ; adds r0, r1, r0      /* what the ROM has     */
```

Parenthesising does not help (`t + 1 + d` already parses that way). Splitting it
does: `t2 = t + 1; n = t2 + d;` gives the ROM's shape. Use a **second local**
rather than reassigning `n` — `n = t + 1; n = n + d;` gets the instructions right
but costs an extra `adds r0, rN, #0`, because the two assignments tie `n` to the
first one's register.

### Three more one-line levers from this batch

**`v *= a; v *= 100;` and `v = v * a * 100;` differ by two `mov`s.** THUMB `MUL`
is destination-tied; the compound form ties both products to `v`'s register,
while the single expression allocates a fresh pseudo for the intermediate and
reload copies in and out. Same for a subtraction of two products:
`def = def * (v >> 4); atk = atk * 6; res = def - atk;` puts each product in its
own operand's register (`muls r3, r0` / `lsls r7, r0, #1`), where
`res = (v >> 4) * def - atk * 6;` does not.

**`s16` and `u16` are not interchangeable for a local that is only ever compared
against zero.** `sub_08024ABC`'s `v2` is assigned from an `int`-returning callee
and tested `!= 0`; both spellings truncate with `lsl #16; lsr #16`, and only the
signed one leaves `r0` holding the pre-shift value for the `cmp r0, #0` that
follows. Four bytes, and no oracle other than the diff — this is the
"byte-neutral wrong type has no oracle" hazard in a form where it is *not*
byte-neutral. `decomp-permuter` found it from a candidate that was otherwise
99.0%; it is exactly the class the permuter is good at, and it is why the 300 s
run is worth spending even on a diff that looks like pure allocation.

**Spelling a member inline rather than binding it to a local moves the pool load
ahead of it.** `sub_08024ABC`'s last four bytes: with `u = a->unk00;` as its own
statement the two loads come out in source order, and with `a->unk00` written
inline inside the expression that also names `gUnknown_08499594`, agbcc
materialises `ldr r0, =gUnknown_08499594` *first* and the member load second.
Every later use CSEs back to that one load, so the inline spelling costs nothing.
This is the mirror image of the "bind the subexpression to a local" instinct and
of the `lim` local in `sub_0800AA30`.

### agbcc's pointer-difference division shifts AFTER the multiply

gcc 2.x's `expand_divmod` implements `EXACT_DIV_EXPR` as **multiply by
`invert_mod2n(d >> post_shift)`, then shift right by `post_shift`**. Later gccs
pre-shift, which is why the emitted code does not look like a division at all and
why a reciprocal ladder in this tree has to be read right-to-left:

```
lsls r0,r1,#2 ; adds r0,r0,r1 ; lsls r1,r0,#4    ; adds r0,r0,r1
lsls r1,r0,#8 ; adds r0,r0,r1 ; lsls r1,r0,#0x10 ; adds r0,r0,r1
rsbs r0,r0,#0 ; asrs r0,r0,#8 ; adds r0,#1
```

The ladder builds `x * 0x55555555` and `rsbs` negates it, so the multiplier is
`0xAAAAAAAB` — `synth_mult`'s negate strategy, and `0xAAAAAAAB` is the inverse of
3 and of nothing else. `asrs #8` is therefore `post_shift = 8`, so
`d = 3 << 8 = 0x300`: **a pointer difference over a 768-byte stride**, which in
`sub_08024ABC` is 64 `struct Unk08499594` records — one army's worth of unit
slots — and the `+ 1` after it makes the result a 1-based army index into
`gUnknown_08499598`. Write it as the pointer subtraction it is, with a
`struct { struct Unk08499594 unk00[64]; }` in the `.c` purely for its size.

**Do not take the stride from a nearby multiply.** This function has
`movs r0, #0x5c; muls r0, r3, r0` two instructions later and it is unrelated — it
indexes `gUnknown_085D5ABC` by a byte the ladder's own result was loaded from.
`0x5C` is not invertible against `0xAAAAAAAB`, and reading the ladder is the only
way to get the stride.

### A second `-fforce-addr` pool block in code-0801D390.s

The chapter above lists two blocks, `code.s` at 0x0808D6DC-0x0808D89x and
`code-0801D390.s` at 0x0809092C-0x08090C2x. There are at least two more, both in
that second unit and both far outside the quoted range:

```
0x08091350-0x0809138C   0x03003FC0, 0x030040D8 x4, 0x03003100, 0x085D5ABC,
                        0x08499598 x2, 0x084A077C, 0x020288A0 x2, ...
0x0816D938-0x0816D9BC   0x08499590 x9, 0x030040D8 x6, 0x03003F2C x4,
                        0x03004784 x2, 0x030013B0, 0x03003338, 0x030033EC
```

Both are bracketed by ordinary data (0x04F504F8 above the second, 0x01010100
below it) and every word in them is fan-in 1, so the density screen flags them
correctly — the *address range* in the section head is what is incomplete.
`gUnknown_0816D9E0`, already recorded elsewhere in this file as a known pool, is
the tail of the second block. **Run the fan-in + run-density screen rather than
the address range; the ranges are a sample, not a list.**

### The `.LC` screen is PREDICTIVE, not just explanatory (wave 16, C)

Waves 14 and 15 built the `.LC`-word metric from seven functions that were all
selected *after* the fact. Wave 16's C batch is the first test of it as a
**filter**: four functions, 1,832 bytes, picked by `tools/lc_screen.py` in
advance purely because they score zero `.LC` words and have
`backward_branches == 0`. Nothing else about them was matched up — they span
three subsystems and two `asm/` units.

| | bytes | `.LC` | rounds | new layouts | new symbols | outcome |
|---|---|---|---|---|---|---|
| `sub_08080324` | 372 | 0 | **1, no probe** | 1 local proc struct | 0 | **matched** |
| `sub_080895E4` | 484 | 0 | **1, no probe** | 1 local proc struct | 1 global, 1 proto | **matched** |
| `sub_0802B91C` | 480 | 0 | ~8 + 3 probe files + 300 s permuter | 0 | 0 | **matched** |
| `sub_0808B91C` | 496 | 0 | 3 + 1 probe + permuter | 0 | 0 | see soft-float below |

**Two 372–484 byte functions matched on the first `trymatch` with no probe round
at all.** Before this wave the only first-try matches at that size were family
members inheriting a worked-out exemplar; these had none. The screen is worth
running as a filter and the remaining 74-function `.LC`-free straight-line pool
is worth draining.

**But the batch also refutes "zero `.LC` means cheap".** `sub_0802B91C` scored
zero and still cost roughly eight times the other two, and none of the standing
metrics explains it: it is not the biggest, it needed zero new struct layouts,
zero new globals and zero new prototypes — the two first-try matches each needed
*more* new type vocabulary than it did. So the honest form of the finding is
**one-sided**: a nonzero `.LC` count predicts expense, and a zero count predicts
nothing except the absence of that particular cost.

#### What made the expensive one expensive: argument-position evaluation order

All three of `sub_0802B91C`'s levers are the same shape, and each alone was the
whole difference between a near-miss and a match. Each is about **where a value
gets materialised relative to a call or a branch**, and all three live inside a
*call argument list*:

1. A `?:` in argument 3 of a 4-argument call, where the ROM evaluates the whole
   conditional — branch, index, `ldr` — *before* arguments 1, 2 and 4. Writing
   it as an `if`/`else` assigning a `void *` local instead moved the candidate
   from 27.5% to 93.3% in one edit, and as a side effect stopped
   `(a4 - 1) * 4` reassociating into `a4 * 4 - 4` with the multiply hoisted
   above the branch.
2. A sum of three terms with a constant in the *inner* position —
   `a8 * 4 + ((a4 & 1) + 0x1dc)`. `split_tree()` pulls an `INTEGER_CST` out of
   either operand of a `PLUS_EXPR`, so `fold` flattens it to
   `(a8 * 4 + 0x1dc) + (a4 & 1)`. Two locals are needed, not one: binding the
   a4 term alone keeps the ROM's grouping but emits it *before* `a8 * 4`, and
   the ROM has the multiply first.
3. An argument whose expression contains two `bl`s
   (`sub_08026198() + (0x78 - sub_080261A0()) * 0x20`). Binding it to a `dst`
   local is what puts the *other* arguments' arithmetic after those calls;
   without it the index statements are emitted ahead of them and have to
   survive the calls in callee-saved registers.

**The proposed screen, and it is one batch of evidence so treat it as a
proposal: count the call arguments whose expression contains a nested call, a
branch, or a three-or-more-term sum with a constant in a non-outermost
position.** `sub_0802B91C` has five. The two first-try matches have **zero** —
every one of their arguments is a constant, a single member read, or two-term
integer arithmetic on one variable — and `sub_080895E4` has twenty-odd computed
arguments and still scores zero on this, which is the point: it is not argument
*complexity*, it is argument *evaluation order*. This is visible in the target's
own listing before any C is written: look for a `bl` inside another call's
argument setup, and for a branch between a call's first and last argument.

**Corollary, and it cost this batch a whole round.** A parameter-width sweep run
against a candidate that still has a structural error will give you the wrong
answer with total confidence. `s16 a1, a2` measured **+12 bytes** against `u16`
plus `(s16)` casts while the tail was still wrong, and was **the thing that
matched** once the tail was fixed. Sweep widths only after the instruction
stream is otherwise aligned.

---

### Eight rules from the 360–404 band (wave 17, agent B)

Nine functions, 2596 bytes, **one `try_match` each and no permuter run** —
`sub_08051DE0` (360), `sub_0805297C` (376), `sub_080524C0` (400),
`sub_08050958` (404), `sub_08051BEC` (392), `sub_08051F4C` (364) and the three
100-byte members of F092. Each rule below was isolated with a controlled
`compile_probe`: the same function, one statement respelled, everything else
held fixed. The five immediately below came from the first four plus F092; the
subsection after them from the two 0x08051xxx neighbours.

**The batch-level result worth carrying: none of these nine needed a second
attempt, and the reason is that every one of the rules below was found with
`compile_probe` and a local normalising diff rather than with `try_match`.**
The band is not harder than the 256–384 one the earlier sections measured; it
is the same cost per byte, and the whole cost is in identifying which of a
handful of byte-neutral-looking spellings the original used.

**agbcc issues the LOADS of a sum in the REVERSE of the order its addends are
written, because it expands the ADDRESSES in source order. Read the pool order
forwards and the load order backwards.** This is the single highest-yield rule
in this batch — it fired twice, in a 360-byte function and in a 100-byte one,
and both times it was the whole diff.

```c
x = tbl[i].off + entry->x;   /* ldr =tbl first, then ldr =entry ; loads entry->x, then tbl */
x = entry->x + tbl[i].off;   /* ldr =entry first, then ldr =tbl ; loads tbl, then entry->x  <- ROM */
```

Identical length and identical operand count, so there is no size signal: the
diff is a permuted pool plus a swapped `adds`. The practical procedure is to
read which symbol's pool `ldr` comes FIRST and put that term FIRST in the
source, then check that the first value LOADED is the second term. If both
readings agree you have the order; if they disagree you have something else
wrong. `sub_08051DE0`'s two position sums and `sub_080646D4`'s
`obj->unk38 + curve[obj->unk26]` are the two instances.

**A constant member offset belongs in the load's immediate, and only a STRUCT
puts it there — a multi-dimensional array folds it into the symbol's address
instead.** Two spellings of the same 28-byte-stride ROM table, same semantics
and same stride arithmetic:

```c
t[v][3]        /* u16 t[][14]:  movs r0,#6 ; adds ip,ip,r0 ; adds r6,r6,ip ; ldrh r0,[r6]  */
t[v].unk06     /* struct 0x1c:  adds r2,r2,ip ; ldrh r0,[r2,#6]                 <- ROM     */
```

Two bytes per site, and it fired at both of `sub_08051DE0`'s constant-index
sites (`gUnknown_08552D80.unk06` and `gUnknown_085D7E28[..][..].unk04`). Read
backwards: **a constant offset appearing in an `ldrh`/`ldrb` immediate off a
scaled base is positive evidence for an aggregate; the same constant added to
the base register instead is positive evidence for an array subscript.** Note
the corollary for a VARIABLE last index — `t[v][g + 1]` computes `(g+1)*2` and
loses the `g*2` subexpression that a neighbouring `[..][g]` would have shared,
which is a second, independent way the array spelling shows up.

**`int v` and `u16 v` differ at a bitfield store, and here it is the `int` that
matches.** Wave 15 found that `u16 v` and `int v` + an explicit `(u16)` cast
are different code; this is the same family with the sign of the effect
reversed, so do not memorise a direction. Assigning a `u16` table element into
a 10-bit bitfield:

```c
oam.tileNum = tbl[i];              /* ldrh r0,[r0] ; ldr r1,=0x3FF ; ands r1,r0        */
u16 t = tbl[i]; oam.tileNum = t;   /* ldrh r1,[r0] ; ldr r0,=0x3FF ; ands r1,r0        */
int t = tbl[i]; oam.tileNum = t;   /* ldrh r1,[r0] ; ldr r2,=0x3FF ; adds r0,r2,#0 ;
                                    * ands r1,r0                              <- ROM   */
```

Two bytes, and the `int` form is the LONGER one — it keeps a register copy the
other two drop. The matched `sub_0804D928` has the identical three-instruction
shape with an arithmetic value rather than a load, which is the independent
confirmation. **So when a bitfield store's mask setup carries a
`adds rD, rS, #0` that your candidate does not, widen the temp rather than
narrowing it**, and check that a temp exists at all before checking its width.

**`a = b = expr;` collapses to ONE stack slot; two independent assignments keep
two, and the FRAME SIZE is the tell.** In `sub_08050958` two pairs of locals
hold the same two values and all four are live across a call:

```c
a = c = g[i].unk30;                     /* sub sp,#0x10 -- one slot, a coalesced away */
c = g[i].unk30;  a = g[i].unk30;        /* sub sp,#0x18 -- two slots       <- ROM     */
```

The copy insn a chained assignment produces is coalesced by regmove and the
variable disappears; two separate assignments from the same memory expression
are two pseudos that cse never merges, because equality of value is not
identity of live range. **Count the frame's words against the values you can
see stored and read back before drafting** — being one word short is a missing
variable, not a register-allocation problem, and no amount of respelling the
body fixes it. The independent confirmation that they really are separate
variables is available in the listing: in the arm guarded by `c == 0` gcc
const-folds `c` to `movs r0,#0` and *still* loads the other slot in the sibling
arm.

**`mov rD, rS` with two LOW registers and `adds rD, rS, #0` are ONE encoding
(0x1c1a), the same way `mul` has one form.** agbcc emits both spellings and gas
assembles them identically, so a diff that shows only this is not a diff. Verify
it in ten seconds rather than spending a round on it:

```
$ printf '\t.code 16\nf:\n\tmov r2, r3\n\tadd r2, r3, #0\n' > t.s && as -o t.o t.s && objdump -d t.o
   0:	1c1a      	adds	r2, r3, #0
   2:	1c1a      	adds	r2, r3, #0
```

Two more type readouts from the same batch, both decisive and both free:

- **`bgt` vs `bhi` on a word member compared against a `u16` member settles the
  word member's signedness outright.** `gUnknown_03001470[proc].unk2c` was
  declared `u32`; `unk2c > gUnknown_02029710[side].unk16` emits `bhi` under
  that declaration (the u16 promotes to unsigned) and `bgt` under `int`. The
  ROM has `bgt`. Retyping was byte-neutral for all three promoted `= 0`
  writers. **A mixed-width comparison is worth looking for specifically** — it
  is the only construct that makes an otherwise byte-neutral signedness
  visible.
- **A `strh`-only writer plus an `ldrsh` reader in a DIFFERENT function is how
  a struct member's signedness actually gets settled.** F092 stores into
  `Unk08580934_Obj.unk2a` with a bare `strh` (byte-identical for four types)
  and `sub_08064E5C` reads the same offset with `ldrsh`. The producer proves
  nothing and the consumer proves everything; this is the "discriminating use"
  the type-model section asks for, in its cheapest form.

#### Three more, from the two 364/392-byte neighbours (same batch)

`sub_08051F4C` and `sub_08051BEC` are near-twins that the shape metric scores
*apart* from the cluster above and from each other; both fell in one
`try_match` once these three were settled.

**A LOCAL `T *` supplies the aggregate when the shared declaration is an
array.** The rule two entries up says a constant index wants the offset in the
load's immediate and only a struct puts it there — but a global declared
`u16 g[][12]` and used by already-promoted code cannot be retyped for one
caller's convenience. Binding the row does the same job with no header change:

```c
if (g[w][2] == 1)                       /* adds r2,#4 ; adds r0,r2 ; ldrh r0,[r0]   */
row = g[w]; if (row[2] == 1)            /* adds r0,r2 ; ldrh r0,[r0,#4]  <- ROM     */
```

So the struct-vs-array question is really "is there an aggregate lvalue at the
point of the subscript", and a pointer local is the cheap way to answer yes.
Reach for this before proposing to retype a shared global.

**A call argument whose expression is evaluated BEFORE the other arguments'
pool words was its own statement in the source.** The fifth (stack-passed)
argument of `sub_08015410` is computed in the ROM before either pool `ldr` for
arguments one and three, and only narrowed to `u8` at the `str [sp]`. Inline,
agbcc evaluates it last and needs an `ip` shuffle to keep an earlier argument
alive — one extra instruction pair, at the same size class. The local must be
`int`, not `u8`: a `u8` local moves the `lsls #0x18; lsrs #0x18` up to the
assignment, where the ROM has it at the call. This is the *readable* half of
the wave-16 "argument-position evaluation order" finding: **an argument value
that appears too early is a statement, and one that appears too late is
inline.**

**Two functions can need DIFFERENT spellings of the same statement, and the
tell is whether the guard's load is shared.** Both functions contain
`if (e->unk01 == 1) { e->unk00 = <1>; ... }` over the same struct, and:

```c
e->unk00 = 1;            /* sub_08051F4C matches; sub_08051BEC gains movs r0,#1 */
e->unk00 = e->unk01;     /* sub_08051BEC matches; sub_08051F4C gains adds r2,r3,#0 */
```

Neither spelling matches both. The cause is which register cse has available:
in `sub_08051F4C` the later `== 0` test reuses the SAME `ldrb`, so the compared
register is committed and the store needs a fresh constant; in `sub_08051BEC`
an indirect call between the two tests forces a reload, so cse's "this register
holds 1 on this edge" equivalence is still free to satisfy the store. **Do not
normalise sibling functions to one spelling on the grounds that they look
alike** — and note this is a case where probing the OTHER sibling is the fast
way to find the second spelling.

**A caller can retype an already-PROMOTED parameter, and this batch is the
first case where it had to.** `src/decomp/c_080157A4.c` and `c_080157F4.c`
declared `void sub_080157Ax(s16 a, u16 b)`; both are one-line bare-`strh`
setters, so by the setter table their own bytes cannot tell `u16` from `s16`
and the `u16` was a free choice. `sub_08051BEC` and `sub_08051F4C` are the
discriminating use — each sign-extends a `u16` table value with
`lsls #0x10; asrs #0x10` immediately before the call, which is the `u16 -> s16`
conversion and which a `u16` parameter does not emit. Both definitions were
retyped to `s16 b` and both still match. **The brief's "a promoted definition
wins over your declaration" is about not gratuitously disagreeing, not about
the promoted file being right** — when the promoted function is one whose own
codegen is provably blind to the distinction, the caller is the only evidence
there is, and the promoted file is the thing to change.

**Two methodological notes, one of which cost this batch its only wasted
round.**

- A normalising local diff script (compile the probe, strip gas-vs-objdump
  spellings, `difflib` the instruction streams) is worth the twenty minutes —
  it turned rounds of eyeballing 6000-line `compile_probe` blobs into one
  command, and it is what made nine functions land at one `try_match` each.
  But it once reported a clean match for a candidate `trymatch` then rejected
  at 97.3%, because the `sed` that was supposed to have edited the probe file
  had silently matched nothing. **The script tells you WHERE to look; only
  `trymatch`'s exit status tells you whether you are done.** Re-run the real
  oracle after every edit you believe is byte-neutral, including reverts.
- **Run `python tools/sync_work.py` BEFORE the regression sweep that follows a
  shared-type edit, not after the sweep fails.** The Workflow section already
  says this and it is still the easiest thing in the process to skip: two
  promoted files reported `conflicting types` against a prototype *this batch
  had just made correct*, because `trymatch` reads `work/<fn>/<fn>.c` and those
  drafts were stale. It reads exactly like a real regression.
- **BUG FOUND AND FIXED in `tools/sync_work.py`, and it manufactured exactly the
  false regression the tool exists to prevent.** Its multi-function splitter
  located each function with `^\S.*\b<fn>\s*\(`, which also matches the FIRST
  line of a block comment — that line starts with `/`, and a doc comment
  routinely names the function the one below it calls. `c_0803B3C8.c`'s comment
  opens ``/* `sub_0803B3D4(8)`: ...`` and hijacked sub_0803B3D4's boundary, so
  one draft came out empty and the other held two functions; `trymatch` then
  reported both as +12 bytes on a sweep of otherwise untouched code. The fix
  tracks comment state with `promote.strip_comments` and only accepts a hit on
  a code line. **Two consequences worth carrying:** a sweep failure on a
  function your batch never mentions is more likely a draft-generation artefact
  than a regression — diff `work/<fn>/<fn>.c` against `src/decomp/c_<fn>.c`
  before believing it; and the claim elsewhere in this file that `sync_work.py`
  "deliberately leaves multi-function drafts alone" is out of date, it splits
  them now.

### Two functions, one expression, two spellings — the 328–364 band (wave 18, A)

`sub_0804E7A8` and `sub_0804FCA4` are near-twins in the 0x0804Exxx animation
family (328 and 364 bytes, `.LC`-free, `backward_branches == 0`). Both came out
**size exact** and both are parked on register allocation, but the useful result
is what had to differ between them, because the instinct is to normalise
siblings onto one spelling and that is wrong twice over here.

**`&gArray[i].member[j]` CSEd across several accesses wants the EXPLICIT
BYTE-OFFSET SUM; used once it wants the plain subscript.** Same expression,
same two functions' worth of context, opposite answers:

```c
/* used ONCE, in a comparison (sub_0804E8F0) -- plain subscript is exact       */
a == gUnknown_02029A10[c].entries[e].unk18

/* CSEd across FOUR member accesses (sub_0804E7A8) -- the subscript folds the  */
/* base into the `e` term and computes c*180 first; the ROM computes e*36      */
/* first and adds the base LAST                                               */
entry = (struct Unk02029A10 *)(e * sizeof(struct Unk02029A10)
                               + c * sizeof(struct Unk02029A10Group)
                               + (u8 *)gUnknown_02029A10);
```

That is the third row of the "where the base add lands in `base + i*A + j*B`"
table, and this is the first case found where *whether the address is reused*
is what selects the row. Count the accesses before choosing the spelling.

**A ROM table read ONCE sinks its constant offset into the pool word's
relocation; read TWICE with different constants it shares one pool word and
adds each constant at run time — so two functions over the same table get two
different SYMBOLS, and both are right. The way to serve both from one
declaration is a STRUCT whose member is the inner array, and finding that was
worth a match.** `sub_0804E7A8` reads the 24-byte-row
sound table at `+0xc` only, so its pool word is `gUnknown_085D6C94` (=
`0x085D6C88 + 0xc`) with no runtime add; `sub_0804FCA4` reads it at `+0xc` and
`+0x10`, so its pool word is `gUnknown_085D6C88` and each site does its own
`adds rB, #0xc` / `adds rB, #0x10`. `gUnknown_0855239C` / `gUnknown_085523A4`
already had this shape and it was read as an oddity; it is the rule.

Declared flat — `extern s16 g[][6][2]` at the *biased* address — the
single-reference function is happy and the two-reference one cannot be written
at all, because its two constants would each fold into their own relocation.
Declared as

```c
struct Unk085D6C88 { u8 filler_00[0xc]; s16 unk0c[2][2]; u8 filler_14[4]; };
extern struct Unk085D6C88 gUnknown_085D6C88[];
```

both work: `g[B].unk0c[j][i]` puts the member offset on the base as a run-time
`adds rB, #0xc`, which is what the two-reference function has, and in the
one-reference function the same expression sinks `+0xc` into the relocation as
an addend against the base symbol — which `reloc_equivalent` resolves to the
ROM's own separate symbol. **`sub_0804FCA4` went from 38.5% to a MATCH on this
one declaration, and its sibling `sub_0804E7A8` from 90.2% to 94.2%.** Read
backwards: *a run-time `adds rB, #C` between an array global's pool `ldr` and
its index add is a struct member, and the flat view of the same bytes cannot
produce it.*

**The method mattered more than the rule, and it is the transferable part: both
functions were stuck on what looked like independent register-allocation
residuals, and both were solved by diffing the two ROMs AGAINST EACH OTHER
rather than each against its own candidate.** The comparison is cheap — dump
both instruction streams normalised and `difflib` them — and what it shows is
the *shared* skeleton with the per-function registers laid side by side. Here
it read out that both ROMs put the same value in r6 with a high-register copy,
that the two differed only in which of two values took r5, and therefore that
the residual was one shared decision rather than two allocation accidents. Two
size-exact near-misses that pair on `shape_map` are worth this before any
further per-function spelling sweep.

**Why it works is worth stating, because it also says when to reach for it: two
near-misses that pair on shape share a CAUSE, not a residual.** The prediction
going in was a register decision and what came out was a type decision, and
that is the method succeeding rather than failing — the diff does not tell you
what the shared thing is, only that there is one.

### SUSPECT THE TYPE BEFORE THE ALLOCATION — and a lever that helps is not evidence

**This is the generalisation, and it is worth more than the table rule above.**
Both of those functions presented as register-allocation problems: size exact,
right instructions, wrong registers, and every documented allocation lever
either flat or marginal. The cause was an *aggregate type* — a ROM table
declared flat where it needed a struct with the inner array as a member — and
one declaration took a function from 38.5% to a match.

**The trap is sharper than "we guessed wrong", and it is what cost the round:
a spelling that IMPROVES the diff is not evidence that it addresses the
cause.** A `do { … } while (0)` wrapper in that draft was worth a whole
callee-saved register and looked like a textbook instance of the
allocation-priority lever this file documents — right up until the type was
fixed, at which point it became a 60-byte regression and was deleted from the
matching source. It had been *paying for the wrong aggregate type* somewhere
else in the function.

That is the same family as wave 16's inverted width sweep ("a measurement taken
in the wrong context is not weak evidence, it is inverted evidence"), and it
generalises past parameter widths to every axis: **a lever measured against a
candidate that still has a type error can be right about the bytes and wrong
about the reason, and it will keep looking right for as many rounds as you
spend on the wrong axis.** Practical order:

1. Settle every aggregate the function reaches — especially any ROM table
   reached at a constant offset, where flat-versus-struct is invisible in the
   instruction stream and decides the pool word, the constant's position and
   the whole register file at once.
2. Only then sweep bindings, scopes and `do`/`while(0)`.
3. When a lever helps, re-test it after the next type change. If it stops
   helping, it was never the lever.

**A subscript expands its base FIRST and an explicit byte sum expands it LAST,
and on a register-tight function that is a whole `mov ip, rN`.** The 3-D
subscript `g[B][A-1][b&1]` gets the index arithmetic exactly right — each term
pre-scaled, in the ROM's order — and then has to keep the base alive across all
of it. Writing the same address as `*(s16 *)((u8 *)g + k)` with `k` a
**block-scoped** `int` holding the byte sum loads the pool word last, which is
what the ROM does. Two further measurements go with it: declaring `k` at
function scope costs three callee-saved registers (the wave-13 block-scoped-temp
rule, second instance), and folding the sum into the deref without the local
lets `fold` reassociate the base into the largest term and lose the ROM's add
order.

**`do { … } while (0)` round one read-modify-write was worth one callee-saved
register here too**, with no instruction of its own — `e` moved from r6 to the
ROM's r7. That is now three independent functions on which this lever has paid
(`sub_0806DDF4`, `sub_0808B91C`, `sub_0804E7A8`), so treat it as a first-class
allocation knob rather than a curiosity.

**Where the STACK SLOTS come out is decided by declaration order, and it is
free to check.** `sub_0804FCA4` spills three values and the ROM's order is
`[sp] = w`, `[sp,#4] = p1`, `[sp,#8] = p2` — reached only by declaring `u16 w;`
*ahead of* the two pointers, even though `w` is assigned last. Registers are
famously not decided by declaration order (eight orders were probed here and
none moved a register); slots are.

---

## Soft float — libgcc, and the constants that reach it (wave 16, C)

`sub_0808B91C` is a `cosf`: range-reduce by whole multiples of pi, then a Taylor
series in `r*r` out to the `r^16` term, then negate on odd quotient. It is the
first soft-float function anyone has taken in this tree, and everything below
was read off it or probed against it. The GBA has no FPU, so every arithmetic
step is a `bl` into libgcc: `__addsf3`/`__adddf3`, `__mulsf3`/`__muldf3`,
`__subdf3`, `__divdf3`, `__negsf2`, the `__ges`/`__gedf2` comparisons and the
`__extendsfdf2`/`__truncdfsf2`/`__fixdfsi`/`__floatsidf` conversions.

**A double in registers is stored HIGH WORD FIRST, and reading it the other way
gives a nonsense constant.** agbcc inherits ARM's FPA layout
(`FLOAT_WORDS_BIG_ENDIAN`), so for a call taking a double in `r2:r3`, **`r2` is
the high word**:

```
ldr r3, _0808B948 @ =0x54442D18      <- low
ldr r2, _0808B944 @ =0x400921FB      <- high
bl __divdf3                          -> 0x400921FB54442D18 = pi
```

Read little-endian that pair is 0x54442D18400921FB, about 9e97, which is exactly
the kind of value that makes a reader conclude the function is not compiler
output. The single-word check is `=0x3FF00000` / `=0x00000000` for `1.0` and
`=0x3FE00000` / `=0x00000000` for `0.5`, both of which appear in this function
and pin the order with no arithmetic.

**agbcc does NOT promote float arithmetic to double. Every `__*df3` in this
function comes from an unsuffixed decimal constant, and the ROM proves it with
its own control.** One function contains both:

```c
u * 0.5f                  /* -> bl __mulsf3, pool word 0x3F000000       */
u * 4.779477332387e-14    /* -> bl __extendsfdf2 ; bl __muldf3          */
x >= 0                    /* -> bl __gesf2, NOT __gedf2                 */
```

An unsuffixed decimal literal is `double` in C89, so the usual arithmetic
conversions widen the float operand and every intermediate stays double until
something forces it back. An *integer* constant does not — `x >= 0` converts the
`0` to `float`, so the comparison is single-precision. **So a `bl
__extendsfdf2` immediately before an arithmetic libcall is a missing `f` suffix
in your source, not a compiler quirk**, and the fix is at the constant, never at
the variable. Seven `__extendsfdf2` calls on the same float local in a row —
five of them spilled to `[sp, #0]` … `[sp, #0x20]` — is what one variable used
seven times in double context looks like; it is not seven different values.

**`t - C` with `C` a constant emits `__subdf3`, not `__adddf3` with `-C`.** An
alternating series therefore has to be written with explicit negative literals
and `+` to reach the ROM's negative pool words:

```c
u * C7 - 1.147074559773e-11    /* bl __subdf3, pool 0x3DA93974A8C07D48 */
u * C7 + -1.147074559773e-11   /* bl __adddf3, pool 0xBDA93974A8C07D48  == ROM */
```

gcc 2.x's `fold` only rewrites `A - B` as `A + (-B)` for integers, and the same
function's `1.0 - u * 0.5f` (non-constant right operand) stays a `__subdf3` in
both spellings, which is the control.

**The constants are hand-typed decimals, not computed reciprocals, and the
difference is visible in the pool.** The seven series coefficients are
1/4! … 1/16! written to **thirteen** significant digits:

```
0x3FA5555555555736 = 0.04166666666667      (1/24  would be 0x3FA5555555555555)
0xBF56C16C16C16E17 = -0.001388888888889    (1/720 would be 0xBF56C16C16C16C17)
0x3EFA01A01A01A336 = 2.480158730159e-5     0xBE927E4FB778A265 = -2.755731922399e-7
0x3E21EED8EFF8DA63 = 2.087675698787e-9     0xBDA93974A8C07D48 = -1.147074559773e-11
0x3D2AE7F3E733B5BD = 4.779477332387e-14
```

So `1.0 / 24.0` does **not** reach 0x3FA5555555555736 — write the literal.
Conversely pi needs sixteen digits: `3.141592653589793` gives
0x400921FB54442D18 and `3.14159265358979` gives 0x400921FB54442D11, seven ULP
out. **A pool word that is close to a familiar constant but not equal to it is a
decimal literal with a digit count you have to recover; take the shortest
decimal that round-trips.**

Practical note: `tools/lc_screen.py` correctly reports `refs=[]` for a function
like this. Raw double constants are pool words with no relocation, so they are
invisible to every `data_refs`-based screen — do not read an empty ref list on a
496-byte function as "nothing to model".

### A zero-trip `do { } while (0)` re-orders REGISTER ALLOCATION, and it is a lever

Found by decomp-permuter on `sub_0808B91C` and then isolated: wrapping two
statements in `do { … } while (0)` — which emits no instruction of its own —
moved that function from 97.6% (twelve differing bytes) to 99.4% (three).

The mechanism is `global.c`'s `allocno_compare`, which divides an allocno's
reference count by its live length and **weights each reference by loop
depth**. A zero-trip loop is still a loop as far as `loop_depth` is concerned,
so every pseudo referenced inside one is promoted above every pseudo outside
it, and the promoted ones get first pick of the hard registers.

Concretely: `x` (referenced six times, long live range) was losing r4 to the
`x / pi` double quotient (referenced twice, but DImode, and `allocno_compare`
multiplies priority by the allocno's *size*), so `x` landed in r6 and the
quotient in r4:r5 where the ROM has the opposite. Putting `x`'s last two
statements in the wrapper reversed it exactly.

**Read this as a diagnostic first and a source claim second.** It says "the ROM
gives this value a higher allocation priority than your spelling does", which is
real information; it does not say the original contained a literal
`do`/`while`. In a math routine the plausible origin is a macro. Reach for it
when a candidate is instruction-for-instruction correct and the only diff is
which of two long-lived values got the lower-numbered callee-saved register —
that is the signature, and no amount of rebinding, reordering declarations or
re-associating expressions touches it.

**The matching negative, worth as much:** it does *not* help a pseudo that is
losing a call-clobbered register to a call-saved one. `sub_0808B91C`'s last
three bytes are `v` allocated r1 where the ROM has r4, and wrapping the tail,
the assignment, or the return in their own `do`/`while` moves none of them —
because `REG_ALLOC_ORDER` offers r0-r3 first to any allocno with
`calls_crossed == 0`, and that test is prior to priority, not part of it.

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
- **That check was UNREACHABLE for any function containing a `bl`, and it stayed
  that way for three waves (wave 15).** `reloc_equivalent` walked the two
  relocation lists in parallel and bailed on the first entry that was not
  `R_ARM_ABS32` — so a `bl`'s `R_ARM_THM_CALL`, which comes first because it is
  at a lower offset than the literal pool, rejected the whole comparison before
  any pool word was examined. `sub_08011B34`, the case the check was written
  for, is a leaf, which is why nobody noticed. Family F049 (four 112-byte
  functions with one `bl`) reported **99.1%, one differing byte, first
  difference at the pool word** — the exact profile of a real near-miss — and
  all four were instruction-for-instruction identical and linked to the same
  ROM. Fixed in `tools/trymatch.py`: a non-ABS32 relocation must now name the
  identical symbol and is skipped, rather than aborting the check, and its
  bytes are still compared like any others. **Read the symptom, not the
  percentage: a diff whose only entry is a `.word` plus its relocation line,
  with every instruction matching, is this — check the two symbols' addresses
  by hand before believing the score.**
- **The OTHER pool-word relocation case is a REAL mismatch, and the bullet
  above will talk you out of fixing it (wave 14).** That one is two symbols
  resolving to one address. This one is a relocation against *no* relocation:
  where the ROM's pool word is a bare constant, the splitter invents an lds
  symbol at that address, so `asm/` assembles to `.word 0` plus
  `R_ARM_ABS32 gUnknown_XXXXXXXX` while the honest C — a literal, e.g.
  `((void (*)(void *))0x0300619D)(dst)` — emits `.word 0x0300619d` with no
  relocation at all. Identical after linking, identical instruction stream,
  and `trymatch` scores it **81.2%** on a 16-byte function with
  `first difference at +0xc`. It does *not* print the
  `different symbols that resolve to the same address` line, because that check
  compares two relocations and here there is only one. The fix is to spell the
  pool word as `&gUnknown_XXXXXXXX` and declare the symbol in
  `unknown-globals.h` with a comment saying it is not an object — `sub_0801B6EC`
  and `sub_0801B6FC` are the worked cases. **Read this as a spelling forced by
  the split, not as a discovery about the original source**, and say so in the
  header: a bogus `extern u8` at an odd IWRAM address is exactly the kind of
  byte-neutral wrong type the brief warns has no oracle.
- **`compile_probe` is free.** Compile candidate C and read the assembly without
  spending an attempt. One agent matched four functions in one `try_match` each
  by probing locally first. Explore with `compile_probe`, spend `try_match` on
  the verdict.
- **`python tools/trymatch.py <fn> --diff` is the same check the MCP tool runs**,
  against the same `work/<fn>/<fn>.c`. Iterating locally and using `try_match`
  only to confirm costs nothing and is how the 0802 cluster was done.
- **Above roughly 250 bytes, iterate with local `trymatch --diff` and stop using
  `compile_probe` as the main loop.** Both are free, but they return different
  amounts of noise: one whole-function probe came back as ~6,400 lines, most of
  it `.debug_line` and `.debug_abbrev`, for one answer, and the useful part had
  to be read against the target by eye. `trymatch --diff` returns a percentage,
  a signed size delta, the offset of the first difference and an aligned
  instruction diff, in about five seconds, and it is the same verdict the MCP
  tool gives. Wave 13 used one probe round to place the first draft and then ran
  entirely on local `trymatch` — roughly twenty iterations across seven
  functions, at a token cost a single probe would have exceeded. Keep
  `compile_probe` for what it is unbeatable at: **isolating one codegen question
  with several spellings side by side in a file with no target at all** (that is
  how the `-fforce-addr` no-loop trigger and the `*pp`-is-not-unchanging result
  below were both settled). Explore with `compile_probe`, converge with
  `trymatch`, spend `try_match` on the verdict.
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
- **After editing a shared header, re-verify by comparing `.text`, never whole
  `.o` files — a whole-object compare reports every dependent file as changed
  and all of it is noise.** `CFLAGS` carries `-g -ffix-debug-line`, so the line
  numbers of every included header are baked into `.debug_line`/`.stab`.
  Inserting one prototype into `include/unknown-functions.h` shifts every line
  number below it and changes the object of *every* file that includes
  `global.h` — `src/proc.c` included, which cannot possibly be affected
  semantically. Wave 12 added ~40 prototypes and saw all 16 spot-checked
  objects differ; extracting `.text` with
  `arm-none-eabi-objcopy -O binary --only-section=.text` showed all 16
  identical. `trymatch.py` already does exactly this, which is why it is the
  right regression check and a byte-diff of `build/**/*.o` is not.
- **When a batch is a run of wrappers over consecutive ROM symbols, dump those
  symbols out of `baserom.gba` — the data names the family for you and costs one
  Python call.** The `-fforce-addr` section says to dump the words before
  modelling a `.LC` block; the general form is more useful than that one case.
  Two things fall out that the assembly alone cannot give you. **The stride**:
  address deltas that are constant across the run are a table, and where the run
  ends is visible as the first entry whose shape stops matching — that is the
  element size, pinned before any consumer is matched. **The back-reference**:
  ROM blobs in this tree embed THUMB function pointers (odd word, `& ~1` lands
  on a `thumb_func_start`), so grepping the dump for your own batch's addresses
  says which wrapper drives which record. Wave 11's 0x08004A60–0x08004B6C batch
  is the worked case — `gUnknown_084873BC + 0x48*n` holds `&sub_08004A60 +
  0x0C*n | 1` at `+0x10` for exactly `n = 0..4`, which proves the 0x48 stride,
  caps the table at five entries, and pairs each of the five `sub_08004A30(K)`
  leaves with the wrapper that starts it. None of that is reachable from the
  fifteen functions' own assembly, and all of it belongs in the header comment.
  It does **not** change what you declare: `const u8 []` is still the weakest
  model that gives the clean pool word, and stays right until something indexes
  the table.
- **A run of bare `bl`s with no argument setup carries NO information about
  whether the source nested the calls, and "does anything move r0 between them"
  is not the tell it looks like.** The instinct is that `h(g(f()))` shows up as
  r0 flowing straight through — but three independent statements leave r0 alone
  too, so both spellings are the *same* instruction stream. One probe, agbcc
  `-O2`, all three 20 bytes and byte-identical:

  ```c
  void f1(void){ va(); vb(); vc(); }        /* void(void) callees          */
  void f2(void){ na(); nb(); nc(); }        /* int(void), results dropped  */
  void f3(void){ ic(ib(ia())); }            /* fully nested                */
  ```

  All three are `push {lr}; bl; bl; bl; pop {r0}; bx r0`. The evidence is
  entirely on the **callee** side: nesting requires the second and third callees
  to take a parameter, so if each callee reads no argument register before
  writing it, nesting is not merely unlikely, it is not expressible. Check the
  callees' own prologues and epilogues before drafting; the wrapper cannot tell
  you. (Wave 12's seven-member `bl`×3 family — `sub_08002EB4`, `sub_08028154`,
  `sub_0802CD00`, `sub_0802CD14`, `sub_08034FD8`, `sub_08034FEC`,
  `sub_0805DB50` — is all three-statement on exactly this reading, and
  `src/decomp/c_08048558.c` was already the matched exemplar.)
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
- **It does not include `proc.h` either, and that one is easy to miss because
  the failure does not name it (wave 14).** `Proc_Start` degrades to
  `implicit declaration` and `PROC_TREE_3` to `undeclared identifier`, which
  read like missing prototypes; but `PROC_HEADER` inside a struct fails as
  `no semicolon at end of struct or union` followed by
  `syntax error before '}'` and then `dereferencing pointer to incomplete type`
  at the use — three errors, none of which mentions proc.h, on a struct that is
  fine. Ten of one wave-14 batch's files hit this. `src/decomp/c_08011550.c` is
  the convention: `#include "global.h"` then `#include "proc.h"`. Note a
  `compile_probe` that includes proc.h for one function will hide it from the
  whole rest of the batch, which is how it survived to the `trymatch` step.
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
    range dispatch, deliberate missing return). **The family's address range is
    much narrower than the `0x0803Cxxx` label suggests, and by the 0x0803CCxx
    end none of it is left.** `sub_0803CC84` is a string copy over two pointer
    parameters and `sub_0803CCEC` is a `gUnknown_020280C0[i]` name-string
    accessor with a ROM fallback; neither touches `gUnknown_02028030`, and both
    matched in a single probe from their own assembly. Check that the target
    actually names the family's global before treating the address as a hint —
    three of the entries here now do not.
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
  `lsls #16; asrs #16` the original does not have. **The same test works on the
  unsigned side across a call**, and it is the commoner case: a `u8` parameter
  that has to survive a `bl` gets `lsls #24; lsrs #24` in the prologue from
  PROMOTE_MODE, whatever the eventual store width. So a proc setter that saves
  its argument with a bare `adds r4, r0, #0` and later does `strb r4, [r0]`
  takes an `int`, not the `u8` the `strb` suggests. `sub_080733A0`.
- **Proc starters: read the second parameter off what the `bl` does NOT do.**
  This family is everywhere in the 0806-0807 range and the shape is mechanical.
  `Proc_Start`/`Proc_StartBlocking` take `(script, parent)`, so r1 must hold the
  parent at the call — and if the function body never writes r1, the parent is
  the starter's own **second parameter**, arriving already in place:

  ```
  adds r4, r0, #0 ; ldr r0,=script ; bl Proc_Start   -> f(arg, ProcPtr parent)
  adds r4, r0, #0 ; ldr r0,=script ; adds r1, r4, #0 -> f(ProcPtr parent), used for both
  adds r4, r0, #0 ; ldr r0,=script ; movs r1, #0     -> f(arg), PROC_TREE_VSYNC
  ```

  An untouched r1 looks like a one-argument call to a two-argument function and
  invites the wrong signature; it is just an argument passed through. The return
  is `((struct SomeProc *)Proc_Start(...))->unkNN = arg;`, the proc struct is a
  pointer-parameter type so it lives in the `.c`, and `pop {r4}; pop {r0}` says
  `void`. Five of one wave-8 batch were this, all matched first try.
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

  **The second reason is codegen, and it is loud: `const` on a ROM table read
  inside a loop hoists the load into the preheader.** A non-const global is
  invalidated by any store through a pointer GCC cannot see past, so it is
  re-read every iteration; a `const` one is loop-invariant and moves out, which
  also parks it in a callee-saved register and permutes everything downstream.
  `sub_08074EEC` reads one `gUnknown_0861433C[index]` element inside a
  5-iteration loop that stores through a pointer, and the ROM re-`ldrh`s it each
  pass — so that table is declared without `const`, on the same evidence as
  `gUnknown_0849957C`. Read backwards: **a ROM table re-loaded inside a loop is
  positive evidence that the original's declaration was not `const`**, and it is
  visible before you spend an attempt.

  **"In a loop" is too narrow — the same tell fires across a plain `bl`, and
  there it costs two bytes rather than a permutation (wave 15).** A `const`
  global's MEM carries `RTX_UNCHANGING_P`, so CSE keeps it valid across a call;
  an unqualified one is killed by the call and reloaded. Family F049 reads
  `gUnknown_085D5ABC[c].unk18` on either side of `bl sub_080432E0` and the ROM
  keeps the element **address** in r6 and re-`ldrb`s through it. One body, two
  declarations of the same 0x5c layout, one probe:

  ```
  const : add r3,r3,r4 ; ldrb r6,[r3,#0x18] ; ... ; cmp r6,#0      <- value CSEd
  plain : add r6,r3,r4 ; ldrb r3,[r6,#0x18] ; ... ; ldrb r0,[r6,#0x18] ; cmp r0,#0
  ```

  The second is the ROM. So **two reads of one global straddling a `bl`, with
  the address rather than the value held live, means the declaration is not
  `const`** — and the const form is *shorter*, so this presents as your
  candidate being two bytes under, not over. `gUnknown_085D5ABC` had been
  `const` in `unknown-globals.h` since wave 6 and is now plain; the change is
  byte-neutral for all four already-promoted users, each of which reads it once
  (re-verified with `trymatch`, plus a 76-function sweep over every promoted
  function touching the structs edited in that wave).

---

## Proc wrappers — a free family, and the one trap in it

**Scope note added in wave 13, because everything below was derived on 20–32
byte leaves and the 384–512 band tests it.** The rules here hold at that size
with one gap that is easy to walk into. The gap: **the "read the parent off
which register is NOT written" table applies only to proc *starters*, and at
384 bytes and up you are almost always looking at a proc *body* instead** — a
function whose r0 already IS the proc, reached from a `ProcCmd` script rather
than from another wrapper. There is no `bl Proc_Start` to read anything off, so
that table has nothing to say and the useful readings are different ones:

- `adds rN, r0, #0` in the prologue with r0 never reloaded, plus any access at
  an offset above 0x29, is the proc-body signature. `sub_08073B00` (392 bytes)
  and `sub_08069B90` (428 bytes) are both exactly this, and `PROC_HEADER` plus
  `STRUCT_PAD(0x29, <first offset>)` fitted both first try — so the 0x29 header
  size and the `STRUCT_PAD` convention are now confirmed at this size, not just
  on the leaves.
- The 0x29 trap still fires the same way and is still free (a negative array
  size, i.e. a compile error rather than a mismatch), so keep writing the
  `PROC_HEADER` version first.
- **But do not reach for `PROC_HEADER` merely because the parameter is a struct
  pointer at these addresses.** `sub_0807D918` (384 bytes, 0x0807xxxx, reads
  +0x4c/+0x52/+0x58/+0x5c/+0x60) calls no `Proc_*` routine at all and is
  modelled with `u8 filler_00[0x4c]`. Members past the header are byte-identical
  either way, so filler costs nothing and asserts nothing — and the brief's
  "address adjacency is not evidence of what a blob is" hazard applies to
  function bodies just as much as to ROM data. Use `PROC_HEADER` when a
  `Proc_*` call or a sub-0x29 access proves it, filler otherwise.

The 0x0806xxxx–0x0807xxxx range is full of 20–32 byte leaves that are nothing
but `bl Proc_Start` or `bl Proc_Find` followed by one to three stores. Wave 8
took fourteen of them in one probe with no `try_match` attempts. The recipe:

```c
/* one store  */ ((struct UnkNProc *)Proc_Find(gScript))->unkNN = v;
/* two or more */ struct UnkNProc *proc = Proc_Start(gScript, parent);
                  proc->unkAA = a; proc->unkBB = 0; proc->unkCC = b;
```

Both spellings are already the house convention (`src/title-screen.c`,
`src/decomp/c_08011550.c`). The proc struct describes a pointer, so it goes in
the `.c`; the script goes in `unknown-globals.h` as
`extern const struct ProcCmd gUnknown_XXXXXXXX[];` — `const` is what proc.h's
prototypes take and it costs nothing.

**Read the `parent` argument off which register is *not* written.** agbcc sets
up r1 for `Proc_Start`'s second parameter, so the move into r1 names the source
directly, and its *absence* is the informative case:

| codegen before the `bl` | source |
|---|---|
| `mov r1, #N` | `Proc_Start(g, PROC_TREE_N)` — a root |
| `adds r1, r0, #0` | parent is this wrapper's **first** parameter |
| `adds r1, r2, #0` | parent is its **third** parameter (r0, r1 are the payload) |
| **r1 never written** | parent is its **second** parameter, passed straight through |

That last row is the one to know: `sub_0806E210` is `push {r4,lr}` /
`ldr r0,=g` / `bl Proc_Start` with r1 untouched, which looks like a one-argument
function calling a two-argument one, and is in fact `f(int a, ProcPtr parent)`.
It is *not* a calling-convention violation and does not belong in
`asm-resident.json` — the first parameter is still in r0.

**The trap: `PROC_HEADER` is 0x29 bytes, so a store below +0x29 through a
`ProcPtr`-shaped parameter means the object is not a Proc.** Offsets +0x24
(`proc_sleepTime`), +0x26 (`proc_mark`), +0x27 (`proc_flags`) and +0x28
(`proc_lockCnt`) are all inside the header, and a `strh r1,[r0,#0x26]` writing
`proc_mark` and `proc_flags` in one go is not something the compiler produces
from two separate members. `sub_0806D1F0` and `sub_0806D4C0` take a pointer to
some other object entirely; model it with `u8 filler_00[0x26];`. The failure is
loud and free — `STRUCT_PAD(0x29, 0x26)` is
`size of array '_pad_0x29' is negative`, a compile error, not a mismatch — so
write the `PROC_HEADER` version first and let the compiler tell you.

**"Parameter" is too narrow — the trap fires on `Proc_Start*`'s own return
value too, and that reading is much harder to trust.** `sub_080337D8` is
`bl Proc_StartBlocking` followed immediately by `str r4,[r0,#0x20]` and
`str r5,[r0,#0x24]` — proc_prev and proc_sleepTime, which `Proc_Start` in
`src/proc.c` has just initialised three instructions earlier. It looks
impossible, so the instinct is to doubt `PROC_HEADER` instead of the object;
do not. `src/proc.c` is a matching source, so the 0x29 layout is pinned by the
build, and the answer is simply that the wrapper does not treat what it got
back as a Proc. Model the whole prefix as `u8 filler_00[0x20];` in the `.c`,
exactly as for the parameter case — the codegen is identical either way for
members past the header, so nothing is lost by using filler when in doubt.

Also worth knowing here: a member offset that needs a runtime `adds rB, #imm`
in this family is almost always just the THUMB displacement limit
(`strb`/`ldrb` 0–31, `strh`/`ldrh` 0–62 even), not an address being taken.
`+0x36`, `+0x50` and `+0x64` all produce it from a plain `p->member = v`.

**The wrappers come in matched pairs, and spotting the pair is worth more than
reading either one.** At 0x08071EF0–0x08071F70 six consecutive wrappers cover
four scripts in exactly two shapes: a tree-3 `Proc_Start` taking only the
payload, and a `Proc_StartBlocking` forwarding its own second parameter as the
parent — the same script appearing in both. They differ only by the presence of
`movs r1, #3` (28 bytes vs 24), so once you have written one of each the rest
are a symbol substitution. The payload here is a **halfword** at +0x64, and the
argument is still `int`: `adds r4, r0, #0` with no `lsl #16; lsr #16` in front of
it rules out a `u16` parameter, because one that has to survive a `bl` would
carry the narrowing whatever the store width. `+0x3d` and `+0x58` do too. The same
holds one width up — `strh`/`ldrh` is 0–62 even, so a **halfword** member at
`+0x64` gets `adds r0, #0x64; strh r1, [r0]` while the `str` at `+0x5c` two
lines above it folds. `sub_08076770` and `sub_080767A8` write the same `+0x64`
field and both do it; word members at `+0x54`/`+0x58`/`+0x60` in the same family
never do.

**Past a certain size a wrapper family is best read as a SIZE HISTOGRAM, and
the sizes are the shapes.** 0x08071F88–0x08072288 is 41 consecutive forwarders,
the largest single-shape run found so far, and it collapses to five bodies that
`awlib`'s sizes name outright:

| size | body |
|---|---|
| 12 | `CALLEE(K);` — no parameter at all, the incoming r0 is dead |
| 16 | `CALLEE(K, parent);` — `adds r1, r0, #0`, parameter becomes arg **2** |
| 20 | `sub_080722B8(N, K, parent, NULL);` — `movs r3, #0` **last** |
| 24 | `sub_080722B8(N, K, parent, fn);` — pool `ldr r3` **second** |
| 24 | *or* the 20-byte body plus a second `bl` — check before assuming |

That last row is the trap and it is worth the one grep it costs: `sub_080721B8`
is 24 bytes sitting among the 20-byte ones and looks like the pool-word shape,
but it is `sub_080722B8(2, 8, parent, NULL); sub_08072394();` — two statements,
no pool word. **Two bodies of equal size in one family is normal; size selects a
candidate, the instruction stream confirms it.** All 41 matched first try from
one `compile_probe` of the whole batch, with the six callee prototypes settled
first — the prototypes were the entire job, the wrappers were free.

**This family is the one place a setter's argument width *is* recoverable, and
it is free.** The Workflow section states the negative half — a bare
`adds r4, r0, #0` saved across the `bl` and later stored with `strb` is an
`int`. The positive half is just as reliable, because every argument here has to
survive a call and PROMOTE_MODE narrows it in the prologue whatever the eventual
store width:

| prologue, before the `bl` | parameter |
|---|---|
| `adds r4, r0, #0` | `int` / `s32` — even where the store is `strb`/`strh` |
| `adds r4, r0, #0 ; lsl #24 ; lsr #24` | `u8` |
| `adds r4, r0, #0 ; lsl #16 ; lsr #16` | `u16` |

`sub_0806A4B0` is the `u8` row (stored `strb` at +0x3d) and `sub_0806E5CC` the
`u16` row (stored `strh` at +0x34). Read the shift, not the store.

**The epilogue says whether the starter hands the proc back**, by the general
`pop {r0}` / `pop {r1}` rule — and in this family the returned value is always
the `bl`'s own result, since nothing else touches r0 afterwards. So
`pop {r4, r5, r6} ; pop {r1} ; bx r1` on a proc starter is one extra source line
and nothing else changes:

```c
ProcPtr f(...) { struct T *proc = Proc_Start(g, parent); ...; return proc; }
```

`sub_080677BC` is the case; every other member of a 13-function wave-9 batch
popped into r0 and is `void`.

**A permuted callee-saved allocation in a multi-argument starter is not a signal
— do not chase it.** With three payload arguments the prologue copies r0/r1/r2
into r4/r5/r6, but *which* of the three each lands in is decided by the
allocator and is neither parameter order nor store order:

```
sub_08068014  r0->r4 r1->r5 r2->r6   stores a, b, c   (offsets 2c, 30, 34)
sub_08069FAC  r0->r6 r1->r4 r2->r5   stores b, a, c   (offsets 34, 38, 3c)
```

Store order alone would have predicted `b->r4, a->r5, c->r6` for the second and
it is wrong. Both reproduce exactly from the naive source, so the recipe is:
read the parameter-to-register map off the prologue, read the *store* order off
the body, write the statements in store order naming the parameters by their
argument register, and let the permutation fall out. Trying to reverse-engineer
the permutation into a source feature is wasted effort.

**Two `bl`s with nothing between them: `f(); g();` and `g(f())` are
byte-identical, and NOTHING in the wrapper tells them apart. The discriminator
is entirely on the callee side — whether `g` takes a parameter at all.** The
tempting reading is "if the source had nested them r0 would be moved, so a
clean `bl; bl` must be two statements". It is exactly backwards: r0 already
holds the result, so the nest is the spelling that needs *no* instruction. One
probe, five shapes, `push {lr}; bl …; bl …; pop {r0}; bx r0` throughout:

| source | between the two `bl`s |
|---|---|
| `f(); g0();` — `int f(void)`, `void g0(void)` | nothing |
| `g(f());` — `int f(void)`, `void g(int)` | **nothing — byte-identical to the row above** |
| `gu8(fu8());` — `u8` on both sides | `lsl #24 ; lsr #24` |
| `g(fu8());` — narrow return, wide parameter | `lsl #24 ; lsr #24` |
| `gu8(f());` — wide return, narrow parameter | `lsl #24 ; lsr #24` |

So the collapse needs **both** sides word-wide; any narrow type at either end
costs a visible 4 bytes. The practical consequence: for a bare `bl f; bl g`
wrapper, go and read `g`'s own body. If `g` reads r0 before writing it, `g(f())`
is available and the wrapper cannot decide between the two. If `g` takes no
argument — it opens with a `bl`, a pool `ldr` or a `movs` into r0 — the nest is
not expressible in C at all and the answer is two statements, for free. All 19
members of family F005 (16-byte `push {lr}; bl; bl; pop {r0}; bx r0`,
0x0800484C–0x08085298) are the nullary case and all 19 matched first try on it.

**The "save the proc, call something, maybe break" family is the same trap one
level up, and it reads even more convincingly as an argument pass (wave 14).**
Family F032 is `push {r4,lr}; adds r4,r0,#0; bl P; lsls r0,#0x18; cmp r0,#0;
bne; adds r0,r4,#0; bl Proc_Break`. The `bl P` with r0 still holding the
incoming proc looks exactly like `if (!P(proc)) Proc_Break(proc)` — and all six
members are `if (P() == 0) Proc_Break(proc)`, with **P taking no argument at
all**. `sub_08019850`, `sub_08019260` and `sub_080116A0` are each `f(void)` in
their own promoted sources. The `adds r4, r0, #0` is not "save it because we
pass it", it is "save it because the call clobbers r0"; the incoming r0 is
simply dead across the `bl`. Same discriminator as the row above — read the
callee's prologue — and it is worth stating separately because here there IS a
later use of the saved value, which makes the pass-through reading look
corroborated when it is not. Exemplar: `sub_08072288` in
`src/decomp/c_08071F88.c`.

**Family F062 is the unconditional twin of F032, and its three members split
THREE ways on that same question — which is the strongest case yet for "check
every member" (wave 15).** The shape is `push {r4,lr}; adds r4,r0,#0; bl A;
adds r0,r4,#0; bl B; pop {r4}; pop {r0}; bx r0`, 20 bytes, with no
`lsls/cmp/bne` — so B is unconditional and A's result, if it has one, is
discarded. Only the two callees vary. Reading callee A's prologue in each:

| member | callee A | what the `adds r4, r0, #0` means |
|---|---|---|
| `sub_0801153C` | `sub_08011218` — **nullary** (`Proc_EndEach(g)`) | save across a clobber; the F032 trap |
| `sub_08086058` | `sub_0808606C` — takes the proc (`+0x30`, `+0x4e`, `+0x5c`) | a real argument pass |
| `sub_08087B60` | `sub_08087B74` — takes an **`int`**, not a pointer | the saved value is an offset, not an object |

Three members, three different answers, from an instruction stream that is
byte-identical apart from the two `bl` targets. The third row is the one that
would not have been guessed: `sub_08087B74` and `sub_08087C14` both add the
value to a global's address (`&gUnknown_02027F74 + 4`, `&gUnknown_02027F78`),
so the natural `ProcPtr proc` reading is wrong even though the frame looks
exactly like the other two. All three matched first try once the callees were
read; none of them was readable from the wrapper.

**A one-instruction relative to that, from family F054: in `gFlag = K;
CALLEE(...)`, the store's address lands in r0 and its value in r1, which is
backwards from every other setter family and means nothing.** F008 and F017
write `ldr r1,=g; movs r0,#N; str r0,[r1]`; F054's members write
`ldr r0,=g; movs r1,#N; strb r1,[r0]` from the identical source shape, because
the `bl` two instructions later needs r0 and the allocator puts the address
there first. Read a swapped address/value pair before a call as register
allocation, not as a different expression.

**One family, several unrelated callee systems — so the wrapper's shape names
nothing, and neither does the script's address.** The 16-byte
`push {lr}; ldr r0,=g; bl f; pop {r0}; bx r0` family (F000 in
`data/families.json`, 72 members) reads as a run of proc pokers and is not one:
across 29 members in the 0x0804–0x0808 range the callee was `Proc_EndEach`
(22), `sub_080193B0` (the `gUnknown_0200C528` script list), `sub_0806377C` (the
`gUnknown_03001470` slot list), `sub_08067504` (`Proc_BreakEach` open-coded over
`sProcArray`), and `sub_0803B4DC`/`sub_0803B524` (sound ids, where the pool word
is a plain integer and not a symbol at all). **The callee decides the global's
type; the address does not.** Two of these — `gUnknown_08580C7C` and
`gUnknown_08581F40` — sit *inside* the 0x0858xxxx block that
`unknown-globals.h` documents as proc scripts and are `gUnknown_03001470`-list
blobs, provable only from their install/remove pair (`sub_080152EC(g, 3)` next
door, `sub_0806377C(g)` here). Typing them `const struct ProcCmd []` by
neighbourhood would have been wrong and byte-neutral, i.e. invisible.

The practical consequence is that the work in such a family is entirely in the
header: settle each callee's prototype and each global's type from *its own*
call sites, and every member is then one line. All 29 matched from a single
pass with zero `try_match` attempts spent exploring.

**F011 is the sharper case, and it shows that `varies` in `data/families.json`
already contains the whole answer before you open `asm/` (wave 14).** Its nine
members share `bl f; ldr r0,=g; movs r1,#N; bl h` and agree on *nothing else*:
nine distinct first callees, nine distinct pool words, and five distinct second
callees. Four of the nine end in `Proc_Start(script, PROC_TREE_3)` and are
proc starters; three are `gUnknown_03001470` installers; one
(`sub_0801B750`) drives a byte-script interpreter; and one (`sub_08039264`) has
a **function** address in its pool word and is the wave-12 `sub_0801F024`
callback-registration body with a leading `bl`. A wave-14 brief described the
family as "two sequential calls, second takes a ROM table", which is true of
three members out of nine — while the `varies` block named all five callees and
all nine pool words correctly, for free. **Read `varies` first and let it, not
the prose, tell you how wide the family is**; where prose and `varies` disagree,
`varies` has been right both times it has come up.

The same entry is also what flags the members that need a *different* shape of
thought: F024's `varies` shows `bl S` taking two values, `sub_08063A30` on four
members and `_call_via_r1` on two, which is the whole warning that two of the
six are indirect calls rather than direct ones.

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

**`bl _call_via_rN` is ORDINARY COMPILER OUTPUT — it is not a veneer and it is
not a reason to park anything (wave 14).** It reads like the interworking-veneer
tell three bullets up and it is the opposite of one. The GBA is ARMv4T and has
no `blx rN`, so agbcc compiles *every* indirect call in THUMB as a `bl` to a
libgcc trampoline that is one `bx rN`; `lr` is set by the `bl`, so the callee
returns straight past it to the original caller. There are 40 of these in this
tree across `_call_via_r0` through `_call_via_sl`. Two of them,
`sub_0801B6EC` and `sub_0801B6FC`, matched first try in wave 14.

Two things fall out of it that are free evidence:

- **The register index counts the arguments.** gcc puts the pointer in the
  first free scratch register, so `_call_via_r0` is a nullary indirect call,
  `_call_via_r1` a one-argument one, `_call_via_r2` two, and so on. This is a
  hard readout, unlike most arity guesses in a wrapper, and it is worth more
  than the call sites: it told wave 14 that `sub_0801B6EC(void *)` had a
  parameter before either caller was read.
- **A pool word at an ODD address in RAM is the function pointer's VALUE, not a
  variable's address.** Do not let the splitter's name mislead you here. When
  the pool word is a bare constant, `tools/gen_lds.py` invents a symbol at that
  exact address and `asm/` then prints `=gUnknown_0300619D` as though an object
  lived there. Check `aw2bhr.map`: for both wave-14 cases the range is `*fill*`,
  i.e. nothing is allocated, and the pointee is code copied into IWRAM at run
  time. The honest source is a constant or a macro — but see the relocation
  note in the Workflow section, because the honest spelling is not the one that
  matches.

The 0x0806F734–0x080718E4 block is the m4a/MP2K sound driver. `sub_0806F744`
loads `gUnknown_03007FF0` and compares `[r0]` against `0x68736D53` — that is the
canonical `SOUND_INFO_PTR` and m4a's `"Smsh"` ID_NUMBER.

**It is `m4a.c` interleaved with `m4a_asm.s`, not one hand-written block.** This
paragraph used to end "solved in other decomps and should be lifted rather than
re-derived"; wave 8 matched three entry points as ordinary C and wave 9 matched
two more, so the *code* cannot be lifted wholesale. The **data** can: this ROM's
`MusicPlayerInfo` and `MusicPlayerTrack` are the canonical MP2K layouts with
nothing moved, now named as far as +0x22 and +0x1f respectively in
`include/unknown-globals.h`.

Wave 9 spent four probes talking itself into a bogus "+1 shift" here first, so
the trap is worth stating: **the modulation block is `modM, mod, modT`, and a
public layout quoted from memory tends to drop `mod`.** Leave it out and every
field from +0x17 up looks off by one, which is exactly consistent enough to
believe. Do not reconstruct an MP2K struct from recall — read the LFO update at
0x0806FEF8, which names six of these fields in twenty instructions.

**Two more things worth knowing before scoping a batch here.** The driver keeps
*both* copies of some routines — `ClearModM` exists hand-written at
`sub_08070300` (track in **r1**) and compiled at `sub_08071564` (track in r0),
with the two zero stores in opposite orders. So an FE name tells you *which
routine* this is and nothing about which half of the file it came from; check r0
first, every time. And the hand-written half is first-class evidence about the
layout even though it will never match: `sub_080700C0` (ply_note) and the LFO
block above are where nine of the ten named track fields came from.

Cheap pre-filter when scoping a batch:

```
grep -n "arm_func_start\|non_word_aligned_thumb_func_start" asm/<file>.s
```

### Two more tells, one of them decisive; and one that looked decisive and is not (wave 18, W18-C)

**`mov ip, lr` … `bx ip` is hand-written, and it is decisive on its own.** agbcc
returns from a THUMB function that makes a call by pushing `lr` and popping it
into a **low** register: `push {lr}` … `pop {r0}; bx r0`. It never parks the
return address in `ip`, and it never returns through a high register. Two
independent controls:

- **Population.** Across the 959 promoted units in `build/src/decomp/`, `ip` is
  written exactly ten times and every one is `mov ip, rLOW` holding a *value*
  when the allocator has run out of low registers (`c_08024ABC.s`,
  `c_08036F68.s`, `c_0804D290.s`, `c_080876B4.s`, …); each is read back with
  `mov rLOW, ip`. There is no `mov ip, lr` and no `bx ip` anywhere in agbcc's
  output.
- **Probe.** A leaf that forwards one call, a `void` forwarder, a
  self-recursive function, and a body carrying ten simultaneously live values
  (which spills into r8/r9/sl *and* the stack) all emit `push {lr}` …
  `pop {rN}; bx rN`. The epilogue shape is not a pressure effect.

In `asm/` there are exactly **15** `mov ip, lr` and exactly **15** `bx ip`, they
pair 1:1, and all 15 are m4a track-command handlers. The idiom is what it looks
like: a routine that has to `bl` a helper but does not want a stack frame parks
`lr` in `ip` and returns through it — legal only because the *callee* is also
hand-written and known not to touch `ip`, which is a contract no compiler can
assume.

**THUMB `tst` is a second, weaker-but-free tell.** agbcc has no `tst` for
THUMB: eight spellings of "AND two values, test, discard the result"
(`a & b`, `(a & b) != 0`, `!(a & b)`, a `u8` pair, against a global, in a loop
condition, and as a returned `?:`) all emit `and` + `cmp #0`, and `tst` appears
**zero** times in the 959 promoted units. In `asm/` it appears 37 times: 6 in
ARM functions, and every one of the remaining 31 inside the m4a span
(`sub_0806F856`, `sub_0806FB84`, `sub_0806FDE4`, `sub_0807004C`,
`sub_080700C0`, `sub_080702C0`). Corroborating, not decisive on its own —
it is a mnemonic-level claim about one compiler build.

**`bl` to a mid-function local label is NOT a tell. 15 of the 19 sites in this
tree are ordinary compiler output, and a wave-18 brief had it the other way
round.** Resolve the target against the function index before reading anything
into it; there are three distinct causes and only the third means anything:

| cause | how to recognise it | sites |
|---|---|---|
| **agbcc's long branch.** THUMB `b` reaches ±2 KB; `bl` reaches ±4 MB. A `goto`/loop-exit past 2 KB becomes `bl`, which is safe because `lr` is already on the stack. | target is in the **same** function unit, at a delta **> 0x800** | 11 — `sub_0800CFDC` (+0x18DE ×4), `sub_0800FD44` (+0x8B6 ×2, +0x8AC), `sub_0807CE5C` (+0x834 ×3, +0x848) |
| **A split artefact.** The label *is* a real function entry; the splitter merged it into the unit above because nothing named it. | target is a different unit, but the bytes before it are a literal pool or `.align` padding, and the "owning" unit's own entry is never called | 4 — `_08079B38` ×3 and `_08036B48` |
| **A genuine second entry point.** | target is a different unit, inside real code, at a small delta, and the caller keeps executing afterwards | 4 — `bl _0806FBEE` from `sub_0806FBD4` ×1 and `sub_0806FCC8` ×3 |

The middle row is worth its own note because it produces a "function" that can
never be matched and is not hand-written either. `sub_08079B04` is two bytes of
`b _08079B38` sitting in front of the *previous* function's 13-word literal
pool; the real function starts at `_08079B38`, nothing ever calls 0x08079B04,
and the three `bl _08079B38` sites are ordinary calls. `sub_08036B34`'s unit
likewise carries a separate two-byte `_08036B48: b _08036B48` hang routine after
its pool, which `AgbMain` calls twice. **Before concluding anything from a `bl`
to a label, check whether the label is preceded by `.4byte` words.**

### What the 0x0806FBD4–0x0806FD97 block is, and where it ends

Verdict: **hand-written**, and 0x0806FBD4–0x0806FD97 is 100 % of it — every one
of the 19 units in that range either carries `mov ip, lr` … `bx ip` or was
already in `data/asm-resident.json`. It is not a clean contiguous block overall,
though: two more handlers of the same shape sit at `sub_08070328` and
`sub_0807033C`, with five ordinary-looking compiled units (`sub_0806FD98`
m4aSoundVSync, `sub_0806FDE4` MPlayMain, `sub_0807004C`, `sub_080700C0`,
`sub_080702C0`) in between. That is the m4a.c / m4a_asm.s interleave this
chapter already describes, seen at instruction granularity.

**The mechanism, which is what makes it a block rather than 17 coincidences.**
`sub_0806FC08` is the shared command-byte reader: two bytes of
`ldr r2, [r1, #0x40]` falling into `sub_0806FC0A`, which advances `cmdPtr`,
does `ldrb r3, [r2]` and then `b _0806FBEE` — so it takes the MusicPlayerTrack
in **r1**, returns the byte in **r3**, and its "return" is actually
`sub_0806FBEC`'s `bx lr` two bytes into *that* function. `_0806FBEE` is inside
`sub_0806FBEC`, not inside `sub_0806FC08`. Every handler in the run is then the
same four lines:

```
mov ip, lr            @ no frame
bl sub_0806FC08       @ next command byte -> r3, track in r1
strb r3, [r1, #N]     @ one MusicPlayerTrack field
ldrb r3, [r1] ; orrs r3, #M ; strb r3, [r1]    @ set the dirty bits
bx ip
```

**A hand-written dispatch table and a compiler-generated one differ in a
nameable way: the compiled one has ONE frame.** A `switch` compiles to a single
function with one prologue, one epilogue and a `.word` table or a compare chain,
and every arm shares them. Here there are N separately addressed, frameless
routines, each with its own entry and its own `bx ip`, agreeing on an argument
register (r1) and a return register (r3) that no C prototype can express, and
reached from the ply table by address. That is a table of hand-written
subroutines, not a compiled `switch`.

**How much this implicates.** Less than the `bl` evidence suggested and more
than the brief's six: the `bl`-to-local-label sites implicate only **two** new
functions (both of which also carry `mov ip, lr`), while `mov ip, lr` implicates
**15**, none previously recorded. With `sub_0806FC64` (which branches into
`sub_0806FC08`'s unit with `b _0806FC16` and consumes its r3 return),
`sub_0806FB6C` (clobbers r4 with no `push` anywhere, saving it in `ip`) and
`sub_0806FB84` (an 80-byte unit holding *two* complete frames), that is **18**
new entries in `data/asm-resident.json`.

Deliberately **not** added, and worth stating so nobody re-derives it:
`sub_0806FDE4` (MPlayMain), `sub_080700C0` (ply_note), `sub_080702C0`
(ply_endtie) and `sub_0807004C` (TrackStop) all carry the `tst` tell and all
call `sub_08070090` (ChnVolSetAsm), which takes both operands in r4/r5 — but
`tst` alone is a mnemonic claim, and a caller setting up r4/r5 was not verified
instruction by instruction here. They are the obvious next batch for anyone
extending this list, and they should be entered on their own evidence.

---

## Formerly blocked functions -- all six are now matched

**Nothing in this repo is currently known to be blocked on register
allocation.** The three original ones are `sub_080308B4`, `sub_08063980` and
`sub_08001158`; the first fell to decomp-permuter, the other two did not fall to
it at ~100,000 and ~84,000 iterations and then fell to one free `compile_probe`
each once the *type model* changed. Both fixes are recorded above -- the
non-volatile read under "`orr` operand order" and the bound index under
"Binding the scaled index". Neither is reachable by rearranging an AST, which is
why the permuter could not find them and why the iteration counts were evidence
rather than bad luck.

Wave 8 added three more (the m4a trio below) and they went the other way: the
permuter solved them in minutes and hand-reasoning had already burned 35
spellings. **So "the permuter cannot find these" is not the rule -- the rule is
that it cannot find a change to the type model, and it is very good at finding a
change to liveness or statement structure.** Reach for it once a diff is a pure
register permutation AND a type sweep has come back flat.

**That gating is right for small functions and too strict above ~256 bytes.**
Measured on `sub_0804D928` (280 bytes) from a real 60.7% near-miss whose diff
was one MISSING INSTRUCTION plus a register swap -- not a pure permutation, and
so exactly the case the paragraph above says not to bother with -- three
independent runs reached a byte-exact match in 26, ~196 and 39 iterations, all
inside six seconds of a 600-second budget. The randomizer edits per statement,
so its search space grows with the statement count while the number of wrong
statements stays at one; a long straight-line function is close to its best
case. Numbers, the fix it found, and the caveats are under "Large functions".
**Above 256 bytes, run it for 300 s before the third hand rewrite, whatever the
diff looks like.**

The transferable lesson, since it has now paid twice: **when a diff is a pure
register permutation and the expression shape is already right, the next move is
to change a type or bind a subexpression to a local, not to search harder.** A
sweep of 16 spellings in one probe costs one tool call and no attempts.

**Wave 8 found a third axis, and it is the one neither of those two covers: a
statement that emits NO code can still decide the allocation, because liveness
is computed before the statement is deleted.** `sub_080703B8`, `sub_080703D4`
and `sub_08070620` (m4a `m4aMPlayContinue` / `MPlayFadeOut` /
`m4aMPlayFadeOutTemporarily`) were each 84-93%, correct size, correct
instruction selection, correct pool, differing only in whether the `ident` temp
landed in r1 or r3. **Thirty-five spellings across both of the axes above moved
nothing**: `!=`-with-early-return, `goto`, `do/while(0)`, a local for the ident,
a local for the status, a local for the pointer, a local for the speed, K&R
parameter lists, `register` on parameters and locals, an extra unused parameter,
an unused local, `volatile` on either field or both, `s32` vs `u32` ident, raw
`u32 *` and `void *` parameters with hand-written offsets, and `^`-instead-of-
`==`. The answer was one extra line:

```c
u32 ident = mplayInfo->ident;
if (ident != ID_NUMBER) return;
...
mplayInfo->ident = ident;      /* compiles to nothing; deleted as redundant */
```

The store is dead — GCC removes it and the function is the same length without
it — but it extends `ident`'s live range past the branch, so `ident` conflicts
with the body's temps and global-alloc gives it r3 instead of r1. This is the
m4a file's house idiom (every entry point re-stamps `ident` on the way out; the
ones that touch tracks bump it first), so it is almost certainly what the
original wrote, not a trick.

**Two consequences.** First, add "does a value need to stay *live* longer?" to
the type-and-binding checklist — the diagnostic is a temp sitting in a
high register while a lower one is free in the same block, which means the
allocator saw a conflict you have not reproduced. Second, this is exactly the
kind of edit a human never enumerates and the permuter finds immediately: it
reached zero score in **4,566 iterations, under five minutes**, having invented
`mplayInfo->ident = mplayInfo->ident;`. Read that output as a *pointer to the
mechanism* and then write the idiom the original would have used, rather than
committing the self-assignment.

**The free-liveness trick is word-only, and wave 9 hit the wall.** The store
above emits nothing because it is a redundant SImode `str`; the same shape on a
`u16` member does **not** vanish, so you pay two bytes for the liveness and the
idiom is unusable there. One probe, one struct, the same "keep this value live
past the multiply" goal:

```c
mplayInfo->ident = ident;            /* u32 member, value from a local  -> deleted   */
mplayInfo->tempoD = mplayInfo->tempoD; /* u16 member, direct            -> load AND store both deleted */
d = mplayInfo->tempoD; ...; mplayInfo->tempoD = d;   /* u16 via a local -> `strh` SURVIVES */
```

Note the middle row is not a workaround: deleting the load too is exactly what
removes the liveness you were buying. So on a halfword member the trick has no
form that both keeps the value live and costs nothing. It *does* work — the
third row produces the target's `mov rD,rX ; mul` copy shape and its
`push {r4, lr}` — which is how the mechanism was confirmed; it just cannot be
spent. `sub_080713F8` (m4a `MPlayTempoControl`) is parked one dead `strh` away
on exactly this.

**And the vehicle has to be a store to MEMORY. A dead assignment to a local
buys nothing at all** — `life_analysis` deletes a dead register set before the
liveness it would have created is ever recorded, so the value dies at its last
real use exactly as if you had not written the line. Four spellings tried on
`sub_0801A6C0`, all byte-identical to omitting them: `i = v;` on a dead counter,
`p = (T *)v;` on a dead pointer, a store immediately overwritten on the next
line (`g.m = v; g.m = 0;` — agbcc drops the first), and the same pair on a
different member. Reach for the idiom only where the extra reference lands in a
real, surviving store.

`decomp-permuter` is still wired up and is still the right tool when the
obstacle really is allocation:

```
python tools/permute.py sub_08063980 --seconds 600 -j 6
```

It starts from `work/<fn>/best.c`, searches, and re-checks every result with
`trymatch` — the permuter's own score diffs objdump text, which is weaker than
byte equality, so it is a search signal and not a verdict. See `vendor/README.md`.

**It cannot run on any draft that includes `hardware.h`.** The permuter's own C
parser (pycparser) does not accept `__attribute__((aligned(N)))` on a struct
definition, and `IO_ALIGNED(2)` on `struct DispCnt` and its neighbours is the
first thing it hits:

```
error: the permuter could not score the starting point.
  Syntax error in base.c.
  before: 4 at approximately line 1164, column 31 (after PERM expansion)
  struct __attribute__((aligned(4))) DispCnt
```

That rules it out for the whole display-shadow family — `gDispIo`,
`gUnknown_030030E0`, `gUnknown_030030A4`, the `BgCnt` mirrors — which is
precisely the code most likely to near-miss on allocation. Do not read the
failure as a broken permuter or a broken draft; it never compiled anything.
Solve those by hand, and reach for the `do { … } while (0)` barrier above first.

| function | was | what it actually was |
|---|---|---|
| `sub_080308B4` | 96% | `-fforce-addr` address-taking: one assignment moved out of a declaration. Found by decomp-permuter on iteration 134 of its first run. |
| `sub_08063980` | 80% | A **volatile** byte read where the original's was plain. `orrs r1, r0` vs `orrs r0, r1` was a symptom, not the problem. |
| `sub_08001158` | 88.2% | The scaled index needed to be **bound to a local**. The reported "8 bytes" and the story about `y * 2` killing a register early were both descriptions of the symptom. |
| `sub_080703B8` | 92.9% | A **dead store that keeps a value live** past the branch. Permuter, 4,566 iterations. |
| `sub_080703D4` | 84.4% | Same, transferred by hand once `sub_080703B8` explained it. No permuter run needed. |
| `sub_08070620` | 84.4% | Same. |

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

**Currently open: `sub_0801A6C0`, parked at 98.4% — one byte.** A clear-loop
plus three zero stores, exact in every respect except which of two values live
across the loop gets r3 and which gets r4 (the base pointer and the hoisted
zero, swapped). The full list of what was ruled out is in
`work/sub_0801A6C0/sub_0801A6C0.c` and is long enough to be evidence in its own
right: every statement order, every loop form, four types for the constant,
the dead-statement trick above, and 106,936 permuter iterations in 600s that
never beat the starting point. Per the paragraph above, read that as the axis
being wrong. The one thing that *does* move the tie-break is giving the zero a
third reference — which is how the draft gets to one byte — so whatever the
original wrote, it kept that constant live past the loop for a reason that is
not visible in the three stores that follow it.

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

**"Moving a field" means moving the *byte offset*, not moving the declaration —
re-basing a nested array is safe and is sometimes the only way forward.** When a
new function reaches a sub-record at an offset *below* the sub-array's declared
base, the base is wrong and no amount of adding members reaches it: the offset
would have to be a negative member offset. Slide the array base down and rename
every member up by the same amount, and the absolute offset of every existing
access is unchanged, so the change is byte-neutral by construction and the
edits to the promoted files are mechanical. Wave 9 did this to
`struct Unk085D3DD0`: `sub_08039F18` reaches `base + a*0x104 + b*0x44 + 0x38`
and the sub-array was declared at +0x40, so it moved to +0x38 and
`unk40[b].unk06` became `unk38[b].unk0e` in five places. All fourteen functions
in `c_08042E2C.c` plus `c_08042DCC.c`, `c_08042E18.c` and `c_08043D84.c` still
match. Two things worth carrying:

- **Verify it, do not reason it.** The check is `python tools/sync_work.py`
  followed by `trymatch` on every function in the files `grep -rl` names — that
  is a real verdict, and it is what makes this a 30-second change rather than a
  leap of faith. (This bullet used to add "for a multi-function promoted file
  `sync_work.py` deliberately leaves the drafts alone, so edit
  `work/<fn>/<fn>.c` by hand". **That is out of date** — it splits them, and
  wave 17 fixed a boundary bug in that splitter; see the wave-17 section in the
  large-function chapter.)
- **A re-base often falls out exactly, and that is corroboration.** At +0x38 the
  record array covers `struct Unk085D3DD0` to the byte (`0x38 + 3*0x44 == 0x104`)
  and the old `filler_c8[0x3c]` tail disappears — the trailing filler was itself
  an artefact of the wrong base. An extent that had been guessed became proved.

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
     gUnknown_0200D510  layer heads, 16 of them
     gUnknown_0200CD10  the entry pool, 0x800 bytes == 128 entries, and it ends
                        exactly where the head array begins
     gUnknown_03002B24  pool cursor, reset to gUnknown_0200CD10
     gUnknown_0808F090  a ROM word holding 0x0200D510, i.e. &gUnknown_0200D510;
                        sub_0801BE78 is its only user and reaches the heads
                        only through it
   sub_0801BE78 is the reset: it chains head[i].next = &head[i+1] and clears
   every head[i].object, then breaks the chain at index 15 (the end) and at
   index 4. Why index 4 in particular is unexplained -- nothing else in the
   tree touches it yet. */

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

/* 0x08063DDC-0x080640EC is a 20.12 FIXED-POINT MATRIX LIBRARY, and it is the
   one cluster here with no global at all -- every routine takes its operands
   as pointer parameters, so the types live in the .c files rather than in
   unknown-globals.h. Recorded here because the layout is what makes the whole
   block fall out at once:
     struct Mtx43 { s32 m[4][3]; }   0x30 bytes, row stride 0x0c
     struct Vec3  { s32 x, y, z; }   0x0c bytes
   0x1000 == 1.0, and every product is renormalised with `asrs #0xc`.
   The layout is proved three times over: sub_08063F98 loads the identity and its
   three 0x1000 stores land at +0x00/+0x10/+0x20, which are m[0][0], m[1][1]
   and m[2][2] only under a 0x0c row stride; and sub_08063E28 reserves exactly
   `sub sp, #0x30` for one temporary and walks its right-hand operand's columns
   at 0x0c while walking rows at 4.
     08063DDC  Vec3 x Mtx43, rows 0-2 only -- the DIRECTION transform. It reads
               the matrix column-wise (+0x00/+0x0c/+0x18, then +0x04/+0x10/+0x1c,
               then +0x08/+0x14/+0x20), which is the same 0x0c row stride seen
               from the other side and is a third independent proof of it.
               Skipping row 3 is what makes it the direction rather than the
               point transform.
     08063E28  multiply, into a caller-supplied dst (aliasing-safe: it detects
               dst == either operand and routes through the stack temporary,
               then calls 08063FB8 to copy it out)
     08063F98  load identity      08063FB8  copy (element-wise, NOT `*dst = *src`)
     080640C8  Vec3 dot product, `>> 12`
     080640EC  Vec3 cross product, `>> 12`
   The whole block is the naive spelling with no locals anywhere. The vector
   operands' components stay live in r4-r6 across all three output stores
   without a local, because the stores are SImode and a word store does not
   invalidate a cached load -- see the sub_08044178 / sub_08064BC8 split under
   Aliasing. Reaching for a local here is the wrong instinct and costs a frame.
   Row 3 is the translation: 08063E28's last three terms add a[3][j] after the
   shift instead of multiplying it. Still unworked in this block: sub_08064214
   (08063E28's only caller) and the rest of 0x08064xxx. */
```

`BLEND_EFFECT_ALPHA/BRIGHTEN/DARKEN/NONE` are referenced by macros in
`hardware.h` but never defined anywhere. Literals 2 and 3 are brighten/darken.

---

## Shape families — what clusters, what does not, and the tool that finds them

`tools/families.py` clusters every function by normalised instruction shape and
writes `data/families.json`. It exists because batching by shape is the biggest
single lever on match rate found so far, and every family used that way up to
wave 11 was found by eye — by scanning for runs of equal size at equal address
spacing. That method only sees families that are contiguous in memory. **The
`Proc_Find` existence-predicate family is 29 functions spread from 0x0801C7B4 to
0x0808AA88; the paragraph above claiming 13 was counting the 13 that happen to be
adjacent.** (Left as written above, because the 13 it describes are correct and
the codegen claim it makes is the point; read the count as a floor.)

### The normalisation, and why each choice

It is `fe_signatures.signature()`'s `full` signature with exactly one axis
flipped. Per instruction: mnemonic, then operands with **immediates → `#`**,
**local labels → `L`**, **all other symbols → `S`**, and **a branch to a local
label → its delta in instruction indices**. Literal-pool words are excluded
entirely (`awlib.instructions()` already drops `.4byte`), and their contents are
reported separately as what *varies* between members.

**Registers are kept, and that is the one divergence from `fe_signatures`.** The
two tools answer different questions and the difference is not cosmetic.
`fe_signatures` compares AW2 against four other games built from different
sources by a different build, where register allocation is noise and has to go.
Inside one ROM built once, agbcc's allocation is a deterministic function of the
source, so **a register difference is a source difference.** Measured on the
41-member `push {lr}; movs rN,#imm; bl f; pop {rM}; bx rM` shape:

| shape | n | source |
|---|---|---|
| `movs r0,#imm` … `pop {r0}` | 34 | `void g(void)  { f(imm); }` |
| `movs r0,#imm` … `pop {r1}` | 3 | `int  g(void)  { return f(imm); }` |
| `movs r1,#imm` … `pop {r1}` | 3 | `int  g(int a) { return f(a, imm); }` |
| `movs r1,#imm` … `pop {r0}` | 1 | `void g(int a) { f(a, imm); }` |

**The register holding the immediate names the argument position, and the `pop`
register discriminates void from value-returning** (`pop {r0}` overwrites the
callee's result, so it was discarded). Those are four different C templates, not
four spellings of one — an agent handed the erased version has to notice the
split itself, which is exactly the work batching was supposed to remove. The same
reading applies to `ldr r0,L` vs `ldr r1,L` before a `bl`, and to which register
an `lsls/lsrs` cast pair operates on.

Cost of keeping them, ROM-wide: **16 members** (2.2%) drop out of any family, and
13 shapes split — but the shards are 72/6/1, 50/5, 34/3/3/1, 19/1, 9/1 and so on,
i.e. one dominant template plus a handful of genuinely different ones. Cheap, and
it buys the guarantee that a family is one body.

**Callee names are erased, and that is load-bearing in the other direction.** The
41 forwarders at 0x08071F88 call eight different functions and are four
templates; `push {lr}; bl f; pop {r0}; bx r0` is 50 functions calling 48 distinct
targets. Keeping callees shatters both into singletons. Same argument for the
pool: "same shape, different global" is the family you want to find.

A second **fuzzy** tier widens each exact family to shapes within ~2 edits of its
representative, compared on the register-*erased* sequence. Two constraints were
found by measurement and both matter:

- **It must be anchored on an exact family, never transitive.** The first cut
  used union-find over all pairwise links and transitivity destroyed it: A~B and
  B~C merge even when A and C share nothing, producing a 110-member "family"
  across 71 shapes and sizes 20 through 48. Anchoring costs recall and buys the
  property that matters — every member is within two edits of the one function
  the agent is told to solve first.
- **Minimum 10 instructions.** At 8, `push/bl/pop/bx` and `push/movs/bl/pop/bx`
  are one edit apart and the whole 4–8 instruction wrapper population fuses.
  Short shapes lose nothing: they already cluster exactly, and fuzz only blurs
  them.

### What clusters well

- **Forwarders and wrappers** (4–8 instructions). The largest populations in the
  ROM by a wide margin and essentially free once the shape is written once.
  **F001 is the floor of this**: 50 members of `push {lr}; bl S; pop {r0}; bx r0`
  and nothing else, 12 bytes each. Wave 12 took the 43 open ones in a single
  probe with zero `try_match` attempts spent exploring, because *the wrappers
  are not the work — the callee prototypes are*. Two things follow, and both
  cost time if they are learned per-function:
  - **The wrapper's arity is invisible from the wrapper.** It sets up no
    argument register, so `void f(void)` and `void f(a, b) { g(a, b); }` are the
    same twelve bytes; ten of the 43 turned out to pass one or two parameters
    straight through, and every one of those arities came from reading the
    CALLEE's prologue for which of r0–r3 it reads before writing. Note this is
    not the same as the 12-byte row in the Proc-wrapper size histogram further
    up, which is `CALLEE(K)` with a pool word — no pool word here at all.
  - **The wrapper's `pop {r0}` says nothing about the callee's return.** It
    overwrites r0 before the branch, so an `int`-returning and a `void` callee
    are indistinguishable at the call. Read the callee's own epilogue. (The one
    member that pops into r1 instead, `sub_0801A168`, is the exception that
    opened the missing-`return` hole documented in "Reading types off the
    assembly".)
- **Long straight-line functions differing only in globals.** The best find is
  F022: seven 188-byte, 75-instruction functions at 0x0805CA60–0x0805D2xx that
  differ in two globals and one compared constant (`cmp r0,#1` vs `#4` vs `#5`).
  1,316 bytes behind one worked shape. **Size does not predict family-ness in
  either direction** — a 188-byte function can be a template instance.
- **Bitfield predicates.** The 5×44-byte family at 0x08045848 is
  `(gPtr[...])->bits >> 5 == 1` with different table offsets.
- **Getter/setter one-liners** (`ldr r1,L; movs r0,#; strh r0,[r1]; bx lr`).
- **Literal duplicates.** A family's `varies` list is the whole difference
  between its members, so an *empty* entry for every index means two members are
  byte-for-byte the same function. F043 is four 72-byte wrappers that are two
  duplicated bodies: `sub_08023DCC` == `sub_08023E14` and `sub_08023E5C` ==
  `sub_08023EA4`, same callees, same global, same relocations. Do not go looking
  for a distinguishing constant — write one body and instantiate it twice. Read
  `varies` before reading the assembly of the second member; it is the cheapest
  diff in the tree and it answers "what do I actually have to change" outright.

**Read `varies` as COMPLETE in both directions, and it makes a whole class of
predictions free to check (wave 14).** The list is normally used forwards — "so
these are the things I have to derive". The backwards reading is worth as much:
an instruction index that is *absent* from `varies` is byte-identical in every
member, **including the already-matched ones**, so it is already answered by the
exemplar and needs no derivation at all. Wave 14 was told that its two F038
targets differed from their matched siblings in "using `ldrsh` where several
exemplars use plain loads"; `ldrsh r0,[r0,r1]` is not in F038's `varies`, so all
five members share it and there was nothing to work out. F038's `varies` has
exactly two entries — the byte offset and one return constant — and that was the
entire job for a 56-byte function. Ten seconds of reading the family record
refutes a wrong prediction about the assembly before you open the assembly.

### What does not cluster, and must not be made to

- **Size.** Twenty-five clustered functions in the ROM are 44 bytes and they fall
  into five unrelated families (16, 19, 15 and 19-instruction shapes). Any
  heuristic that treats equal size as evidence merges them. This is the third
  validation check below and it is there because size-and-spacing scanning is
  precisely the method being replaced.
- **Return stubs.** 83 functions are the single instruction `bx lr`. They cluster
  perfectly and mean nothing; excluded via `awlib.is_trivial()` because they are
  handled by the bulk stub sweep, and including them puts a meaningless
  83-member family at the top of every ranking.
- **Shapes under 4 instructions**, for the same reason.

### Validation — the tool re-derives all three known families

Run on every invocation; `families.py` exits non-zero if any check fails, because
clusters that cannot be checked against something already known would get
believed and batched on blindly.

| check | result |
|---|---|
| 41 forwarders at 0x08071F88–0x08072288 → ~4 clusters | **PASS** — 4 clusters of 14/11/8/6 plus one member that joins a larger family elsewhere; 40 of 41 clustered |
| `Proc_Find` predicate family → 29 members | **PASS** — 29, spanning 0x0801C7B4–0x0808AA88, all 29 already matched |
| 44-byte bitfield family not merged by size | **PASS** — 4 exact, 5 with the fuzzy tier (the fifth hoists one `ldr` two instructions earlier, same source, different schedule); the other four 44-byte families stay separate |

Current totals: **98 families ≥ 3 members, 698 members, 451 of them still
unmatched**, plus 20 fuzzy clusters. Read `data/families.json` → `batching_plan`
for the ranked list; `with_exemplar` entries are cheaper than `cold` ones because
the shape is already solved in `src/decomp/`.

### `shape_map.py` at 0.610: a TAIL-ONLY pair is still worth batching, for a reason the score does not express (wave 18, W18-C)

Wave 18 predicted that `sub_080255F4` / `sub_080257C0` at 0.610 was below the
useful threshold, on the correct observation that their callee sets are disjoint
and the whole score comes from a shared four-neighbour tail. Both halves of that
observation held. The conclusion did not, and the reason generalises:

- The **shared idiom was worth solving once.** The tail is family F061's shape
  (see `src/decomp/c_0800B5C0.c`) with a `u16` accumulator, and the two
  functions differ only in the callee. Written once, instantiated twice.
- **The pair was the only evidence for a parameter width.** `sub_08025744` and
  `sub_08025598` have byte-identical body shapes and take *different* parameter
  widths — `int` and `s16` respectively. Neither is visible from its own body,
  and neither is visible from one caller: `sub_080255F4` reads `s16` off the
  narrowings it does and does not emit, while `sub_080257C0` is blind because
  all four of its arguments are `ldrb`-derived so an `s16` conversion would be
  elided at every site. `sub_080257C0`'s width had to be read from
  ARGUMENT-SETUP ORDER instead (see below). Batching them together is what put
  the two readouts side by side.

So a low `shape_map` score on a **tail-only** overlap means "these are two
functions, not one instantiated twice" — not "do not batch them". The cost model
that follows is: budget them as two independent functions, and expect the
overlap to pay in the header rather than in the second function's draft.

**Four more data points at 0.42–0.53, and they say the ratio is a poor cost
metric even when it is telling the truth about shape (wave 18, W18-C).** All
four matched; the batch was `sub_08066470` (0.423 against `sub_08027CC8`),
`sub_08052154` / `sub_08052CA4` (0.530) and `sub_08050B70` (0.541).

- **The shape claim held.** Unlike the 0.610 pair, these were real:
  `sub_08052154` and `sub_08052CA4` have identical global sets, an identical
  prologue and differ in three nameable places, and `sub_08050B70` shares the
  same skeleton with a different tail. So a low ratio does not mean a false
  family — 0.610 was misleading for a reason (tail-only overlap) that the
  number itself does not express, and reading the *callee sets* is what
  separates the two cases in ten seconds.
- **The ratio ordered the cost exactly backwards.** `sub_08066470`, the LOWEST
  score in the batch at 0.423, was the cheapest function in two waves — one
  probe, one `try_match` — while `sub_08050B70` at 0.541 was the most
  expensive, and every one of its probes went on a single novel tail.

What predicted cost was **whether a matched exemplar covered the whole
function**, not similarity to anything. `src/decomp/c_08051DE0.c` covers
`sub_08052154`/`sub_08052CA4` end to end (one probe each); it covers
`sub_08050B70`'s first two thirds and stops at the dispatch tail (four probes);
and `sub_08066470` scored lowest precisely because its tail differs, while the
part that *was* covered — by `c_0806E240.c` and two functions matched an hour
earlier — was the whole expensive middle. **Rank a shape batch by exemplar
COVERAGE, and use the ratio only to find the candidates.**

**And the sharper rule that fell out of it: where a narrowing would be elided,
argument-setup ORDER is still a readout.** agbcc evaluates a call's arguments
before it loads them into r0..r3, so an argument that needs *any* computation is
emitted ahead of an argument that is a plain register copy — whatever their
positions. On `f(x, y - 1)` with an `int` callee that gives
`subs r1, r5, #1; adds r0, r4, #0`; declare the callee `s16` and the two come
out in argument-number order instead, because the (later-deleted) conversion
changes which argument the front end treats as trivial. That 2-instruction swap
is the entire difference between `int` and `s16` on a call whose values are
provably in range, and it is invisible to the usual narrowing readout.

---

## The column-offset fold is a TYPE discriminator: struct row vs array row (wave 17, W17-A)

`sub_0804FA2C` reads column 9 of `gUnknown_085D6A48` (stride 24). The ROM:

```
lsls r0, r0, #3        @ X*24
adds r0, r0, r5        @ + base
ldrh r1, [r0, #18]     @ column 9 folded into the LOAD DISPLACEMENT
```

`u16 g[][12]` indexed `g[X][9]` **cannot** produce that. `fold`'s `split_tree`
pulls the `INTEGER_CST` out of the address `PLUS`, so `base + X*24 + 18`
reassociates to `(base + 18) + X*24` and agbcc emits

```
adds r1, r5, #0
adds r1, #18
adds r0, r0, r1
ldrh r1, [r0]          @ four instructions instead of two
```

Spelling the row as a **struct** — `((struct Row *)g)[X].unk12` — makes the
column a `COMPONENT_REF`, whose byte offset is applied to the MEM rather than to
the address tree, and reproduces the ROM exactly. Measured on `sub_0804FA2C`:
664 -> 660 bytes, and it is the only spelling of the six tried that gets there.

**So the fold is a readout of the original's type for the row**, and it is the
first discriminator anyone has had for "array of arrays" vs "array of structs":

- constant column folded into the `ldrh`/`ldrb`/`str` displacement -> the row is a
  **struct** and the column is a member;
- constant column added onto the base before the index -> the row is an **array**.

Both appear in the same function, so this is not a compiler mood. `sub_0804FA2C`
folds `gUnknown_085D6A48`'s column 9 into the displacement while hoisting every
one of `gUnknown_03004580`'s columns (`[3]`, `[5]`, `[2]`) onto the base -- so
085D6A48's rows are structs and 03004580's rows are a plain `u16` array, in one
compilation unit and one function.

**Caveat, recorded because it is not resolved.** At column 0 the two spellings
are the same SIZE but not the same bytes: swapping `gUnknown_085D6A48[X][0]` for
`((struct Row *)g)[X].unk00` in `sub_0804D290` moved it from 96.3% to 95.3% at
600 bytes both ways, by reordering the instructions around it. Do not assume
column 0 is neutral, and do not retype a global on column-0 evidence. That is
why `gUnknown_085D6A48` is still declared `u16 [][12]` in
`include/unknown-globals.h` with the struct evidence recorded next to it.

## A zero-trip `do { } while (0)` also works on straight-line code (wave 17, W17-A)

The lever documented in the soft-float chapter -- `allocno_compare` weights every
reference by `loop_depth`, so a zero-trip loop promotes the pseudos inside it --
is not specific to a math routine. On `sub_0804D290` (600 bytes, zero backward
branches, zero `.LC` words) it was worth **12 bytes and 55 percentage points**:

| spelling | size | identical |
|---|---|---|
| plain | 588 (-12) | 41.7% |
| + two `u16 *` locals for the camera-origin reads | 588 (-12) | 26.7% |
| + `do { } while (0)` round the one call statement | 596 (-4) | 60.3% |
| both | **600 (exact)** | 96.3% |
| both + the address anchor in the next section | **600 (exact)** | **MATCH** |

The loop is necessary but not sufficient, and the last row is the point: it gets
the instruction stream and the register assignment exactly right and still
leaves 22 bytes, all of them one misplaced `ldr`. **Do not read a size-exact,
register-exact candidate as "nearly there by luck" — finish it with the
creation-order lever below.**

The diagnosis it encodes is the same one: "the ROM gives `&gUnknown_03004580` a
higher allocation priority than your spelling does". Without it, `0xb4` (the
`gUnknown_02029A10` group stride, six references) wins `r6` and the address
(two references) is pushed to `sl`; every `muls` then costs an extra `mov`, in
the ROM's favour, and the candidate comes out *smaller* than the original.
**A candidate that is smaller than the ROM in the multiply-heavy middle of a
straight-line function is an allocation-priority signal, not a missing
statement.**

Note this cuts against the naive reading of `allocno_compare`: the ROM gives its
scarce low callee-saved register to a two-reference, whole-function-live address
and not to a six-reference constant, which priority alone does not explain. The
zero-trip loop is the only lever found that reverses it.

## Of two address constants, the pseudo created FIRST wins the register — and it is reachable from source (wave 17, W17-A)

This is the rule that closed `sub_0804D290` and `sub_0804DCA8`, and it is the
sharpest register-allocation lever found so far because the source construct
that drives it is a *position*, not a value.

Both functions call
`sub_08057D44(gUnknown_085D6A48[gUnknown_03004582[i][0]][0], gUnknown_03004580[i][3])`
and read `gUnknown_03004582` and `gUnknown_03004580` once more each, three
statements later. Two globals, **two uses each, in the same two statements** —
perfectly symmetric. The ROM gives the callee-saved register to
`gUnknown_03004580` and rematerialises `gUnknown_03004582` from the pool at both
uses; every natural spelling does the opposite.

**What decides it is allocno order, and allocno order is RTL creation order.**
`allocno_compare`'s tie-break is literally `return v1 - v2` — the allocno
number, assigned in order of first appearance. Two symmetric address constants
tie on `log2(n_refs) * n_refs / live_length`, so the one whose pseudo is created
first takes the register. And the winner's single `ldr` is then emitted at the
head of the statement, while the loser's is re-emitted at each use — so **the
literal-pool word order is a direct readout of which pseudo was created first**,
and the two facts are one fact.

The lever is a comma operator placed inside the *other* argument's index:

```c
pos = (struct UnkPosPair *)sub_08057D44(
    gUnknown_085D6A48[(meta = gUnknown_03004580,
        gUnknown_03004582[gUnknown_0300453C][0])][0],
    gUnknown_03004580[gUnknown_0300453C][3]);   /* reads stay on the global */
```

`meta` is never read. What matters is that the reference sits **after**
`gUnknown_085D6A48`'s outer base is forced and **before**
`gUnknown_03004582`'s inner one — a point inside argument 1 that no statement
boundary can reach. The two neighbouring spellings each miss by exactly one
slot, which is what makes this a real readout rather than a lucky spelling:

| where the reference to `&gUnknown_03004580` is | result |
|---|---|
| nowhere (natural spelling) | `ldr` twelve instructions late, pool `…582, …580` — 96.3% |
| `meta = gUnknown_03004580;` as its own statement before the call | `ldr` one instruction early, pool `…580, 085D6A48` — 99.7%, **2 bytes** |
| the comma, inside argument 1's index | **exact** |

**Read it backwards, which is the usable direction.** When two globals are used
the same number of times in the same statements and the ROM register-allocates
one and rematerialises the other, the ROM's source referenced the winner
earlier. The pool order tells you which one, and the winner's `ldr` position
tells you where the reference has to go — between the two `ldr`s already
adjacent to it.

`sub_0804FA2C` corroborates it from a different angle: there the first
`gUnknown_085D6A48` reference is in the tile-number statement rather than in the
call, and the ROM duly materialises `&gUnknown_03004580` **three statements
before its first use**, inside a statement that does not reference it. Moving
the same anchor into that statement reproduces the position exactly.

**It needs the zero-trip loop as well, and the two are not substitutes.** On
`sub_0804D290` the anchor alone is 588 bytes (26.7%) and the loop alone is 600
bytes (96.3%); only together do they match. The loop fixes *which* pseudo is
worth a register, the anchor fixes *which of two tied* pseudos gets it.

### What was ruled out, so nobody repeats it

`-fno-force-addr` produces **bit-identical** output on this function, so despite
appearances these `ldr rN, =sym` are ordinary address loads and **not**
`-fforce-addr` artefacts — an earlier draft of this section said they were and
that was wrong. `old_agbcc` is 624 bytes. `lc_screen` reports 0 pool words, so
this failure mode is invisible to it. Also measured and rejected: a
`u16 (*)[8]` local used for the reads (584), `*(g[i] + 3)` and
`(&g[0][3])[i * 8]` (596 each), binding the other argument to a local (600,
95.5%), a second or nested `do`/`while` (596–600), a struct row for
`085D6A48` column 0 (600, 95.3%), an `(int)` cast on the index (no change), and
300 s of decomp-permuter (score 230 → 215, no match).

The permuter's near-win is still worth keeping as a **diagnostic**: a dead
`if (!gUnknown_03004580) { }` before the previous statement. It is the same
class of edit as the anchor, one statement too coarse, and it reproduced
independently on `sub_0804FA2C` (648 → 640 bytes). When a near-miss is
size-exact with correct registers and the only diff is a hoisted `ldr` of a
global's address, drop the dead `if` in to confirm the class, then replace it
with a comma at the right depth.

## The wave-16 "evaluation order" cost axis: right phenomenon, wrong counter (wave 17, W17-A)

Wave 16 proposed, off one batch and flagged as a proposal: *count the call
arguments whose expression contains a nested call, a branch, or a
three-or-more-term sum with a constant in a non-outermost position.*

Wave 17's W17-A batch is a controlled test of it — three functions of 600 / 600 /
632 bytes, all straight-line, all **zero** `.LC` words, so the established cost
axis is held constant. The scores were written down from the ROM listing before
any C was drafted:

| function | bytes | axis score | actual cost |
|---|---|---|---|
| `sub_0804D290` | 600 | 2 | ~45 compiles, matched |
| `sub_0804DCA8` | 600 | 2 | **2 compiles**, matched — pure transcription |
| `sub_0804FA2C` | 632 | 2 | ~55 compiles, **not closed** (+8 bytes) |

Both scoring sites in each function are the same two: `gUnknown_03004580[i][3]`,
whose `+6` is emitted onto the base rather than into the load displacement, and
`gUnknown_08552FB8[w][q][2]`, whose `+8` is likewise. Counting occurrences
instead of arguments gives 3 / 3 / 3 — the same ordering.

**As a cost predictor it carries no signal here.** It is flat across a 20:1
spread and gives the same number to the two-compile function as to the
fifty-compile one. What ordered the batch was **normalised shape similarity to a
function you have already worked**: `sub_0804DCA8` is 0.960 to `sub_0804D290`
and cost two compiles; `sub_0804FA2C` is 0.276 and is still open.

**But it is pointing at the right phenomenon, and that is worth more than the
count.** Every one of the ~100 compiles this batch spent went on exactly what
the axis is about — *where a value gets materialised relative to a call's
argument list*. The whole difference between 96.3% and byte-exact on both twins
was the position of one `ldr` of a global's address inside argument 1, and the
fix was a comma operator at a specific depth in that argument (see "Of two
address constants" above).

So the correction is to what it counts, not to what it looks at. **The axis
counts argument-expression shape; what actually costs the rounds is the position
of an address constant's FIRST REFERENCE, which is invisible in the C and was
byte-identical across all three functions here.** Two arguments that score 2 can
differ by fifty compiles depending on which of two symmetric globals the source
happened to name first. A screen for this would have to be computed from the
ROM's *literal pool order* against the order the obvious C spelling produces —
which is checkable before drafting, and is a better candidate axis than the
argument count.

And the negative result that stands on its own: **`.LC` == 0 is not
sufficient.** All three score zero on the screen that "picked winners
one-sidedly" in wave 16, and they cost 2, 45 and 55+ compiles. Zero pool words
buys you a function with no `-fforce-addr` wall; it does not buy you a cheap
one.

## The `(e1 = ...)` binding generalises to a 2-D row (wave 17, W17-A)

`src/decomp/c_0804EEFC.c` records that binding a table element's address to a
local blocks agbcc from canonicalising the commutative operands of the final
address `add`. The same edit, one level up, is worth 12 bytes on
`sub_0804FA2C`: the ROM builds `pos[k]` as its own sub-address and then adds the
element offset,

```
lsls r2, r1, #2 / adds r2, r2, r1 / lsls r2, r2, #3   @ k*40
adds r2, r2, r0                                       @ + pos
... (i*5+j)*4 ...
adds r2, r2, r1
```

whereas `pos[k][i * 5 + j].x` on a `struct Pair (*)[10]` computes the element
offset first and adds the row last. Writing it
`(row = pos[k])[i * 5 + j].x` -- with `row` a `struct Pair *` given a second use
by the assignment -- restores the ROM's order: 660 -> 648 bytes, 16.8% -> 41.8%.
Read backwards: **if the ROM computes the outer index's scaled offset before the
inner one, the source bound the row.**

## One binding local PER STATEMENT, not one reused (wave 17, W17-A)

`c_0804EEFC.c` declares `e1` and `e2` for its two element bindings and the note
there explains only *why the binding exists* — it blocks agbcc from
canonicalising the commutative operands of the final address `add`. It does not
say why there are **two names for two statements**, and that turns out to matter
on its own.

A single local assigned in N statements is **one pseudo whose live range spans
all N**, even when every assignment is dead. `sub_0804FA2C` binds the row
address in four consecutive statements; with one `row` the pseudo takes **r7** —
a low callee-saved register — and holds it across the whole block, which pushed
the constant `180` into a high register and cost two `mov`s at every `muls`. The
ROM keeps that row address in a call-clobbered scratch, because it dies inside
each statement.

Four separate locals, one per statement, each die where they are born and take a
scratch. Worth **4 bytes** and it was the single edit that moved `sub_0804FA2C`
from +8 to +4 after two permuter runs had found nothing.

**Read it backwards, which is the cheap direction:** if the ROM recomputes a
value in each of N statements and holds it in a *scratch* register, but your
candidate parks it in a callee-saved one, you have one local where the original
had N. Look for the pushed-out value — here it was an integer constant forced
into a high register, which is visible at a glance because each use grows a
`mov`.

The general form is worth stating, because it is the opposite of the usual
instinct to reuse a variable: **binding locals are punctuation, not storage.**
Give each statement its own, and let the register allocator see the short live
ranges the original had.

## The `.LC` pool block is one unit's, and its slot order IS function order (wave 18, W18-B)

**`0x0808D6DC .. 0x0808D8A8` is a single translation unit's `-fforce-addr`
address-constant pool, 116 slots, and the map from slot to owning function is
1:1 and STRICTLY MONOTONIC in function address.** Measured over every
`gUnknown_0808Dxxx` reference in `asm/`: 103 of the 116 slots are referenced,
**no slot is referenced by two functions, and there are zero inversions** across
the whole run from `sub_08000694` to `sub_08010DD4`.

```
0808D6DC sub_08000694     0808D7F8 sub_080081E0     0808D854 sub_0800AA30
0808D6E0 sub_0800081C     0808D7FC sub_080083E0     0808D858 sub_0800ABD0
0808D6E4 sub_0800081C     0808D800 sub_080085E0     ...
0808D6E8 sub_0800081C     0808D81C sub_0800977C     0808D8A8 sub_08010DD4
```

Three things follow, and the third is the useful one:

- **A function with N distinct force-addr'd symbols owns N CONSECUTIVE slots.**
  `sub_08000E48` and `sub_0800CB30` own five each, `sub_0800081C` three.
- **`0x0808D8AC` is referenced by THREE functions** (`sub_08000CCC`,
  `sub_08002E3C`, `sub_08002E5C`), so it is a real global and marks the block's
  end. Shared ownership is the boundary test: a `.LC` word is never shared.
- **It is PREDICTIVE, not just explanatory.** For any unmatched function in
  `code.s` you can read off which pool word it owns by interpolating between its
  address-order neighbours, before writing a line of C — and if the neighbours
  bracket it with no free slot, it has none. Previous waves derived each
  function's word one at a time by grepping its own disassembly; that is
  unnecessary.

Note this corrects a size claim elsewhere in this file. The often-quoted "run of
THIRTY consecutive slots that all hold 0x08499590" is a *sub-run* of this block
— the stretch whose functions all touch the map descriptor — not the block.

### The monotonic-slot rule survives a function that owns NO slot (wave 19, W19-A)

The rule above was derived on a run where every function in address order had at
least one word, so it left open whether a function with none leaves a hole. It
does not. The `0x0816D9E0 .. 0x0816DA37` block is a second, smaller instance —
22 words, one pair per list builder at `0x0805CA60 .. 0x0805D1F0` — and **two of
the thirteen builders (`sub_0805CDF0`, `sub_0805CE20`) have no pair at all**,
because they are the two with no loop and so nothing is live across a merge.
Grepping each of the thirteen bodies for its own pool symbols gives strict
address order with those two simply absent and the next builder taking the next
slot:

```
CA60 D9E0  CB1C D9E8  CBCC D9F0  CC88 D9F8  CD34 DA00
CDF0 --    CE20 --    CE50 DA08  CF0C DA10  CFBC DA18
D078 DA20  D134 DA28  D1F0 DA30
```

So the interpolation in the bullet above is safe, but **the count of slots
between two matched neighbours is an upper bound on the functions that own
them, not a census** — a bracketed function may own nothing, and the way to
tell before writing C is whether it has a loop or any other control-flow merge
carrying the address. This also corrects an off-by-two in
`include/unknown-globals.h`, which called this block "thirteen consecutive
pairs" while its own last sentence said two builders have none; 0x58 bytes is
eleven pairs.

## The c_local workaround has ONE remaining wall: the binding wins a register the ROM gives away (wave 18, W18-B)

**Superseded for these three, but keep reading — the rule still holds where the
honest spelling is NOT byte-exact.** `sub_080081E0`, `sub_080083E0` and
`sub_0800977C` are now MATCHED and promoted, from the honest spelling, because
the split can place a `.rodata` pool word (see the wave-18 section at the end of
this file). They were never a codegen problem. What follows is still the correct
description of the workaround's wall for any function that needs it.

Three functions stalled on the same fact, and stating it as one fact is worth
more than any of the three: **in every `c_local` spelling the explicitly bound
middle-level pointer OUTRANKS the ordinary local it competes with, and in the
ROM it always loses.**

| function | ROM | every c_local draft |
|---|---|---|
| `sub_080081E0` / `sub_080083E0` | `x + 1` in the low register, binding in r8 / r7 | binding low, `x + 1` pushed out |
| `sub_0800977C` | `ok` in r7, binding in r8 | `ok` in r8, binding in r6 |

The reason it is structural: in the original source there is no binding local at
all — the middle value is a temp **CSE invents**, and a CSE temp is created after
every source-level pseudo, so it loses every allocation tie. A declared local
cannot be created that late. This is why the honest spelling reaches 100% on all
three and the workaround does not.

**The one lever that moves it is the ASSIGNMENT's position, and nothing else.**
Hoisting `q = *pp` to the top of its block lengthens the binding's live range,
drops its priority, and inverts the pair — on `sub_080081E0` that is
508 B / 22.1% → 512 B / 75.2%. It buys the registers at the price of emitting the
binding's two instructions where the ROM does not have them.

### Byte-neutral, so stop spending probes on them

Measured on `sub_080081E0` (and the `q` set again on `sub_0800977C`), all
producing **bit-identical** output:

- **declaration ORDER of the binding locals** — first, last, interleaved;
- **declaration SCOPE** — function scope vs block-scoped inside the region that
  uses it. This one is worth knowing because it looks like it should reproduce a
  CSE temp's late creation, and it does not;
- on `sub_0800977C`, **the binding's reference count and its existence**: bound
  by name, bound through `*pp`, reduced to one use, and removed altogether all
  give the same bytes.

So when a `c_local` draft is size-exact with the binding in the wrong register,
the fix is not a spelling — only the assignment's position and the surrounding
live ranges matter.

### `volatile` reproduces the ROM's re-derivation and still loses

`sub_0800977C` re-derives `**pp` twice inside a **call-free** region, which no
ordinary load survives — CSE shares it. `volatile` on the pool word is the only
construct that forces the re-derivation, and it was measured in three placements:
whole chain **+12**, inner pointer as well **+12**, and a second
volatile-qualified pointer used *only* at the four counting-region reads **+20**.
It buys the re-derivation and destroys the caching the ROM keeps everywhere else.
**A `.LC` word behaves like neither a normal nor a volatile object**, because
force-addr re-expands the address *after* CSE has run, and no C qualifier is
scheduled at that point.

### The honest draft is the deliverable when the workaround stalls

All three functions above have a draft that is **100% byte-exact** with the pool
symbol named directly, differing only in the relocation. Keep that as
`work/<fn>/<fn>.c` and the workaround as `_clocal_nearmiss.c`, not the other way
round: the honest one is almost certainly the original source, and it is what a
later split that can place `.rodata` will need.

**Corollary worth carrying: the toolchain axis cannot be the cause when the
honest draft is byte-exact.** `data/parked.json` tells you to check the compiler
and flags before parking; a byte-exact honest draft has already proved both, so
skip it and do not spend the probes.

---

## An indirect call's target is SUNK unless you bind it (wave 18, W18-C)

`bl _call_via_rN` is ordinary compiler output — that is already recorded above.
What is new is that the `ldr` of the function pointer has a *position*, and the
position is a source readout:

```c
tbl[i](a, b);            /* ... ldr r2,=tbl ; add ; mov r3,r8 ; ldrh r1,[r3]
                            ; ldr r2,[r2] ; bl _call_via_r2   -- load LAST  */
fn = tbl[i]; fn(a, b);   /* ... ldr r2,=tbl ; add ; ldr r2,[r1] ; mov r3,r8
                            ; ldrh r1,[r3] ; bl _call_via_r2   -- load FIRST */
```

Written directly, agbcc computes the callee's *address* where the expression
sits and then sinks the load itself past the argument setup, because the loaded
value has one use and nothing writes memory in between. Binding it to a local
pins the load to its own statement. Same instructions, same length, so this
presents as two instructions having swapped places with nothing in the
expression to blame. `sub_08050B70` needs the bound form.

**And the bound form collides with the `row` binding, which is the part worth
carrying.** `sub_08050B70`'s dispatch is
`tbl[gUnknown_085D6A48[gUnknown_03004580[c][1]][2]](c, d)`, and it needs *both*
of these at once:

- `row` bound to a `u16 *`, or the `[2]` hoists onto the base as `adds rB, #4`
  instead of folding into the `ldrh` displacement (the rule
  `src/decomp/c_08051F4C.c` records);
- the whole dispatch kept as ONE expression, or `gUnknown_085D6A48`'s pool word
  is created before `gUnknown_085535B0`'s. Address pseudos are created in source
  order and a nested subscript expands outermost-first, so splitting `row` into
  its own statement reverses the pool.

Those two are contradictory as written, and the comma operator resolves them —
the same lever `src/decomp/c_0804D290.c` uses for a different reason:

```c
fn = tbl[(row = gUnknown_085D6A48[gUnknown_03004580[c][1]], row[2])];
fn(c, d);
```

**The general form: when a binding is needed for its addressing mode but a
statement boundary would reorder the pool, put the assignment inside the
subscript.** Read backwards, a pool word that is out of source order is telling
you a binding was made at a point no statement boundary can reach.

### Argument order in an indirect call is still the direct-call rule

`_call_via_rN`'s register index is the arity (recorded above), and the arguments
themselves follow the ordinary rule: an argument needing computation is emitted
ahead of one that is a plain register copy, whatever their positions. Both of
`sub_08050B70`'s are plain loads of u16 globals, so nothing moves — but do not
read the trampoline as changing the convention. It does not.

## The split CAN place a `.rodata` pool word — the wall is gone (wave 18, W18-B)

Twelve parked functions, 3,368 bytes, were held by one thing: a byte-exact draft
that names the global directly emits a `-fforce-addr` pool word into its own
`.rodata`, and that word had nowhere to live. **It has somewhere to live now.**
**All twelve were unparked** — `sub_080081E0`, `sub_080083E0`, `sub_0800977C`,
`sub_0804E8F0`, `sub_0804FE10` and the seven-member `sub_0805CA60` group,
**3,368 bytes** — every one from the draft that names the global directly, with
`make SPLIT=1 compare` and `make compare` both reproducing
`14dd0b22c894865867aff89e8116b2dffae25605`. Five of them were at 0 differing
bytes; the `sub_0805CA60` group's one differing byte was never a codegen diff at
all, only the inline addend of the second pool word (`.rodata+4` against the
original's `gUnknown_0816D9E4+0`), which resolves to the identical address once
the word is placed.

### The mechanism, in one paragraph

The pool words arrive twice: once as the compiling unit's output, and once as
incbin'd ROM bytes in `data/rodata.s` or `data/data.s`. `tools/split_rodata.py`
splits those blobs **per symbol** into generated pieces under `build/rodata/`,
reading `data/` and never modifying it — the same read-only treatment
`split_asm.py` gives `asm/`. `gen_lds.py` then interleaves a promoted unit's own
`.rodata` between the pieces, at the address the original build used:

```
. = ALIGN(4); rodata/rodata-0808D6DC.o(.rodata)   /* blob, 0x0808D6DC.. */
. = ALIGN(4); src/decomp/c_080081E0.o(.rodata)    /* 0x0808D7F8, the C's word */
. = ALIGN(4); src/decomp/c_080083E0.o(.rodata)    /* 0x0808D7FC */
. = ALIGN(4); rodata/rodata-0808D800.o(.rodata)   /* blob resumes */
```

A unit declares the words it owns with a `rodata` list in `data/promoted.json`.
Both blobs are flat runs of `.global`/label/`.incbin` triples, one per symbol,
fully contiguous — which is what makes a per-symbol split exact, and every pool
word in the tree is a 4-byte chunk boundary in one of them.

### Four things that will bite whoever extends this

- **GNU ld AUTO-LOADS an object named without a wildcard in an input-section
  spec.** Leaving `data/rodata.o(.rodata)` in the split script pulls that object
  into the link *even though the Makefile never passes it on the command line*,
  and it collides with every symbol in the generated piece. This cost the first
  attempt; a script naming a nonexistent `nosuch.o(.text)` fails with
  `cannot find nosuch.o`, which is the one-line proof. **The split script must
  always point at the pieces, not only when something is carved out.**
- **A unit with N force-addr'd symbols owns N CONSECUTIVE words and its object
  must be placed ONCE covering the whole run**, because agbcc emits them as a
  single `.rodata` section. Placing it per word emits the section once per word
  and overruns the next piece. The splitter refuses a non-consecutive claim.
- **Which blob a word lives in does not change its section.** A promoted unit's
  word is `.rodata` even when carved out of `data/data.s`'s `.data`; the pieces
  keep the blob's own section. It is all one output section, so ld does not care.
- **The Makefile must drop exactly the blobs the pieces replace.** Too few and
  the blob is linked twice; too many and megabytes vanish from the ROM with only
  a SHA mismatch to show for it. `split_rodata.py` writes `build/rodata/blobs.mk`
  with `SPLIT_BLOBS` and the Makefile includes it, so the two cannot drift.

### The consequence for how you keep drafts

**When the honest spelling is byte-exact and only its relocation differs, that
draft is the deliverable — not the `c_local` workaround.** `sub_080081E0`,
`sub_080083E0` and `sub_0800977C` sat parked for several waves while agents
ground on the workaround's register allocation (75.2%, 75.2%, 38.6%) and the
honest draft had been 100% the whole time. The workaround exists to reach the
ROM's *relocation*; that is now the linker's job. Reach for it only when the
honest spelling is not byte-exact.

### Do NOT relax `trymatch` without the placement

`trymatch`'s `reloc_equivalent` can be taught to resolve a candidate's own
`.rodata` and compare the value against `baserom.gba`, which would flip these
functions green. **On its own that manufactures unbuildable promotions.**
`trymatch` judges one unit; the split build links all of them, and a promoted
unit whose `.rodata` the linker script does not place either loses the word or
shifts every address after it. Since `promote.py` acts on `trymatch`'s verdict,
the failure arrives in the build with functions already moved. **Placement
first, verifier second** — the order this work was done in, and the reason the
builds stayed green throughout.

### The verifier, added second and only because placement works

`trymatch` now blesses these drafts, and the check is semantic rather than a name
comparison: resolve what the candidate's `.rodata` word *will contain* and
require it to equal the word the ROM actually has at the address the original's
code loads. If those agree, promoting with a `rodata` entry reproduces the ROM.
Measured behaviour after the change — it discriminates, it is not a rubber stamp:

| set | before | after |
|---|---|---|
| the twelve placed functions | exit 1 | **exit 0** |
| the eight still-parked (`sub_0801A6C0`, `sub_08022618`, …) | exit 1 | exit 1 |
| a sample of already-matched (`sub_0800AA30`, `sub_08001158`, …) | exit 0 | exit 0 |

Two guards make the ordering enforceable rather than a convention. **`trymatch`
prints the exact `rodata` declaration the match depends on**, and **`promote.py`
parses it and records it automatically**, so a promotion cannot silently omit the
placement. `split_rodata.py` then refuses any claimed address that is not a
4-byte chunk boundary, or whose ROM word is not address-shaped.

**One trap inside the verifier itself, worth knowing because it hid the whole
thing for a while.** `symbol_addresses()` reads the last-built ELF — and once a
pool word is carved out, its `gUnknown_<addr>` label goes with it, so the symbol
is **absent from the split build's ELF entirely**. The original's relocation
names that symbol, so nothing could be resolved and every function in the class
fell back to "relocations differ" no matter how correct it was. The fix is that
these symbols are *invented at their own address*, so the name carries the
answer: fall back to parsing `gUnknown_0XXXXXXX` when `nm` does not have it.

The same fact is a real constraint on what you may carve: **a word can only be
carved out if nothing still in the build references that symbol by name.** A
function still using the `c_local` workaround does reference it, so its word must
stay in the blob until that function is re-done with the honest spelling. This
fails loudly at link time (undefined symbol), not silently.

---

## `(u8)(x - K) <= N` is one branch, and a `bhi` after a shift pair is where it lives (wave 19, W19-A)

`sub_0805CC88` filters a table on a two-value id range. The ROM:

```
ldrb r3, [r0]          @ r3 = the u8 field, KEPT
...
adds r0, r3, #0
subs r0, #0x10
lsls r0, r0, #0x18
lsrs r0, r0, #0x18
cmp  r0, #1
bhi  <skip>
```

Read by the existing shift-pair rule this is `(u32)(x - 0x10) << 24 >> 24`, i.e.
`(u8)(x - 0x10)`, and the `bhi` says the compare is **unsigned**. The source is

```c
(u8)(gUnknown_08499594[i].unk00 - 0x10) <= 1
```

and it matched first try. Two things worth carrying:

- **The `(u8)` cast is not decoration, it is the whole idiom.** Without it, a
  `u8` field minus a constant is an `int` in C89 and `x - 0x10 <= 1` on the
  promoted value needs a *signed* test plus a lower-bound branch — two compares.
  The truncation is what collapses "in `[0x10, 0x11]`" into one unsigned
  compare, and the shift pair is the truncation, not a mask.
- **Do not reach for `>= 0x10 && <= 0x11`.** That is the same predicate and
  different code. The `bhi`/`bls` pair after a `subs` is the positive tell for
  the cast form; a two-sided spelling emits two conditional branches.

### A dropped address constant reshuffles the frame, and none of it is a source feature

Same function against its matched exemplar `c_0805CA60.c`: identical source
except that third condition, which is the one that does **not** index
`gUnknown_085D5ABC`. Removing that one table reference changed four things at
once, all free:

| exemplar (2 address constants live) | CC88 (1) |
|---|---|
| `mov r7,sb; mov r6,r8; push {r6,r7}` | `mov r7,r8; push {r7}` |
| `gUnknown_08499594` parked in `ip` via `r0` | parked directly in `r7` |
| `gUnknown_085D5ABC` in `r7` | absent |
| base pointer in `r3`, field value re-`ldrb`'d for the third test | value held in `r3`, base in `r0` |

**Two high registers saved versus one is a readout of how many long-lived values
the source has, and so is which register a constant lands in.** This is the
existing "`mov r7,sb; mov r6,r8` is NOT a loop signal" rule seen from the other
end: here the count went *down* by exactly one when the source lost exactly one
address constant, with no allocation lever, no extra local and no reordering.
If your candidate's push list differs from the ROM's, count the source's
long-lived values before touching anything else — a spilled-register difference
in a function this size has never yet been fixable at the spelling level.

### Datapoint for the wave-19 `.LC` caveat: carved siblings really are bookkeeping

Four functions (`sub_0805CB1C`, `sub_0805CC88`, `sub_0805CF0C`, `sub_0805D1F0`),
**two `.LC` pool words each**, all four matched on the **first** local `trymatch`
with **zero** `compile_probe` rounds. Under the pre-wave-18 cost rule two words
predicted 8–28 bytes of trouble each; here it predicted nothing, because seven
address-order siblings were already promoted with their pairs carved by
`tools/split_rodata.py` and the four new pairs fill holes in a block whose
mechanism was already proven. The brief's caveat holds: **where a sibling is
already carved, `.LC` count is not a cost signal.** Where none is, the original
rule is untouched by this result.

---

## Callee-set Jaccard, measured: a DUPLICATE detector, not a cost metric (wave 19, W19-B)

Wave 19 replaced shape similarity with callee-set Jaccard as its batching metric
and handed one batch out as the experiment, because `shape_map.py --all
--min 0.58` returns zero pairs over the whole 160-function straight-line band.
This is the measurement, with the attempt counts recorded per function.

**The batch: four screen-setup functions, 2,036 bytes, all four MATCHED.**

| function | bytes | starting point | local `trymatch` attempts |
|---|---|---|---|
| `sub_0806EB5C` | 544 | wave-18 draft at 93.0%, size-exact | **3** (1 diagnostic + 2 edits), +1 control |
| `sub_0806ED7C` | 644 | nothing | **1** — match first try, zero probes |
| `sub_0806BB08` | 532 | wave-18 draft at 94.2%, size-exact | **1** |
| `sub_0806C52C` | 316 | nothing | **1** — match first try, zero probes |

Zero `compile_probe` calls, zero permuter runs, no `.LC` words anywhere.

### The pair the metric was chosen for did behave like a family instantiation

`sub_0806EB5C` and `sub_0806ED7C` share **26 of 26 callees** (Jaccard 1.000) and
22 of 29 data refs (0.688). ED7C was produced by copying EB5C's finished source
and substituting the tail, and it **matched on the first `trymatch` with no
probe round**: 27 leading statements are identical, the proc struct is the same
layout with one filler narrowed, and the only derivation needed was a
twelve-statement window-enable block, four field loads and a guard. That is the
wave-5 family discount at 644 bytes.

**And shape similarity would not have found it.** `shape_map` scores that same
pair **0.366** — below its own 0.58 batching threshold, and below the **0.541**
it gives `sub_0806BB08`/`sub_0806EB5C`, which is the highest-scoring pair in the
band. So callee-set identity is not a noisier proxy for normalised shape; on
this pair it is strictly better, because ED7C's extra 100 bytes of bitfield
writes dilute the normalised shape string while leaving the callee set alone.
**`calls` is invariant to inserted code and the shape string is not.**

### But as a graded cost predictor it carried NO signal, and the batch cannot separate it from the screen the doc already has

The honest result. Jaccard against the representative, and the cost:

| function | callee J to EB5C | shape to EB5C | attempts |
|---|---|---|---|
| `sub_0806ED7C` | **1.000** | 0.366 | 1 |
| `sub_0806BB08` | 0.312 | 0.541 | 1 |
| `sub_0806C52C` | **0.172** | 0.338 | 1 |

The **lowest**-Jaccard member of the batch cost exactly as much as the pair that
shares every callee. A metric that predicts a 6:1 spread and produces a 1:1 one
has no discriminating power here. Two reasons, and both matter for wave 20:

- **All four score on the older screen, and that is what predicted the
  cheapness.** `backward_branches == 0`, `calls` 8–26, `data_refs` 16–29, zero
  `.LC` words, and a body that is *entirely* calls, `hardware.h` macros and
  constant stores. That is verbatim the "straight-line, call-dense, no loop"
  class already recorded in the 256–384 band section, which has now matched
  eleven functions at about one attempt each across three waves. `sub_0806C52C`
  was on that section's own untried candidate list. **Jaccard selected inside an
  already-cheap population, so this batch could not have refuted it either.**
- **`sub_0806BB08` transferred from `sub_0806EB5C` on a shared CAUSE while
  sharing only 10 of 26 callees.** The one-line fix that closed EB5C closed BB08
  unchanged. So the thing that actually transferred between those two — a
  read-modify-write spelling — is invisible to both metrics, and the pair
  `shape_map` liked best (0.541) turned out to be the pair with the shared
  *bug*, not the shared body.

### The rule to carry into wave 20

**Use callee-set Jaccard at or near 1.0 as a duplicated-body detector, and do not
use intermediate values for anything.** J = 1.0 over a set of 20+ callees is a
near-certain claim that one function was written by copying the other; it is
cheap, it is invariant to inserted code, and it finds pairs `shape_map` scores
under its own threshold. J in the 0.2–0.5 range ordered nothing on this batch and
should not be used to order a target list — the `backward_branches == 0` +
high-`calls` + high-`data_refs` + zero-`.LC` screen already selects that
population better and is the reason all four were cheap.

Corollary on how to spend the discount: **diff the two assemblies, do not
re-derive the second function.** ED7C's 644 bytes took one attempt because the
first 27 statements were transcribed rather than read. The prediction that
survives from wave 18 is the instruction to diff, not any prediction about what
the diff will contain — here the brief predicted the variation would be in the
proc fields and the guard, and it also included a hundred bytes of window-enable
bitfield writes nobody had flagged.

---

## Callee-set Jaccard picked a real family here — but read the two sections above and below before reusing it (wave 19, W19-A)

**Scope note added at integration, because this section's original title
("Jaccard WORKS as a batching metric") claims more than its evidence supports.**
Three measurements landed in wave 19 and only the narrow reading survives all
three: J≈1.0 over a LARGE shared set detects a duplicated body; the ratio on its
own detects nothing. This section is the ten-callee case that worked; W19-B's
section above found intermediate values ordering nothing, and its boundary test
below found a *five*-callee J = 1.000 pair where neither member closed. Take the
combined rule from the boundary-test section, not from this title. What follows
is unedited and is the evidence for the positive half.

Wave 19 introduced callee-set Jaccard as the replacement for exhausted shape
similarity and flagged it UNVALIDATED. **It validated.** The triple it picked —
`sub_080831FC` (648 B), `sub_08083484` (692 B), `sub_08083738` (780 B), Jaccard
1.000 on every pair — is one shape family, and all three are now matched:

| function | local `trymatch` runs to close |
|---|---|
| `sub_080831FC` | 1 (first draft) |
| `sub_08083484` | 6, all six on ONE expression (see the section below) |
| `sub_08083738` | 1 (first draft) |

Eight local `trymatch` runs, zero `compile_probe` rounds and zero MCP
`try_match` attempts across 2,120 bytes. Everything except that one expression
was right on the first draft in all three functions. For comparison the same three score around 0.40 on `shape_map.py` and
`families.py`'s exact tier does not see them at all, because the shapes differ
structurally: one takes two parameters and two take a different phase
expression, and one has no leading `Interpolate` at all. **Shape similarity was
measuring the wrong thing for this class.** What the callee set actually
identifies is a SUBSYSTEM — ten shared callees meant one vocabulary
(`Interpolate`, `DivRem`, `PutSprite`, `PutSpriteExt`, `SetObjAffine`, `Div`,
three one-line predicates) and therefore one set of idioms to derive once.
Recommend it as wave 20's batching metric — **with the set-size floor from the
boundary-test section, which was measured after this paragraph was written.**

**The multiplier was not the metric, though — it was one grep.** The affine tail
of all three is five lines that were already promoted twice
(`src/decomp/c_08032E88.c`, `src/decomp/c_08027B68.c`), found by grepping
`src/` for `COS_Q12`. That grep is what turned `lsls r0, r0, #4` into `* 16`
(the `shorten_binary_op` rule — a shift there does not fold), and it is the
same "grep `src/decomp/` for the globals the scaffold lists" advice one level
up: **grep for the MACRO the idiom would use, not only for the symbols.**

### `gSinLut` in the pool is not evidence of a rotation variable

All three functions reference `gSinLut`, which reads as trig/rotation code and
was flagged as such. In fact the angle is the constant 0: the ROM has
`adds r0, r4, #0x80; movs r1, #0; ldrsh r0, [r0, r1]` with no `ands #0xff`
anywhere, i.e. `COS_Q12(0)`, and the whole matrix is an identity rotation with a
vertical scale from one interpolated field. **A missing `ands #0xff` in front of
a `gSinLut` load means the angle is a literal**, and the generic
`Div(COS_Q12(0) * 16, d)` spelling is what the original wrote — the same five
lines as the two promoted exemplars, not something to re-derive.

### REFUTED: "no carved sibling" does not restore the `.LC` cost rule

Wave 19's brief carried a caveat that a `.LC` count of 2 is bookkeeping where a
sibling is already carved, but that **where none is carved the old cost rule
still stands at full strength** — and it predicted these three would be
materially harder than a batch whose siblings were carved. They were not. Each
carries two `.LC` words at fan-in 1 and density 17, **no sibling of the
`0x081D93BC-0x081D93D0` block was carved**, and all three matched from the
honest spelling with `trymatch` resolving the pool words and printing the
`rodata` entry. Total cost was eight local `trymatch` runs for 2,120 bytes, and
six of the eight went on one expression that has nothing to do with the pool.

So the correct statement is narrower than either version: **since wave 18 the
`.LC` count predicts nothing at all, carved sibling or not.** The cost it used
to predict came from the pool word having nowhere to live, and placement removed
the cause rather than the symptom. What remains true is only the mechanical
requirement — the promotion must carry the `rodata` entry, and `trymatch` now
prints it.

### One source spelling can produce BOTH pool-word and direct address loads

Inside a single one of these functions the address of `gUnknown_08615C04` is
materialised two different ways, and this is not two source spellings:

```
branches 0/1/5:  ldr r4, =<pool word> ; ldr r3, [r4]    (reroute)
branch 3:        ldr r4, =gUnknown_08615C04 ; adds r3, r4, #0   (direct)
```

The difference is exactly the documented trigger. Branches 0, 1 and 5 cross-jump
into a shared tail that uses the address again, so it is live across a MERGE and
`-fforce-addr` reroutes it; branch 3 uses it twice inside one basic block and
falls through, so it does not. Both come from writing `gUnknown_08615C04` by
name. **A mixed pattern in the disassembly is not a signal that two source
spellings are needed** — do not go looking for one.

## Two members plus a constant: the address pseudos follow source order, the constant does NOT (wave 19, W19-A)

`sub_08083484` sums an `s16` member, a `u16` member and the literal 2 as a
`DivRem` argument. The ROM:

```
adds r7, r5, #0 ; adds r7, #82     @ &unk52  -- pseudo created FIRST
adds r6, r5, #0 ; adds r6, #78     @ &unk4e
movs r1, #0 ; ldrsh r0, [r6, r1]   @ unk4e   -- loaded FIRST
adds r0, #2                        @ the constant lands HERE
ldrh r2, [r7, #0]
adds r0, r0, r2
```

Six spellings of one expression, everything else in the file byte-identical
throughout:

| source | result |
|---|---|
| `p->unk4e + 2 + p->unk52` | 91.6% — pseudo order wrong AND constant on `unk52` |
| `(p->unk4e + 2) + p->unk52` | 91.6% — identical to the above; the parens are free |
| `2 + p->unk4e + p->unk52` | 91.6% — identical again |
| `p->unk52 + (p->unk4e + 2)` | 91.0% — worst; parens do not survive `fold` |
| `p->unk52 + p->unk4e + 2` | 94.8% — pseudo order RIGHT, constant still last |
| **`p->unk52 + 2 + p->unk4e`** | **match** |

The 94.8% row is the informative one: it separates the two axes, because it
fixes the address-pseudo order while leaving the constant in the wrong place.
Those two things are both set by source order and they move in **opposite**
directions, which is why guessing costs attempts:

- **The two `p + K` address pseudos are created in source reference order**, and
  the first one created wins the lower register — the same allocno-order rule as
  two address constants elsewhere in this file. So the member you write FIRST is
  the one whose `adds rN, #K` is emitted first.
- **The constant is folded onto the member you write LAST**, and that member's
  load is the one emitted first. Writing the constant next to a member does not
  keep it there; `fold` moves it to the other operand, and explicit parentheses
  do not stop it.

So to reproduce `(a + C) + b` with `b`'s address pseudo first, write
`b + C + a`. Read backwards: **if your candidate has the right instructions but
the `adds rN, #imm` is on the wrong load, swap the two members in the source
and leave the constant where it is** — the constant follows the swap on its own.

---

## PRE-COMMITTED cost prediction for the 0x0807 cluster (wave 19, W19-A)

Wave 19 retired `.LC` count as a cost metric and confined callee-set Jaccard to
J≈1.0 on large callee sets, which leaves the band with no way to *rank* anything.
This section is a pre-registration: it was written **before reading a single
instruction** of the four functions, from index metadata only, and the actual
counts are appended below it unedited. If the prediction is wrong, that is the
result.

**Unit, fixed in advance:** invocations of local `python tools/trymatch.py <fn>`
from first draft to exit 0, counting every invocation including sweep runs. Same
unit as the 0x08083 triple, which cost 1 / 6 / 1.

**The inputs I am allowed** (everything below is from `data/functions.json` and
`tools/lc_screen.py`; no assembly was read):

| function | size | `.LC` | callees | new callees | real globals (fanin / density) |
|---|---|---|---|---|---|
| `sub_0807567C` | 356 | 0 | 5 | 1 | 5, four of them fanin 104–111 at density 17/14/13/11 |
| `sub_08079EA4` | 264 | 1 | 6 | 2 | 1, fanin 13 density 6 |
| `sub_080748A0` | 348 | 2 | 6 | 2 | 1, fanin 38 density 6 |
| `sub_08075C98` | 292 | 0 | 7 | 4 | none but `gSinLut` |

**The theory I am betting on.** What actually cost me time on the 0x08083
triple was not size, not the pool and not the callee count: it was **one
arithmetic expression over two struct members and a constant**, where several
source spellings produce the same instructions in a different order. Six of the
eight runs went there. So my predictor is "how many independent
source-order-or-association decisions does this function contain", and my two
visible proxies for it are:

1. **Reference density on real globals**, generalising the doc's "distinct `.LC`
   read-site spellings" from pool words to ordinary globals. Each dense global is
   more read sites, and each read site is a place where operand order is
   invisible in the assembly.
2. **Number of new callees**, because each unsettled signature is its own
   decision, and a wrong one is byte-neutral in a pass-through.

**Predicted order, most expensive first, with absolute counts:**

| rank | function | predicted runs | why |
|---|---|---|---|
| 1 | `sub_0807567C` | 5 | four globals at density 11–17 is by far the most read sites in the cluster, and it is the largest |
| 2 | `sub_08075C98` | 4 | three unsettled callee signatures; with only `gSinLut` as a data ref its arithmetic must be over its own proc struct, which is exactly where the triple's cost landed |
| 3 | `sub_080748A0` | 2 | mid-size, one unsettled signature, low density |
| 4 | `sub_08079EA4` | 2 | smallest, lowest density, one unsettled signature, and its global is adjacent to `gUnknown_0848B6CE` which I typed an hour ago |

Predicted total: **13**.

**Three falsifiable side-bets, so this cannot be read as a hedge:**

- **`.LC` count will not order the cost.** Specifically `sub_080748A0`, the only
  one with two pool words, will not be the most expensive. If it is, my
  refutation above is weaker than I claimed.
- **The affine tail costs zero in all four.** `Div`, `Interpolate` and
  `SetObjAffine` appear in every one, so `Div(COS_Q12(0) * 16, d)` and the
  `x != 0 ? x : 2` guard should transfer verbatim and produce no iterations. All
  four reference `gSinLut`; I predict the angle is a literal in all four (no
  `ands #0xff`), on the tell recorded above.
- **`Proc_Break` in all four means these are proc BODIES**, so all four need
  `PROC_HEADER` structs and `#include "proc.h"`, and none of them is a proc
  starter — so the "read the parent off the untouched register" table does not
  apply to any of them.

*(Note for the record: the wave-19 brief gave these `.LC` counts as 2 / 0 / 0 / 1
in the order listed. `lc_screen.py` measures 0 / 1 / 2 / 0 — the brief's values
are the same multiset shifted by one position. The table above is the measured
one.)*

### RESULT: the prediction was inverted, and the reason matters more than the miss

Actual counts, same unit, nothing edited above:

| function | predicted | actual | outcome |
|---|---|---|---|
| `sub_0807567C` | 5 (my #1 most expensive) | **1** | matched, byte-for-byte, `relocs: match` |
| `sub_08075C98` | 4 (my #2) | **1** | matched, byte-for-byte |
| `sub_080748A0` | 2 | **2** (1 of them a compile error from a global I had not declared yet — **1** codegen iteration) | matched, byte-for-byte |
| `sub_08079EA4` | 2 (my joint-cheapest) | **2**, and NOT CLOSED | parked at 99.2%, size-exact, 2 bytes |

Predicted total 13, actual 6. **The ordering is close to a perfect inversion at
both ends:** the function I ranked most expensive was tied-cheapest, and one of
the two I ranked cheapest is the only one in the batch that did not close.

Scoring the four side-bets, because they are the part that discriminates:

- **`.LC` count will not order the cost — CORRECT, and for a worse reason than I
  predicted.** `sub_080748A0` was the only one with two pool words and it
  finished `relocs: match` with **no pool words at all**. See the next
  subsection: three of the four `.LC` words `lc_screen.py` attributed to this
  batch are not pool words.
- **The affine tail costs zero in all four — WRONG, and it is the only thing in
  the batch that cost anything.** The single codegen iteration in 1,260 bytes was
  the *denominator* of the affine tail in `sub_08079EA4`. I had it as the
  promoted `d != 0 ? d : 2` and it needed `x == 0x200 ? 2 : 0x200 - x`; the wrong
  arm order was +4 bytes and 28.8%. Recorded as a rule in the parked entry: **in
  `c ? A : B` compiled to a single branch, A is the arm gcc emits
  UNCONDITIONALLY, so the presetting `movs` tells you which arm the source wrote
  first.**
- **The `gSinLut` angle is a literal in all four — WRONG, split 2–2.**
  `sub_0807567C` and `sub_08075C98` have variable angles (`ands #0xff` present
  before the load), `sub_08079EA4` and `sub_080748A0` have the literal 0. The
  tell itself held perfectly every time; my *guess about the population* did not.
  Read the tell, do not assume the batch is uniform.
- **All four are proc bodies needing `PROC_HEADER` — CORRECT**, all four, and
  none is a starter.

**What actually separated them: nothing visible before reading.** Both my
proxies picked the wrong function. Reference density said `sub_0807567C`, which
matched first try — its four dense globals were all already declared and typed
in `hardware.h`, so density measured work that had been done in a previous wave.
New-callee count said `sub_08075C98`, which also matched first try — two of its
three "new" callees were already prototyped, and settling the third took one look
at a prologue. **A count of new callees is the wrong unit; a count of
*undeclared* callees is the right one, and even that is nearly free, because
arity and void-ness read straight off the prologue and epilogue.**

**The recommendation for wave 20 is therefore to stop looking for an ordering
metric in this band.** The cost distribution is not "some functions are 3–5x
harder"; it is "almost everything is one or two iterations once the vocabulary is
in context, and occasionally one function is blocked by something no metric can
see" — here a missing linker symbol, in wave 18 a wrong aggregate type. Ranking
cannot help with that shape of distribution; **throughput can.** Batch by shared
vocabulary so the idioms are already derived (that part of the callee-set result
holds and is why 1,260 bytes cost six runs), then read every member rather than
ordering them. The pre-registration is the finding: two plausible metrics, built
from the best evidence this wave produced, and both ordered the batch backwards.

### `tools/lc_screen.py` misclassifies low-fan-in ROM tables as `.LC` pool words (wave 19, W19-A)

Three of the four `.LC` words the screen reported for this batch are ordinary
globals, all confirmed by dereferencing `baserom.gba`:

| reported as `.LC` | what it is |
|---|---|
| `gUnknown_08615E40` (fanin 1, density 4) | a 12-byte `u8` table, `02 03 04 05` ×3, read `base + index; ldrb` |
| `gUnknown_081CC4C4` (fanin 1, density 8) | an 8-byte OAM sprite blob, `0x0001` + one triple |
| `gUnknown_081CC4CC` (fanin 1, density 9) | the next 8-byte OAM blob |

`sub_080748A0` was scored at two pool words and compiles to `relocs: match` with
none. The screen splits on fan-in plus position in a `.rodata` run, and a genuine
low-fan-in ROM table inside such a run is indistinguishable to it — which is the
same ambiguity its own docstring describes for the *index*, not yet applied to
its own output. Two checks cost nothing and settle it:

- **Dereference the address.** A pool word holds an address; `02 03 04 05` does
  not. This is the check the `-fforce-addr` section already tells you to run
  before believing a `varies` entry, and it applies to the screen too.
- **Check the spacing.** A `-fforce-addr` pair is **4** bytes apart, one word per
  address the function forces. `gUnknown_081CC4C4` and `gUnknown_081CC4CC` are
  **8** apart, which is an element stride, not a pool.

And the use site is decisive: a rerouted address constant is always a **double**
indirection (`ldr rN, =word; ldr rM, [rN]`). A single `ldr rN, =sym` feeding an
`adds`/`ldrb` or a `u16 *` argument is a plain global. **Since `.LC` count no
longer predicts cost, the screen's remaining job is telling you which symbols to
declare — and for that a false positive is worse than a false negative, because
it invites inventing a global for an address that is not one.**

---

## `.LC` reachability is decided by YOUR candidate's control flow (wave 19, W19-B)

Wave 18 established "write the honest spelling first — since wave 18 the build can
place the pool word". That is right, and it has a precondition nobody had hit:
**agbcc has to actually emit the `.rodata` word, and whether it does depends on
the candidate's own CFG. A near-miss with no `.rodata` section is not evidence
that the ROM's `.LC` word is unreachable from the honest source.**

`sub_0804F18C` is the case, and it moved twice in one session:

| draft | `.rodata` words emitted | size |
|---|---|---|
| honest, guard spelled `if (a && !b)` | **none** | −4 |
| honest, guard spelled as nested `if`s | **all three, in the ROM's slot order** | −16 |

Nothing about how the three globals are *named* changed between those two rows.
The only edit was to a guard on an unrelated object, and it decided whether
`gUnknown_03001FBC`, `gUnknown_0300451C` and `gUnknown_0300453C` were rerouted
through `.rodata` at all. The `&&` folds two bit tests into one compare, which
removes a basic block; three blocks reroute and two do not.

**The practical rule: when a `.LC`-carrying target's honest draft emits no
`.rodata`, the diagnosis is that your CFG is wrong, not that the reroute is
unreachable.** Get the branch structure right first and re-check `grep -c
'.section .rodata'` on the emitted `.s` before reaching for `c_local`.

This retires the wave-13 scalar/array triage as a *decision* rule. That triage
said a `.LC` word pointing at a scalar is fixable with `c_local` and one pointing
at an array is an automatic park. Measured here: `sub_0804F658`'s three words are
`&gUnknown_0300451C`, `&gUnknown_0300453C` and **`&gUnknown_03004580`, an
array** — the row the triage parks outright — and the honest spelling emits all
three, correctly ordered, with the pool relocating `R_ARM_ABS32 .rodata` exactly
as the twelve unparked wave-18 functions do. What the triage was really measuring
was which spelling reproduces the ROM's *indirection*, and the answer since wave
18 is "the honest one, always" — provided the CFG is right.

Two negative results from the same session, so nobody re-derives them. Neither
`volatile` on the read, nor `-fforce-mem`, nor `-fno-gcse`, nor `old_agbcc`
produces the reroute where the CFG does not; and a zero-trip `do { } while (0)`
does **not** substitute for a real basic block here (four spellings probed, none
emitted `.rodata`). The reroute is a front-end/CFG effect, not a flag or a
loop-depth effect.

### Two bitfield tests on one byte FOLD across `&&` — and the ROM's two tests need nested `if`s

Sharper and cheaper than the section above, and it is what unlocked it.
`gUnknown_03004504.bit0 && !gUnknown_03004504.bit6` does not compile to two
tests: `fold` collapses it to `(x & 0x41) == 1`, one mask and one compare. The
ROM keeps both. Six spellings, one probe, and only the last reaches it:

| source | codegen after the `ldrb` |
|---|---|
| `if (a.bit0 && !a.bit6)` | `mov #0x41; and; cmp #1; bne` — **folded** |
| `if (a.bit0 != 0 && a.bit6 == 0)` | byte-identical to the row above |
| `if (a.bit0) { if (!a.bit6) … }` | two tests, but `+ lsl #0x18; lsr #0x18` on the second |
| `if (a.bit0 == 0) return; if (a.bit6 != 0) return;` | identical to the row above |
| bitfield reads bound to `int` locals first | `ldr` (SImode!) plus three shifts — worse |
| **`t = *(u8 *)&a;` then `if (t & 1) { if (!(t & 0x40)) … }`** | `mov #1; and; cmp #0; beq; mov #0x40; and; cmp #0; bne` — **exact** |

Two things fall out. The **fold is the default**, so a pair of separate mask
tests in the ROM is positive evidence the source did *not* use `&&` — read it as
nested `if`s. And the nested `if`s alone are not enough: a bitfield read of a bit
above 0 carries a QImode truncation (`lsl #24; lsr #24`) that a plain mask on an
`int` temp does not, so **the byte has to be read once into a wide local and
masked, not read twice as bitfield members**. `sub_0804BCB8`'s own body has the
identical eight-instruction shape over the same two bits of the same byte, so
this is worth carrying to it.

Note the third row against the fifth: binding the *fields* to locals is strictly
worse than binding the *byte*, and it changes the load width from `ldrb` to
`ldr`. That is the "one binding local per statement" instinct pointing the wrong
way — here what wants binding is the container, not the values.

### The boundary test: J = 1.0 needs a SET-SIZE floor, and |shared| is the free discriminator (wave 19, W19-B)

The section above established callee-set Jaccard as a duplicated-body detector on
one pair and proposed "20+ callees" as the qualifier. That qualifier was then
tested against a second J = 1.000 pair with a *small* set, chosen precisely
because it should fail. It did fail, and the way it failed names a third
behaviour that neither "family instantiation" nor "independent function"
describes.

| pair | J | \|shared\| | bytes | outcome |
|---|---|---|---|---|
| `sub_0806EB5C` / `sub_0806ED7C` | 1.000 | **26** | 544 / 644 | ED7C: **1** attempt, 27 statements transcribed, matched |
| `sub_0804F18C` / `sub_0804F658` | 1.000 | **5** | 572 / 612 | F658: 4 attempts, same residual class, **neither closed** |

**The ratio is identical and the outcomes are 1 attempt versus 4-and-open, so the
ratio alone is worthless. `|shared|` orders them correctly and costs nothing to
compute.** A five-callee overlap is satisfied by any two functions in the same
subsystem — here `sub_0801566C`, `sub_08015608`, `sub_080155C0`, `sub_0804BCB8`
and `sub_08057D44`, which is just "rebuilds an OBJ and reseeds its position".
Twenty-six is a claim about the whole body.

**What the small-set pair DID buy is worth having a name for: a shared residual
class.** F658's first draft was pure substitution from F18C's and landed in
F18C's failure mode immediately, and then **four consecutive edits transferred
one-for-one**, in the same direction, with no re-derivation:

- the nested-`if` guard: F18C 26.7% → 36.0%, F658 16.5% → 31.4%, same edit;
- the `do { } while (0)` lever: a regression in both;
- `int v` + `(s16)` casts: byte-neutral in both;
- both end up short of the ROM rather than long, on the same allocation choice.

So the useful reading of an intermediate-size J = 1.0 pair is **not** "you will
transcribe the second one" but "whatever the first one's residual turns out to
be, the second one has it too, and every probe you spend is spent twice". That is
the `sub_0804D290` / `sub_0804DCA8` property — *a stuck representative banks the
sibling's work* — arriving from a metric rather than from shape similarity.

Practical form for wave 20: **batch on `|shared callees| >= ~20 && J >= 0.9` if
you want functions that fall out by transcription; batch on J = 1.0 with a small
set only when you are willing to pay one function's exploration for two
functions' worth of result.** Do not read the two cases as the same bet.

---

## PRE-COMMITTED probe of the |shared|-callee middle: `sub_08083A44` (wave 20, W20-A)

Wave 19 left the `|shared callees|` floor with exactly two calibration points and
nothing between them:

| pair | J | \|shared\| | outcome |
|---|---|---|---|
| `sub_0806EB5C` / `sub_0806ED7C` | 1.000 | 26 | 1 attempt, 644 B, transcribed |
| `sub_0804F18C` / `sub_0804F658` | 1.000 | 5 | 4 attempts, neither closed |

`sub_08083A44` sits at **|shared| = 10, J = 1.000** against *three* already-matched
exemplars (`sub_080831FC`, `sub_08083484`, `sub_08083738` — identical callee sets,
`extra = []`, `missing = []`). It is the cleanest probe of the middle available.

**Written before reading one instruction of `sub_08083A44`.** Inputs allowed:
`data/functions.json` only — 1,180 bytes, `backward_branches: 5`, callees
`Div, DivRem, Interpolate, PutSprite, PutSpriteExt, SetObjAffine, sub_0803BC7C,
sub_0803BC88, sub_0803BC94, sub_0803CBD8`, data refs = the exemplars' set
(`gSinLut`, `gUnknown_03005968`, `gUnknown_0848B6CE`) PLUS the 0x08082 block's
table group (`gUnknown_08615C76`, `gUnknown_08615C84`, `gUnknown_0861696C`,
`gUnknown_08616972`, `gUnknown_08616980`) and ONE pool word, `gUnknown_081D93D4`,
where each exemplar has two.

**Unit, fixed in advance:** invocations of `python tools/trymatch.py sub_08083A44`
from first draft to exit 0, counting every invocation. Same unit as the exemplar
triple, which cost 1 / 6 / 1.

### Prediction: 4 attempts. Bet: TRANSCRIPTION, not shared-residual.

The two wave-19 cases are not two points on one scale — they are two different
bets, and the discriminator is **whether the exemplar closed**, not the set size:

- The 26-callee case was a transcription bet and it paid because EB5C was
  *matched*, so there was a finished body to copy.
- The 5-callee case was a shared-residual bet: F18C never closed, so what F658
  inherited was a *failure mode*. Every probe was spent twice because neither
  probe was a success.

All three of `sub_08083A44`'s exemplars are matched and promoted in
`src/decomp/c_080831FC.c`. There is no residual to inherit. So the only live
question is **how much of the 1,180 bytes the exemplars cover**, and I predict:
the four-way phase chain and the affine tail transcribe for free (they are already
written three times, and wave 19 spent six of its eight runs on ONE expression
inside them, which is now a recorded rule), while the `backward_branches: 5` loop
and the five extra table globals are new material the exemplars say nothing about.

That is roughly 600 transcribed bytes and 600 derived bytes. Per the doc's own
band table the derived half sits in the 512–768 B class, and a loop is *one
coupled decision* rather than many independent ones — it fails as a whole and
gives a diff that does not point at itself.

**Predicted: 4.** Not 1 (the loop is not in any exemplar), not 6+ (the expensive
part of the exemplar family is already solved in writing).

**Three falsifiable side-bets:**

1. **The `|shared|` floor is not the real variable.** If this comes in at 1–2,
   `|shared| = 10` did not "earn" it — a matched exemplar did, and the rule should
   be restated as *exemplar STATUS, not overlap size*.
2. **The single pool word is not a cost.** `gUnknown_081D93D4` should resolve from
   the honest spelling exactly as the exemplars' six did (wave 18 placement), and
   contribute zero attempts.
3. **The residual, if any, lands in the LOOP and not in the transcribed tail.** If
   an attempt is spent on the affine tail or on a `DivRem` phase expression, the
   transcription discount is weaker than this section claims.

Actuals are appended below, unedited, including the case where I am wrong.

---

## PRE-COMMITTED: what does SIZE alone cost, with NO globals? `sub_08083EE0` (wave 20, W20-B)

Written before reading past the first 400 lines of the target and before any
`compile_probe` on it.

**First, a correction to how the band numbers get quoted.** My assignment cited
them as "258 attempts-per-closed at 280-368B, 278 at 384-512B, 438 and 574 at
512-768B, 811 above 768B". Those are **bytes per attempt**, not attempts, and the
direction is the opposite of what "attempts-per-closed" implies: a *higher*
number means a *cheaper* function. The tables at "The 384-512 band, measured" and
"The 768-byte-and-up band" are the source. Anyone re-reading this section should
take the claim as *large functions cost fewer attempts per byte*, not more.

### Why this target is the clean test

Every band measurement so far came from functions that also carried globals, pool
words and undeclared callees, and the doc's own causal claim (twice, at 384-512
and at 768+) is that **new type vocabulary, not size, is the entire cost**. Those
two variables have never been separated, because big functions in this tree
happen to carry lots of symbols. `sub_08083EE0` separates them:

- 1,636 bytes, which is 2x the top of the highest measured band;
- `data_refs: []` -- **zero** globals, so zero new global vocabulary;
- three callees (`DivRem`, `Interpolate`, `sub_0801F34C`), all already declared
  with settled prototypes, so zero new callee vocabulary;
- `backward_branches == 0`, so the doc's necessary-but-not-sufficient screen is
  satisfied and the "N independent decisions" model applies;
- one struct type, on a single pointer parameter parked in r7, with a candidate
  exemplar already promoted in the same block (`src/decomp/c_080831FC.c`).

So the only new vocabulary it can possibly force is **one struct layout**, and
even that may already exist.

### The prediction

**2 `try_match` attempts for `sub_08083EE0` alone**, excluding the six small
wrappers in the same batch, which are reported separately and are not allowed to
dilute the number.

Reasoning, and the part that makes this a weaker test than it looks:

1. Extrapolating the size curve: 811 bytes/attempt at 768+, applied to 1,636
   bytes, predicts **2.0 attempts**.
2. Applying the vocabulary model instead: 0-2 new types is "one attempt, every
   time" per the 768+ table, predicting **1 attempt**.
3. **The two models are one attempt apart, so the count alone cannot separate
   them.** Pre-committing to that is the honest move -- an agent who predicts 2,
   measures 2 and declares the size step confirmed has learned nothing. What
   discriminates is the *shape* of the residual, so I am pre-committing to that
   too (below), and the count is only the falsification test.

What I expect to actually cost something, none of which is size:

- The address-CSE chain. `adds r0,#0x64` -> `adds r0,#4` (+0x68) -> `subs r0,#0x1c`
  (+0x4c), parked in `sl`, `[sp,#4]` and `r8`. This is ONE coupled decision that
  sets source-statement order for the whole body; read wrong, every `ldrsh` is
  misplaced and the diff will not localise.
- `sub sp, #8` plus `str rN, [sp]` before each `Interpolate`: the fifth argument
  is stacked, so the frame is decided by the callee's arity and not by a local.
- The struct: +0x4e, +0x64, +0x68, +0x4c, +0x66, +0x58 and the write targets
  +0x2c/+0x30/+0x3c/+0x40. The exemplar pins +0x34/+0x4c/+0x4e/+0x52/+0x60, which
  overlaps on **+0x4c and +0x4e only**. That is a hypothesis, not a fact, and a
  byte-neutral wrong type has no oracle -- so I am not counting the exemplar as a
  vocabulary discount.
- The bulk is four near-identical `DivRem`/`Interpolate` blocks. **Most of the
  1,636 bytes is repetition, not distinct decisions**, which is exactly why I
  expect size to be nearly free here.

### Falsification, stated in advance

- **>= 4 attempts** (i.e. < 410 bytes/attempt, worse than the *512-768* band's
  438 despite being 3x the size) falsifies "the step is about size" for a
  globals-free function, and says the earlier bands were measuring the globals
  and pool words their functions happened to carry.
- **1-2 attempts** is consistent with the step, but per point 3 above it does
  **not** confirm size as the cause -- it is equally the vocabulary model's
  prediction. In that case the tie is broken by the residual: if the attempts I
  do spend are lost on the **struct layout and the address chain** rather than on
  anything that scales with byte count, then size was free and the step was never
  about size.
- "I could not close it" is a result too, and will be reported with the exact
  remaining diff and the axes ruled out.

Actuals are appended below, unedited.

### ACTUALS for `sub_08083EE0` (wave 20, W20-B)

**1 `try_match` attempt. 1,636 bytes per attempt.** Predicted 2; the size
extrapolation said 2.0 and the vocabulary model said 1, and the vocabulary model
won. Full accounting, and nothing here is padded with the six wrappers in the
same batch, which are reported separately below:

| | `sub_08083EE0` |
|---|---|
| bytes | 1,636 |
| `try_match` attempts | **1** (match) |
| probe rounds | 4 |
| new globals declared | 0 |
| new callee prototypes | 0 |
| new struct types | 1 |

The four probe rounds were: one full-function draft; two controlled sweeps of a
single expression (10 and 11 spellings) for the one residual it had; one
confirming full-function probe that came back **instruction-for-instruction
identical, 814 of 814**, before the verdict was spent.

### The answer to the question: the size step is REAL, and it was never about size

**At 1,636 bytes with zero `data_refs`, zero new callee prototypes and one new
struct, the function cost one attempt.** That is 1,636 bytes per attempt against
the 768+ band's 811 and the 280-368 band's 258 -- it does not merely sit on the
cheap side of the step, it is twice as cheap as the cheapest band ever measured.
So **"large functions are dearer" is refuted a third time**, and the step in the
band table is not an artefact of the globals those functions carried.

But the honest reading is stronger and more useful than "the step is real":

**Size did not participate in the cost at all, in either direction.** Of the
1,636 bytes, roughly 1,300 are four near-identical `DivRem`/`Interpolate` blocks
and their kind-4/kind-1 twins. Transcribing them cost nothing per byte, because
each is an independent statement whose diff points at itself -- the doc's "N
independent decisions" claim, at 4x the size it was made at. **The whole cost of
the function was ONE expression**, and that expression appears at six sites, four
of them inside the repeated bulk. Had the function been 200 bytes and contained
that expression once, it would have cost the same one attempt.

So the band table's rising bytes-per-attempt is real but it is measuring the
wrong variable. What actually happened across all those bands is that **cost is
roughly constant per DISTINCT EXPRESSION SHAPE, and large functions have a lower
distinct-shape-per-byte ratio because they repeat themselves.** Bytes per attempt
rises with size for the same reason lines-of-code per bug does. That subsumes the
"new type vocabulary" claim at 384-512 and 768+ rather than contradicting it: a
new struct or a new global IS a distinct shape you have to derive, and the four
one-attempt matches in the 384-512 table had none.

**The practical rule this replaces the band table with:** do not screen on size
in either direction, and do not screen on `data_refs` count. Screen on **how many
distinct expression shapes the listing contains**, which for a straight-line
function is cheap to eyeball -- read the `bl` sequence and count how many times a
*different* one appears, not how many times any appears. `sub_08083EE0` has
roughly eight distinct shapes in 814 instructions and that, not 1,636, is its
size.

Two caveats, so this is not over-read:

- **n = 1.** It is one function, and the strongest single datapoint in the table,
  but the band figures behind it are 4-6 functions each.
- The prediction and the outcome were one attempt apart, exactly as
  pre-registered, so **the count alone did not discriminate the two models** --
  the tie was broken by the residual's shape, which was pre-committed above and
  came out on the "not size" side: the one thing that cost anything was an
  expression-association rule, which has no size dependence whatsoever.

### The rule that WAS the whole difference: fold moves an additive literal onto the OTHER operand

This is the residual, and it is a general one-token rule that belongs next to
`* 0x100` vs `<< 8`.

When an additive expression has three parts -- two variable terms and a literal --
`fold`'s `associate` (via `split_tree`) rewrites it so the literal ends up
attached to **the operand it was NOT written next to**:

```c
/* ROM shape: lsls r4,r4,#4 ; subs r0,#0x54 ; subs r4,r4,r0   */
a * 16 + 0x54 - b       /* -> a * 16 - (b - 0x54)  <- fold's canonical form */

/* NOT the ROM: lsls r4,r4,#4 ; adds r4,#0x54 ; subs r4,r4,r0 */
a * 16 - (b - 0x54)     /* -> (a * 16 + 0x54) - b */
```

Identical length, identical register assignment, pure opcode-and-operand diff, so
there is nothing in the expression to blame. The same holds for `PLUS`:
`a * 16 + 0x3C + b` emits `adds r0, #0x3c` on `b`, while
`a * 16 + (b + 0x3C)` emits `adds r4, #0x3c` on the shift.

**Read backwards, this is a source-order readout and a good one:** the constant
lands in the ROM on the operand the source did NOT write it beside. So
`subs r0, #0x54` applied to the second operand means the source wrote
`<first> + 0x54 - <second>`. Every additive triple in a listing carries this
signal for free.

`split_tree` needs an `INTEGER_CST` directly under a `PLUS_EXPR`/`MINUS_EXPR`, so
the association fires on every purely-arithmetic spelling. Eleven were measured
and all eleven fold: `a*16 - (b - K)`, `a*16 - b + K`, `a*16 + (K - b)`,
`a*16 - (b + -K)`, `a*16 - (b - Ku)`, `(a<<4) - (b - K)`, `a*16 - (int)(b - K)`,
`-((b - K) - a*16)`, `a*16 + -(b - K)`, `a*16 - (b - K) + 0`, and
`a*16 - (K * -1 + b)`. **Do not sweep spellings of the arithmetic -- there is
exactly one that works and it is the one with the literal on the first operand.**

**Ruled out, so nobody repeats it:** binding the subtrahend to a local
(`t = b - K;` then `a*16 - t`), the compound form (`t = b; t -= K;`) and the
comma operator inside the argument (`(t = b - K, a*16 - t)`) all DO block the
association -- but all three emit the `subs` **before** the shift rather than
after, because a statement or comma boundary orders them, and the ROM's order is
shift-then-`subs`. They are the wrong fix even though they defeat the fold. The
comma-operator lever recorded elsewhere in this document is for *creating a
reference at a point no statement boundary can reach*; it is not an association
lever and it costs ordering here.

### The batch's other six, for completeness

Six wrappers at 0x08084580-0x0808488C, 208 bytes, **zero `try_match` attempts** --
all six were finished at the `compile_probe` stage and every one passed the
verdict first time. Reported separately on purpose: folding them into the number
above would have turned "1 attempt for 1,844 bytes" into a figure that says
nothing about either half.

Two findings from them that are not about size:

- **`if (c) return A; return B;` and `if (!c) return B; else return A;` are
  DIFFERENT CODE**, and it is the arm placement, not the branch condition. agbcc
  puts the *early-return* form's `B` in the fallthrough and the explicit-`else`
  form's `A` in the fallthrough, so a listing that falls through into the arm you
  consider "the interesting one" wants the explicit `else` with the condition
  inverted. `sub_08084864` and `sub_0808488C` both turn on exactly this.
- **A `u8 [][32]` and a flat `u8 []` with an explicit `+ i * 32` are the same
  address and different code as soon as the index carries a constant.**
  `arr[i + 6]` on the 2-D declaration lets fold distribute the element-size
  multiply and fold `6 * 32` into the symbol -- the pool word becomes
  `gUnknown_0823DC38+0xc0` and the ROM's runtime `adds r0, r4, #6` vanishes. On
  the flat declaration the `+ 6` survives. **A pool word carrying a non-zero
  addend where the ROM has a bare symbol plus a runtime add is this, and it is a
  declaration bug, not an expression bug** -- the same family as wave 18's
  "suspect the TYPE before the allocation".

### A note on the harness, since it cost nothing but would have

`try_match` compiles `work/<fn>/<fn>.c`, and retyping an already-promoted
function means editing `src/decomp/c_<fn>.c` AND that stale work copy. Retyping
`sub_08084858`'s return to `u8` and re-verifying gave `COMPILE FAILED --
conflicting types` until the work copy was updated too. That is the wave-17
draft-artefact failure mode arriving from the other direction: the artefact is
the *stale* work draft, not a corrupted one. Diff `work/<fn>/<fn>.c` against
`src/decomp/c_<fn>.c` before believing a regression on a promoted function.

### Two extension functions, and they sharpen the finding rather than repeat it

`sub_08084600` (200 B) and `sub_08084F44` (256 B) were taken after the above, from
the same file, with `Interpolate` and `DivRem` already in hand. Both matched on
**one `try_match` each, from the first draft, with zero probe iterations** -- the
first full-function probe of each came back instruction-for-instruction identical
(100/100 and 126/126) before the verdict was spent.

That is the useful control the batch was missing. These two are 8x and 6x SMALLER
than `sub_08083EE0` and cost exactly the same one attempt, so within this batch
**cost was flat from 200 to 1,636 bytes** -- an eightfold size range with no cost
signal at all. Combined:

| function | bytes | probe rounds | `try_match` | new globals | new protos |
|---|---|---|---|---|---|
| `sub_08083EE0` | 1,636 | 4 | 1 | 0 | 0 |
| `sub_08084F44` | 256 | 1 | 1 | 0 | 1 |
| `sub_08084600` | 200 | 1 | 1 | 3 | 0 |
| six wrappers | 208 | 4 (shared) | 0 | 5 | 2 |

The three larger ones total 2,092 bytes for 3 attempts (697 bytes/attempt) and the
whole batch 2,300 bytes for 3 attempts (767). **Note that the batch total is
DRAGGED DOWN by the small functions, which is the opposite of what the band table
would predict and is entirely an artefact of counting bytes**: the six wrappers
contributed 208 bytes and zero attempts, while the one function that cost an
attempt for a non-trivial reason (`sub_08083EE0`) contributed 1,636. Any
bytes-per-attempt figure is a ratio of two things neither of which is what you
want to know.

Note the two extension functions carried MORE new vocabulary than the big one --
three new globals and one new prototype between them, against zero -- and still
cost one attempt each, because each piece of vocabulary was a single `ldrh` or a
single entry-narrowing readout. So "new type vocabulary" predicts cost only when
the vocabulary is genuinely ambiguous; counting declarations does not.

---

## PRE-COMMITTED: the extreme test of the distinct-shape rule — `sub_0800CFDC`, 6,384 bytes (wave 20, W20-B)

Written after a structural survey of the listing (block counts, idiom counts, two
case bodies) and **before drafting a line of C**. The section above claims cost is
roughly constant per DISTINCT EXPRESSION SHAPE and that large functions are cheap
because they repeat themselves. `sub_0800CFDC` is the strongest available test:
6,384 bytes, `backward_branches == 0`, 466 branches, 254 labels, four callees.

### The distinct-shape count, committed before the answer is known

**10 distinct expression shapes.** Measured, not guessed:

| # | shape | instances |
|---|---|---|
| 1 | `p = gUnknown_08499590` (plus the `.LC` reroute at the head) | 22 |
| 2 | `rows = p + 0x417A`, `tiles = p + 0xA22` — the `c_08001158.c` idiom | 26 |
| 3 | cell read `*(u16 *)(tiles + (*(u16 *)(rows + y*2) + x) * 2)`, x and y each ± a small constant | ~159 |
| 4 | the bridge predicate `(u16)(cell - 0x86) <= 1` | 159 |
| 5 | exact tile compares (`== 0x65`, `!= 0x45`, …) | dozens |
| 6 | bounds guards (`x >= width - 2`, `y <= 1`, `x > 0`, `y > 0`) | dozens |
| 7 | `width = *(u16 *)p`, `height = *(u16 *)(p + 2)` | many |
| 8 | two `casesi` switches, 26 entries each, 5 and 7 distinct arms | 2 |
| 9 | the four helper calls (`sub_0800E8CC/E9F4/EAF4/EB5C`, 32 sites) | 32 |
| 10 | the shared `return` tail reached by four `bl` FAR JUMPS | 4 |

Supporting counts: 189 basic blocks, 159 occurrences of the `subs #0x86` predicate,
169 `lsls #0x10; lsrs #0x10` u16 truncations, 26 `0x417A` pool loads, 21 `0x0A22`.
Two 74-line case bodies picked blind differ only in register allocation and in the
tile constants they compare against. **The function is one auto-tiling predicate
evaluated 159 times over different neighbour offsets.**

Against that, the honest counter-evidence, recorded so it is not retrofitted:
**93 distinct normalised BASIC-BLOCK shapes out of 189, 69 of them singletons**,
with registers and immediates erased. Block-shape diversity is much higher than
expression-shape diversity. If cost tracks the block number rather than the
expression number, this function is 9x `sub_08083EE0` and my rule is wrong.

### The prediction

**3 `try_match` attempts.**

That is deliberately *not* the 1 that the distinct-shape rule alone implies, and
the gap is the real hypothesis:

- **Shape cost: ~1 attempt.** Ten shapes, of which shapes 2 and 3 are already
  solved in a promoted file (`src/decomp/c_08001158.c` has the exact
  `p`/`rows`/`tiles`/`off` binding), shape 8 is documented as free ("jump tables
  match, and they are a readout of source order"), and shape 10 is compiler
  output I do not spell at all. Only shapes 4-7 need deriving and they are one
  line each.
- **Plus ~2 attempts of CLERICAL cost, which my rule does not model.** 159
  predicates each carrying its own `x ± k` / `y ± k`, 254 labels, 466 branches and
  two 26-entry case tables is a transcription volume that scales with SIZE, not
  with shape count. A single wrong `+1` is a real mismatch.

**This is the specific thing I expect to be wrong about my own rule**: that cost
is "per distinct shape" full stop. I predict there is a second, size-linear
clerical term that `sub_08083EE0` was too small and too regular to expose.

### Falsification, stated in advance

- **>= 5 attempts, or no close, with a residual made of scattered wrong
  constants** falsifies "cost is per distinct shape" as a complete model and
  confirms the clerical term.
- **1-2 attempts** falsifies my *prediction* in the other direction and says the
  clerical term is absorbed entirely by `compile_probe` — in which case the rule
  should be restated as being about `try_match` attempts specifically, and the
  probe rounds are where the size cost actually lands. **I will therefore report
  probe rounds as a first-class number, not a footnote**, because if attempts stay
  flat while probe rounds scale with size, the honest conclusion is that the
  metric everyone has been quoting for eight waves measures the verdict step and
  not the work.
- **A residual that is one SHAPE error repeated 159 times** would confirm the rule
  cleanly, because it would cost one edit regardless of size.
- If it turns out to be genuinely intractable rather than merely long, that gets
  said early with the diff, and two smaller datapoints (`sub_0800EC20`,
  `sub_0800F8D4`) are worth more than one heroic failure.

Actuals are appended below, unedited.

### RESULT: 1 attempt, not 4 — and the whole batch was 4 for 3,304 bytes

Actuals, same unit, nothing edited above. Every function verified by exit status.

| function | bytes | predicted | actual `trymatch` runs | outcome |
|---|---|---|---|---|
| `sub_08083A44` | 1,180 | **4** | **1** | matched, `relocs` = pool word placed |
| `sub_080829B0` | 604 | — | **1** | matched, byte-for-byte |
| `sub_08082C0C` | 1,064 | — | **1** | matched, byte-for-byte |
| `sub_08083034` | 456 | — | **1** | matched, byte-for-byte |

**Four `trymatch` invocations for 3,304 bytes, all four exit 0 on the first
submission.** The exploration was ~60 `compile_probe`-class compiles (local, via
the wave-17 `probediff.py`), which cost nothing and never touched the verdict.

Scoring the prediction and the three side-bets, because the misses are the point:

- **The number was wrong by 4x, and side-bet 1 is why.** I predicted 4 on the
  theory that "roughly 600 transcribed bytes and 600 derived bytes" would split
  the cost. It did not: the loop *was* the entire difficulty, and it was resolved
  entirely inside `compile_probe`. **`|shared| = 10` earned nothing. What earned
  it was that all three exemplars were MATCHED, so there was a finished body to
  copy and no failure mode to inherit.** Side-bet 1 called this and it is the
  finding: restate the wave-19 rule as *exemplar status, not overlap size*. The
  5-callee pair cost four attempts because neither member ever closed — that is
  a property of the exemplar, not of the number 5.

  *(Correction added after the fact by W20-A, and it strengthens rather than
  weakens the point. The `|shared| = 10` this prediction was written against is
  the RAW count. Under W20-C's `tools/overlap_screen.py --max-fanin 40`, which
  drops `Div`, `DivRem`, `PutSprite`, `SetObjAffine` and the other library
  helpers, the same pair is `|shared| = 4, J = 1.000`. The prediction stands as
  made -- it was made on the inputs available -- but the true overlap was even
  smaller than the number I discounted, and it still cost one attempt. Two
  agents reached the same conclusion by different routes this wave: the count
  was never the variable.)*
- **Side-bet 2 (the single pool word costs nothing) — CORRECT.** `gUnknown_081D93D4`
  resolved from the honest spelling exactly as wave 18's placement predicts;
  `trymatch` printed `relocs: name different symbols that resolve to the same
  address` and the `rodata: ["0x081D93D4"]` line to add at promotion. Zero
  attempts, zero thought.
- **Side-bet 3 (the residual lands in the loop, not the tail) — CORRECT, and
  strongly.** The affine tail and the four-way phase chain transcribed verbatim
  from `src/decomp/c_080831FC.c` and were right on the first compile in all four
  functions. Every single probe went into loop shape: induction variables,
  association of constants, and one loop-variable naming decision.

**The generalisable lesson is about the unit, not the number.** Counting
`trymatch` invocations measured almost nothing here, because a free local
compile-and-diff loop absorbs all the work and the verdict is then a formality.
Wave 19 reported "eight local `trymatch` runs" for its 2,120-byte triple and six
of the eight went on one expression — those six would have been probes under this
workflow. **If a later wave wants a cost metric, count probe rounds, not
attempts, and expect the two to diverge by an order of magnitude.**

### The `0x081D93B0-0x081D93D4` pool run IS one continuous `-fforce-addr` block, and it is slot-ordered by function address

All twelve words dereferenced against `baserom.gba`, which settles the second
question wave 20 asked:

| word | holds | owner |
|---|---|---|
| `0x081D93B0` | `0x08616980` | `sub_080824D4` |
| `0x081D93B4` | `0x0300591C` | `sub_080824D4` |
| `0x081D93B8` | `0x03002EE0` | `sub_08082660` |
| `0x081D93BC` / `C0` | `0x0861696C` / `0x08615C04` | `sub_080831FC` |
| `0x081D93C4` / `C8` | `0x0861696C` / `0x08615C04` | `sub_08083484` |
| `0x081D93CC` / `D0` | `0x0861696C` / `0x08615C04` | `sub_08083738` |
| `0x081D93D4` | `0x08615C04` | `sub_08083A44` |
| `0x081D93D8` / `DC` | `0x03000650` / `0x08499598` | later |

Two things confirmed, both already predicted by the doc and neither previously
measured on a run this long:

- **Slot order is function address order** (`0x080824D4 < 0x08082660 <
  0x080831FC < 0x08083484 < 0x08083738 < 0x08083A44`), extending W18-B's
  monotonic-slot rule across ten consecutive slots and *six* functions, including
  two that are still `asm` and own slots ahead of the matched ones.
- **Three siblings hold three different `gUnknown_081D93xx` names for the SAME
  two addresses.** This is the "several pool words in a run can hold the same
  address" caveat, seen at full strength: six words, two distinct addresses.

**Why `sub_08083A44` needs only one word, and it is not a size effect.** Its
single word is `&gUnknown_08615C04`; what the three exemplars *also* reroute and
it does not is `&gUnknown_0861696C`. `sub_08083A44` opens with a five-iteration
loop that reads that table, so agbcc hoists the address into a callee-saved
register (`ldr r7, =gUnknown_0861696C` before the loop) and the four-way phase
chain afterwards reloads it once into `r4`. That is **one** address reference
reaching the merge, and the reroute trigger is reference count across a
control-flow merge. The exemplars are straight-line: their four chain arms each
name the address independently and all four merge, so it reroutes.
`sub_080829B0` is the control — same block, same table, same four-way idiom
absent, and it has a loop and **no pool word at all**, from either global.

**So a loop *reduces* the pool, by converting N references into one hoisted
pseudo.** That is the opposite of the retired "a pair of words is loop-driven"
intuition, and it is a cheap prediction to make before writing anything: if the
ROM hoists a global's address out of a loop, do not expect a pool word for it.

## Five loop rules from the 0x08082-0x08083 sprite block (wave 20, W20-A)

All five were found by probe on `sub_08083034` (456 B) and then transferred
unchanged to `sub_080829B0`, `sub_08082C0C` and `sub_08083A44`. Each one was
worth a wrong answer on its own; together they are the whole cost of the batch.

### 1. `(i + 1) - x` compiles as `i - (x - 1)` — the constant moves to the SUBTRAHEND

The ROM computes an array index as

```
ldrsh r0, [r1, r2]   @ x = p->unk4e
subs  r0, #1
subs  r0, r7, r0     @ i - (x - 1)
```

and the source spelling that produces it is **`i + 1 - p->unk4e`**, not
`i - (p->unk4e - 1)`. Measured, five spellings, one probe:

| source | codegen |
|---|---|
| `i - (p->unk4e - 1)` | `add i,#1` hoisted, then `sub` — i.e. `(i + 1) - x` |
| `i + (1 - p->unk4e)` | identical to the above |
| `-(p->unk4e - 1) + i` | identical to the above |
| `i - p->unk4e + 1` | `sub r1,r0` then `add r1,#1` — `(i - x) + 1` |
| **`i + 1 - p->unk4e`** | **`sub r0,#1` then `sub r1,r0` — exact** |
| **`(i + 1) - p->unk4e`** | identical to the row above |

`fold` normalises all of them and the mapping is an **inversion**: writing the
constant next to `i` puts it on `x`, and writing it next to `x` puts it on `i`.
This is the same phenomenon as the wave-19 `p->unk52 + 2 + p->unk4e` table, now
seen on MINUS, where it also decides which operand is *loaded* first — and here
it further decided whether `i + 1` was shared with the sibling index
`gUnknown_08616972[i + 1]`. The ROM does **not** share it, which is the tell:
**if the ROM computes `i + 1` twice, once as `sub #1` folded into the other
operand, your source has the constant on the wrong side.**

### 2. `A | (B | C)` does not survive `fold` — put the constant in the MIDDLE

An OAM word built from two reads of the phase table:

```
lsls r3, r3, #0xc     @ A = (g[d1] + 2) << 12
... adds r0, r0, r1   @ B = g[d2] * 32 + 0x1D8
movs r1, #0x80 ; lsls r1, r1, #4 ; orrs r0, r1   @ B | 0x800
orrs r3, r0                                      @ A | (B | 0x800)
```

Six spellings, one probe, and only two reach it:

| source | result |
|---|---|
| `A \| ((B) \| 0x800)` | `(A \| 0x800) \| B` — the constant hops to the FIRST operand |
| `A \| (0x800 \| (B))` | identical to the above |
| `A \| (B) \| 0x800` | `(A\|B) \| 0x800` — constant last |
| `0x800 \| A \| (B)` | `(A\|B) \| 0x800` again |
| **`A \| 0x800 \| (B)`** | **exact** |
| **`0x800 \| (A) \| (B)`** | wrong — do not confuse with the row above |

So the reliable form is `A | K | B` with the constant written **between** the two
variable terms. Note the trap in the last two rows: `A | 0x800 | B` and
`0x800 | A | B` are *not* the same tree, and only the first is right.
`-Wparentheses` is on with `-Werror`, so `B + 0x1D8 | 0x800` will not even
compile — the parentheses the warning forces are free, but the ASSOCIATION is
not.

### 3. To make `i + K` a shared pseudo, BIND it — and bind it inside the expression

`DivRem(p->unk52 + i + 6, 6)` appears twice in one statement. The ROM computes
`i + 6` **once**, into a callee-saved register, and adds it to a freshly-loaded
`p->unk52` each time:

```
mov  r2, sl ; ldrh r0, [r2]
adds r5, r7, #6
adds r0, r0, r5
```

Every parenthesisation of the honest spelling folds the 6 onto the *load*
instead (`ldrh ; add #6 ; add i`), which is the same instruction count and the
wrong pseudo — and that one missing long-lived value cascades: it drops the
function's peak pressure by one, the parameter moves from `r8` to a low
register, and the whole function comes out **4 instructions short** with a
`sub sp, #4` where the ROM has `sub sp, #8`.

| source | insns (ROM = 198) |
|---|---|
| `p->unk52 + (i + 6)`, `(i + 6) + p->unk52`, `i + 6 + p->unk52`, `p->unk52 + i + 6` | 194, all four identical |
| `k = i + 6;` as a statement, then `p->unk52 + k` twice | 198, one insn misplaced |
| **`p->unk52 + (k = i + 6)` then `p->unk52 + k`** | **198, exact** |

The statement form is one instruction early: it emits `adds r5, r7, #6` *before*
the address copy and `ldrh`, where the ROM emits it between them. Putting the
assignment inside the first use makes the binding part of the expression tree, so
op0 (the load) still expands first. This is the wave-17 comma-operator lever
arriving in a second guise — **the binding has to happen at the depth where the
value is first needed, not at the nearest statement boundary.**

Read backwards this is a cheap diagnostic and it inverts the doc's existing one:
**if the ROM holds `i + K` in a callee-saved register where your candidate folds
K onto the other operand, add a binding; you have N terms where the original had
one.**

### 4. Reusing ONE loop variable across sibling loops changes the ALLOCATION

`sub_08083A44` has an outer 5-iteration loop and four 2-iteration loops in a
four-way chain. Written with `int i; int j;` — `i` outer, `j` inner — the four
inner loops all come out with the counter in `r4` and the strength-reduced
`0x48 + 16j` in `r5`. **The ROM has them the other way round**, in all four
branches, and nothing about the expressions changes it: sixteen spellings of the
two induction variables were probed (`j * 16 + 0x48`, `0x48 + 16 * j`, and four
associations of the OAM word) and **all sixteen produced byte-identical output.**

Declaring one `int i` and reusing it for the outer loop and all four inner loops
fixed every one of them at once — 92 differing instruction lines to 12. The
mechanism is the allocno tie-break already in this file: allocno numbers follow
pseudo creation order, source locals are created at block entry and `loop.c`'s
givs afterwards, so a *second* declared local sits between the biv and the givs
and takes the register the giv wants. **A spare local is not free even when it is
never simultaneously live**, and the symptom is a clean two-register swap
repeated at every use — which no expression rewrite will ever move.

### 5. A `ldr rN, =<big constant>` inside a loop can be a FOLDED induction variable

The last 12 bytes of `sub_08083A44` were three instances of

```
ROM   ldr r7, =0x0000AA98 ; str r7, [sp]
cand  ldr r0, =0x0000AA98 ; str r0, [sp]
```

— same constant, same pool, different destination register, in the `i == 0`
arm of each inner loop. The exemplar `src/decomp/c_080831FC.c` has that exact
constant as a **source literal** (`PutSprite(3, x, 0x48, blob, 0xAA98)`), and
transcribing it is what produced the `r0` version. The ROM's is
`(i * 12 + 0x298) | 0xA800` — the same expression as the loop's other two arms
with a different constant — which `cse` folds to `0xAA98` because it knows
`i == 0` on that path, but which leaves the value in the *giv's* register class
rather than in a scratch.

So: **a constant that a nearby arm builds from an induction variable is a
candidate for being that same expression folded, and the destination register is
the only evidence either way.** Byte-wise the two spellings differ, so this is
not a cosmetic choice. The general form of the tell is the one already in this
file for `cse`'s `record_jump_equiv` — a comparison against a constant makes that
constant available on the fall-through, and *anything* on that path may be folded
against it, including strength-reduced expressions that did not exist in the
source.

## Binding a table element to a LOCAL reverses the address-expansion order between two call arguments — and the load still folds back to the call site (wave 20, W20-C)

`sub_08052270` is a straight-line draw routine whose tail is two calls:

```c
sub_080157A4(gUnknown_02029808[a].unk24[b], gUnknown_08553B10[a]);
sub_080157F4(gUnknown_02029808[a].unk24[b], 0x180);
```

The ROM expands the addresses `08553B10`, then `02029808`, and issues the loads
`02029808`, then `08553B10` — the "expand in source order, load in the opposite
one" pattern `src/decomp/c_08051DE0.c` documents for a two-term sum, here across
a two-argument call. Written inline exactly as above, agbcc does the *other*
thing: it evaluates argument 1 completely, then argument 2, so both the pool
order and the two `ldr`s come out `02029808, 08553B10`. That is a 6-instruction
reordering in the tail plus a swapped `r4`/`r6` assignment in the head — and the
register swap is a CONSEQUENCE, not a second fact.

**Binding the second argument to a local fixes both.** All three of these are
byte-identical to each other and to the ROM:

```c
u16 e;  e = gUnknown_08553B10[a];  sub_080157A4(..., e);
s16 e;  e = gUnknown_08553B10[a];  sub_080157A4(..., e);
u16 *p; p = &gUnknown_08553B10[a]; sub_080157A4(..., *p);
```

The binding creates the address at the binding statement — which is what moves
the pool word — while `combine` folds the load itself back down to the call,
because nothing between them writes memory.

**The trap this kills:** an `ldrsh` sitting immediately before the `bl`, with no
separate earlier load, was being read as proof that the argument is an inline
expression and NOT a local. It is not proof of anything. A `u16` local read
exactly once and passed to an `s16` parameter compiles to a single `ldrsh` at
the call site, identical to the inline spelling; the only thing that
distinguishes them is *where the address was expanded*, i.e. the literal-pool
order. **Read the pool order, not the load position.**

This is the same lever as wave 17's comma anchor, reached from the other end:
there the problem was two address constants tied on allocation priority and the
fix was a reference at the right depth; here the problem is two address
constants in one argument list and the fix is a statement boundary. Both are
"the pseudo created FIRST wins", and both are read off the pool order.

## The `c`/`d` copy in `src/decomp/c_08051F4C.c` does NOT generalise to a straight-line sibling (wave 20, W20-C)

`sub_08052650` / `sub_08052AF4` load `unk30` and `unk34` into `r4`/`r3`, copy
each into `r5`/`r6` with `adds rD, rS, #0`, use the first pair up to a
conditional `sub_08052E04` call and the second pair after it. That is exactly
the shape `src/decomp/c_08051F4C.c`'s doc comment attributes to two real
variables (`c = a; d = b;`), and the wave-20 brief predicted the same reading
here. **It is wrong, and the natural spelling with ONE variable each is the
match** (both functions, one `try_match` each).

Measured, in this function: adding `c = a; d = b;` makes the output *smaller*,
not larger — 4 saved registers instead of the ROM's 5, and no `ip` spill. In a
single basic block `cse` propagates `a` into every use of `c`, the copy dies,
and the two live ranges merge into one. The copies in `c_08051F4C` survive only
because their last use is inside a nested `if`, in a block the equivalence does
not reach.

**So `adds rD, rS, #0` before a call and a second register after it is a RELOAD
artefact by default.** It means one value is live across a call and the
allocator needed a callee-saved home for it; it is evidence of two source
variables only when the two ranges also overlap, which you can see because both
registers are live at the same instruction. Here they never are.

## The 0x08052 sprite-install cluster, and the callback table that explains it (wave 20, W20-C)

Six consecutive 0x18-byte animation descriptors at `0x085536A4`-`0x0855371C`
pair a *draw* function with an *install* function; `sub_08015410` takes the
descriptor as its first argument. Dereferenced in `baserom.gba`:

| descriptor | slot 0 (draw) | slot 2 | named by |
|---|---|---|---|
| `085536A4` | `sub_08051DE0` (matched) | `sub_08051F48`, a `bx lr` stub | `sub_08051BEC` (matched) |
| `085536BC` | `sub_08052154` (matched) | `sub_08052270` | `sub_08051F4C` (matched) |
| `085536D4` | `sub_08052154` (matched) | `sub_08052358` | `sub_080520B8` |
| `085536EC` | `sub_080524C0` (matched) | `sub_08052650` | -- |
| `08553704` | `sub_0805297C` (matched) | `sub_08052AF4` | `sub_08052718` |
| `0855371C` | `sub_08052CA4` (matched) | `sub_08052E00`, a `bx lr` stub | `sub_08052BBC` |

Two consequences worth keeping:

- **That table is why none of these functions has a `bl` caller anywhere in
  `asm/`.** They are reached only as data. A zero-fan-in function in a block
  full of matched siblings is a *callback*, not a dead function, and the
  descriptor tells you which family it belongs to before you read a single
  instruction.
- **It also explains `sub_08052650` and `sub_08052AF4` being byte-identical.**
  One C body, installed from two different descriptors, so the two copies need
  distinct addresses. There is nothing to derive for the second one.

`struct Unk02029A10.unk1c` was settled here by an independent producer/consumer
pair, which is the standard the "a wrong type that is byte-neutral has no
oracle" rule asks for: `sub_08052818` writes it `movs r0,#1; strh r0,[r4,#0x1c]`
and `sub_08052650`/`sub_08052AF4` read it `ldrh [r0,#0x1c]; cmp #1`. Halfword at
both ends.

## The band screen was hiding exemplar-rich work -- `tools/overlap_screen.py` (wave 20, W20-C)

Waves 16-19 all screened on `size >= 256 && backward_branches == 0`. The
0x08052 cluster is five matched exemplars interleaved with seven unmatched
siblings at 144-256 bytes, and no band screen ever showed it. **Size was never
the right floor; proximity to a matched exemplar is.** `tools/overlap_screen.py`
measures three kinds of proximity over every unmatched THUMB function of 96
bytes or more (1,494 functions, 400,434 bytes). `--self-test` re-derives this
cluster with no knowledge of it and is the gate on any future change to the
tool.

### Byte-identical duplicates are the single highest-value thing it finds

Strip local labels, compare instruction streams and pool words: **22 groups
involving an unmatched function, 1,652 bytes that are pure transcription** once
one member of each pair is matched. Every one verified as an exact stream match,
not a heuristic:

```
200B  sub_08052650 sub_08052AF4      88B  sub_080672A8 sub_08067358
196B  sub_08058254 sub_08058318      72B  sub_0803A460 sub_08047094
168B  sub_08050134 sub_08050364      68B  sub_080272C4 sub_08027428
160B  sub_0804C828 sub_0804CD84      52B  sub_08036C4C sub_08036C80
144B  sub_08026100 sub_08044854      48B  sub_0804D8F8 sub_0804E304
104B  sub_08003704 sub_080037AC      48B  sub_08005F1C sub_08007B74
```

plus ten more at 16-40 bytes. **Zero groups pair an unmatched function with an
already-matched one** under the strict digest (two do under the loose digest
that ignores pool-word symbol names, worth 56 bytes) -- so there is no free match
sitting in the tree, only free *second* members. Note both members of every
group are currently unmatched, which is why this never showed up as "the
duplicate of something we have": the duplicates are of each other.

### The raw Jaccard number is mostly library-helper contamination

At `|shared| >= 4 && J >= 0.6` against a matched exemplar the screen returns
**74 pairs covering 27 distinct unmatched functions and 11,688 bytes**. The
largest cluster it builds is 17 functions and 7,476 bytes -- and the callees ALL
seventeen share are `Div` and `SetObjAffine`, called by 137 and 67 functions
each. That is not a family.

Dropping callees with fan-in above 40 (29 symbols: the `Proc_*` API,
`Div`/`DivRem`, `Decompress`, `ApplyPaletteExt`, `CpuFastSet`, `PutSprite`, ...)
collapses the same screen to **11 pairs, 6 functions, 2,712 bytes** -- and every
survivor is a real family. **So the honest reading of wave 19's
`|shared callees| >= 20` rule is that it was measuring the wrong thing rather
than being too strict: an IDF cut on the callee set is worth more than any
threshold on the raw count.** `--max-fanin` defaults to 40 for that reason.

### The axis the callee metric cannot see at all

`sub_08052358` has **one** callee. No threshold on `|shared callees|` can ever
find it -- and it is the cheapest function in the whole wave-20 batch: 144 bytes,
first draft, one `try_match`, zero new declarations. What it has instead is that
its four `data_refs` are a **strict subset** of the matched `sub_08052154`'s.
A subset means the exemplar's type model covers the target completely: no new
struct, no new global, no new prototype, nothing to derive but statement order.

The screen reports that axis separately. It said **35 unmatched functions,
5,084 bytes** when this was written; the real figure is **67 / 9,588** -- the
first number was measured with a one-word bug that excluded 596 matched leaves
from being exemplars. See the defect write-up further down. It is disjoint from
the callee axis by construction for the small-callee cases, and it is where this
batch actually lived.

### What was left open, and the exact residual

`sub_08052718` (256 B) and `sub_08052BBC` (232 B) did not close. Both drafts are
in `work/<fn>/<fn>.c` with the diff in a comment. They share ONE residual and it
is the same one in both: the ROM computes `b * 2` -- the index of the assignment
target `gUnknown_02029808[a].unk24[b]` -- immediately after `gUnknown_0300451C = b`
and BEFORE the `sub_08015410` argument setup, keeping it in a callee-saved
register across the call; every spelling probed computes it after the call, at
the store. `sub_08052BBC` additionally hoists `a * 4`, the `gUnknown_02028E5C`
index, from its statement at the very end of the function to the same place,
which costs it `sl` and a third saved high register.

The two matched exemplars do not settle it: in `c_08051BEC.c` and `c_08051F4C.c`
the same `b * 2` appears before the call, but it is CSEd out of
`gUnknown_08552178[a][b]`, a statement these two functions do not have (their
`sub_08015410` fifth argument is the literal 0). So there is no exemplar for
"`b * 2` early with nothing else to produce it".

Ruled out by probe, all byte-for-byte measured, none of them moved the hoist:
`s16 *`/`u16 *` locals bound to the slot or the row (these fold `+0x24` into the
symbol's own relocation and change the pool word, which is a *worse* diff);
`(&gUnknown_02029808[a])->unk24[b]` (raises the register count to the ROM's
three high registers but binds the wrong value, and moves `a` into `r8`);
`*(gUnknown_02029808[a].unk24 + b)`; an `(int)` cast on the index;
`c = a; d = b;` copies; moving the `gUnknown_02028E5C` store to the top (the
pool word moves with it, so the pool order refutes that placement directly);
swapping the last two statements; and a zero-trip `do { } while (0)` around
either the one statement or the whole body -- the wave-17 lever makes this one
*worse*, moving `a` into a high register for a net +1 instruction.

Everything else in both functions is already exact, including the `-fforce-addr`
`.rodata` pool word `sub_08052718` needs: written honestly as `gUnknown_02029808`
the candidate emits its own `.LC` word, which is what the ROM's `gUnknown_0813610C`
(a `.LC` block slot in `data/data.s` holding `0x02029808`, neighbours
`0x03001470 0x03001FBC 0x020298E0 0x020297C0 0x02029808 0x03004580 0x02029A10`)
actually is. `sub_08052BBC` has no such word because it has no control-flow merge
-- the same single-word/merge rule the `-fforce-addr` chapter records, seen twice
in one pair of near-twins.

### 6. Read the branch TARGET to tell `&&` from a nested `if` (wave 20, W20-A)

`sub_08082660` tests `p->unk5c` for `< 0` and then `> 0`, each guarded by a
second test on a different member. Two spellings are semantically identical here
because the second arm is unreachable when the first arm's outer test held:

```c
if (a < 0) { if (b == 0xE) { ... } }   else if (a > 0) { if (b == 0xE) { ... } }
if (a < 0 && b == 0xE) { ... }         else if (a > 0 && b == 0xE) { ... }
```

They are **not** the same code. The discriminator is where the INNER test's
failure branch lands: with nested `if`s it lands past the whole chain, with `&&`
it lands on the next arm's test — which is what lets gcc keep the single
`ldr r1, [p, #0x5c]` live across the merge instead of reloading it. The nested
form cost 2 instructions and a different register for the parameter's address.
This is the counterpart to the existing "read the unconditional `b` as the
discriminator" rule, one level up: **for a chain, read the conditional branch's
TARGET, not its condition.**

### The 0x081D93B0-0x081D93D4 pool run is now entirely C

With `sub_080824D4` and `sub_08082660` matched as this wave's extension work,
all six functions that own a slot in that run are decompiled, and every slot's
contents is confirmed by dereference (table above). Promotion entries needed:
`sub_080824D4` -> `["0x081D93B0", "0x081D93B4"]`, `sub_08082660` ->
`["0x081D93B8"]`, `sub_08083A44` -> `["0x081D93D4"]`; the three exemplars
already carry theirs.

### ACTUALS for `sub_0800CFDC` (wave 20, W20-B) — NOT CLOSED, and the reason is the finding

**Predicted 3 `try_match` attempts. Spent 0. The function is not matched.** It is
**not intractable** — it is larger than one agent-session, which is a different
thing and needs saying plainly, because "could not close it" and "could not
work out how" are opposite results and only one of them is a codegen problem.

| | measured |
|---|---|
| bytes | 6,384 |
| `try_match` attempts spent | **0** |
| probe rounds spent | 1 (the head) |
| head instructions reproduced exactly | **72 of 72** |
| distinct expression shapes, predicted | 10 |
| distinct expression shapes, found | 10 (no correction needed) |
| basic blocks | 187 |
| instances of the one predicate | 159 |
| fraction transcribed into C | ~10% (the head) |

### The prediction's own falsification clause is what fired

I pre-registered: *"1-2 attempts falsifies my prediction in the other direction
and says the clerical term is absorbed entirely by compile_probe — in which case
the rule should be restated as being about `try_match` attempts specifically, and
the probe rounds are where the size cost actually lands."*

That is exactly what happened, in a stronger form than the clause anticipated.

- **The shape cost was ONE probe round and it was right first time.** The head —
  the `-fforce-addr` reroute, the `p`/`rows`/`tiles`/`off` binding, the
  `(u16)(cell - 0x86) <= 1` predicate, the three `sub_0800E8CC` calls, the `&`
  pair, the 26-entry `casesi` — came out **72 instructions of 72 identical** from
  the first draft, with no iteration. Ten shapes predicted, ten found, no
  surprises. **At 6,384 bytes the distinct-shape rule held exactly.**
- **The cost that stopped the function has nothing to do with shapes.** It is
  transcribing 159 predicate instances, 187 blocks, 466 branches and two 26-entry
  case tables without a single wrong `+1`. That is clerical volume and it scales
  linearly with SIZE.

**So the corrected rule is:** cost per distinct expression shape governs *whether
you can work the function out*; cost per byte governs *how long it takes to write
down*. The band table has only ever measured the first, because every function in
it was small enough that the second was free. `sub_08083EE0` at 1,636 bytes was
still in that regime. `sub_0800CFDC` at 6,384 is not.

**The practical consequence for wave planning, which is the part worth keeping:**
`try_match` attempts is a **bad unit of work above ~2 KB** and every
bytes-per-attempt figure in this document inherits that. A function can cost zero
attempts and still not get finished. Budget large functions in *blocks
transcribed*, not in attempts — `sub_0800CFDC` is 187 blocks and `sub_08083EE0`
was 24.

### What was built, so the next agent starts at 80% rather than 0%

- **`tools/symtrace.py`** — CFG-accurate symbolic execution of a straight-line
  THUMB listing. Splits at labels, computes successors (including `casesi`
  tables and `bl`-to-local far jumps), **joins predecessor states** at merges,
  and folds the result into readable vocabulary. It turns this function's 3,239
  assembly lines into 1,190 lines in which every index expression is already
  resolved to `ro[y-1]`, `cell[(ro[y]+2)+x]`, `BRIDGE(...)`, `WIDTH`, `HEIGHT`.
  It is generic; the only function-specific part is the fold table at the top.
  **This is the reusable output of this task and is worth more than the match
  would have been.** The join matters: without it, 44 of 187 blocks render with
  poisoned register state, and transcribing from those silently produces wrong
  constants — the exact failure mode that would have burned the attempts.
- **`work/sub_0800CFDC/_symtrace.txt`** — the rendered listing.
- **`work/sub_0800CFDC/sub_0800CFDC.c`** — the verified head plus a written-out
  account of the remaining structure, the four `?rN` spots in the trace and what
  they actually are, and the one genuinely open question (how many local
  bindings per pattern region, ~20 independent allocator decisions).

### Three things about this function that are new and are not about size

- **`bl <local label>` inside a function is a FAR JUMP, not a call.** THUMB `b`
  reaches +/-2 KB; agbcc's `thumb_jump` emits `bl` past that. There are four here,
  all to the epilogue. On a function over 2 KB this is ordinary compiler output
  and must not be read as a second entry point or as hand-written assembly — it
  trips the `data_refs` screen too, because the splitter records the local label
  as a data reference (`_0800D080`, `_0800D40C` here are the two `casesi`
  tables, also not globals).
- **The `-fforce-addr` reroute fires ONCE in a 22-use function**, at the head,
  and the other 21 uses load the symbol directly. Writing `gUnknown_08499590`
  honestly reproduced both, first try, at 6 KB. That is the wave-19 claim
  confirmed at ten times the size it was found at.
- **agbcc chains integer constants the way it chains addresses.** In the
  neighbouring `sub_0800F8D4`, a run of compares against 0x140, 0x100, 0xE0,
  0xDF comes out as `movs r0,#0xa0; lsls r0,#1` then `subs r0,#0x40`,
  `subs r0,#0x20`, `subs r0,#1` against a single live constant. Nothing in the
  source distinguishes it from writing the literals; do not try to reproduce the
  chain.

### Honest note on how the session was spent

Roughly half of it went into `tools/symtrace.py` rather than into C. That was the
right call — the first, non-CFG version rendered a quarter of the blocks with
poisoned state and would have produced a draft full of silently wrong constants —
but it is the reason the transcription is unfinished, and the next agent should
know the tool now exists so none of that cost recurs.

### `sub_0800F8D4`: a lever that scores better by DROPPING A POINTER LEVEL (wave 20, W20-B)

Not matched — 600 instructions against 544, structurally identical throughout
(same compare chain, same constant chain, same four pool words, same branch
structure) with the whole residual in one extra callee-saved register. Left at
`work/sub_0800F8D4/sub_0800F8D4.c` with the ruled-out axes. One result from it is
general and belongs here:

**The `c_local` recipe can score better while being WRONG, and the tell is
pointer depth.** Three spellings of the same map-base read, everything else in
the file held fixed:

| spelling | insns | indirections at the head | ROM has |
|---|---|---|---|
| `p = gUnknown_08499590;` (honest) | 600 | **3** | **3** |
| `pp = &gUnknown_08499590;` … `p = *pp;` | **574** | 2 | 3 |
| `extern u8 **const gUnknown_0808D898;` … `p = *gUnknown_0808D898;` | 602 | 4 | 3 |

The middle row is the best score in the batch and drops a level of the model to
get it: it buys 26 instructions by not emitting an indirection the ROM emits.
Chasing the number would have locked in a wrong pointer model and then spent the
remaining attempts on a register-allocation problem that no longer existed.
**Wave 18's "a lever that appears to work may be paying for a wrong aggregate
type elsewhere" holds for pointer DEPTH, and depth is checkable in one line — count
the `ldr rN,[rM]` chain at the head before believing any instruction-count
improvement.**

The third row is the other half of the same lesson: **do not declare the `.LC`
pool word.** These words are already agbcc's own `-fforce-addr` copies, so
naming `gUnknown_08499590` honestly is what produces the middle level; declaring
the word as `u8 **const` and dereferencing it makes agbcc force-addr *that*
symbol's address too and yields four levels. The `u8 **const gUnknown_0808D7F8`
family already in `include/unknown-globals.h` is for functions whose ROM really
does carry that relocation — it is not a general recipe, and wave 20 removed the
three declarations it had briefly added for 0x0808D88C / 0x0808D890 / 0x0808D898
on exactly this measurement.

### A byte-neutral type with no oracle, settled by a second agent's caller

`gUnknown_0823DC38` was declared `u8 []` here from `sub_08084864` and
`sub_0808488C` alone, both of which only ever do pointer arithmetic on it and so
cannot see the element type — the "wrong type that is byte-neutral has no oracle"
case. A concurrent agent settled `sub_08084864`'s RETURN from its caller
(`sub_08082660` passes it to `ApplyPaletteExt`'s `u16 *`), which forced the array
to `u16` and the 32-byte stride to `* 16` elements: a run of 16-colour palettes.
Both accessors still match byte-for-byte after the retype. **This is the
discriminating use the doc asks for arriving from a DIFFERENT function than the
one that introduced the type, and it is the argument for declaring globals in the
shared header with the evidence rather than keeping them local to one `.c`.**

## The duplicate screen, cashed in: 5 pairs, 10 functions, 1,544 bytes, 6 derivations (wave 20, W20-C extension)

`tools/overlap_screen.py` claimed byte-identical duplicates were the highest-value
thing it finds. **That claim was then tested on its own output and it held
exactly.** All five pairs at 96 bytes and up were taken in one sitting:

| pair | bytes each | derivations | probe rounds on member 1 | `try_match` on member 2 |
|---|---|---|---|---|
| `sub_08058254` / `sub_08058318` | 196 | 1 | 1 | 1, matched |
| `sub_08050134` / `sub_08050364` | 168 | 1 | 5 | 1, matched |
| `sub_0804C828` / `sub_0804CD84` | 160 | 1 | 2 | 1, matched |
| `sub_08026100` / `sub_08044854` | 144 | 1 | 12 | 1, matched |
| `sub_08003704` / `sub_080037AC` | 104 | 1 | 0 | 1, matched |

**Every second member matched on the first attempt from the first member's C body
copied verbatim, with only the function name changed.** No probe, no
re-derivation, no diff. That is the whole value of the digest: the second member
costs one `try_match` regardless of what the first one cost, and the first one
cost anywhere from 0 to 12 probe rounds.

The screen was also right about the direction. It reported **zero** groups
pairing an unmatched function with an already-matched one, and that is what the
work looked like: nothing here was free on its own, only free *the second time*.
Nine of the ten had zero callers -- they are callback-table entries, the same
shape the 0x08052 descriptor table explains.

Two of the five pairs sit in `code-0801D390.s` next to the wave-20 block, and
that neighbourhood paid: `sub_0804C828` reuses `c_080524C0.c`'s `pal` local
verbatim, and `sub_08050134` reuses `struct OamData` and `sub_0801566C`.

## `struct OamData *` is the WRONG parameter type when the ROM subtracts the raw halfword (wave 20, W20-C)

`sub_08050134`/`sub_08050364` take a pointer to an OBJ attribute buffer, subtract
the fetched `tileNum` from it, and write the fetched value back into the same
field. Three of those four operations are bitfield semantics -- and the parameter
is still `u16 *`, indexed `p[2]`, not `struct OamData *`.

The discriminator is on the SUBTRACT side. The ROM has

```
ldrh r3, [r1, #4]      @ the whole halfword, no extraction
subs r0, r3, r0
ands r0, r1            @ & 0x3FF
```

Through `struct OamData *`, `p->tileNum` emits its own `lsls #22; lsrs #22`
pair, and `force_to_mode` does **not** remove it even though the `& 0x3FF`
downstream makes it redundant -- probed with the operands in both orders and
with the other operand bound to a local first. The store side is worse: through
the struct the mask comes out as `ldr =-0x400` from the literal pool (a 32-bit
`~0x3FF`), where the ROM has the 16-bit `movs #0xfc; lsls #8`.

**So a `ldrh` of a bitfield container with no extraction in front of the
arithmetic is a type readout, and it says the object is NOT the bitfield
struct at that site.** The local `oam` in the same function IS a
`struct OamData` -- it is read `ldrh [sp,#4]; lsls #22; lsrs #22`, which is the
bitfield spelling. One function, both spellings, three instructions apart.

The second half of the same function is the `c_080524C0.c` `pal` rule inverted:
`p[2] = (p[2] & 0xFC00) + oam.tileNum;`, with the MASK TERM WRITTEN FIRST. Written
`oam.tileNum + (p[2] & 0xFC00)` the `lsrs #22` that re-extracts `oam.tileNum`
moves ahead of the `ands`, for +0 bytes and a wrong instruction order.

## The wave-17 anchor generalises: THREE position readouts in one comma chain, and `&global` is not `global` (wave 20, W20-C)

`sub_08026100`/`sub_08044854` are 144 bytes of straight-line bounds checks and one
table lookup, and twelve probe rounds went into one expression. It is the
sharpest instance of the wave-17 creation-order lever so far, because three
independent facts all needed a reference at a position no statement boundary
reaches, and each one moved the output by exactly one slot:

```c
u = &gUnknown_08499594[(pp = &gUnknown_08499594, t = y * 2,
    idx = *(u16 *)((rows = p + 0x417A) + t) + x,
    (cells = p + 0x51A)[idx])];
```

| what | if it moves out of the chain |
|---|---|
| `pp = &gUnknown_08499594` | the address `ldr` lands 5 instructions late, the height read moves r6 -> r2 and the frame drops r6 |
| `t = y * 2` | as its own statement it is one slot EARLY -- ahead of the anchor instead of behind it |
| `idx` before `cells` | the two adds reassociate and the pool order flips to `0x51A, 0x417A` |

**The new part, and it cost four of the twelve rounds: an anchor on a POINTER
global must be `&g`, never `g`.** `u = gUnknown_08499594;` is a pointer LOAD --
`ldr rX, =g; ldr rY, [rX]` -- and it drags the deref up with it, where the ROM
materialises only the address early and issues the `ldr` at the very end.
`pp = &gUnknown_08499594` with `struct Unk08499594 **pp;` creates the address
pseudo and nothing else. The wave-17 write-up used an array global, where the
two spellings coincide; they do not coincide here.

Also confirmed, since it is the same expression: `cells = p + 0x51A` is the
`p[X + C]` / `*(p + X + C)` rule from the top of this document, and it is needed
in the OPPOSITE direction from the usual case. Without the binding agbcc
reassociates the constant outward to `((idx + p) + 0x51A)`; the ROM has
`idx + (p + 0x51A)`.

## A loop ENTRY GUARD is a readout of the loop bounds (wave 20, W20-C)

`sub_08058254` has

```
lsls r3, r2, #6        @ i * 64
adds r4, r3, #0
adds r4, #0x40         @ i * 64 + 64
cmp  r3, r4
bge  <skip the loop>   @ always false
```

An always-false guard in front of a loop is not dead code to be explained away.
agbcc emits the guard exactly when it cannot fold the entry test, so **its
presence tells you the bounds are non-constant expressions in the source**:
`for (j = i * 64; j < i * 64 + 64; j++)` and not `for (j = 0; j < 64; j++)` over
`[i * 64 + j]`, which has no guard at all. The two spellings are otherwise
identical in the body, and the guard is the only thing that distinguishes them.

## sub_080156E8's second parameter: a prototype disagreement that is real, and a retraction (wave 20, W20-C)

`include/unknown-globals.h` said struct `Unk02029BA8`'s members "are addresses,
not counters" **because** they are handed to `sub_080156E8`. That inference is
wrong and has been retracted in place.

`sub_080156E8` narrows r1 with `lsls #0x10; lsrs #0x10` at entry, and its matched
tail-callee `sub_080156FC` uses that value as `(u16)x * 4` added to the pointer
at `gUnknown_0200E438[..].unk48` -- a small table index. But every caller loads
the member with a word `ldr` and passes it with **no narrowing in front of the
`bl`**, which a declared-`u16` parameter would have forced.

Both readings are correct about their own side, and that is the point:
`sub_080156E8`'s own unit declared the parameter narrow and its callers' unit did
not. Per "settle it from the CALLERS", the declaration here is wide (`void *`,
which is byte-identical at every site and keeps the member type). **Whoever
matches `sub_080156E8` itself will need `u16` in its own file, and that is not a
contradiction to fix -- it is the same across-files disagreement that kept two
prototypes wrong for four waves, caught this time with both halves visible.**

## The `data_refs`-subset axis: it predicts NO NEW DECLARATIONS, and that turns out not to be a cost (wave 20, W20-A)

W20-C's screen reports two independent proximity axes and flagged one pair as
the case where both fire at once. That is a separation test, and it was run:

| function | bytes | callee overlap to exemplar | `data_refs` | probe rounds | `trymatch` |
|---|---|---|---|---|---|
| `sub_08066374` | 252 | `|shared| = 4, J = 1.000` vs `sub_08066470` | **100 % subset** (identical set) | **0** | **1** |
| `sub_08063BE0` | 236 | `|shared| = 4, J = 1.000` vs the same exemplar | **no subset** — 2 of its 4 globals are new | **0** | **1** |

**Both fell on the first draft with zero probe iterations, so the two axes did
not separate.** Reporting that honestly matters more than the two matches.

What the subset relation *did* predict, exactly and correctly, is the thing it
claims: `sub_08066374` needed no new declaration of any kind, and `sub_08063BE0`
needed two new globals and one new parameter struct. The prediction was right
and **the work it predicted is nearly free** — `gUnknown_0202F0E8` was typed from
one `ldrsh` and one `ldrh`/`strh` pair, and `gUnknown_085806F2` from a single
`void *` parameter and sixteen ROM bytes. Ten minutes of reading, zero
iterations, zero attempts.

This is the same shape as wave 19's result on *new callees*: "a count of new
callees is the wrong unit; a count of *undeclared* callees is the right one, and
even that is nearly free, because arity and void-ness read straight off the
prologue." **Declaration work is real work that does not show up as cost.** So:

- **Keep the subset axis as a SCREEN.** It found a 252-byte first-draft match
  that the callee metric alone also found, and it reaches 35 functions the callee
  metric cannot see at all — that is its value, and it is large.
- **Do not read it as a cost ORDERING.** Nothing in this wave suggests a
  subset-relation function is cheaper *per byte* than a sibling without one.
- The honest summary of two waves of metric work is now: **every proximity signal
  measured so far predicts whether a function is in the tractable population, and
  none of them orders cost inside it.** That population is large and mostly
  one-attempt; wave 19's advice to stop ranking and start batching survives
  intact.

### `sub_08063BE0` corroborates the sub_08083A44 affine idiom from a third block

Its four `Div` calls are `Div(COS_Q12(0) * 16, 0x100)` / `Div(-SIN_Q12(0) * 16,
d)` / `Div(SIN_Q12(0) * 16, 0x100)` / `Div(COS_Q12(0) * 16, d)` — the exact five
lines already promoted in `c_08032E88.c`, `c_08027B68.c`, `c_080831FC.c` and now
`c_08083A44`'s draft, with `d` recomputed inline at both uses because `bl Div`
clobbers memory between them. **Do not bind that divisor to a local**: a local is
computed once and held, and the ROM re-loads. The angle is the literal 0 again
(no `ands #0xff` before the `gSinLut` load).

## `(row = g[i])[1]` — the same binding lever, this time to keep a constant in the LOAD DISPLACEMENT (wave 20, W20-A)

`sub_080501DC` reads `gUnknown_02028E5C[c][1]`, a `u16 [][2]` table whose row
index is already CSEd into a register as `c * 4`. The ROM:

```
ldr  r0, =gUnknown_02028E5C
adds r0, r8            @ r8 = c * 4, a CSEd pseudo
ldrh r0, [r0, #2]      @ the +2 rides in the displacement
```

Three spellings, one probe each, on an otherwise byte-exact 392-byte candidate:

| source | result |
|---|---|
| `gUnknown_02028E5C[c][1]` | `ldr; adds #2; adds r8; ldrh [r0]` — **+1 instruction** |
| `*(gUnknown_02028E5C[c] + 1)` | size-exact but the `+2` still folds into the address |
| `row = gUnknown_02028E5C[c];` as its own statement, then `row[1]` | size-exact, correct instructions, **emitted twelve instructions early** |
| **`gUnknown_085644D4[(row = gUnknown_02028E5C[c])[1]]`** | **exact** |

`fold` turns `base + c*4 + 2` into `(base + 2) + c*4`, because `base + 2` is a
constant and constants get associated together — so the natural spelling pays an
`adds` that the ROM puts in the load. Binding the row to a pointer stops it, but
the binding has to happen **where the value is first needed**, not at the nearest
statement boundary: as its own statement it lands before the two
`gUnknown_085523B0` address computations that precede it in the ROM.

This is the third instance of one lever in two waves — wave 17's `(meta = ..., )`
comma anchor, this wave's `p->unk52 + (k = i + 6)`, and now this. The general
form is worth stating once: **when the ROM materialises an intermediate that no
statement boundary can produce at the right point, bind it inside the expression
at the depth where it is first used.** The three cases differ only in what is
being bound (an address constant, an index sum, a row pointer) and in what goes
wrong otherwise (a lost register, a folded constant, a folded constant).

---

## PRE-COMMITTED: does the `data_refs`-subset axis pay, and does the DEGREE order cost? (wave 20, W20-B)

Written after running `tools/overlap_screen.py` and reading the three targets'
index metadata, and **before opening a line of their assembly**. W20-C found the
axis; nobody has deliberately tested it.

| target | bytes | branches | callees | refs | subset of | degree |
|---|---|---|---|---|---|---|
| `sub_0804BFC0` | 212 | **0** | 2 | 6 | `sub_0804EEFC` (476B) | 60% |
| `sub_08024830` | 180 | **0** | 8 | 5 | `sub_08023360` (440B) | 42% |
| `sub_08075368` | 292 | 13 | 4 | 4 | `sub_08076494` (324B) | 57% |

### Prediction

**Cheapest first: `sub_0804BFC0`, then `sub_08024830`, then `sub_08075368`.
One attempt, one attempt, two attempts — four total.**

**The degree of subset does NOT order cost, and I predict it is anti-correlated
with the truth here.** Ordering by degree gives 60% / 57% / 42% =
`sub_0804BFC0`, `sub_08075368`, `sub_08024830` — which swaps my last two. That
is the falsification test and it is a clean one.

Reasoning:

1. **The degree is a ratio of set sizes, not a measure of what is left to
   derive.** A strict subset means *zero* new globals whatever the percentage;
   60% vs 42% only says how much of a big exemplar's model the target happens to
   touch. It is the same category error as `.LC` count and raw
   `|shared callees|`, both of which this document has already retired.
2. **Verified before predicting: the axis does pay on its own terms.** All six of
   `sub_0804BFC0`'s globals and all five of `sub_08024830`'s are already in
   `include/unknown-globals.h`; all four of `sub_08075368`'s are in
   `hardware.h`. **Zero new globals across all three** — that is the axis
   delivering exactly what it claims, and it is worth stating separately from
   whether it orders anything.
3. **What should order the cost is what the subset relation cannot see.** The
   relation is on `data_refs` only, so the callee side is uncovered: 2 of 2 and
   8 of 8 callees are already declared for the first two, but `sub_08075368`
   calls `sub_08075340`, which is declared nowhere. Its exemplar does not call
   it, so the subset gives no help there.
4. **Branches, not bytes.** `sub_0804BFC0` and `sub_08024830` have `branches: 0`
   — genuinely straight-line, N independent decisions. `sub_08075368` has 13, so
   it carries real control flow to get right on top of the new prototype. That
   it is also the biggest is incidental; this document has refuted size three
   times this wave.

### Falsification, stated in advance

- **`sub_08075368` cheaper than `sub_08024830`** falsifies point 1 and says the
  degree carries real signal.
- **Any of the three needing a new global** falsifies the axis itself, which is
  the stronger claim being tested.
- **All three at one attempt** would make the ordering untestable — I would then
  report the axis as paying but the ordering question as unresolved rather than
  claim a win.

Actuals appended below, unedited.

## The wave-17 anchor does NOT transfer, measured — and an `int` binding on the RESULT is a different lever from a cast on the OPERAND (wave 20, W20-A)

`sub_0804E584` (548 B) is the third member of the `sub_0804D290` /
`sub_0804DCA8` family. The wave-17 section above says its two levers "do not
transfer to a function carrying one more live value". That caveat had never been
tested. It is now, and both halves hold:

| draft | insns (ROM = 234) | differing instruction lines |
|---|---|---|
| natural spelling | 234 | 124 |
| + wave-17 comma anchor `(meta = gUnknown_03004580, …)` | 234 | **124 — byte-identical, the anchor does nothing** |
| + zero-trip `do { } while (0)` round the `sub_08057D44` call | 233 | 161 — **a regression** |
| + both | 233 | 161 |
| + the `(e1 = &pos[…][…])->x` binding pair | 231 | **21** |

So of the three constructs that closed the two exemplars, **only the `e1`/`e2`
binding transferred; the anchor was byte-neutral and the loop made it worse.**
The anchor's precondition is two *tied* address constants used equally often in
the same statements — `sub_0804D290` has `gUnknown_03004580` against
`gUnknown_03004582`, and `sub_0804E584` has no second global in that position at
all, so there is no tie to break. **Check the precondition before spending a
round on the lever; "same family" does not imply "same tie".**

### The last 3 instructions: bind the SUM to an `int`, do not cast the operand

The residual was a *dead* sign extension the ROM emits and no draft did:

```
ROM   lsls r0, r6, #16 ; asrs r0, r0, #16 ; ldrh r4, [r1,#4] ; adds r0, r4 ; strh r0, [r1,#8]
cand                                       ldrh r0, [r1,#4] ; adds r0, r6  ; strh r0, [r1,#8]
```

`v` is loaded with `ldrh` from a `u16` table, so `(s16)v` is a real conversion —
but the sum is stored with `strh`, so combine's `force_to_mode` sees a 16-bit
consumer and drops it. **Seven spellings of the operand are byte-identical**:
`s16 v`, `u16 v`, `int v`, each with and without an explicit `(s16)` cast at the
use, plus `(s16)` pushed onto the table read (which instead folds into the load
and produces `ldrsh`, a different wrong answer). The cast is unreachable from
that position.

What works is binding the RESULT:

```c
entry->x = (x0 = v + entry->unk04);     /* int x0, never read */
```

An `int` binding gives the addition a 32-bit consumer, so the extension is no
longer redundant and survives. **This is the mirror image of wave 15's `u16 v`
vs `int v` + `(u16)` cast rule**: there the cast on a *use* was what survived
where a narrow declaration folded; here a cast on the *use* folds and a wide
binding on the *result* is what survives. The unifying statement is that agbcc's
redundant-conversion elimination is driven by the CONSUMER's width, so the lever
has to change the consumer, not the operand.

### A counter-datapoint on the permuter, and it is the useful direction

Wave 17 recorded "on a pure register-allocation residual with the instruction
order already correct, ~15,000 iterations across two runs got nothing while a
hand fix closed 4 bytes", and this file has since leaned on that. **Here the
permuter found the answer and four hand rounds had not**: 5,018 iterations,
score 0, one edit — the `int` binding above — on a candidate that was already
size-near-exact with the instruction order correct. Both results stand; the
difference is what kind of residual it was. Wave 17's was a register *assignment*
tie with the instruction stream already identical, which the permuter cannot
express. This one needed an extra instruction that no spelling I could enumerate
produced, which is exactly the space it searches. **Read the residual first: if
the candidate is SHORT of the ROM, the permuter has something to find; if it is
size-exact with only register names differing, it does not.**

### ACTUALS for the `data_refs`-subset axis (wave 20, W20-B) — PARTIAL, and the ordering question is UNRESOLVED

**Only one of the three was worked. The ordering prediction is therefore
untested and must not be scored as confirmed or refuted.** Saying so is the
whole point of pre-registering it.

| target | bytes | worked | result |
|---|---|---|---|
| `sub_0804BFC0` | 212 | yes | **85.8%, size-exact (104 insns vs 104)**, not matched |
| `sub_08024830` | 180 | no | not attempted |
| `sub_08075368` | 292 | no | not attempted |

### What IS settled: the axis pays, and that was the stronger claim

The prediction's second falsification clause — *"any of the three needing a new
global falsifies the axis itself"* — did not fire, and it was checked on all
three before any drafting:

- `sub_0804BFC0`: all six `data_refs` already in `include/unknown-globals.h`;
- `sub_08024830`: all five already there;
- `sub_08075368`: all four in `hardware.h`.

**Zero new globals across all three, and on the one that was worked, zero new
prototypes as well** — its two callees are both in the exemplar's callee set, so
the type model transferred whole. `sub_0804BFC0` reached 85.8% and size-exact
from a first draft written directly off `src/decomp/c_0804EEFC.c`, with the
entire cost going into ONE statement's evaluation order. That is the axis
behaving exactly as W20-C's `sub_08052358` datapoint predicted: a subset means
nothing to derive but statement order.

**One caveat worth carrying, because it nearly cost a wrong prediction.** The
screen's "declared" guarantee is weaker than it looks in two ways:

1. **The subset is on `data_refs` only, so the callee side is uncovered.**
   `sub_08075368` calls `sub_08075340`, which is declared nowhere and which its
   exemplar does not call. A target can be a 100% subset on globals and still
   owe a prototype.
2. **A global being covered does not mean it is in `unknown-globals.h`.**
   `sub_08075368`'s four are in `hardware.h`, and a grep of the wrong header
   makes a covered target look uncovered. Check both before concluding a subset
   target needs new declarations.

### The one function worked, and the general rule it produced

`sub_0804BFC0`'s whole residual is the `tileNum` statement, and it is a clean
instance of a lever that **cannot be pulled to two depths at once**:

| spelling | insns | pool order | `ldr` position | multiply |
|---|---|---|---|---|
| plain `((Row *)g)[idx].unk12 * b` | 106 | swapped | — | 2 copies |
| `rows = g;` own statement | 106 | right | one insn EARLY | 2 copies |
| `(rows = g, rows)[idx]` comma | 106 | right | **exact** | 2 copies |
| `(t = (rows = g, rows)[idx].unk12, t) * b` | **104** | right | right | **exact** |

The last row collapses the multiply to the ROM's destination-tied `muls r0, r6`
— but binding `t` inside the comma hoists the entire right operand of the `+`,
so `a * 0x100` moves *after* the table loads where the ROM has it before. **The
comma operator's depth controls WHICH reference is created early, and binding a
second value inside it drags the whole subexpression forward with it.** The
existing note in this document ("the lever is a comma operator at the right
depth") is right, and this is the case that shows "the right depth" is not
always reachable: two things in one statement need to move in opposite
directions.

Ruled out on the multiply, so nobody repeats them: `(int)b` on the operand, and
swapping to `b * ...`. Neither changes anything, so it is **not** commutativity
— it is which pseudo the allocator ties the destination-tied THUMB `muls` to.
The untried next axis is in the draft: give the shift and the load each their
own statement so neither can be hoisted past the other.

### Honest note on the round

Three cheap functions were assigned and one was worked, because the session ran
out mid-batch. That is a budgeting failure on my side, not evidence about the
axis. `sub_08024830` (180 B, zero branches, 8 callees all declared) is the
cheapest-looking of the three and is the one wave 21 should take first if it
wants the ordering answered.

## `work/*/best.json` is an unread index of unpromoted near-misses — sweep it every wave (wave 20, W20-A)

`tools/trymatch.py` writes `work/<fn>/best.json` (`{"percent": …}`) and
`work/<fn>/best.c` on every run, so the tree already carries a per-function
record of how close anyone has ever got. **Nobody has been reading it.** The
sweep is two commands and it found real work:

```sh
# 1. what has a saved best and is not matched
python - <<'EOF'
import json, glob, os
recs = {r['name']: r for r in json.load(open('data/functions.json'))}
for bj in sorted(glob.glob('work/*/best.json')):
    fn = os.path.basename(os.path.dirname(bj))
    r = recs.get(fn)
    if r and r['status'] != 'matched':
        print(json.load(open(bj)).get('percent'), r['size'], fn, r['status'])
EOF

# 2. the stronger check -- re-run every unmatched draft and gate on EXIT STATUS
```

**34 unmatched functions have a saved best; two of them read 100.0 %.** One was
`sub_0804CEF8`, which this wave then matched — and its stale `best.c` contained
the two spellings (`a * 0x2000` and `u16 n`) that four hand rounds had not
found, so it was worth reading before starting, not after.

The other is the finding. **`sub_08000694` (392 B) MATCHES today, unchanged,
with the draft that has been sitting in `work/` since wave 13.** It was parked
on the `-fforce-addr` relocation class; wave 18 taught the split to place that
pool word; nothing about the C changed and nobody re-tested it.

**Why the existing re-test missed it: the pre-flight sweep every wave since 18
has run covers `data/parked.json`, and this function is not in that file.** Its
own source comment said "PARKED" and that was the only record. So there are two
populations of parked work and only one of them is being re-tested. The full
sweep — re-run `trymatch` on every unmatched function that has a `work/<fn>/`
draft and gate on exit status — costs about a minute for 80 functions and is the
one that catches both.

**Do this at pre-flight, before choosing a batch.** Harness capability moves
between waves (wave 18's `.rodata` placement, wave 13's permuter fix, wave 17's
two `sync_work.py`/`permute.py` bugs), and every one of those changes can
retroactively un-block a draft that nobody will otherwise look at again. The
cost of the check is a minute; the cost of not doing it was two waves on one
function that was already finished.

---

## PRE-COMMITTED: finishing W20-B's subset-axis ordering test (wave 20, W20-A)

W20-B pre-registered an ordering on three subset-axis targets, worked one, and
recorded the result as UNRESOLVED. This section finishes it. **Written before
opening a line of assembly for `sub_08024830` or `sub_08075368`.**

**Disclosure, because it changes what my number is worth: `sub_0804BFC0` is NOT
blind to me.** I have read W20-B's actuals — 85.8%, size-exact at 104/104
instructions, the entire residual in one `tileNum` statement, four spellings
ruled out and the next axis named. My prediction for it is an informed one and
should be scored as such; only the other two are clean.

### First, a correction to the inputs, and it is a tool bug

`tools/overlap_screen.py` builds its exemplar pool as

```python
matched = [r for r in recs if r["status"] == "matched" and r["calls"]]
```

The `and r["calls"]` guard belongs to the callee-overlap axis and is reused by
`dataref_neighbours`, which does not look at `calls` at all. **That excludes 596
matched leaf functions from ever being a `data_refs` exemplar.** For one of these
three targets it changes both the exemplar and the degree:

| target | screen says | actually |
|---|---|---|
| `sub_08075368` | 57% of `sub_08076494` (324 B) | **100%** of `sub_08085F40` (80 B) — and of `sub_08072454` and `sub_0806F658`, whose `data_refs` sets are *equal* to its own |

So the degree W20-B pre-committed against was wrong for a third of its sample.
Fixing the guard is one word; I am not touching the tool because W20-C is
regenerating the wave-21 list off it — flagged here for that regeneration.

**And the correction exposes what the degree actually measures.** It is
`len(target_refs) / len(exemplar_refs)`, so it is maximised by picking the
SMALLEST matched function that still covers the target. A 100% subset of an
80-byte leaf means the exemplar's whole type model is four globals; a 57% subset
of a 324-byte function means five-sevenths of a much larger model. **The metric
rewards the exemplar that covers least, which is the opposite of what the axis
is for.** That is a stronger objection than W20-B's "it is a ratio of set sizes",
and it is checkable independently of how these three come out.

### The prediction

| rank | target | bytes | branches | callees | undeclared callees | corrected degree | predicted attempts |
|---|---|---|---|---|---|---|---|
| 1 (cheapest) | `sub_08024830` | 180 | 0 | 8 | **0** | 42% | **1** |
| 2 | `sub_08075368` | 292 | **13** | 4 | **1** (`sub_08075340`) | **100%** | **2** |
| 3 (dearest) | `sub_0804BFC0` | 212 | 0 | 2 | 0 | 60% | **3** |

**Predicted total: 6.** Unit as always: invocations of local
`python tools/trymatch.py <fn>` from my first draft to exit 0, counting every
invocation, `compile_probe`-class compiles excluded and reported separately.

**Ordering by corrected degree gives 100% / 60% / 42% = `sub_08075368`,
`sub_0804BFC0`, `sub_08024830` — which puts my cheapest last and my middle
first.** That is the falsification test and it is clean.

### Four falsifiable side-bets

1. **The degree does not order cost, in either the reported or the corrected
   form.** Note the tool bug makes this doubly testable: the *reported* degrees
   order `sub_0804BFC0` (60) > `sub_08075368` (57) > `sub_08024830` (42), the
   *corrected* ones order `sub_08075368` (100) > `sub_0804BFC0` (60) >
   `sub_08024830` (42). If either ordering matches the actuals I should say so.
2. **The axis itself pays again — zero new globals across all three.** W20-B
   verified this before drafting; I will re-verify. If any of the three needs a
   new global, the axis fails on its own terms and that outranks the ordering.
3. **What orders the cost is undeclared callees plus control flow.**
   `sub_08075368` is the only one of the three with an undeclared callee AND the
   only one with branches. If it does not cost more than `sub_08024830`, my
   proxy is as dead as the degree.
4. **The permuter will NOT close `sub_0804BFC0`**, and this one is a test of my
   own rule from earlier this wave: *"if the candidate is SHORT of the ROM the
   permuter has something to find; if it is size-exact with only register names
   differing, it does not."* W20-B left it size-exact at 104/104. By my own rule
   the permuter should fail on it. If the permuter closes it, my rule is wrong
   and that is worth more than the match.

Actuals appended below, unedited, including the case where I am wrong.

## A `volatile` LHS is forced into a register BEFORE the RHS call — bind the result (wave 20, W20-C)

`gUnknown_03001FFC = Interpolate(0, ...);` where the global is `volatile u16`
does NOT compile to what the ROM has. agbcc expands the assignment target
first, and a volatile MEM goes through `memory_address` with the address
forced, so the pool `ldr` lands **before** the `bl` and the address then needs a
callee-saved home across the call — one extra saved register and one misplaced
`ldr`. Binding the result first is exact:

```c
s32 v;
v = Interpolate(0, proc->unk30, proc->unk34, proc->unk38, proc->unk2c);
gUnknown_03001FFC = v;
```

This is a new corner of the `volatile` note in `include/hardware.h`, which
recorded the other eight `gUnknown_03001FFC` writers as byte-neutral **because
every one of them stores a constant**. A call result is not byte-neutral, and
nothing in the volatile rules said so. Non-volatile globals do not do this: the
plain assignment is correct for them, which is why this only shows up on the
hardware shadows.

## Read a conditional branch's SENSE against the ARM ORDER, not the comparison (wave 20, W20-C)

`sub_08037D80` is a four-way classifier on three thresholds. Its first two arms
are `if (a <= K) return N;` and come out as `bgt`; its third is the same shape
and comes out as `ble`, and writing it the same way as the first two is wrong.

The rule is mechanical: agbcc emits `jump_if_not(cond)` to the code that follows
the `if`, so **whichever value FALLS THROUGH in the ROM is the one the source
wrote last**. Here the fall-through is 5, so 4 goes inside the `if` and the test
is `a <= 0x117`, even though the two arms above it are written the other way
round. Do not normalise a chain of comparisons to look consistent; each link is
a separate readout of which arm fell through.

## An unused parameter is invisible in the callee — F005's arity was wrong for two of nineteen (wave 20, W20-C)

Family F005 (nineteen 16-byte `push {lr}; bl S; bl S; pop {r0}; bx r0` wrappers)
was declared `void f(void)` across the board, on the `pop {r0}` rule. **That rule
settles the RETURN type and says nothing about parameters**, and the empty
parameter list was an assumption that is wrong for two members:

- `sub_0801A538` takes **four**. `sub_08019DA8` passes 0, 1, 6 and 0xC — four
  distinct non-zero constants immediately before the `bl`, which nothing but
  four arguments explains; the other three call sites pass four zeros.
- `sub_08085298` takes **one**. All four callers do `adds r0, rN, #0` off a
  callee-saved proc pointer in the instruction before the `bl`.

In both, the parameters are dead — the body's first `bl` overwrites r0 — so both
promoted definitions are byte-identical before and after the retype, and **no
oracle in this tree could have caught it from the callee side**. It was found by
re-reading every call site of all nineteen; the other seventeen really are
nullary. Same class as `sub_08052E04`'s dead third parameter, which every caller
still passes explicitly.

**Generalise it: arity has to be read from the CALLERS even when the body is two
instructions long.** A caller that sets no argument register is not a caller that
passes no argument (`sub_0804D8F8` passes `gUnknown_03001FBC` in r2 with no
`mov` at all, because the allocator had already put it there) — and a callee
that reads no argument register is not a callee that takes none.

## `ApplyPaletteExt`'s third parameter was `u32` and is `u16` (wave 20, W20-C)

The duplicate digest found `ApplyPaletteExt` in a family of four byte-identical
palette wrappers — `sub_080135F4`, `sub_08013640`, `sub_08013664` and itself —
and matching the other three settled the header's seventeen-wave-old `u32`.

The readout is the POSITION of the narrowing, not its presence. Declared `u16`,
the `lsls #0x10; lsrs #0x10` is PROMOTE_MODE on the parameter and sits at the
top of the function, ahead of the `gPal` address arithmetic. Declared `u32`, the
same pair still appears — it is the conversion to `sub_08011C58`'s `u16` third
parameter — but it lands at the call instead. One instruction pair, one slot out
of place, and the only difference between the two declarations. Every call site
in the tree passes a constant, so the retype cost the 12 promoted callers
nothing; all were re-verified.

**The transferable part: when an entry narrowing and a call-site narrowing would
be the same two instructions, their ORDER relative to the function's other work
is what tells you which one it is.**

## Two defects in `tools/overlap_screen.py`, and why only one of the two fixes was the one proposed (wave 20, W20-C)

W20-A found both while closing the subset-axis question. Both are fixed; the
second is fixed differently from the suggestion, and the difference is measured.

**Defect 1 — one word hid 596 matched functions.** The exemplar pool was built
once, `status == "matched" and r["calls"]`, and served both axes. The `calls`
guard belongs to the callee axis; `dataref_neighbours` never looks at `calls`,
so **every matched LEAF was excluded from ever being a `data_refs` exemplar** —
596 of them. There are now two pools and a comment saying not to re-merge them.

The effect is not marginal. `sub_08075368` was reported as "57% of
`sub_08076494`"; it is in fact covered by **23** matched functions, ten of which
have *exactly* its four refs, and the tightest is a 36-byte leaf. The subset
list goes from 35 functions / 5,084 bytes to **67 / 9,588**.

**Defect 2 — the degree read as coverage, which is trivially 100%.** That part
is real and the number is gone: this axis only reports subsets, so "what
fraction of the target is covered" is always 1 and a percentage carries no
information.

**But it was not anti-correlated, and ranking by the exemplar's SIZE instead is
inverted.** `len(target_refs) / len(exemplar_refs)` is maximised by the exemplar
whose vocabulary is *closest* to the target's — which is the right exemplar to
read, because one that uses the target's four globals and nothing else is about
the same thing. Measured against the only two functions this axis actually
produced in wave 20, ranking the covering exemplars and asking where the one an
agent really read comes out:

| target | covering exemplars | exemplar actually read | tightest-first | widest-first |
|---|---|---|---|---|
| `sub_08052358` | 5 | `sub_08052154` | **1** | 5 |
| `sub_08050134` | 11 | `sub_08052154` | **1** | 11 |

Widest-first puts it LAST in both cases, and the mechanism is obvious once the
leaves are visible: the widest cover of any small ref set is whatever large
function happens to touch those globals among dozens. `sub_0801258C` covers
`sub_08075368`'s four refs among its own 88 — and covers 23 other targets the
same way, so it would have been named as "the exemplar" for all of them.

So selection stays tightest-first. What is printed is the ref count covered, the
tightest exemplar **with its own ref count** so the fit is visible, and **how
many distinct matched functions cover the target** — the last of these new, and
the single most useful thing the leaf fix bought.

**`work/*/best.json` is now swept too** (`--near-miss`, default 95%). Four
unpromoted drafts sit at 98–99.4%: `sub_0808B91C` (496 B, 99.4%),
`sub_08079EA4` (264 B, 99.2%), `sub_08002844` (288 B, 98.6%, and NOT parked —
nothing records it anywhere) and `sub_0801A6C0` (64 B, 98.4%). Three are parked
with ruled-out axes; `sub_08002844` is the one to look at first, because a
98.6% draft nobody parked and nobody promoted is a derivation somebody
abandoned rather than one that was judged hard.

## Wave 21: the batching list, REGENERATED off the corrected screen (wave 20, W20-C)

**This list goes stale every wave, and regenerating it is a PRE-FLIGHT step, not
a wave-end one.** The screen's output is a function of the matched set, so a
wave that adds ~75 exemplars invalidates the previous wave's list. The duplicate
section is the sharpest case: its headline flipped from "no unmatched function
is a byte-identical twin of a matched one" to "here are three free matches"
*inside* wave 20, purely because the wave matched the other half of each pair.
Run this before choosing batches, never after:

```
python tools/overlap_screen.py --pending --min-size 8 --top 20
python tools/overlap_screen.py --self-test          # the gate, 3 assertions
```

`--pending` is why the list can be regenerated mid-wave at all.
`data/functions.json` only learns about a match at PROMOTION time, so a plain
run sees the state the wave started in. The flag counts any draft whose last
`trymatch` matched, by slicing `work/<fn>/_target.bin` at the function's offset
in its split unit and comparing against `work/<fn>/_cand.bin`. (Comparing those
two files WHOLE is wrong and was the first version of the check: `_target.bin`
is the entire unit's `.text`.)

### What moved, and why

**This list moved for two different reasons and they should not be confused: 75
functions were matched, AND a bug was fixed.** The duplicate rows moved because
of the matching; the subset rows moved because of the fix.

| | wave-20 start | wave-20 end, corrected tool |
|---|---|---|
| exemplars | 1,341 | 1,415 (74 pending) |
| STRICT duplicate groups w/ an unmatched member | 22 (1,652 B) | **0** |
| LOOSE groups pairing unmatched↔matched | 2 (56 B) | 3 → **0** (taken) |
| `data_refs`-subset functions | 35 (5,084 B) | **67 (9,588 B)** |
| callee-overlap pairs (post-IDF) | 11 / 6 fn / 2,712 B | 11 / 7 fn / 1,332 B |

- **The strict duplicate well is dry.** All 22 groups were taken (44 functions,
  3,304 bytes, 22 derivations — every second member matched first-attempt from
  its twin's body verbatim).
- **The subset axis nearly doubled, and none of that is new matching** — it is
  the 596 leaves the guard was hiding.

### The list

1. **The 4-ref blend-shadow class: 24 unmatched functions, 2,284 bytes, ONE
   vocabulary.** Every member's `data_refs` are exactly `gUnknown_03001FFC`,
   `gUnknown_03002020`, `gUnknown_03002B28`, `gUnknown_030030E0` — the BLDALPHA
   and BLDCNT shadows — and **24 matched functions cover them**, the tightest
   being `sub_08012358` at 36 bytes. Largest members: `sub_0806B668` (148 B),
   `sub_08067A4C` (136 B), `sub_08067AE8` (132 B), `sub_0801320C`,
   `sub_080132B0`, `sub_0806C154` (116 B each). This class was **invisible
   before the leaf fix** and it is the largest single-vocabulary batch on the
   board. `hardware.h` already documents the `.raw` vs `.bits` discriminator
   these need, and wave 20 matched two of the family (`sub_080672A8` /
   `sub_08067358`) including the `volatile`-LHS rule.
2. **The 15 LOOSE all-unmatched duplicate groups, 2,544 bytes.** One SHAPE,
   differing pool symbols — derive one member, transcribe the other with the
   globals swapped, which is what wave 20's three loose free matches cost (one
   line each). Largest: `sub_0804BDD8`/`sub_0804BECC` (244 B),
   `sub_08066C70`/`sub_0806DD34` (192 B), `sub_0804B42C`/`sub_0804B4C4` (152 B),
   `sub_08066BF4`/`sub_0806DCB8` (124 B), `sub_08014668`/`sub_080146D4` (108 B).
   Weaker than the strict digest, so `trymatch` BOTH members, always.
3. **`sub_08002844` (288 B, 98.6% in `best.json`, unparked).** See above.
4. `sub_08052718` + `sub_08052BBC` (488 B) — **parked**, `data/parked.json` has
   the residual and eleven ruled-out axes. Do not re-derive the spellings.
5. `sub_0804E584` (548 B), exemplars `sub_0804D290` / `sub_0804DCA8` — read the
   wave-17 comma-anchor section first.
6. The 5-function 532-byte class on `gUnknown_03001FE8` / `gUnknown_0300251C` /
   `gUnknown_03002B6C` / `gUnknown_030030B4` (12 exemplars, tightest
   `sub_080688E4`), and the 3-function 408-byte class that unions it with the
   blend shadows (6 exemplars, tightest `sub_08037260`). Same subsystem as
   item 1; take them together.
7. `sub_0802CFFC` + `sub_0802D064` + `sub_0802D0B4` (232 B), exemplar
   `sub_0804096C`, five shared callees across all three.
8. `sub_0808177C` (548 B) and `sub_080815C0` (444 B), exemplars `sub_080829B0` /
   `sub_08083034` — both matched in wave 20, so their vocabulary is fresh.
9. `sub_080780E4` (64 B), exemplars `sub_08036C4C` / `sub_08036C80`, both
   matched in wave 20.


## A BARE PROLOGUE is positive evidence for a WIDE parameter (wave 21, W21-B)

`PROMOTE_MODE`'s `lsl #16; lsr #16` on a sub-word parameter is emitted in the
**prologue**, unconditionally, and it is **not** deleted when the extension is
dead. That inverts the natural reading of a prologue, and it is the cheapest
parameter-width oracle in the project because it needs no caller.

Two functions in wave 21 turned on it, in opposite directions.

**`sub_08001148`** — 16 bytes, a halfword fill:

```
	cmp r1, #0
	ble _08001156
_0800114C:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bgt _0800114C
_08001156:
	bx lr
```

r2's only use is a `strh` that throws its upper half away, so "the extension is
dead, it will be optimised out, therefore `u16` is safe" is the obvious
inference. It is wrong. `void sub_08001148(u16 *, int, u16)` compiles to **20**
bytes — the two extra instructions are the prologue pair — and `int` gives 16
and matches. The declaration was briefly `u16` mid-wave on exactly that
reasoning; only the body refutes it, because the one caller passes the constant
0 and is byte-neutral either way.

**`sub_08072C40`** — the same rule read forwards. Its prologue is

```
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
```

three pairs, so **all three** parameters are 16-bit. It had been declared
`(u32, u16, u32)` since wave 12 and stayed wrong for nine waves, because every
promoted caller passes either a literal or a `u16` lvalue and so agrees with
both spellings. The retype to `(u16, u16, u16)` is byte-neutral at all fifteen
functions in the seven units that call it (re-verified with `trymatch`); the
`(u16)` casts two promoted call sites carried on the third argument had been
compensating for the wrong declaration and are now redundant. Two of them were
written by earlier waves as deliberate findings.

**So:**

- **Sub-word parameter, extension present** → declare it narrow. Which of `s16`
  and `u16` still needs the *second* shift pair at a use, as before.
- **Sub-word-looking parameter, prologue BARE** → it is `int`/`u32`, even when
  every use is a narrow store. This is the half nobody was reading.
- A prologue pair is *positional*: count the pairs before the first real
  instruction and they map to r0, r1, r2, r3 in order. A copy such as
  `adds r3, r0, #0` interleaved between them is the register allocator getting
  the value out of the way, not an argument boundary.
- **`trymatch` on the CALLERS cannot find either error.** Agreement between a
  wrong declaration and callers that happen not to discriminate is exactly what
  the "prototypes are a contract, not ground truth" rule predicts. The callee's
  own prologue is the oracle, and it is free to read.

## `overlap_screen.py`'s "tightest exemplar" was decided by a SIZE tie-break, and the tie-break was backwards (wave 21, W21-C)

Batch: seven functions, 808 bytes, all matched (`sub_08072A88`, 164 B, was
derived here too but matched concurrently by W21-B and is theirs). The batch was
chosen to be the controlled experiment, because it contains both kinds of
exemplar relationship at once — and that turned out to be load-bearing in a way
the assignment did not anticipate: the two groups disagree, and it is their
disagreement rather than either one alone that fixes the size of the fix.

**The claim under test.** `dataref_neighbours()` ranks the matched functions
whose `data_refs` cover a target and calls the winner "tightest". The primary
key is the exemplar's own ref count — fewest wins — and that key is *right*: it
is the subset guarantee, and it means the exemplar's vocabulary is close to the
target's rather than incidentally containing it. But it **ties constantly**, and
the tie was broken by `m["size"]` *ascending*. Smallest wins. Smallest means
"does least", which means "demonstrates fewest of the operations the target
performs".

**The measurement.** `sub_08012358` (36 B) and `sub_08085F40` (80 B) have
**identical** `data_refs` — `{gUnknown_03001FFC, gUnknown_03002020,
gUnknown_03002B28, gUnknown_030030E0}` — and both are zero-call leaves. They
therefore tie on *every* key the screen had except size, and smallest-first
named `sub_08012358` for twelve targets of 96–148 bytes.

`sub_08012358`'s entire body is four zero stores. Against the four targets in
this batch on that exact ref set — `sub_0806AFF0` (96 B), `sub_0806C700`
(108 B), `sub_0806C7B4` (112 B), `sub_0806C154` (116 B) — it supplied **nothing
beyond "these four globals exist and are already declared"**, which
`include/hardware.h` says by itself.

It is worse than uninformative. It writes `gUnknown_030030E0.raw = 0`, and the
union `.raw` spelling is **precisely the one that fails** on any target doing a
read-modify-write: it drags a live zero out of the preceding scalar stores into
a spurious `orr` and costs a callee-saved register. Three of the four targets
here need the plain `*(u16 *)&gUnknown_030030E0` cast instead. Following the
"tightest" exemplar's idiom would have cost every one of them.

**What actually supplied the answers**, one line per function:

| function | what carried it |
| --- | --- |
| `sub_0806C7B4` 112 B | `c_08085F40.c` — the scalar-cast rule, written down in its comment |
| `sub_0806C700` 108 B | same; the union `.raw` is safe here only because nothing is OR-ed |
| `sub_0806AFF0` 96 B | `c_08085F40.c`; the merged-pair case is the one its comment describes |
| `sub_0806C154` 116 B | its own assembly + `PutSpriteExt`'s prototype. `sub_08012358` is its **callee**, not its exemplar |
| `sub_08071DB4` 140 B | `c_08078B08.c` (`sub_08078B74`) for the statement skeleton, `c_08085F40.c` for the cast |
| `sub_080670F8` 132 B | `c_080688E4.c` for the `(struct Unk8012C30 *)&shadow` cast idiom |
| `sub_0802CFFC` 104 B | `c_0804096C.c` — four of its five calls in the same order; the callee axis got this one right |
| `sub_08072A88` 164 B | `c_080688E4.c` for the `union BgCntBuf` model — **matched by W21-B, not by this batch**; see the note on evidence weight below |

`sub_08012358` supplied nothing to any of them. **The hypothesis holds in its narrow form: the size tie-break was inverted.**

**But its stated MECHANISM is refuted, and group 2 is what refutes it.** The
hypothesis was that "proximity in size and call profile predicts what actually
transfers". As a *primary* key that is false, and the screen's own output shows
it. For `sub_080670F8` (132 B):

    tightest  sub_080688E4  (9 refs, 284 B)   <- the exemplar actually read
    nearest   sub_080122EC  (13 refs, 108 B)  <- what proximity alone picks

The ref-count key gets this right and proximity gets it wrong: a 284-byte
exemplar with nine refs beat a 108-byte one with thirteen, on a 132-byte
target. Ranking by proximity would have *broken* group 2 to fix group 1.

So the two keys are not competitors and the defect was never in the primary
key. **Ref-count minimality is right and stays first; only the tie-break was
wrong.** Group 1 is where the tie happens (two exemplars, identical ref sets,
identical call profiles), and it is the only place the tie-break can decide
anything.

The deeper reason both keys work when they work: what transfers is whether the
exemplar *exercises* the shared vocabulary the way the target does. Reference
overlap says the vocabulary matches; it says nothing about the operations. The
exemplar that carried four of these, `sub_08085F40`, is *also* a small zero-call
leaf — it beats `sub_08012358` not by being bigger but by performing the same
read-modify-write. Size and callee count are cheap proxies for that and nothing
more, which is exactly why they belong in a tie-break and not in the key.

**Evidence weight, stated plainly.** Group 2 was assigned as two functions and
this batch kept one: `sub_08072A88` was matched concurrently by W21-B. That
costs the argument nothing *measurable*, because on the axis under test the two
are the same row — identical `data_refs`, `exemplars=12`, same `tightest`, same
`nearest`. They are one data point that happened to be assigned twice, not two.
The group-2 refutation therefore rests on a single screen row, and it is stated
here as a single row. It is enough to kill "proximity as primary key" because
one clean counter-example is all that takes; it would NOT be enough to support a
positive claim about how often the two keys disagree, and no such claim is made.

**The change.** Primary key unchanged — minimal ref count, for the group-2
reason above. Tie-break is now proximity: closest in size, then in callee count.
A second column, `nearest`, reports the best covering exemplar by proximity
*alone* and prints only where the two disagree. **Where they disagree, read the
tightest one**: that is the group-2 case, and there the disagreement means the
tightest cover is a vocabulary match while `nearest` is merely a same-size
stranger. This does **not** reinstate the widest-first proposal wave 20
rejected: "nearest" is bounded on both sides where "widest" was not, it is
advisory rather than selective, and ref count still leads.

The scope of the fix is worth being precise about, because it was tempting to
go further. Group 1 (a tie the tie-break decided wrongly) and group 2 (no tie,
primary key correct, proximity wrong) point in opposite directions, and only a
change confined to the tie-break satisfies both. A batch containing just one of
the two groups would have supported an over-broad fix.

`python tools/overlap_screen.py --self-test` passes before and after. The screen
now names `sub_08067300` (88 B, 4 refs) for all four of the group-1 targets —
which `include/hardware.h` **independently** identifies as a member of the raw
read-modify-write family, arrived at from the assembly with no knowledge of the
screen. `sub_08012358` no longer wins anywhere.

**Generalisation, stated narrowly.** The failure mode is a ranking function
whose primary key ties and whose tie-break is a proxy nobody checked. The
project has now had two of these on the same tool in two waves. When a screen
reports one name, look at how many candidates tied for it before believing the
name means anything.

### The blend shadow: three spellings, and which one each access needs

Consolidating what four of these functions turned on, against the note on
`gUnknown_030030E0` in `include/hardware.h`:

- **`ldrh` with a pool mask ⇒ `.raw`** — a whole 5-bit target group.
- **`ldrb` with a `movs #N; neg` mask ⇒ `.bits`** — one backdrop bit.
- A function uses both, a line apart. `sub_0806C7B4` alternates four times.

The `.raw`-vs-scalar-cast choice is a **third** axis on top of that, and it is
decided by whether a live constant is in flight:

- Two group writes **separated** by a `.bits` write do not merge, and the union
  `.raw` spelling is exact (`sub_0806C7B4`, `sub_0806C700`).
- Two group writes **adjacent** merge into one `strh` via store forwarding, and
  the union spelling then picks up whatever zero the preceding scalar stores
  left live and emits a spurious `orr` (`sub_0806AFF0`, `sub_08071DB4`). Use
  `*(u16 *)&gUnknown_030030E0`.
- `effect = 3` is an all-ones bitfield value, so `store_fixed_bit_field`'s
  `all_one` drops the AND and only `orr #0xc0` survives — which is why
  `sub_08071DB4` has no `and` there and `sub_0806C7B4` (`effect = 1`) does.
- `gUnknown_03001FFC = gUnknown_03001FFC;` is a real self-store and appears in
  two of these. It is only spellable because the global is `volatile`; without
  the qualifier the whole statement is deleted and the bare `ldrh`/`strh` pair
  disappears. If you cannot produce that pair, the qualifier is why.

## `u.raw` and `*(u16 *)&u` are NOT interchangeable — and a probe says they are (wave 21, W21-B)

The wave-15 blind spot has a second instance, and this one is not about type
width. For a `union BgCntBuf`/`BlendCntBuf` object, the raw-halfword view can be
written two ways:

```c
gUnknown_030030E0.raw     = (gUnknown_030030E0.raw     & 0xFFE0) | 0x1F;
*(u16 *)&gUnknown_030030E0 = (*(u16 *)&gUnknown_030030E0 & 0xFFE0) | 0x1F;
```

Compiled side by side in an otherwise empty file, these emit **byte-identical**
assembly — same instructions, same pool words, same order. That measurement is
worthless. Substituted into a real function, they are different code:

- **`sub_08071DB4`** — the cast matches; `.raw` is **+4 bytes** and 56.4%
  identical. `.raw` materialises the `0` that the *preceding* statement stores
  into `gUnknown_03002020` as its own pseudo, which stays live across the insert
  and comes back as a **dead `orrs r1, r3`**. That shifts every subsequent
  register and pushes one more word into the literal pool.
- **`sub_08071CF4`** — same substitution, **size stays exactly 124 bytes** and
  16 bytes differ. Here the cost is purely allocational: `.raw` parks the 0 in a
  callee-saved register, so the prologue becomes `push {r4, r5, lr}` where the
  ROM has `push {r4, lr}`. **A size check cannot see this one at all.**
- **`sub_0807F2FC`**, two functions along in the same subsystem and on the same
  symbol, matches with **either** spelling.

So it is not a property of the symbol, the union, or the mask. It is a property
of what else is live at that statement, which is why the isolated probe --
where nothing else is live -- cannot see it.

**Practical rule:** on a union raw-view write, treat `.raw` and the cast as two
candidates to be tried against the target, never as one spelling with two names.
Both appear in matched promoted code, so neither is "the" convention:
`c_08012358.c` uses `.raw` for a bare `= 0`, and the masked-insert family here
needs the cast. Prefer whichever matches and say which in the file.

**And the general form, restated because it has now cost two waves:** *a probe
showing two spellings are identical is evidence about the probe's context, not
a general fact.* Wave 15 found it for `u16 v` vs `int v` with casts at each use;
this is the same failure on lvalue spelling. A probe can confirm a candidate is
right; it cannot license a substitution.

## The volatile-LHS address load lands before EVERYTHING in its statement — which makes statement membership an ordering lever (wave 21, W21-B)

This both **qualifies** the wave-20 rule *"A `volatile` LHS is forced into a
register BEFORE the RHS call — bind the result"* and gives it a source-level
lever. Read the two together.

**The qualification first, because the wave-20 rule is stated too generally.**
It says the plain `gUnknown_03001FFC = Interpolate(...);` "does NOT compile to
what the ROM has". That is true of the function W20-C was working and false in
general. `sub_0801320C` and `sub_080132B0` both MATCH with the plain assignment,
pool `ldr` ahead of the `bl` and the address parked in a callee-saved register
across it — the very output wave 20 called wrong:

```
	ldr r4, _0801327C @ =gUnknown_03001FFC
	ldr r3, [r5, #0x54]
	adds r3, #1
	str r3, [r5, #0x54]
	...
	bl Interpolate
	strh r0, [r4]
```

So there is nothing to choose on principle. **The ROM tells you which one it
is, and it is a one-glance readout:**

- pool `ldr` for the destination **before** the `bl` → the source is the plain
  assignment. Write it directly.
- pool `ldr` **after** the `bl` → the source bound the result to a local first,
  which is wave 20's `s32 v; v = f(...); g = v;`.

Both spellings exist in this ROM on the *same global*. Treat the wave-20 form as
one of two candidates, not as the fix.

**Now the lever.** Because the volatile destination's address is expanded before
anything else in the statement, **any side effect you put INSIDE that statement
is ordered after the `ldr`, and the same side effect as a PRECEDING statement is
ordered before it.** That is a source-level handle on instruction order with no
size change at all:

```c
/* ldr lands AFTER the ldr/adds/str -- 8 of 116 bytes wrong */
proc->unk54++;
gUnknown_03001FFC = Interpolate(0, 0, 0x10, proc->unk54, proc->unk64);

/* ldr lands BEFORE it -- matches */
gUnknown_03001FFC = Interpolate(0, 0, 0x10, ++proc->unk54, proc->unk64);
```

Identical instruction count, identical size, identical registers — **only the
position of one `ldr` moves.** A size check cannot see it and neither can a
diff summary that only counts bytes; you have to look at where the pool load
sits. It cost one attempt on each of two functions in wave 21.

Generalising past the counter case: this works for **any** side effect that can
be written either as its own statement or as part of the RHS expression — a
post/pre-increment, an assignment used for its value, a comma operator. It is
the same class of lever as the wave-17 comma-operator anchor, but it needs no
comma: the statement boundary is doing the work, and the volatile qualifier is
what makes the boundary observable in the first place. On a NON-volatile
destination the address is not force-expanded, so the lever does not exist and
both spellings give the same code.

## A running maximum's TYPE decides reload-vs-copy, and it is the last two bytes (wave 21, W21-A)

`sub_0804B42C` came in at 98.0% with three bytes wrong and the size exact. The
whole difference was the two instructions that update a running maximum:

    ROM             ldrb r7, [r0] ; cmp r5, r7 ; bhs .. ; adds r6,r2,#0 ; ldrb r5, [r0]
    candidate       ldrb r0, [r0] ; cmp r5, r0 ; bcs .. ; adds r6,r2,#0 ; adds r5,r0,#0

for the obvious source

    if (best < tbl[t]) { result = t; best = tbl[t]; }

The ROM reads the table TWICE; the candidate reads it once and copies. Four
spellings were probed in one call -- `best = tbl[result]` after `result = t`,
`*(tbl + t)` against `tbl[t]`, and swapping the two assignments -- and all
three failed identically, because CSE canonicalises the address through the
register equivalence class and merges them whatever the syntax.

**The lever is not the expression, it is the declared type of the
accumulator.** `u8 best` reproduces the ROM exactly; `int`, `u32` and `s32` all
produce the copy. The assignment is then a QImode-to-QImode move whose source
is a QImode MEM, which agbcc satisfies with a second `ldrb` off the address
register that is still live, rather than with the SImode value CSE already
holds. This is the wave-18 "suspect the TYPE before the allocation" rule
landing on a scalar rather than an aggregate.

**And the compare does not discriminate.** `cmp; bhs` is UNSIGNED, which reads
like a `u32` accumulator and is why `u32` was tried first. It is not: two
zero-extended QImode values compare unsigned whatever the C types are, so
`u8`, `u32` and `int` all emit `bhs` here. The unsigned branch is evidence
about the operands' MODE, not about either declaration -- do not read it as a
width tell.

## Where a narrowing sits relative to the FIRST BODY STATEMENT separates PROMOTE_MODE from a cast (wave 21, W21-A)

The existing rule says a prologue narrowing is not a parameter-width tell when
the narrowed value feeds another call. `sub_08014668` shows the positive half
of that test, and it is purely positional.

Its three trailing arguments are narrowed `lsls #0x10; lsrs #0x10` and then
handed straight to `sub_080147B4`. Declared `int`, agbcc emits exactly the same
three narrowings -- but AFTER the function's first statement (a `strb` to an
unrelated global) and interleaved with the outgoing `str rN, [sp, #k]` stores.
Declared `u16`, all three are emitted at entry, before that `strb`, and the
`str`s are a separate run later. The ROM has them at entry, so the parameters
are narrow.

So the readout is: **a narrowing BEFORE the first side effect of the body is
PROMOTE_MODE and types the parameter; a narrowing after it, adjacent to the
argument setup, is a conversion at the call and types the CALLEE.** Both
spellings have the same instruction count, so only the position tells them
apart, and a straight-line probe shows it in one call.

## A "loose duplicate" pair often has literally ONE source, not two (wave 21, W21-A)

`tools/overlap_screen.py`'s LOOSE tier reports pairs whose instruction streams
match and whose pool symbols differ. Five such pairs were worked in wave 21;
the differing symbols were resolved against `baserom.gba` before any C was
written, and **three of the five pairs turned out to reference the same
globals**:

    0x0816E158 / 0x0816E1AC  -> both 0x08580934      (sub_08066BF4 / sub_0806DCB8)
    0x0816E15C / 0x0816E1B0  -> both 0x03002EE0      (same pair)
    0x0816E160 / 0x0816E1B4  -> both 0x03002EE0      (sub_08066C70 / sub_0806DD34)
    0x0813604C / 0x08136050  -> both 0x020298E0      (sub_0804BDD8 / sub_0804BECC)

Each is a private `-fforce-addr` `.rodata` word, one per (function, symbol)
pair, so a pair of functions compiled from the same source in two translation
units shows two different `gUnknown_` names for one global. For those three
pairs the sibling was not a derivation at all -- the identical C matched, with
only the function name changed. The remaining two pairs (`gUnknown_08551CA0` /
`gUnknown_08551CBD` and `gUnknown_08489548` / `gUnknown_08489568`) are genuine
distinct data, and there the symbols are used as ADDRESSES directly rather than
through a `ldr rN,[rM]` reroute -- which is the test. **One extra `ldr` level in
front of the pool word means the symbol is a `.LC` word and the difference is
probably not real; a direct use means it is.**

`gUnknown_08551CBD` is the counter-example the wave brief flagged: an ODD
address that IS a real object. 0x08551CA0 + 0x1d == 0x08551CBD and
0x08551CBD + 0x1f == 0x08551CDC, so the three symbols tile the region exactly
and the two byte tables are 29 and 31 explicit initialisers. The 5-bit mask on
their index suggests 32 entries and would make them overlap; the ROM layout
wins.
