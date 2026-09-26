# sub_0805A0EC

0x0805A0EC, 380 bytes, THUMB, parked.

Best score so far: 99.0% (best.c).

## Files

- `sub_0805A0EC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at exact size 380/380 with exactly 4 code bytes different. ROM's zero store uses r0 and the verified draft uses r3; a literal obtains r0 but rotates the following row-pointer copy away from ROM r2. Two chained permuters plus literal, chained, late, pointer, width, deleted-anchor and fixed-low-register variants cannot satisfy both decisions simultaneously. Residual is one coupled allocno tie. W77-M 2026-08-18: re-confirmed at 380/380 and 4 reported bytes, of which only TWO are code (+0xd5/+0xd6, `movs r0,#0; strh r0,[r5,#2]` against the same pair in r3); +0x34 and +0x164 are addend bytes of the equivalent .rodata alias and are not residual. No new axis was attempted -- this entry already eliminates the source axis across waves 62, 66 and 70 and the residual is a bare two-pseudo allocation tie. Wave 80 (W80-F), dead-statement transfer, three compile_probes, no try_match spent, still 380/380 and 2 code bytes: literal zero plus a dead z = 0 before the p binding is identical to the plain literal (movs r0 but mov r3,ip) -- cse does not substitute a register for a literal's own register, so a dead CONSTANT set is not reusable the way a dead computation is; the W80-A dead-int form on props[off] rewrites the selector block (worse); literal zero plus a live pp/pp2 copy of props+off to inflate r3's reload use count leaves mov r3,ip. Refined residual: the permuter's long-lived new_var3 zero occupies r3 so reload takes r2 for the ip copy; with the literal r3 is free and sorts first. The ROM has the zero in r0 AND something live in r3 across the store, and no construct measured supplies that value. W83-B 2026-08-26: configured re-verdict 380/380, 98.9%, 4 reported bytes (+0x34/+0x164 addend bytes non-residual, +0xd5/+0xd6 zero-store pair) -- unchanged. Grep rule applied: promoted c_08085F94.c writes the window-adjacent pair `proc->unk58 = gUnknown_03005990[gUnknown_0300596C] + gUnknown_03005980; proc->unk5c = ...;` but its spellings address a different statement set and transfer nothing. No probe spent; batch budget went to the permuted sibling.

WAVE 84 (W84-C): a chained --current campaign did NOT reproduce the wave-83 win pattern -- both ~13.7k/14.5k-iteration runs were killed by environment-level interrupts partway (not tool timeouts; identical invocations ran to completion for sibling targets) after reporting nothing above the starting ceiling. best.c audited binary-equal to draft. The zero-store r0-vs-r3 tie stands.

WAVE86: WAVE 86 (W86-A): (1) wave-84's killed chain re-run full length from w84-start.c: 300 s, 14,942 iterations, ended on its own deadline, nothing above the ceiling -- a REAL negative now, not an abort. (2) W80-F's premise 'the ROM has something live in r3 across the store' is REFUTED by tracing the ROM: nothing is live in r3 there. (3) The residual is an exact two-way TRADE measured off the .s across four spellings in one unit: a long-lived zero local puts the zero in r3 (wrong) and the ip-copy scratch in r2 (right); a literal, a later-dead live copy, or a LATE-bound zero local all put the zero in r0 (right) and the ip copy in r3 (wrong); the ROM wants r0 AND r2. (4) NEW FACT: it is the zero local's LIVE-RANGE START, not its existence, that pins it to r3 -- `new_var3 = 0;` immediately before the store compiles byte-identically to a literal, so wave 66's 'late-binding' and 'literal' measurements were the same experiment. Configured, 380/380, 2 real code bytes (+0xd5/+0xd6), unchanged.
