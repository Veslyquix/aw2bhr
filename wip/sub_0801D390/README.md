# sub_0801D390

0x0801D390, 856 bytes, THUMB, parked.

Best score so far: 63.0% (best.c).

## What it does

Runs the command script of one animated object (a 0x4C-byte record in gUnknown_0200E438) until it reaches a wait or an end command. Commands include wait, jump, show a frame, set a field and end. a2 picks the pass: 1 counts down waits without drawing, 0 draws.

## How close it is

Compiles 4 bytes too short (852 against 856). Everything lines up instruction for instruction except at the top of the loop, where the original copies the 0xFFFFF000 mask through two extra registers before the AND; those 4 bytes shift everything after them, so the byte score (under 10%) means little.

## What is left

Find C that makes the compiler copy the mask constant twice before the AND, as the original does. The same fix should also close sub_0801DCD4, which has exactly this difference.

## Already tried

- Seventeen spellings of the mask and the switch value (operand order, `~0xFFF` or `-0x1000`, the mask or the value in a local inside or outside the loop, `&=` forms, re-reading `*p`, different types for v): all give one direct AND. Writing the mask as `0xFFFFF000` also makes it unsigned, which turns every case comparison unsigned.
- Two chained mask locals, nested inline identity functions, locals pinned to a register, and empty or volatile barriers around them: all compile to the same single AND.
- The permuter for 600 seconds: nothing better.
- A `do { } while` loop with an extra `if (p == NULL) return;` guard (kept in best.c): right size and 63% of bytes matching, but only because the redundant guard adds 4 bytes; it moves the first literal pool and is further from the original.
- Dropping the `end` flag that nothing sets: 6 bytes shorter, so the flag stays.

## Files

- `sub_0801D390.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 852/856 (-4). The whole residual is the shared loop-top mask routed through two missing copies. Seventeen mask spellings, chained locals, fixed-register qualifiers, barriers, inline identity calls and long permuter searches are ruled out.

</details>
