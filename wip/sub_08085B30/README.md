# sub_08085B30

0x08085B30, 1040 bytes, THUMB, parked.

Best score so far: 99.1%.

## Files

- `sub_08085B30.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at exact size 1040/1040, 99.1%. Volatile/ordinary address binding fixes the prior -4 zero-sharing defect. Only an r6/r7 address/value loop swap and associated first-result store hoist remain; array/scalar typing and address-value semantics are settled. W77-M 2026-08-18: of the 9 reported bytes only SIX are code -- a clean r6/r7 exchange at +0x2d6..+0x2fe between the two CpuFastSet givs; +0x108/+0x10c/+0x110 are addend bytes of the equivalent .rodata alias for gUnknown_081D9400/4/8. Byte-neutral at 9: rebasing either source pointer on the other, &arr[..] against arr + .., (u8 *)0x06010E00 + i*0x100 against (void *)(0x06010E00 + i*0x100), rebasing either destination constant on the other, and writing the destination stride as i*0x80*2. Reshaping the biv to stride 0x80 (for (i = 0; i < 0x100; i += 0x80)) destroys it at 266 bytes. The draft's `register int result asm("r0")` pin IS load-bearing -- removing it costs 9 -> 16 -- so tools/permute.py remains unusable on this one W81-A sharpens the diagnosis: through the +0x2d6..+0x2fe window the candidate and ROM share an IDENTICAL emission order (dst2 pool->r8, src2 giv calc, dst1 pool ref, src bump) and the same r8/dst2 and r5/dbra choices; ONLY the register numbers of the two adjacent same-class pseudos flip (ROM src2->r7 with dst1->r6; candidate r6/r7). That is an allocno tie-break with nothing behind it by the wave-77 classification; park until a lever that reorders two tied pseudos is discovered. W82-A: commuting the PLUS operands inside the second call's source (`gUnknown_0200FC50 + i * 0x80 + 0x500`) folds to identical RTL and scores byte-neutral at 9; reversing the ORDER OF THE TWO CPUFASTSET STATEMENTS gives 15 differ (98.6%) -- the ROM's preheader computes the src2 giv before the dst pool word without any statement order reproducing it. W83-C: reversing constant-base association INSIDE src2 (`0x500 + gUnknown_0200FC50 + i * 0x80`) is byte-neutral at exactly 9 -- together with W82-A's operand commutation this closes the whole association space; the window's EMISSION ORDER is already ROM-identical and only the two allocno numbers flip, confirming the pure tie-break diagnosis with nothing source-side left.

WAVE 84 (W84-A): destination commutation (i*0x100 + CONST at both dsts) is byte-neutral at exactly 9 -- the last operand-order axis closed. GNU statement-expression nesting of call A inside call B's argument (wave-56-J shape) REGRESSES to 98.1%/20 by destroying src2's separate giv. Chained permutation is structurally impossible while the r0 pin is load-bearing (every asm-free spelling contradicts expand_assignment's LHS-first rule). Only lever that could matter: whatever orders gcse/PRE's movable numbering function-wide -- not window-reachable.
