# sub_08062FF4 — MultiBootMain. Was -56 bytes / 14.2%; now **-12 bytes / 14.4%** (wave 60, W60-F)

**Read the size line, not the percentage.** 14.4% is positional: the first
difference is at +0x12, which is a `beq near; b far` pair, so every later byte
is shifted. The shape is very nearly right.

## What wave 60 fixed — worth 44 of the 56 missing bytes

Both loops in `case 0` are **peeled in the SOURCE**, not rotated by the compiler.
The peeled copy of each contains a volatile `SIOMULTI3` read, and gcc's
`duplicate_loop_exit_test` refuses to copy insns with side effects, so no pass
could have written it — the original author wrote the `i = 3` iteration out.
Both peels are now written explicitly in the draft. New chapter in
`docs/agbcc-codegen.md`.

Also load-bearing, and now confirmed rather than guessed: the peeled read must be
spelled `*(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2)` with `i` the
VARIABLE holding 3. `cse` substitutes 3 only after `-fforce-addr` has split the
base into its own pseudo, which is what leaves `0x04000120` pooled with the `+6`
in the `ldrh` displacement. A literal index folds the address to a `0x04000126`
pool word and is wrong. (The `0x04000126` word that *does* appear inside loop 1
is `strength_reduce`'s giv init — a pointer walked down by 2. Do not author it.)

## The remaining -12 bytes, read off the instruction diff

Two were fixed this wave and did not move the size, so they are cosmetic but
correct and should be kept:

- `i = MultiBoot(mp); if (i == 0)` — the ROM binds the result (`adds r5,r0,#0;
  cmp r5,#0`) rather than testing r0 directly.
- `advance:`'s word is `(mp->unk28[mp->unk18 - 3] << 8) | mp->unk28[mp->unk18 - 4]`
  — the ROM evaluates the shifted high byte FIRST.

Still open, in the order they appear:

1. **A dedicated `movs r0, #0` return-0 tail.** The ROM keeps `_080633D2: movs
   r0,#0` as its own block just before the shared epilogue at `_080633D4`, and
   the far `return 0` paths reach it with a single conditional branch. This
   candidate cross-jumps them onto an EARLIER `return 0` at +0x26 instead, which
   deletes the `movs r0,#0` and its `b` (-4) and then forces `beq near; b far`
   pairs where the ROM has one branch (+2 each). **This is residual kind 4
   (basic-block layout / which of N identical blocks survives cross-jumping)
   and the brief says the permuter cannot reach it** — but note the deficit is
   self-reinforcing: being short collapses branches, which shortens it further,
   so the TRUE missing code is well under 12 bytes.
2. **Corrected in Wave 70:** `case 0xd1`'s bit test is instruction-exact as an
   `asrs; ands; cmp; beq` sequence. Earlier positional diff output made its
   `ands; cmp` pair look candidate-only; direct ROM assembly proves otherwise.
3. `default:`'s `ip` / `r8` roles are swapped against the ROM (`mov ip,r2; mov
   r8,ip` vs `mov r8,r0; mov ip,r8`). Same length — pure allocation, leave it.

## Wave 70 configured localization

Fresh configured measurement is candidate code **-2 bytes**, whole `.text`
section **-12 bytes**, with 13 candidate pool words versus 14 in the ROM. The
case-`0xd1` bit-test note above is stale: direct comparison to the immutable
ROM assembly shows both sides have `asrs; ands; cmp; beq`; only registers and
downstream offsets differ there. Do not remove that test.

After normalizing agbcc/ROM mnemonic spelling, the candidate has 454 code
instructions versus the ROM's 455. The one-instruction net deficit is the
return/block-layout network: the ROM has three more unconditional `b`s and the
dedicated late return-zero block, while the candidate substitutes two `bne`s,
one `beq`, and one extra compare around earlier return-zero copies. This is not
a missing state-machine operation. No structural edit was retained because it
would undo the settled peeled loops for a residual already localized to block
placement.

## Not a volume park

The whole state machine (probe 0/1/2, download 0xd0/0xd1, the 0x62xx/0x73xx
handshake words, the 0x11 checksum seed) is transcribed and believed correct
against the `MultiBootParam` layout. **This is "could not close it", not "could
not work out how"** — the residual is a named, small, block-layout question.
