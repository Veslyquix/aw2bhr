
## Wave 90 port (orchestrator)

Ported to PR #3 names with tools/port_rename.py; `gUnknown_0200CC88` became `struct SaveSlotGenerations`, so the five `(&gUnknown_0200CC88[16])[x]` uses were hand-ported to `(&gUnknown_0200CC88.slotGeneration[0])[x]`, which is byte-identical to the pre-merge candidate (verified against _cand.prepr3.bin). The plain member `gUnknown_0200CC88.slotGeneration[x]` CHANGES the bytes: 1068/1056 (+12, unchanged size delta), 23.2% against the port's 20.0% -- a small positional change, not adopted as part of the port. Worth re-trying as a lever once the +12 is solved (see W90-B's member-vs-pointer chapter in docs/agbcc-codegen.md).
