# sub_080077EC

0x080077EC, 232 bytes, THUMB, parked.

Best score so far: 26.3% (best.c).

## Files

- `sub_080077EC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

25.9% identical, candidate 224 bytes (-8). Was -20 before wave 59.

### What still differs

THE FIRST LOOP ONLY. The ROM keeps i as a real ascending biv 9..13 and reduces ONLY gUnknown_0200B224[i] (to r2, += 4, initialised ldr r0,=base / adds r2,r0,#0 / adds r2,#0x24), recomputing the gUnknown_084887AC index (i-9)*10 + a2*2 from i every iteration. Every spelling tried instead builds TWO givs off gUnknown_084887AC (adds r2,#0xa and adds r1,#0x14), which removes i's last body use, lets check_dbra_loop reverse the loop to movs r4,#4 / subs / cmp #0 / bge, and then rematerialises movs r4,#14 after it. All the register differences elsewhere in the diff are downstream of this one decision.

### Why it is close

The switch, its jump table, the whole second loop and the frame are now all the ROM's.

### Already ruled out

- Waves 52/57: the index written out (this draft); an explicit q++ pointer for the gUnknown_0200B224 side; q = &gUnknown_0200B224[9] (becomes a .rodata word base+0x24 where the ROM has ldr / adds / adds); a two-biv form j = 0; ... [j*10 + a2*2]; j++ (gcc eliminates i instead, byte-identical to this draft).
- Wave 59 (W59-A): LOOP-BODY VOLUME IS NOT THE LEVER, and it was the best remaining theory. Since flow runs after loop, dead code in the body IS present at strength_reduce time, where it raises insn_count and should suppress giv reduction -- and would then vanish without trace, a mechanism that would be invisible in the ROM. Measured with compile_probe: a dead z = p->unk3a + i;, a dead z = gUnknown_084887AC[i] + a1;, and even a genuinely LIVE extra store inside the loop (three real insns that appear in the output) ALL still reduce both givs and still reverse the loop.

### Notes

TWO OF THE THREE RESIDUALS FELL IN WAVE 59. (1) The dead (s8)p->unk36 + i chain, worth 12 bytes, is kept by a loop whose body is dead -- see docs/agbcc-codegen.md and work/sub_080079B8, which MATCHED with the same vehicle. The comparand must be NON-zero here because the addend is a register and cmn rn,#imm does not exist on Thumb, so == 0 lets combine fold add+compare into a destination-less cmn and the add dies with the branch. (2) The switch's case bodies emit in SOURCE order, and the ROM's block order movs #4,#3,#2,#1,#0 means the original listed them descending by result: case 8, case 6, case 14, case 10, case 11.
