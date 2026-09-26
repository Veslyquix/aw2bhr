# sub_08045FC8

0x08045FC8, 104 bytes, THUMB, parked.

Best score so far: not measured.

## What it does

Draws a list of sprites: for each army 1..sub_080248F8() that is not defeated, draws sprite (team colour + 0x3d) at x 8 and y = army * 16 + 0x30 with sub_0801F34C, then draws two fixed sprites (2 and 0xa9).

## How close it is

Reports the right size (104 bytes), but that is a coincidence: the code is one instruction (2 bytes) short and literal-pool alignment padding makes up the difference. 70 of 104 bytes differ (32.7% line up).

## What is left

The original computes `i << 4` twice; our compiler reuses the first result for the y argument. Every spelling that stops the reuse costs more than 2 bytes, so the one idea left is a wider source context (a macro or inline boundary shared with neighbouring functions), which cannot be tested from inside this function.

## Already tried

- Ten plain rewrites of the y value and loop body (`i * 16 + 0x30`, `i << 4`, `(i - 1) * 16 + 0x40`, a temporary, if/else, continue, switch, an element pointer): all byte-identical.
- `(u16)` casts or a u16 temporary for y: they stop the reuse but add 4 bytes.
- A volatile copy of i for the second use: stops the reuse and gives the original's instructions there, but costs a stack slot, a register and memory traffic.
- A `static inline` helper for the y value or the record index: byte-neutral.
- An `int zero` local passed as the last two arguments (worse), or the defeated flag read into a local (neutral).
- The automatic permuter, about 22,000 tries: nothing better.
- All seven compiler profiles: identical result.

## Files

- `sub_08045FC8.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Best so far

Reports `size: match` at 104 bytes and 32.7% identical, first difference at +0x6. Re-verified wave 73 (W73-C), unchanged since wave 37.

### What still differs

ONE INSTRUCTION. The ROM computes `i << 4` TWICE because its first copy is clobbered in place by its own `subs r0, r0, r4`, while agbcc's 3-operand `sub r0, r2, r4` leaves the shift alive in r2 for cse_insn to substitute. cse_insn fired in BOTH builds; the original's copy simply had nothing to substitute. So this is a register-allocation difference, not a CSE-failure and not a statement-shape one.

### Why it is close

Everything else matches: the loop shape, the *0x3c synthesis, the argument grouping and both trailing calls.

### Already ruled out

- IT IS NOT SIZE-EXACT, AND ANY SCREEN KEYED ON `size: match` IS MIS-INCLUDING IT. The candidate is 2 bytes of CODE shorter and gets exactly 2 bytes back as literal-pool alignment padding. Wave 58 (W58-D) flagged this and wave 73 re-confirmed it. Treat it as a missing-instruction case, never as an allocation case.
- Wave 37 (W37-P3): TEN source shapes, all byte-identical -- `i * 16 + 0x30`, `i << 4`, `0x30 + i * 16`, `(i - 1) * 16 + 0x40`, `y = i * 16; ... y + 0x30`, `if (...) call;`, `if (... != 0) continue; call;`, if/else both ways, `switch (unk14) { case 0: }`, and the element bound as `p = &gUnknown_08499598[i]` or `p = gUnknown_08499598`. None puts a CODE_LABEL between the two shifts, which is the only thing that would end the CSE extended basic block.
- Wave 37 (W37-P3): the `(u16)` forms -- `(u16)(i * 16 + 0x30)` and a `u16 y` temporary. These DO break the CSE because HImode arithmetic is a different RTL expression, but they pay `lsl #16; lsr #16` for it: +4 bytes for a 2-byte problem. This also settles that the third parameter of sub_0801F34C is NOT narrow.
- Wave 37 (W37-P3): `u16 i` is right -- the bottom `bls` needs shorten_compare on two unsigned narrow operands; `int i` gives `ble` and `u8 i` truncates the increment at 24 bits rather than the ROM's 16.
- Wave 43 (W43-H): decomp-permuter, 22,157 iterations, 4 threads, 300 s -- nothing. The candidate is a strictly BETTER allocation than the ROM's and the permuter's variants are all well-allocated too, so the search space does not contain the original's answer.
- Wave 43 (W43-J): the zero-cost-pressure lever (`int zero = 0;` bound before the loop and passed as arguments 4 and 5) costs a register rather than nothing -- r5 is burned for the whole function and the push list grows to {r4, r5, lr}. Strictly worse.
- Wave 43 (W43-J): reading unk14 into a local and passing it as the fifth argument -- neutral on the residual. Worth recording that it reproduces the ROM's `str r1,[sp]` EXPLICITLY where the shipped body gets the same bytes only via gcc's knowledge that r1 == 0 on that path, so it is the likelier original spelling; not shipped because it is not an improvement.
- Wave 43 (W43-J): adding a live range cannot UN-SUBSTITUTE a CSE. That lever closed three slot-wrong siblings in the same batch and cannot reach this one, which is one instruction the ROM has and the candidate does not. Do not try it again.
- WAVE 81 (W81-C): temporary-profile sweep on the unchanged draft -- default, no-force, o1, o1-no-force, old-agbcc and old-agbcc-no-force ALL report identical 104-byte size-exact / 32.7% / 70 differing bytes. The toolchain axis had never been named in this entry; it is now measured and closed.

