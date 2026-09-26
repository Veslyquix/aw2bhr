# sub_0805D438

0x0805D438, 436 bytes, THUMB, parked.

Best score so far: 17.9%, +4 bytes (best.c).

## Files

- `sub_0805D438.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at 440/436 (+4 section; +12 code and pool 22/24), first difference +0x2. Configured, no-force and O1/no-force profiles bracket but do not match. Binding B0/C0 addresses worsens; Wave 70's u8 overlay folds C0+0x13 into a wrong new pool word. The readable semantic draft is restored; residual is force-address pool selection and its allocation/order cascade. WAVE 82 (W82-C): no-force re-measured myself on the wave-70 draft; jump confirmed, no exit-0 (-4 bytes overshoot persists). Mechanism pinned down from the diff: under no-force the loaded gUnknown_030040D8 pointer VALUE binds to r5 ACROSS both map-store blocks (single ldr r5,[pc] re-read via [r5,#0] at both sites) while the ROM re-materialises it per site under -fforce-addr; simultaneously the pool inventory loses one slot (extra standalone alignment padding appears) so every ldr [pc,#N] displacement shifts even where instruction text is identical, and .word 0x0000417a relocates to a different neighbour. Net: no-force removes precisely the two force-addr slots the ROM KEEPS (gUnknown_030046C0/gUnknown_030046B0 related) rather than reproducing their selective emission. No subset of the seven profiles yields that hybrid; per-site rematerialisation cannot be spelled (volatile-cast and binding probes already measured +12/+28/+24). Override claim NOT made.
