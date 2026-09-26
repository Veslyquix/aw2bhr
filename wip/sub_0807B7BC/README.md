# sub_0807B7BC

0x0807B7BC, 156 bytes, THUMB, parked.

Best score so far: 9.0%, -12 bytes.

## Files

- `sub_0807B7BC.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

9.0% identical, candidate 144 bytes (-12), first difference at +0x2

### What still differs

TWO COUPLED FACTS, both allocation/layout, neither a shape. (1) THE REGISTER BUDGET IS ONE SHORT. The ROM allocates SEVEN call-saved registers -- r4=str, r5=g, r6=str+1, r7=tile, r8=outWidths, sb=total, sl=outTotal -- and spills only `count` into a 4-byte frame (str r2,[sp] / ldr r2,[sp] around the Decompress call). The draft allocates SIX -- r4=g, r5=str, r6=tile, r7=count, r8=str+1, sb=outTotal -- and spills BOTH outWidths and total into an 8-byte frame. Same eight values either way; the ROM parks two of them in high registers and pays `mov r0,r8` / `mov r3,sb` at each read, the draft prefers memory. The 12 bytes are the third high register's push/pop/mov (+4), the duplicated outer guard (+4), and the mov shuffles (+4). (2) LOOP ROTATION, SWAPPED BETWEEN THE TWO LOOPS. The ROM rotates the OUTER loop -- test duplicated inline at entry (ldrb r0,[r4] / cmp r0,#0 / beq _0807B838) and again at the bottom -- and leaves the INNER loop jump-to-test (b _0807B82C into a shared cmp r0,#0 / bne). The draft does exactly the opposite. Each version rotates exactly ONE of the two loops and it is the other one.

### Why it is close

Every statement, both loop bodies, the Decompress argument computation, both inline constants (0x000003FF and 0x06010000), the `outWidths[count + 1]` operand order (count is the FIRST operand of the adds), the u16 truncation of total and the (u16)count return are all correct and in the right order. Nothing about the shape, the types or the vocabulary is in question.

### Already ruled out

- Wave 59 (W59-G): SOURCE-LEVEL LOOP ROTATION IS NOT A LEVER. `while (*str != 0) { ... str++; }` and `if (*str != 0) { do { ... str++; } while (*str != 0); }` compile to BYTE-IDENTICAL output -- same 144 bytes, same 9.0%, same registers, same spill slots, same rotation choice, same 130 differing bytes. The front end folds the source guard away and a later pass re-decides the rotation on its own, so which loop gets its test duplicated cannot be spelled. Written up as its own chapter in docs/agbcc-codegen.md.

### Notes

SETTLED READOUTS, do not re-derive. FOUR parameters, in r0-r3; the draft's fifth `void *a5` is unused, costs nothing and is kept only to agree with the existing declaration. `sub sp,#4` is a SPILL SLOT for count, NOT an outgoing argument slot -- Decompress takes two arguments, and r2 is reloaded from [sp] after the call and used as count, which an argument never would be. `count` is int, truncated only at the return (count++ is a bare `adds r2,#1` with no re-truncation, and the return is lsls #16 / lsrs #16); `total` is genuinely u16, its truncation stored back into the variable every iteration. `str + 1` is computed at the top of the outer body and copied back at the bottom in BOTH versions, so it is compiler-invented and must not be authored as a second source variable. WHY the draft cannot simply be told to use sl: outWidths and total are both used in adds/lsrs forms that only encode LOW registers, so a high register costs a copy at every use and gcc weighs that against a spill. NEXT: the rotation is downstream of the allocation, so there is one fact to move, not two, and it is a source form that makes gcc prefer a third high register over a second spill. decomp-permuter's documented case is order-wrong/slot-wrong allocation, which this is -- but `mcp permute` was broken in wave 59, so that axis is UNTRIED, not ruled out.

### Wave 87

WAVE 87 (W87-F, do{}while(0) transfer test): THE LEVER WORKS HERE -- the only one of five that responded, the one whose mis-allocated values live across a `bl`. Thirteen placements, three outcomes: baseline / around Decompress / around the outTotal tail = outWidths and total both spilled, 144/-12, 9.0%; around the inner for / the match then-block / their composition = outWidths -> r7, count spilled, 148/-8; around the WHOLE OUTER while body (r3, and every composition on it) = outWidths -> r7, total -> r8, count AND str+1 spilled, 148/-8, 5.8% -- two of the ROM's three placements bought back, and `count` (the ROM's one spilled value) is now the spill. One try_match on r3 regressed by score (5.8% vs 9.0%, positional) and the draft was RESTORED to the wave-59 baseline (w87-start.c identical); the r3 form is the better starting point and should be reinstated by the next agent. BOUND: the wrapper re-ranks which values win the registers already being allocated; it does NOT change how many callee-saved registers the function spends (r3 still pushes two hi registers with an 8-byte frame vs the ROM's three and 4 bytes) -- that number is global_alloc's cost weighing, and outWidths/total are used in adds/lsrs forms that only encode LOW registers, so a hi register costs a mov per use. Next, sharper than the park's: with the r3 wrapper only `str + 1` remains in the spill set that the ROM keeps in r6, and str+1 is compiler-invented (must not be authored) -- so probe `str++` moved to the TOP of the outer body (before the inner for) with the compare re-read, composed with r3; and a permuter run from the r3 draft (never run; the wave-59 blocker is gone). Do not re-run r1/r5 (neutral) or r2/r4/r6/s2/s4 (worse than r3).
