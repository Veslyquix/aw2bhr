# sub_0804FA2C

0x0804FA2C, 632 bytes, THUMB, parked.

Best score so far: 72.9% (preprocessed form, not included).

## Files

- `sub_0804FA2C.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

636 bytes (+4), 46.2% identical, first difference at +0xc (re-measured wave 79, W79-F). NOTE: the 46.2% here is the DRAFT's. best.c holds an unrelated variant scoring 72.9%, and that number has twice been quoted as this function's state.

### What still differs

&gUnknown_03004580 is materialised early and register-allocated, but into sl and ONE INSTRUCTION BEFORE `ldr r5, =gUnknown_085D6A48`, where the ROM has it in r8 one instruction AFTER -- so the last two literal-pool words are swapped and the tile multiply pays two extra copies (`adds r3,r1,#0; muls r3,r0; adds r0,r3,#0` against the ROM's bare `muls r0, r1`). The multiply is downstream of the allocation, not independent: both operand orders and a temporary for the table read give byte-identical output.

### Why it is close

This was the same failure mode that sub_0804D290 and sub_0804DCA8 had, and both of those are now MATCHED -- but WAVE 79 (W79-F) RE-TESTED THE TWINS' FIX IN ITS EXACT PROMOTED FORM AND IT IS WORSE HERE, so that lead is now closed rather than open. Of two address constants used the same number of times in the same statements, agbcc gives the callee-saved register to whichever pseudo is created first; the fix on the twins was a comma operator inside argument 1's subscript, INSIDE a `do { } while (0)` round the sub_08057D44 statement -- the two together, which is what c_0804DCA8.c actually does and which this function's earlier notes had only ever tried separately. Measured: the combination is 652 bytes (+20), 16.6%; the comma anchor alone moved into the tileNum statement's subscript, between the gUnknown_085D6A48 reference and the gUnknown_03004582 one where the ROM's `mov r8, r3` actually sits, is 636 bytes (+4) at 26.7% -- same size, 20 points worse. FA2C carries one more simultaneously live value than the twins, and the lever that buys &gUnknown_03004580 its register there costs &gUnknown_0300453C its r6 here. This is an allocno tie under a different live set, not a source construct. See 'Of two address constants, the pseudo created FIRST wins the register' in docs/agbcc-codegen.md.

### Already ruled out

- old_agbcc -- 624 bytes on the twins, worse here too
- -fno-force-addr -- BIT-IDENTICAL output, so these `ldr rN, =sym` are ordinary address loads and not -fforce-addr artefacts
- lc_screen reports 0 pool words, so this failure mode is invisible to it
- do { } while (0) round the tileNum statement, the sub_08057D44 statement, the sub_08015928 statement, or the four entry writes -- +8 to +20
- the comma anchor in either the tileNum or the sub_08057D44 statement -- same +4 size, worse bytes
- anchoring through pos, row, an int, or a register-qualified local -- all bit-identical, so the anchor's variable is irrelevant and only its position matters
- a u16 (*)[8] pointer local for the gUnknown_03004580 reads -- collapses the base-plus-constant form the ROM CSEs into an ldrh displacement
- two decomp-permuter runs of 300 s+ (3000 and 12000 iterations) -- best edits were noise (`new_var = 5` used as an array index) and both scored worse than the hand fix
- WAVE 79 (W79-F): the twins' COMBINATION -- do { } while (0) round the sub_08057D44 statement WITH (meta = gUnknown_03004580, ...) inside argument 1's subscript, exactly as c_0804DCA8.c writes it -- 652 bytes (+20), 16.6%
- WAVE 79 (W79-F): the comma anchor inside the tileNum statement's SUBSCRIPT (between the 085D6A48 reference and the 03004582 one, which is where the ROM's `mov r8, r3` sits) -- 636 bytes (+4), 26.7%, i.e. same size and 20 points worse than the plain draft

### Settled

- gUnknown_085D6A48's rows are STRUCTS, not u16[12] -- the ROM keeps column 9 in the ldrh displacement, which an array row cannot emit (4 bytes)
- (rN = pos[k])[i*5+j] and not pos[k][i*5+j] -- the ROM builds the row address first (12 bytes)
- ONE binding local PER STATEMENT: a single `row` reused across four statements is one pseudo spanning all of them and takes a low callee-saved register the ROM spends on the constant 180 (4 bytes)
- * 0x100 and not << 8 (4 bytes)

### Why it is parked

Register allocation with NO source construct behind it. The instruction stream, the type model and every read form are settled; what remains is one address constant landing one slot early in a function that is one live value tighter than its two matched twins, and wave 79 measured that the twins' own lever does not transfer in either of its two forms. Wave-77 class: register numbers with nothing behind them.
