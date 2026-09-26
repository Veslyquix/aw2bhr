# sub_08037FD0 -- Wave 65 final park

Configured profile remains size-exact at 496 bytes and 96.8% identity.  Exactly
16 bytes differ, all in the unk32 != 0 tail.  The ROM loads d into r1 and
copies it to r0 for the call, then loads c directly into r0; the draft assigns
those two adjacent blocks the opposite coalescing choice.  Opcode order,
branches, stack slots and every other block are exact.

The final explicit goto/reversed-source-arm probe compiled to the same two
register choices and the same configured residual, then was reverted.  This is
a closed adjacent-basic-block coalescing park, not a shape or type problem.

## W84-B

- try_match attempt 1: explicit dd hand-off temp (`{ int dd = d;
  sub_08037F94(dd, parent); }`) at the d-arm call only. NULL on the target
  axis: d still loads straight into r0; the only changes are cosmetic pool-word
  relocation (+4 pad movement). Coalescing does not follow source-visible copy
  structure any more than def-site dependency did.
- MCP permute call: client timed out server-side BUT the run completed as an
  orphan (wave-65 lifecycle hazard confirmed live; audited, nothing stranded).
  Its internal diff-scores improved (490 -> 230 range) yet NOTHING promoted:
  best.c/best.json unchanged (96.77%), i.e. all its textual wins normalise to
  zero byte-level difference -- the residual has no scorable mutation surface.
- Baseline re-submitted after experiments: canonical verdict re-measured
  unchanged (96.77%, 496/496, same residual at the unk32 tail).
Park STANDS. Ruled-out list grows by: dd-temp (W84-B), permuter-from-clean-
best-c-no-promotion (W84-B).# sub_08037FD0 — Wave 65 final park

Configured profile remains size-exact at 496 bytes and 96.8% identity.  Exactly
16 bytes differ, all in the `unk32 != 0` tail.  The ROM loads `d` into r1 and
copies it to r0 for the call, then loads `c` directly into r0; the draft assigns
those two adjacent blocks the opposite coalescing choice.  Opcode order,
branches, stack slots and every other block are exact.

The final explicit `goto`/reversed-source-arm probe compiled to the same two
register choices and the same configured residual, then was reverted.  This is
a closed adjacent-basic-block coalescing park, not a shape or type problem.

