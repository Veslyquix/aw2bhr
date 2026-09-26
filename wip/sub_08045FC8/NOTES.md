# sub_08045FC8 — 104 bytes, 32.7%, NOT matched — and NOT size-exact

Wave 58, W58-D. Reviewed, nothing re-measured, no attempt spent. The three
stacked analyses in the head of `sub_08045FC8.c` (waves 37, 43 W43-H, 43 W43-J)
are complete and consistent; read them there.

**Correction worth carrying to the next screen: this function is not a
size-exact candidate.** `size: match` at 104 bytes is a coincidence and the
wave-37 note says so explicitly — the candidate is 2 bytes of CODE shorter and
gets the 2 bytes back as pool alignment padding. Any batch selected on
"size-exact" is mis-including it.

## Residual, unchanged across three analyses

One instruction: the ROM computes `i << 4` twice because its first copy is
clobbered in place by its own `subs r0, r0, r4`, while agbcc's 3-operand
`sub r0, r2, r4` leaves the shift alive in r2 for `cse_insn` to substitute.

Already measured, do not repeat: twelve source shapes (all byte-identical), the
`(u16)` forms (+4 bytes for a 2-byte problem, so the third parameter of
`sub_0801F34C` is not narrow), the element-pointer binding (costs a register),
the zero-cost-pressure lever from W43-C (burns r5 and grows the push list), and
the permuter (22,157 iterations, nothing).

The doc's own rule already covers the class: the permuter is useless on a
residual of one extra instruction, and adding a live range cannot un-substitute
a CSE. The only untested reading is a wider source context (this function
sharing a translation unit or an inline boundary with a neighbour), which is not
reachable from inside the function.
