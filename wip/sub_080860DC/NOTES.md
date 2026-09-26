# Wave 74 matcher notes: `sub_080860DC`

Configured matcher result for the retained active source: size exact at
1452/1452, unmatched, 18 differing bytes (98.8%). This improves the inherited
19-byte / 98.7% draft by one byte with a semantic live-range split in only the
second 0x110 arm:

```c
p->unk58 = gUnknown_03005980;
g = p->unk58;
p->unk58 = p->unk5c + g;
```

The split makes the array byte use the ROM's r3 in that arm, but `unk37` still
uses r4 and the clamped value is reloaded through r1 for the final add. Applying
the split to both duplicated arms cancels the gain and returns to 19 differing
bytes, so the asymmetric spelling is intentionally retained.

The five pool differences at 0x081D9410, 0x081D9414, 0x081D9418, 0x081D941C,
and 0x081D9420 are relocation-equivalent force-address words. Promotion would
need all five rodata words.

Wave 74 probes ruled out:

- Binding the array byte or the `unk37` limit through existing `g`/`w` locals,
  as a separate statement or within the expression, is byte-identical.
- Reversing the comparison, reversing final-add association, rereading
  `p->unk5c`, pointer aliases, comma forms, and volatile byte/pointer loads do
  not improve the configured result.
- A clean 120-second, three-thread current-basin run from the inherited draft
  found the retained 18-byte candidate. A chained run from that candidate
  searched 3,344 iterations and found nothing better.

Keep `w = 0xFFFF` before the u16 store, multiplication for the narrow member,
the explicit duplicated tails, and the established bitfield/pointer casts.

## W84-C

- ROM window decoded directly from target.s. In BOTH 0x220/0x110 arms the
  allocation around the clamp is a pure greedy fill in REG_ALLOC_ORDER order
  over the free scratch set {r3,r2,r1,r0}: BYTE->r3, VALPTR (loaded through
  the arm-resident r9 chain word) ->r2, UNK37->r1, RELOAD->r0. The candidate
  diverges only in colours: arm1 BYTE=r1/UNK37=r4, arm2 (wave-74 split)
  BYTE=r3/UNK37=r4 + reload r1. Canonical re-verdict: 1452/1452, 18 differing
  bytes (98.76%), first difference +0x298, unchanged.
- ARMS-ASYMMETRY AXIS MEASURED AND CLOSED (W83-B lead):
  (a) ternary clamp spelling in the 0x220 arm only -> 1452/1452 but 77 bytes
      / 94.7% (allocation rewrite far outside the arm). Kept at
      w84-varPA.c, not in the draft.
  (b) fresh `int b` row-byte binding in the 0x220 arm only -> byte-neutral,
      still 18/98.8%. Kept at w84-varPB.c, not in the draft.
- Chained permute campaign: two full 300 s runs (-j5; run1 --current, run2
  default from size-exact best.c) found nothing better; draft auto-restored
  and equals w84-start.c byte-for-byte.
