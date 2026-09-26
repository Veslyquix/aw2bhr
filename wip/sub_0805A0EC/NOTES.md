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
