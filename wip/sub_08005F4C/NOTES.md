# sub_08005F4C Wave 74 handoff

Configured verdict: **not matched**. Target 5084 bytes; active candidate 5116
bytes (+32); 3598 of 5084 bytes differ (29.2% identical). The byte oracle's
first difference is +0xF8, caused by later branch displacement. The first
substantive code-generation divergence is in case 4 around +0x1A4: ROM
materializes the array base/state address as `mov ip,r2; mov r9,r6`, while the
candidate has `mov r9,r2; adds r7,r6,#0`.

Strongest semantically valid active checkpoint:

- Keep the zero-instruction retained conditional assignment using `retained`
  and identical `q` definitions. It preserves the ROM's otherwise-dead block.
- `retained` is fixed to r5; this improves 25.1% to 26.8% at unchanged size and
  has no observable semantic effect because the value is deliberately dead.
- Every pointer temporary in the final 0x28..0x30 switch is block-scoped. This
  recovers the ROM's 20-byte frame, `sl` entry address allocation, and the
  `[sp,#16]` spill/reload around `sub_0800C7E8`.
- In case 2, bind `e = &gUnknown_0200B0D0[i]`, increment `i`, then perform the
  two read-modify-writes. This makes that loop's instruction order exact and
  raises the checkpoint to 29.2%.

Measured negative probes (all reverted):

- Block-scoping only the two case-0x2C/0x2D `e2` walkers: 5116 (+32), 23.4%.
- Fixed-register `i` in r5: 5192 (+108), 12.0%.
- Fixed-register case-0x2C/0x2D walker in r2: 5188 (+104), 21.2%.
- Block-scoping case-4 `e` (alone or with case-0x32): regression; case-4 alone
  28.3%, first difference +0xC1.
- Zero-trip `do { } while (0)` around case 4: byte-neutral.
- Fixed case-4 state-address local in r9: 5112 (+28), 18.1%.
- Initializing `d = 0` before case 4: 5120 (+36), 19.6%; `d = d` was neutral.
- Extending `d` with another identical-arm `q` trick moved the constant before
  the guard and scored 29.2%, not an improvement.
- Fixed `d` in r7 reported 29.3%, but generated overlapping/invalid lifetimes:
  r7 was overwritten by `d` and later reused as the state address. It is not a
  valid checkpoint; `best.c` was restored to the active semantic source.
- Removing the block scopes from cases 0x2A, 0x2B, and 0x30 together regressed
  to 5160 (+76), 24.8%, first difference +0xC1.
- Compiler profiles: default equals configured; no-force 5268/+184/7.1%; O1
  5312/+228/5.9%; O1-no-force 5312/+228/6.6%; old-agbcc 5124/+40/16.6%;
  old-agbcc-no-force 5300/+216/7.9%.
- A bounded permuter run could not parse the fixed-register `asm("r5")`
  declaration and made no changes.

The candidate still emits a force-address `.LC6` for `gUnknown_0200B0D0`,
where the ROM repeatedly uses direct `gUnknown_0200B0D0` pool references. This
is likely the next high-value axis, together with separating case-4's live `d`
from the state-address pseudo without fixed-register overlap.
