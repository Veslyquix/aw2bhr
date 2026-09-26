# sub_0808AAF4

0x0808AAF4, 152 bytes, THUMB, parked.

Best score so far: 92.8%.

## Files

- `sub_0808AAF4.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

152 bytes SIZE-EXACT, 59.9% identical under --profile configured (default -O2). WAVE 79 (W79-D) improved this from 28.3% at +4 bytes; the entry's long-standing claim of 'size-EXACT at 152' was STALE -- the draft as found compiled to 156 bytes.

### What still differs

ONE callee-saved register. The ROM opens `push {r4, r5, lr}`, the candidate `push {r4, r5, r6, lr}`. The extra register holds &i, the address of the volatile delay counter at sp+64: the candidate computes it once before the first delay loop and keeps it live across both `bl _call_via_rN` calls, so it must be callee-saved. THE ROM RECOMPUTES IT -- `add r1, sp, #64` appears TWICE, once before each delay loop, and the ROM correspondingly carries the 20000 delay constant as TWO separate pool words, one in each of its two mid-function pools. So the ROM has two independent short live ranges where the candidate has one long one. This is the wave-17 'binding locals are punctuation' diagnostic read backwards, and it IS a named source construct, not an allocno tie.

### Why it is close

Size-exact with the loop shape now correct. See resolution_partial for what wave 79 fixed.

### Already ruled out

- WAVE 79: `int v` instead of `u16 v` for the shared-store temporary -- 144 bytes (-8), 23.7%. The u16 keeps the size right; do not widen it to remove the truncation.
- WAVE 79: giving each delay loop its OWN block-scoped `vu16 i` and `u16 v`, the obvious way to shorten the address's live range -- 156 bytes (+4), 44.1%. gcc gives the two locals two stack slots, so the frame and the offsets both move, where the ROM uses sp+64 for both loops. The two live ranges must come from ONE variable, so the lever has to be something that stops CSE carrying the address across the calls, not a second declaration.
- WAVE 79: the -O1 branch of the toolchain axis, which is what closed sub_0808AC7C and sub_0808B5B8 in this same wave and is therefore the one configuration worth re-testing here -- o1 and o1-no-force are BOTH 160 bytes (+8), 38.2% and 34.2%, i.e. strictly worse in size than the default. Also measured on the pre-wave-79 source: no-force 28.3% at +4, old-agbcc-no-force 28.3% at +4. Default -O2 is right for this function; it is the exception in its block, and wave 60 already recorded that it gets LONGER under -O1.
- TOOLCHAIN AXIS (wave 46, W46-I): old_agbcc is byte-for-byte IDENTICAL to the default here -- it does not change one instruction. That finding stands, unlike the same sweep's conclusion about sub_0808AC7C, because -O1 genuinely IS worse here and W46-I's -O2-only enumeration therefore happened not to matter.
- Reading `_call_via_r5` as an argument count. See docs/agbcc-codegen.md, '`_call_via_rN` for a CALLEE-SAVED N is not an argument count at all'.

### Resolution partial

THE DELAY LOOP'S INITIALISING STORE AND ITS DECREMENTING STORE ARE THE SAME STORE. The ROM sets up r0 = 20000 and then branches INTO the loop body, landing on the `strh`, so one `strh r0,[r1,#0]` serves both the initialisation and every decrement. Spelled: v = 20000; goto store; body: v = i - 1; store: i = v; if (i != 0) goto body; with u16 v and vu16 i. The natural i = 20000; goto test; body: i--; test: if (i) goto body; emits a separate initialising store and is 4 bytes longer. Worth 4 bytes and 31.6 points across the two loops. Same family as the goto-into-the-body lever that was worth 12 bytes on sub_0808B5B8's inner loop.

### Notes

THIS IS SELF-RELOCATING CODE: it calls sub_0808AD6C, which copies four bytes of a sibling's machine code onto the stack, then computes r5 = sp+1 (the THUMB entry point of those bytes) and calls it twice via `bl _call_via_rN`, holding that pointer live across both calls and both delay loops. That lifetime genuinely forces one callee-saved register; the open question is only why the candidate needs a SECOND one. The ROM emits its literal pool MID-FUNCTION twice, each jumped over by a `b.n`, holding 0x0E005555 / 0x0E002AAA / 0x00004E20.

### Wave 88

WAVE 88 (W88-A then W88-D): the park's central claim is REFUTED -- this is NOT the flash block's -O2 exception. The 'gets +8 longer at -O1' note was measured on a draft whose `u16 v` was itself the +8. Under `o1-no-force` (the profile ALL sixteen matched flash entries actually use: -O1 with -fforce-addr removed) the residual is ONE register-copy of the delay constant per loop, everything else byte-identical; W88-D measured 148 B (-4) / 28.3% under o1-no-force. Mechanism settled: nothing is coalesced -- `update_equiv_regs` DELETES a single-use constant pseudo's defining insn, so agbcc has exactly two states (one use: def deleted, no copy, push {r4,r5,lr}; two uses: copies survive but the pseudo crosses the calls, takes r6, pool load hoists to one) and the ROM is neither. Nine spellings measured; the `do { } while (0)` lever was an exact no-op (not a regression); dead second def, dead copy-out and role-swap are exact no-ops (confirms the W80-F bound). Evidence: work/sub_0808AAF4/W88-notes.md.
