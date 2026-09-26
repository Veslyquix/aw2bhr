# sub_0805FC1C

0x0805FC1C, 328 bytes, THUMB, parked.

Best score so far: 71.7%, +4 bytes (best.c).

## Files

- `sub_0805FC1C.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 78 at 336/328 (+8 section, +10 code), 42.4%. The single-use gUnknown_085D5AD0 base is not LICM-hoisted by the tested bindings. Residual is invariant-address placement.

WAVE86: WAVE 86 (W86-F, vocabulary-twin axis): twin sub_0805A008 (in src/decomp/c_08059F24.c) is a SAME-VOCABULARY NEIGHBOUR that never references gUnknown_085D5ABC/gUnknown_085D5AD0 at all -- it contains no instance of the residual's construct (the one missing LICM hoist of gUnknown_085D5AD0 into the preheader) in either direction. Clean NO, no probe. Corroboration worth keeping: the twin reaches the map with a base bound INSIDE the loop body (`q = gUnknown_08499590; rows = q + 0x417a; props = q + 0x12;`) and MATCHES that way, so its ROM does not hoist that address either -- independent support for W55-F's measurement 3 here, and a third independent measurement this wave (sub_080790D0 probe 6) found the same bind byte-identical: the W50-L bind lever is dead on this axis in two unrelated functions. What DOES make agbcc hoist a single-use address constant remains the open question. Configured, 336/328 (+8 section, +10 code), 42.4%, unchanged.
