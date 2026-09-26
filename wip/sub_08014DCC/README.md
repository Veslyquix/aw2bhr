# sub_08014DCC

0x08014DCC, 120 bytes, THUMB, parked.

Best score so far: 71.7% (best.c).

## Files

- `sub_08014DCC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

SIZE-EXACT (120/120) at 71.7%, 34 of 120 differing bytes, first difference at +0x6 (re-measured wave 77, W77-G, from the draft on disk; the 70.0%/36-byte figure in the header predates a later edit).

### What still differs

A PURE REGISTER-NAME residual: same size, same instruction count, same branch structure. The ROM keeps p and next in the SCRATCH pair r2/r3 and spends r4-r7 on size, bestSize, total, best and bestNext; the candidate keeps p in r1, size in r2 and bestSize in r3, so it needs one callee-saved register fewer and its push mask is {r4,r5,r6,lr} against the ROM's {r4,r5,r6,r7,lr}. That is why first difference is +0x0 -- the prologue is the LAST symptom, not evidence about the frame.

### Why it is close

Every statement of the body, the 16-byte header {next,size,used,filler}, the tail layout and the loop's basic-block structure are the ROM's. The two missing instructions wave 42 recorded are gone.

### Already ruled out

- Wave 42 (W42-D): four loop shapes that all COALESCE `p = next` -- `while (1) { body; next = p->next; if (!next) break; p = next; }`; `for (;; p = next) { body; next = p->next; if (!next) break; }` (gcc canonicalises these two together); the same with an explicit `goto` INTO the loop past the copy (optimised away, no effect); `do { body; next = p->next; p = next; } while (next != NULL);`.
- Wave 42 (W42-D): the fixpoint it shipped -- `next` seeded before the loop with `p = next` as the first body statement. Keeps p and next apart but runs the copy on the first iteration too, which IS the -4. Superseded by the wave-73 draft.
- Wave 73 (W73-C): basic-block PLACEMENT is not what is left. The ROM places the latch physically AHEAD of the header so the back edge falls through, and pays `bne <header>; b <ret0>` at the guard; the candidate falls into the header and pays a `b` at the loop bottom. Seven instructions either way -- the two layouts cost the same.
- Wave 73 (W73-E): THE HANDOFF WORKED AND IT IS THE BATCH'S CLEAREST RESULT. W73-C predicted that making the function size-exact moved it out of the permuter's provably-useless class (one extra instruction) into its documented sweet spot, and that chained runs had never been tried from that state. Run 1, `--current` from the 10.0% draft: 10.0% -> 63.33%, size-exact, semantically clean, INSTALLED AS THE DRAFT. Runs 2 and 3, chained: 65.83% and 68.33%, BOTH SEMANTICALLY WRONG. Run 2 -- it moved `new_var = p->size;` inside the if-body while the guard still reads `new_var`, so the guard reads an uninitialised value; run 3 ended the function `return (void *) total;`, where `total` is `size + 0x10` on both NULL-returning paths, not 0. NEITHER was adopted as written -- but run 3 was worth READING: correcting that one return to `return (void *) 0;` and keeping its other three mutations (`total = size; total = total + 0x10;` split, the hoisted load reverted, `total = 0; q->used = total;`) gives 70.0%, which is the current draft and the final state. 10.0% -> 70.0% in one wave. Wave 42's negative was against a MISSING-INSTRUCTION residual, exactly as W73-C said. NOTE THE TOOLING TRAP: best.c held the wave-42 body 4 bytes short, so the MCP `permute` tool -- which always starts from best.c and cannot pass `--current` -- would have searched the wrong starting point. Shell out to `python tools/permute.py <fn> --current` whenever the draft beats best.c. ALSO MEASURED AND NOT TO BE REPEATED: deleting `new_var2` and using `size` directly at all three sites costs FOUR BYTES (120 -> 116, 13.3%) and drops r7 from the push mask -- that local is buying a register, not redundant. THE NEXT PROBE is `q->used = (u32)next;`: the ROM writes that field with `str r3,[r2,#8]` where r3 still holds `next`, which is provably NULL at _scan_done since the label is only reached by the `next == NULL` goto. Wave 42 called that reload_cse and not something to author, but it reuses `next`, not a zero constant, so the probe is semantically valid and has never been run. DO NOT GENERALISE THE REPAIR FROM THIS FUNCTION: it is the 1 of 3 that worked. The same technique returned the baseline score on sub_0800E9F4 and on W73-B's sub_08045C18. It works here only because the invalid part -- a wrong return value -- was INCIDENTAL to the live ranges the other three mutations created.
- WAVE 77 (W77-G): THE `NEXT PROBE` THIS ENTRY AND THE DRAFT HEADER BOTH NAMED IS NOW MEASURED AND IT IS NEGATIVE. The tail hunk is ROM `adds r2,r0,#0 / str r6,[r2] / subs r0,r4,r7 / str r0,[r2,#4] / str r3,[r2,#8]` against the candidate's `str r6,[r0] / subs r1,r4,r3 / str r1,[r0,#4] / movs r3,#0 / str r3,[r0,#8]` -- five instructions each, the ROM spending a copy of q into r2 and reusing r3 (= next, provably NULL at _scan_done) for the `used` store where the candidate spends `movs r3,#0` and keeps q in r0. Writing the store as `q->used = (u32) next;` does NOT buy the ROM's reuse: it goes 120 -> 116 bytes (-4, 50.0%), i.e. gcc drops TWO instructions rather than one. The zero is const-propagated through `next` and the candidate loses the materialisation without gaining the copy. The `movs r3,#0` is not a missed reuse opportunity -- it is what pays for keeping q in r0, and the two spellings are a package.

### Settled

- Wave 73 (W73-C): THE LEVER IS `goto` INSTEAD OF `break` FOR A TRAILING EXIT TEST. `while (1) { body; next = p->next; if (next == NULL) goto _scan_done; p = next; }` puts the copy in a real latch block AND does not coalesce. This is the wave-59 sub_08029AF8 lever (a user goto is not a jump to the loop's own end_label, so expand_end_loop does not roll the exit) applied to a TRAILING rather than a LEADING exit test. Wave 42 asked whether 'copy only on the back edge' and 'p/next still conflict' were coupled: they are NOT.
- Wave 73 (W73-C): REFUTES wave 42's claim that a 4-callee-saved push proves coalescing. This candidate saves only r4/r5/r6 and does not coalesce.
- Wave 42 (W42-D): `q->used = 0` is a LITERAL zero; the ROM's register reuse there is reload_cse, not something to author -- sub_08014EF4 writes the same field with a plain `movs r0, #0`.
- Wave 42 (W42-D): a single trailing `return NULL` is what puts the shared `movs r0,#0` block AFTER the `adds r0,r5,#0; adds r0,#0x10` tail; two early `return NULL;` statements put it in the middle.
- Wave 42 (W42-D): the round-up is on the `size` PARAMETER in place, `total = size + 0x10` is a real local, and the compares are unsigned so size and bestSize are u32.

### Notes

Wave 73 (W73-C). The residual CHANGED CLASS this wave, from missing-instruction to size-exact register allocation, and that is the point of the entry. NEXT: run decomp-permuter REPEATEDLY, each run starting from the previous best.c (wave 59's 87.3 -> 94.3 -> 98.2 -> match pattern). This is now precisely the permuter's documented case and it has never been tried from a size-exact draft here.

### Wave 87

WAVE 87 (W87-F, do{}while(0) transfer test): NO EFFECT on the residual, draft unchanged and re-verified 120/120 SIZE-EXACT 71.7%, first difference +0x6 (the brief's '50.0%' was W77-G's rejected 116-byte probe). Register map read off both sides: ROM size r1 / p r2 / next r3 / total r7 / bestSize r4 / best r5 / bestNext r6; draft coalesces p and next into r2, total slides into r3, new_var fills r7 -- push mask {r4,r5,r6,r7,lr} on BOTH sides since wave 73, so the park's residual statement (one register fewer) is out of date: the ROM has SEVEN distinct live values, the draft SIX. Wrappers (w1-w6) re-rank only global.c allocnos and cannot un-coalesce p/next. Further measured (x1-x3, y1-y2): the split of `next` from `p` survives ONLY when `next` is dead at the loop exit (x2: 124/+4, unrotated), and the tail's reuse of `next` (the ROM's `q`) is available ONLY when it is not (x1/y1: 116/-4) -- the two halves are MUTUALLY EXCLUSIVE under agbcc because adding the tail reference is what makes gcc coalesce (the NULL p ends on IS the next the tail wants). That is the real reason the function will not close and it differs from both the park's and the header's. The ROM buys both by paying two copies (`adds r2,r3,#0` at the loop top, `adds r2,r0,#0` at the tail for q) and recovering them at the guard (`bne head; b ret0`). Next: a form in which q needs its OWN register at the tail (bind q EARLIER, before the `bestSize >= new_var2 + 0x20` test, so its live range starts before the branch). Do not re-run w1-w6, x1-x3, y1-y2, the bare `q->used = (u32)next;` (W77-G) or the wave-42 loop splits -- they are halves of this package.
