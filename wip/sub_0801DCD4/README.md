# sub_0801DCD4

0x0801DCD4, 516 bytes, THUMB, parked.

Best score so far: 14.7% (best.c).

## What it does

A smaller copy of the script interpreter in sub_0801D390: it runs the command script of animated object a1 in gUnknown_0200E438 until a wait or end command, with only the wait, jump, show-frame, set-field and end commands. It draws frames with sub_0801ECE8 instead of sub_0801D348, and when bit 13 of the unk30 template is set it draws only on odd values of gGameClock (a flicker). a2 picks the pass: 1 counts down waits and runs end actions without drawing, 0 draws.

## How close it is

Compiles 4 bytes too short (512 against 516). The difference is the same one as in sub_0801D390: at the top of the loop the original copies the 0xFFFFF000 mask through two extra registers before the AND. Everything after it is shifted, so the byte score (about 12%) means little.

## What is left

Find C that makes the compiler copy the mask constant twice before the AND. Solve it in either this function or sub_0801D390 and the fix should carry to the other.

## Already tried

- Seventeen spellings of the mask and the switch value, tried on both functions (operand order, `~0xFFF` or `-0x1000`, the mask or the value in a local, `&=` forms, re-reading `*p`, different types for v): all give one direct AND. `0xFFFFF000` also makes every case comparison unsigned.
- Two chained mask locals, nested inline identity functions, locals pinned to a register, and empty or volatile barriers: all compile to the same single AND.
- The permuter: nothing close. Its best result (in best.c, about 15%) only adds meaningless edits such as subtracting a variable that holds 1.
- A `do { } while` loop with an extra null guard: reaches the right size in sub_0801D390 only by adding a redundant check, so it was not used here.

## Files

- `sub_0801DCD4.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 512/516 (-4). Exact twin of sub_0801D390's loop-top mask-copy residual. Direct, chained, fixed-register and barrier vehicles all collapse to the same one-pseudo AND; CFG and semantic body are settled.

</details>
