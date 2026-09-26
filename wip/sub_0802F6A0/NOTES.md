## Wave 74 (W74-C)

Configured verification of the retained source is size-exact 604/604 with 327
different bytes (45.9% identical), first divergence `+0x0c`. Two clean,
chained `python tools/permute.py sub_0802F6A0 --current` runs (150 seconds then
90 seconds, three threads) drained without a match. The retained candidate
binds the wrapped cursor to a new `u16` in the same assignment that sets `t`;
it is semantics-preserving relative to the prior active draft and improves the
previous 337-byte residual by ten bytes.

Do not trust the current 49.8% `best.c`/`best.json`: the 49.7% and 49.8%
outputs initialize their replacement cursor/checksum locals after an
unconditional `return -4`, but use those locals from earlier `goto found`
paths. They are undefined-behavior candidates and were rejected after direct
inspection. The remaining credible mechanism is still the `dst`/`expSum`
hard-register versus stack-slot inversion described below; bounded lifetime
and allocation search did not resolve it.

/* Wave 50 (W50-D).  PARKED with a COMPILABLE DRAFT this time -- see
 * work/sub_0802F6A0/sub_0802F6A0.c.  Wave 49's read-out (kept below in
 * substance) was right about everything it claimed; the whole instruction
 * stream now reproduces, frame included (`sub sp,#0xc`, three slots).  The
 * residual is ONE CONTESTED CALLEE-SAVED REGISTER and nothing else.
 *
 * =========================================================================
 * THE TYPE MODEL, now settled by compiling it
 * =========================================================================
 *   s16 sub_0802F6A0(s8 slot, u16 *dst)
 *
 * - The three pool symbols are pool words, exactly as wave 49 said.  Write
 *   `gUnknown_03003128[slot]`, `gUnknown_03003F48[slot]` and
 *   `gUnknown_02025C18[cursor][slot]` -- all three are already declared
 *   volatile, and the ring is the TWO-DIMENSIONAL `volatile u16 [][4]`.
 *   NO NEW GLOBALS WERE NEEDED.  That part of the note was exactly right.
 * - `slot` is `s8`: every index use is `lsls #0x18; asrs #0x17` off one
 *   sign-extended value, and the u8 form spilled at [sp] is the parameter's
 *   own home slot.
 * - `len` is an `s16` LOCAL assigned from an `ldrh`.  That is what produces
 *   the ROM's split: the raw halfword sits in one pseudo (`mov ip, r0`) and
 *   every USE re-signs it (`lsls #16; asrs #16`), and the success return
 *   `return len * 2;` folds to the single `lsls #0x11; asrs #0x10`.
 * - `avail`, `sum`, `comp`, `expSum`, `expComp` and the wrap temp are all
 *   `u16`, and the two reads of `avail` are written `(s16)avail` -- the ROM
 *   truncates with `lsls #16; lsrs #16` and then sign-extends with
 *   `lsls #16; asrs #16`, two separate narrowings, which only a u16 variable
 *   plus an (s16) cast at the use gives.
 * - The available-length arms really are asymmetric, as wave 49 flagged:
 *     if (w < c) avail = w - (c + 0xFFFFFC00); else avail = w - c;
 *   the first arm evaluates c first and the second evaluates w first, and
 *   writing them in that order is what reproduces the load order.
 * - The payload loop is `i = 0; while (i < len) { i++; ... }` -- the `i++` is
 *   the FIRST statement of the body, which is why the multiplier is 1-based
 *   and the bottom test compares the already-incremented counter.  The ring
 *   element is written out THREE times inside the body (sum, complement,
 *   store) exactly as wave 49 predicted; hoisting it into a local loses three
 *   instructions per iteration.
 * - The marker scan is a `do { c++; c &= 0x3ff; if (marker == 0x4FFF &&
 *   c != w) goto found; } while (c != w); return -4;`.  The two `c != w`
 *   compares are separate in the ROM and separate in the source.
 * - The four failure returns are -2 (cursors equal at entry, and again when
 *   `len + 6 > avail`), -4 (fewer than two halfwords, scan exhausted, or
 *   `len > 0x80`) and -3 (sum/complement mismatch).  Wave 49 said they are not
 *   interchangeable and that is right -- note that -2 is used at TWO sites and
 *   -4 at THREE, all cross-jumped into one copy each.
 *
 * =========================================================================
 * THE EXACT REMAINING DIFF
 * =========================================================================
 * `dst` and `expSum` want the same register and agbcc gives it to the wrong
 * one:
 *   ROM:    `dst` gets NO hard register -- it is stored to its home slot
 *           [sp,#4] in the prologue and reloaded once into r5 in the loop
 *           preheader -- and `expSum` lives in sl for the whole tail.
 *   draft:  `dst` gets r8 (so `dst++` costs the extra `movs r0,#2; add r8,r0`
 *           instead of `adds r5,#2`) and `expSum` is spilled to [sp,#8].
 *           The draft also materialises the gUnknown_03003128 address once
 *           directly, giving one extra literal-pool word the ROM has not.
 * Net: 4 bytes over, and the instruction ORDER is already correct.
 *
 * RULED OUT (attempt 2, do not repeat): copying the parameter into a local
 * `q` before the loop and writing `*q = ...; q++`.  It does move `dst` to the
 * stack and does produce the ROM's `ldr r5,[sp,#4]` preheader reload, but it
 * makes things WORSE overall -- the frame grows to 0x10 and expSum still
 * spills, now to [sp,#0xc].
 *
 * NEXT: this is a decomp-permuter candidate on the wave brief's own criterion
 * -- a pure register-allocation residual on a >256-byte function with the
 * instruction order already right, which is exactly the case the brief says
 * the permuter is NOT useless on.  Do not hand-rewrite the statements; they
 * are correct.
 */
