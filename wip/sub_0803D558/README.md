# sub_0803D558

0x0803D558, 352 bytes, THUMB, parked.

Best score so far: 95.5%, +4 bytes.

## Files

- `sub_0803D558.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

352/352 size-exact, 20 differing bytes (94.3%), first difference +0xEA. Unchanged since wave 66; re-verified wave 77 (W77-B) and wave 80 (W80-D). Profile: configured. best.c is the same draft.

### What still differs

The second map scan's row read. ROM: `ldr r1,[r6] / ldr r3,=0x417A / adds r0,r1,r3 / adds r0,r0,r7` -- (ptr + 0x417A) + y*2 with the constant materialised INSIDE the loop. Draft: `ldr r2,[r6] / adds r0,r5,r2 / ldr r3,=0x417A / adds r0,r0,r3` -- (y*2 + ptr) + 0x417A. Registers renumber with it (ROM r7/r5/r1 vs r5/r7/r2, `mov r3,r8` vs `mov r1,r8`). The cell address `(ptr + 0x1432) + idx` and everything else is exact.

### Why it is close

WAVE 80 (W80-D) pinned the mechanism with eleven compile_probes. (1) Every RAW pointer sum reassociates: expand_expr's PLUS_EXPR under EXPAND_SUM does 'make sure any term that is a sum with a constant comes last' and 'associate to put the constant outside', so `(p + c) + i2`, `p + (i2 + c)`, `(int)p + c + i2`, `i2 + (c + (int)p)`, `(u16 *)((u8 *)p + c) + y`, and `t = y*2` bound first all emit (p + i2) + c. `(*(u16 (*)[N])(p + c))[y]` is NOT an ARRAY_REF: c-typeck's build_array_ref turns a subscript on an INDIRECT_REF into pointer arithmetic, so it reassociates too. (2) Only the COMPONENT_REF path (`((struct Map *)p)->unk417A[y]`) forms (p + c) first -- normal_inner_ref applies the member bitpos with plus_constant BEFORE adding the index offset -- and it reproduces the ROM's grouping for BOTH the row and the cell (probe d5). (3) The constant 0x417A then arrives as a SEPARATE `(set u 0x417A)` insn (the thumb addsi3 expander forces non-encodable constants into registers), and whether LICM hoists it is a move_movables decision that depends on the loop's composition, not on the value or the mode: with the same struct spelling the row constant hoists when the cell array is u8 (probes d5, p1 with the two constants' VALUES swapped, p3 both-u8) and does NOT hoist when the cell array is u16 (probe p2, where the inner loop hoists nothing at all); the cell's own constant hoists only in a tiny loop (p4) and never beside the row's. The real function's struct spelling hoists 0x417A (+4, `ldr r3,[pc]; mov r8,r3` / `mov r2,r8`) and the ROM's does not.

### Already ruled out

- Wave 55: `u8 *p` local for the cell address (frame 0x10 -> 0x14, extra -fforce-addr word); `int o` index local subscripting unk1432 twice (byte-identical).
- Wave 62: profiles o1 (+4, 5.7%), o1-no-force (+8), no-force (+16); opaque no-op store (+24); bound-pointer form (identical).
- Wave 66: struct-member spelling for scan 2 -- ROM grouping but the 0x417A hoist, +4; volatile member variants -- extra loads.
- Wave 77 (W77-B): mixed spelling, struct for the row read and raw pointer arithmetic for the store (+36, 7.1%); `*(u16 *)(gUnknown_08499590 + 0x417A + y * 2)` (byte-identical to the draft).
- Wave 79 (orchestrator): all seven compiler profiles, zero matches.
- WAVE 80 (W80-D): `(u16 *)((u8 *)p + 0x417A) + y`; `*(u16 *)((int)p + 0x417A + y * 2)`; `y * 2 + (0x417A + (int)p)`; `t = y * 2` bound in the outer loop then `*(u16 *)(((u8 *)p + 0x417A) + t)`; `(*(u16 (*)[0x100])(p + 0x417A))[y]` alone, with a struct cell, and with the same form for the cell; `rows = p + 0x417A` as an in-loop statement (the constant is then hoisted AND y*2 is not) -- all reassociate or hoist. `i = x` retained in scan 2 (byte-identical to d5).

### Settled

- The ROM's grouping is the COMPONENT_REF grouping; the source read the row through the struct, as scan 1 does.
- `(*(T (*)[N])(p + c))[i]` is pointer arithmetic to the front end and cannot be used to force an ARRAY_REF on a computed base.
- Under EXPAND_SUM the constant of a pointer sum always ends up outermost; no raw spelling can put (p + c) first.

### Why it is parked

Residual kind 4-adjacent: a loop-optimiser hoist decision. The grouping is reachable (struct spelling) but that spelling emits the 0x417A constant as its own movable and the real function's inner loop hoists it where the ROM's did not. What makes the ROM's movable fail move_movables' test (savings * lifetime against the loop's insn count, if that is the test) is not visible from any source spelling tried; probes p2/p3 show the decision flips with the loop's composition, so the lever, if any, is an insn that existed at loop time and vanished later. No pure source order remains to try.
