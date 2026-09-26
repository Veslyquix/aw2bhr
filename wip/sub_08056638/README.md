# sub_08056638

0x08056638, 144 bytes, THUMB, parked.

Best score so far: 95.8%.

## Files

- `sub_08056638.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at exact size 144/144 with 6 differing bytes. The only residual is the allocno/pool inversion between gUnknown_02029822 and gUnknown_0202980A. Flat indexing, typed pointer binding, separate swap temps, four permuter runs and Wave 70's payload opaque-use barrier are ruled out; the barrier flips the held base but over-hoists both rows and removes the required inline load. Preserve the verified readable draft. Wave 77, W77-L: configured re-verdict still 144/144 with SIX differing bytes, and they are exactly three halfwords -- +0x28 `mov r3,sb` vs `ldr r3,[pc]`, +0x34 `mov r0,sb` vs `ldr r0,[pc]`, +0x56 `ldr r2,[pc]` vs `mov r2,sb`. NEWLY RULED OUT, each measured: moving the whole payload swap inside the do/while(0) so its base pseudo lives in ONE basic block (14 bytes, 90.3%); moving only the last payload store inside it (byte-neutral, still 6); deleting the do/while(0) entirely (still 6 bytes, but the held base moves from sb to sl and the outer counter takes sb -- the do/while is load-bearing for the COUNTERS, not for the payload); and byte-offset-first/base-last flat spelling of the PAYLOAD ONLY, `*(u16 *)(j * 2 + side * 0x6c + (u8 *)g)` (+4 bytes, 26.4%) -- the doc's one `later` lever, refuted here by its collateral exactly as on sub_0804C5A4. The wave-57 `two basic blocks leaves local_alloc` rule does NOT explain this residual: block count of the payload accesses was varied over 1, 2 and 3 and the held register never flipped. Both address constants have 2 references and near-equal live ranges, so this is an allocno TIE, and no source-level block or operand-order lever this project has reaches a tie-break. Wave 80 (W80-F), dead-statement/creation-order transfer, four compile_probes, no try_match spent, still 144/144 and 6 bytes: dead row/element address locals for gUnknown_02029822 at the loop top or in the swap block are byte-identical (flow deletes them before refs are counted); a dead gUnknown_0202980A address created BEFORE the first gUnknown_02029822 use is byte-identical too, which lowers 0A's pseudo number below 22's and shows the allocno-number tie-break is not the decider -- the priorities differ; a second do/while(0) region around the gUnknown_02029822 loads does put 22 in sb but drags side*0x6c into ip and spills the outer counter (worse), and around the first load only it swaps the symbols with the same collateral. W83-B: no new axis measured (batch budget went to the permuted siblings); state per W77-L/W80-F stands.
