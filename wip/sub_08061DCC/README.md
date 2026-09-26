# sub_08061DCC

0x08061DCC, 136 bytes, THUMB, parked.

Best score so far: 27.2% (best.c).

## What it does

Checks one unit (a struct Unit) against two thresholds in the byte row that gUnknown_03004784 points at. If its HP is below entry 3, it sets the 3-bit field in the unit's byte 9 to 2. Otherwise, if its type carries ammo and it has none left, or its fuel as a percentage of the type's maxFuel is below entry 2, it sets that field to 1; otherwise it leaves the unit alone.

## How close it is

Compiles to 136 bytes, the ROM's size, but only because 2 bytes of alignment padding fill the gap: the code is one instruction short. 27.2% of bytes are in place. The missing instruction is a copy of the unit-type table's address into a saved register, which the ROM makes and the draft does not.

## What is left

First, name the two globals directly (gUnknown_03004784 and the unit-type table gUnknown_085D5ABC) instead of reading them through gUnknown_0816DB08 and gUnknown_0816DB0C, which are the compiler's own pointer words; that fixed four similar drafts, and the one measurement against it was taken on a much earlier draft. Otherwise the draft holds five values across the branches where the ROM holds four, because it keeps the constant 0x5c in a register instead of loading it at each multiply.

## Already tried

- Naming the two globals directly, on an early draft: 16 bytes short, because the compiler merged the two table reads across the division call.
- Binding both table addresses to locals and using them everywhere: needs one more saved register (120 bytes at the time). Binding the first one but leaving its first use as the plain global gained one of the two missing copies (kept).
- Five respellings of the unit-type index (a local, an assignment inside the subscript, two locals and so on): all byte-identical.
- `& 0xff` on the index: byte-identical. A shift-mask-shift on the second use made the compiler recompute the multiply as the ROM does (kept).
- Binding the masked index to a local before the `if`: 2 bytes too long.
- `const` on the two pointer-word declarations: no effect.

## Files

