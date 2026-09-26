# sub_08005F4C

0x08005F4C, 5084 bytes, THUMB, parked.

Best score so far: 29.2%, +32 bytes.

## Files

- `sub_08005F4C.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

Wave 74 semantic draft: 5116/5084 (+32), 29.2% identical, 3598 differing bytes, first difference +0xf8.

### What still differs

The two-level state-machine body is transcribed, but case-4 allocation begins with ROM ip/r9 versus candidate r9/r7 and the final switch still differs in address placement; the candidate also emits a spurious force-address word for gUnknown_0200B0D0.

### Why it is close

Wave 74 recovered the ROM's 20-byte frame, sl entry allocation, caller-save spill around sub_0800C7E8, and an exact case-2 element loop.

### Already ruled out

- Re-transcribing the six switches: their structure and the 0x46..0x5b / 0x28..0x30 ranges are settled.
- The fixed-d probe that scored 29.3% was semantically invalid and was reverted; alternate compiler profiles were worse.

### Settled

- Block-scoped final-switch pointer temporaries are the frame lever; preserve the dead conditional assignment and identical-q spelling.

### Why it is parked

Wave 74 W74-A. Resume at the case-4 ip/r9 allocation and final-switch address lifetimes, not semantics.
