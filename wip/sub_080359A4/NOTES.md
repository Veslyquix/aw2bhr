# sub_080359A4 — Wave 65 final park

Configured profile: target 324 bytes; the preserved semantic draft is 16 bytes
short.  The residual is allocation/constant placement rather than missing game
logic.  The ROM keeps the proc in r6, `&unk44` in r4 (and copies it to r5 after
the optional camera call), `&unk42` in r8, and the private force-address word's
address in r9.  The draft carries only r8 and emits neither the same pointer
copies nor the same reload placement.

The final targeted `px = &proc->unk42` binding made the candidate 24 bytes short
and removed more of the ROM's pointer-copy punctuation, so it was reverted.
Changing the definition to a typed proc pointer conflicts with the existing
shared `ProcPtr` contract and did not supply an allocation mechanism.  The body
and local map/proc layouts remain the best semantic reconstruction.
