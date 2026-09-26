# sub_08004D90

0x08004D90, 68 bytes, THUMB, parked.

Best score so far: 85.3%.

## Files

- `sub_08004D90.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

19.1% by byte score, but 62 of 68 bytes are solved -- the low score is the cascade from one early difference; best spelling is in work/sub_08004D90/sub_08004D90.c. Remaining diff is PLACEMENT, not shape: the ROM materialises `ldr rN, =gUnknown_08499578` inside BOTH arms of the if (two pool words at 0x08004DA4/0x08004DD0 holding the SAME address) and dereferences once after the merge; every candidate emits one address load after the merge. Ruled out: source ordering, exhaustively -- putting the array reference in both arms drags the deref into the arms, or cross-jumping re-merges the whole suffix. It is a -fforce-addr placement artefact with no source-level lever found in wave 26. The arithmetic half is solved and reusable: stage `&g[(x+K)*32+3]` through an int local one step at a time (i = b*2; i += K; i = i*32+3) to block agbcc's tree-level refold; any two steps written as one expression refold. Next attempt: start at the pool-word duplication, not the arithmetic; re-test whenever a -fforce-addr duplication rule lands in docs/agbcc-codegen.md.

WAVE87: WAVE 87 (W87-C then W87-E): 19.1% -> 85.3% SIZE-EXACT 68/68, first difference +0x8, draft REPLACED (wave-26 draft in w87-start.c). The park's central conclusion ('-fforce-addr placement artefact, source ordering ruled out exhaustively') is REFUTED by wave 86's statement-split rule: bind the ADDRESS of the pointer global to a local as the FIRST statement of EACH arm (`p = &gUnknown_08499578;`, a `u16 **`) and dereference once after the merge (`sub_0801F2AC(9, &(*p)[i])`) -- `&g` is an address CONSTANT so each arm emits only the force-addr `ldr rN,=sym` (two pool words, the ROM's) while bare `g` is a pointer LOAD, which is why the park's inline attempt dragged the deref into the arms; `p` set in both arms is a multi-set pseudo (twin c_08087514.c's rule, transplanted). Load-bearing and measured: the bind must be the FIRST statement in each arm (after `i += 5;` the pool load sinks below the merge, one word lost); a comma-anchor initialiser makes the arm assignments CSE'd away (worse than a no-op, W80-F); `*p + i` and `i + *p` byte-identical. The wave-26 arithmetic staging (`i = b*2; i += K; i = i*32+3;`) is unchanged and still load-bearing. REMAINING: one swapped register pair -- ROM index r1 / pointer r0, candidate the reverse; all ten differing bytes. W87-E: chained permuter, FIRST EVER here, four links ~72,500 iterations, no improvement on 85.3% (real negative for THIS draft). Hand probes all byte-identical: `int k = i;` before the call (W86-G composed allocno); `j = i * 32 + 3;` second local (W83 split, i dies at the copy); a second `p = &g;` at the end of one arm (reference count); `u16 *q = *p;` after the merge moves the deref UP ahead of the final lsls (worse). Next lever must change the ALLOCNO PRIORITY of p vs i in local-alloc (relative reference counts / live lengths), not the statement text.