- `sub_08061DCC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Best so far

15.4% identical, candidate 128 bytes (-8), first difference at +0x0 (the push mask -- a symptom of the extra long-lived pseudo, not a frame error). Re-measured by W59-E. NOTE best.c holds 19.1% for a different spelling; the draft is 15.4%.

### What still differs

EIGHT BYTES IN ONE PLACE; the instruction stream is otherwise identical, branch for branch and constant for constant. At _08061E16 the ROM RECOMPUTES the stride multiply in the second arm -- 'ldr r2,[r5]' / 'movs r1,#0x5c' / 'muls r1,r3,r1' / 'adds r1,r1,r2' -- keeping the bare p->unk00 alive across the merge (the 'adds r3,r2,#0' copy), where the candidate keeps the PRODUCT alive and emits 'ldr r1,[r3]' / 'adds r1,r2,r1'. The two pool-address copies ('adds r6,r2,#0', 'adds r5,r3,#0') and the third callee-saved register in the push list are the same fact seen from the allocator: the ROM carries one more long-lived pseudo. 4 bytes for the recomputed multiply, 4 for the copies.

### Why it is close

Settled and not to be re-derived: the parameter is a unit record with struct Unk08499594's layout and the bitfields are what produce the ROM's SImode 'movs #8; negs; ands' mask (a hand-written '(p->unk09 & ~7) | K' narrows to 'movs #0xf8; ands' and is one instruction SHORTER -- measured, so the field really is a bitfield); volatile on the two pool words is what restores the re-dereference at every use and is a reproduction device, not a claim about the object; the || short-circuit, the (u8) cast on the quotient, '100 * x', the SIGNED __divsi3, and the shared 'orrs r1,r0' / 'strb r1,[r4,#9]' tail reached by cross-jumping are all exact. Note [r4,#4] is read both as a byte with a 7-bit field and as a halfword masked 0x780, i.e. one u16 bitfield accessed at two widths, not two members.

### Already ruled out

- Wave 37: the honest spelling ('gUnknown_03004784[3]', 'gUnknown_085D5ABC[..]') loses the .rodata indirection entirely, 16 bytes short. Measured cause: -fforce-addr's reroute is settled after CSE has merged the references, and a pointer global read twice around 'bl __divsi3' collapses to ONE reference because a libcall does not clobber memory. Two references in two basic blocks are necessary but NOT sufficient.
- Wave 37: the c_local workaround ('pa = &gUnknown_0816DB08', 'pb = &gUnknown_0816DB0C'). Hoists both pool loads into the entry block and CSEs harder -- 120 bytes, strictly worse.
- Wave 37: a local for the index, and the same local written as an embedded assignment inside the first subscript ('g[t = p->unk00]'). Byte-identical output; the product CSE is not reachable from the source.
- Wave 37: 'const' on the two pool declarations. Byte-identical, i.e. no effect.
- Wave 59 (W59-E): THE PERMUTER, which wave 37 named as the next thing to try, must not be run through 'mcp permute' -- it is broken this wave (W59-A) and strands raw header-expanded output in work/<fn>/<fn>.c, destroying the draft. Any negative from that path is worthless.
- Wave 59 (W59-E) assessment: the surviving half of this residual is which of two identical blocks survives cross-jumping at the shared orrs/strb tail, which is the brief's kind-4 class. The documented position is that the permuter cannot reach kind 4 (sub_080373F0: 19,619 iterations, ceiling unmoved). Recommend leaving this parked rather than spending a fourth wave on it.

### Wave 87

WAVE 87 (W87-D): pre-registered W81-C two-definition / W86-G join re-derivation lever REFUTED, 0 try_match, draft unchanged (128/136, -8, 15.4%). Two spellings in one probe, both BYTE-IDENTICAL to baseline: `t = p->unk00;` before the `if` with the first arm inline `g[p->unk00].unk0b` and the second `g[t].unk10`; and `u = p->unk00;` re-read as the first statement of the if body. Mechanism: W81-C needs definitions that DISAGREE BY VALUE across paths, and this join is reached from the two arms of one `||` that both need the SAME index -- there is no path on which a different value can flow. Index-spelling axis is now FIVE deep and exhausted (inline; one local; embedded assignment; two locals; inline-first-local-second). ROM read off target.s: before the branch it emits `adds r5,r3,#0` (copy of the pool-word ADDRESS) and `adds r3,r2,#0` (copy of the INDEX), keeping TWO pseudos alive across the join and recomputing the multiply at _08061E16; the draft keeps ONE (the product) and reloads the pool -- that is the third callee-saved register (ROM push {r4,r5,r6,lr} vs {r4,r5,lr}), 4 bytes for the recomputed muls, 4 for the two copies. The open question is why the product is AVAILABLE at the join in the draft and not in the ROM with the same CFG and dominating block; if anything is tried, target the availability of the multiply itself, never the index. W59-E's 'leave parked' recommendation stands; this was the fourth wave.

### Wave 89

WAVE 89 (W89-D then W89-H): 15.4% -> 19.1% -> 27.2%, size delta -8 -> size-exact header with code -4 -> -2. TWO levers landed. (1) W89-D, the FIFTH SPLITTER: a bare `& 0xff` is byte-identical (fold discharges it before cse numbers the multiply) but `(((u32)p->unk00 << 24) & 0xff000000) >> 24` on the SECOND reference survives to cse and dies in combine, so the product is no longer available at the join -- the ROM's recomputed multiply, its live bare index and its {r4,r5,r6,lr} push mask all reproduced for the first time in five waves; binding the quotient to a u8 local also fixes the post-call block. The prompt's premise (wave 88's static-inline helper, on the ground that p->unk00 is a memory read) was REFUTED without a probe: the disputed value is `p->unk00 * 0x5c`, an address-arithmetic pseudo, the class the helper is inert on. (2) W89-H: bind the symbol's ADDRESS to a local AND LEAVE THE FIRST REFERENCE BARE -- the bind creates the cross-block pseudo (a block-local and a global allocno cannot coalesce, so the copy survives) and the bare reference stops the allocator collapsing them, reproducing the ROM's `ldr r0,=X / adds r6,r0,#0`. THIS OVERTURNS THE STANDING WAVE-37 `c_local` NEGATIVE AND NAMES ITS CAUSE: that measurement bound locals at EVERY reference, and re-running it reproduces the regression exactly (push mask grows to {r4,r5,r6,r7,lr}). It was the leave-one-bare rule all along, not a fact about binding -- worth re-testing every park whose ruled-out list contains a bind-the-address negative. Evidence: work/sub_08061DCC/W89-notes.md.

</details>
