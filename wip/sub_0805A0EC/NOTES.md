# Wave 84 notes: `sub_0805A0EC`

## W84-C

- Chained permute campaign replicating the W83-B win pattern (`--current`
  run then default-from-best.c run, -j4, 300 s each): BOTH runs were killed
  mid-search by an environment-level interrupt (KeyboardInterrupt/"Exiting."
  around iteration 13.7k/14.5k — not a clean client timeout; identical
  invocations completed normally for the sibling functions), but up to that
  point neither reported anything above the starting point.
- Combined with the two wave-84 pre-campaign aborted chains and the standing
  evidence (waves 62/66/70/77/80), the residual stands UNCONVERTED: 380/380,
  4 reported bytes of which ONLY the +0xd5/+0xd6 halfword pair is real
  (`movs r0,#0; strh r0,[r5,#2]` in ROM vs the same pair in r3);
  +0x34/+0x164 are relocation-addend bytes of the equivalent .rodata alias.
- `best.c` was audited: 380/380, first difference +0x34 — byte-equal to the
  active draft's binary, so it stayed unpromoted (unlike 59E3C's, which hid a
  genuinely better anchor).
- The W83-B mechanism did NOT reproduce: no dead-in-sequence copy re-ranked
  the tied allocno pair here. Park line: naked allocation tie, four parallel
  aborts now included in the negative evidence.

## W90-B -- still parked, PORT-EXACT at 98.9% (2 code bytes + 2 addend bytes)

Ported to PR #3 names (`struct Unk08499594` -> `struct Unit`; PORT-EXACT).
Two 900 s permuter runs with the fixed scorer:
1. undirected from the port: 9,368 iterations, nothing better.
2. directed, from the LITERAL-zero variant (w90-literal.c, 6 bytes),
   PERM_RANDOMIZE from `props = q + 0x12;` to `out->v = 0;`
   (w90-2.perm.txt): 9,699 iterations, best found only equals the port.

MECHANISM, read off `tools/rtldump.py --flags=-dg` (rtl-port/, rtl-lit/):
the two registers in play are RELOAD registers, and reload picks them
round-robin in insn order over the spill set {r0,r1,r2,r3} (see "A RELOAD
register is chosen ROUND-ROBIN" in docs/agbcc-codegen.md).
- Port: the key reload `ldr r2,[sp]` (insn 568) takes r2, the zero store's
  reload of the spilled `new_var3` (REG_EQUIV 0) takes r3 (577), then the
  rowp copy out of ip takes r2 (580; r0 is the insn's output and r1 holds p).
- Literal: the zero is a local-alloc pseudo in r0 (not a reload at all), so
  the ip copy is the next reload after the key's r2 and gets r3.
- ROM: zero in r0 AND ip copy in r2. As reloads that means the round-robin
  pointer sat one step later than in either candidate at that point: either
  one more counted reload between the key test and the zero store (port
  shape), or one fewer before the ip copy (literal shape -- e.g. if the key
  compare's `ldr r2,[sp]` were an ordinary insn, not a reload).
Tried and byte-neutral: copying `key` into a block-local just before the
compare (`k = key;` and `(k = key)` inline) -- cse propagates the copy away.
A from-scratch rewrite in the matched sibling's (c_0805A268.c sub_0805A388)
gMap-> member spelling is 356 bytes (-24), a different shape; not pursued.
The draft is restored to the port.

## Wave 91 (W91-B) -- member form, NEGATIVE

- `->height` / `->width` for the loop bounds, and `->terrain` / `->unit` /
  `(u8 *)->rowOffset` through the `q` cast: BYTE-IDENTICAL (98.95%).
- `rowp = (u8 *)&((struct Map *)q)->rowOffset[y]`: 95.79%. The member
  computes (y*2 + 0x417A) + q, and the ROM has (q + 0x417A) + t. The byte
  pointer is what gives the ROM's order.
- Dropping `q` for member access off the global (cast or gMap): 33.68%.
  The row address hoists into the outer loop.
- 900 s permuter from --current (35,635 iterations): no candidate better
  than the start.
- Temporary -O2 -fno-gcse profile: the configured-tuned draft goes -16.
Residual unchanged: the zero-store r0/r3 reload tie, 2 code bytes.
