# sub_0805B6A0

0x0805B6A0, 164 bytes, THUMB, parked.

Best score so far: 25.6% (best.c).

## Files

- `sub_0805B6A0.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

25.6% identical, candidate 160 bytes (-4), first difference at +0xe. Re-measured by W59-E; unchanged since wave 57.

### What still differs

ONE INSTRUCTION, a register SLOT tie between the function's two address constants. ROM: 'ldr r7,=gUnknown_02029ED8' (base in a LOW callee-saved register, kept all function), 'ldr r0,=gUnknown_030033EC' / 'mov ip,r0' (address in a HI register), and therefore 'adds r3,r5,#0' in the preheader to copy '*a1 * 0x20' out of r5 before r5 is reused as the loop's low copy of the address ('mov r5,ip'). Candidate: base in ip, address in r5, so '*a1 * 0x20' stays in r3 throughout and the copy is never needed. That copy plus the 2 bytes of literal-pool alignment its absence frees is the entire -4.

### Why it is close

Every statement, both out-param stores, the continue re-seed block, the loop rotation and the epilogue are correct; the candidate's allocation is simply the BETTER one. WAVE 59 (W59-E) CONFIRMED THE SPELLING POSITIVELY against the matched twins sub_0805B4D8 / sub_0805B5BC in src/decomp/c_0805B4D8.c, which is worth recording because those twins DO bind p and x locals and this one must not: the ROM loads p->x TWICE from the same register ('ldrb r0,[r1]' for the 0xfe test and again for the *a3 store), which a bound x would collapse to one, and it recomputes the whole p->y address including the gUnknown_030033EC re-read, which a bound p would collapse. The draft's fully-inline spelling is therefore right, not merely untested.

### Already ruled out

- Wave 48 and again wave 57: 'a = *a1;' bound as the first statement. It creates that pseudo first and pushes the base's pool load second, which is backwards from the ROM. There is also nothing for it to prevent -- 'a * 0x20' survives the '++*a2' store without a reload because a1 and a2 are different pointer parameters and agbcc treats two argument-derived bases as non-aliasing.
- Wave 48 and again wave 57: 'u8 *base = gUnknown_02029ED8;' as the first statement. The base still loses the low register.
- Wave 57: the record subscript's operand order. The instruction COUNT is identical either way, so it is not part of the -4.
- Wave 59 (W59-E): THE PERMUTER, which both earlier notes name as the next thing to try, was NOT run and should not be run through the MCP tool. 'mcp permute' is broken this wave (found by W59-A): it fails with a KeyError on 'exit_code' and strands raw header-expanded output in work/<fn>/<fn>.c, destroying the draft. Any permuter negative obtained through that path is worthless. Note also that the residual here is ONE EXTRA INSTRUCTION in the ROM, not a pure order/slot swap, and the brief records the permuter as useless on that case.
- Wave 59 (W59-E): old_agbcc was NOT probed here and is not promising -- this function contains no calls at all, so the documented discriminator for that override (a call inside a loop body, where r0 is both the argument register and the only free scratch) cannot apply.
- WAVE 81 (W81-C): temporary-profile sweep on the unchanged draft, superseding the note above which said 'not probed': default 25.6% (best), no-force 6.7% / +20, o1 and o1-no-force 15.2% / +40, old-agbcc 6.7% / -8, old-agbcc-no-force 13.4% / +8. No profile is even close; the toolchain axis is measured and closed.

### Wave 86

WAVE 86 (W86-B, live-range-split transfer test): the W83 split lever (a live narrow copy of `*a1 * 0x20` at the loop boundary) is EXACTLY byte-neutral -- identical in every figure -- because the copy source stays live (loop counter class); prediction 'the ROM has one MORE instruction, so a split cannot reach it' HELD. 'Bind the OTHER address (gUnknown_030033EC) first' is not an available axis: the ROM loads it into ip via r0 immediately before its only use, so there is no earlier statement to bind it in -- axis CLOSED, not untried. Also measured: promoting the t*0x20 temp to a source local numbers it ahead of every compiler temp and changes NOTHING (allocno number is not the tie-break here). NEW FACT worth keeping: pool-word ORDER and REGISTER assignment moved INDEPENDENTLY -- the pool words were put in the ROM's order (the swap wanted since wave 48) while the base stayed in ip; do not read a corrected pool order as evidence the register will follow. Configured, 160/164, 25.6%, unchanged.
