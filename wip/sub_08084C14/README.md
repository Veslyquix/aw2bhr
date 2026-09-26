# sub_08084C14

0x08084C14, 816 bytes, THUMB, parked.

Best score so far: 79.2% (preprocessed form, not included).

## Files

- `sub_08084C14.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at exact size 816/816, 75.9%. Every statement, call and pool word is present; residual is scratch allocation around the shared constant and established odd CFG spellings. Prior permuter-derived candidates and header-regression variants are rejected.

WAVE86: WAVE 86 (W86-D, constant-twin axis): twin c_080849C8.c (six shared callees, the shared `unk01 == 2 ? sub_0802490C(...) : sub_080248F8()` idiom) is a same-VOCABULARY neighbour, not a shape twin (520B straight-line init vs 816B jump-table key handler). Its construct -- `register ProcPtr x asm("r9")` alias of a value used at every call site -- transplanted onto the 'shared constant 1 in r8' hunk REGRESSED HARD: 816 -> 848 (+32), every store paid a `mov r1,r8`; restored. This shows the wave-54 park wording 'the shared constant 1 ... out of r8' is a MIS-DESCRIPTION: the ROM holds 1 in r8 at ONE point only and materialises it elsewhere some other way -- re-read that hunk before trusting the entry. Also: a register-asm pin is not a neutral experiment on a function whose parameter competes for callee-saved registers (it cost a register and moved p). Configured, 816/816 size-exact, 75.9% draft, unchanged.