### Settled

- Wave 43 (W43-H) re-framed wave 37's diagnosis and the re-framing is the durable part: this is NOT 'why did cse_insn not fire', it is 'which register did the shift land in'. That is why all ten source shapes produced identical code -- they were the wrong axis.

### Notes

Wave 73 (W73-C). DOCUMENTED DEAD END, and the class is the doc's own: the permuter is useless on a residual of one extra instruction, and so is the live-range lever. Three waves (37, 43 W43-H, 43 W43-J) have each concluded the same thing by different routes. The only untested reading is a WIDER SOURCE CONTEXT -- this function sharing a translation unit or an inline boundary with a neighbour -- which is not reachable from inside the function. Do not spend a wave's budget re-measuring in-function spellings.

### Wave 86

WAVE 86 (W86-E, vocabulary-twin axis): twin sub_080853B0 (src/decomp/c_080853B0.c) is a SAME-VOCABULARY NEIGHBOUR, not a shape twin. Its distinguishing construct (counter from 0 with the record indexed [i + 1]) is refuted by this function's own assembly: both scaled indices read the SAME register (`lsls r0,r4,#4` feeding the *0x3c synthesis and `lsls r2,r4,#4` feeding `adds r2,#0x30`), the increment block is the counter itself with `movs r4,#1` at entry -- record index and position index are ONE variable starting at 1, exactly as drafted. The twin's two scaled indices derive from DIFFERENT values, so its build never had a shared i<<4 and cannot exhibit the residual: a twin that does not contain the residual's construct cannot supply a solved instance of it. 0 probes, 0 try_match, draft unchanged; the wave-73 'documented dead end' and the 'NOT size-exact -- 2 bytes of code short plus 2 of pool padding' warnings both stand.

### Wave 89

WAVE 89 (W89-C, then W89-H's diagnostic): the wave-88 levers are REFUTED and the class is closed for them -- both occurrences of `i << 4` sit in ONE basic block with no `bl` between them (so the static-inline helper is deleted outright, measured byte-neutral) and the value never arrives through memory, which is the only thing volatile or the helper acts on. BUT THE AXIS IS LIVE, AND A THREE-WAVE-OLD FRAMING IS WRONG: W43-H's re-framing ('not whether cse fired, but which register the shift landed in') was used to declare ten source shapes the wrong axis. Forcing the second occurrence to be unavailable makes agbcc emit the ROM's OWN destructive `lsl r0,r4,#4 / sub r0,r0,r4` with no other change -- the register is DOWNSTREAM of the CSE. What is still needed is a FREE way to break the CSE: the (u16) forms break it but cost +4 for a 2-byte problem, and the fifth splitter does not apply (its reachable set is address computations with a narrow VARIABLE operand, and on a bare narrow read combine folds the mask INTO the load). General diagnostic born here, now a doc chapter: before calling a residual 'an allocation difference beside a CSE', KILL THE CSE in a probe however expensively and look at the registers -- if they fall into place you have one fact and a live axis. Run it BOTH ways: it confirmed a live axis here and killed a dead one on sub_08035170. Evidence: work/sub_08045FC8/W89-notes.md.

### Wave 89 permuter blocked

WAVE89 PERMUTER-BLOCKED: this draft currently carries a wave-88-style `static inline` helper written with `__inline__`/`__typeof__`, which PYCPARSER REJECTS -- permute.py reports 'could not score the starting point', which is a SYNTAX ERROR, not a result. So no permuter run on the CURRENT draft has ever actually executed, and any permuter negative recorded against a draft carrying the helper is void. `static inline` plus the explicit struct tag is BYTE-IDENTICAL and parses (W89-F, measured). Re-spell before recording any permuter verdict here.

</details>
