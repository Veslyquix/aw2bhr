# sub_08062C94 — parked at 82.2% (348 B). Shape settled; residual is register allocation.

## The finding that unblocked it — take this first

`gUnknown_02029C20`'s first 0x32 bytes are a **`volatile u16 [0x19]`** counter
table. Every store to them in the ROM carries the wave-47 dead load
(`ldrh` into a dead register immediately before the `strh`); the stack-local
twin `loc[0x19]` beside them, written by the same statements, carries none.
That contrast inside one function is the cleanest control the tell has had.

The symbol is declared `extern u8 gUnknown_02029C20[]` and must STAY that way —
`src/decomp/c_0806171C.c` needs `gUnknown_02029C20 + 0x34` in bytes. Wave 49
(W49-F) said the dead load needs a decl-rooted lvalue and never fires through a
pointer, which would make that unreachable. **It does fire through a struct
member on a cast pointer** (probed this wave, now a chapter in
`docs/agbcc-codegen.md`), so the spelling is:

    struct Unk62C94Tab { volatile u16 v[0x19]; };
    #define TAB ((struct Unk62C94Tab *)gUnknown_02029C20)

All three dead loads appear with this and none with `((u16 *)gUnknown_02029C20)[i]`.

## Shape (settled)

    for (i = 0; i <= 0x18; i++) { TAB->v[i] = 0; loc[i] = 0; }
    for (t = 0; t <= 3; t++)
        if (((gUnknown_08499598[gUnknown_030033EC].unk2c >> t) & 1) == 0)
            for (u = t*0x40; u < t*0x40 + 0x40; u++)
                if (gUnknown_08499594[u].unk00 != 0)
                    loc[...unk00] += gUnknown_08499594[u].unk04_0;
        else
            <same, into TAB->v[...]>
    for (k = 1; k <= 0x18; k++)
        if (TAB->v[k] != 0)
            for (m = 1; m <= 0x18; m++)
                TAB->v[k] -= sub_08043070(g598[z].unk1d, g598[z].unk1e, m, k, 0)
                             * loc[m];

`gUnknown_0816DB38` and `gUnknown_0816DB3C` are NOT objects — they are
-fforce-addr words holding `&gUnknown_08499598` and `&gUnknown_08499594`
(dereferenced in baserom.gba, recorded in `include/unknown-globals.h`). The
honest spelling reproduces the three-level chain and `trymatch` reports the two
`.rodata` words to place.

## Remaining diff

Register naming only, and it is systematic — the first loop's counter lands in
r3 where the ROM uses r4 and everything downstream shifts by one register
(r3<->r4 in the t-loop, r4<->r7 / r5<->r6 in the last loop). No instruction is
missing or extra in the second and third loops. Untried levers, in order of
promise:

1. The first loop's two stores: the ROM does `ldrh r0,[r2]; strh r3,[r2];
   strh r3,[r1]` with r2 = gUnknown_02029C20 and r1 = sp+4 — i.e. the VOLATILE
   store first. Check the candidate emits them in that order, not `loc` first.
2. Declaration order of `loc` / `i` / `t` / `u` / `k` / `m` — see the new
   "Spilled locals take stack slots in DECLARATION order" chapter; the same
   mechanism reaches register preference for the ones that are NOT spilled here.
3. `k` and `m` may be one local, not two (wave 49 W49-K: two disjoint counters
   in one function are usually ONE local).

## Wave 60 (W60-F): 82.2% -> 93.7% by CHAINED permuter runs; draft is now permuter output

Four `python tools/permute.py sub_08062C94` runs, each started from the previous
run's `best.c` (the shell path — the MCP `permute` tool is broken):

| run | start | result |
|---|---|---|
| 1 | 82.2% (hand draft) | **91.4%** |
| 2 | 91.4% | **93.7%** |
| 3 | 93.7% | nothing |
| 4 | 93.7% | nothing |

Still size-exact; **22 of 348 bytes differ, first difference at +0x11.** The two
gains came from the first two runs and the ceiling then held across two further
600 s runs, so the chain is exhausted at this starting point.

`work/sub_08062C94/sub_08062C94.c` IS the 93.7% permuter output now (verified by
`try_match` after the header comment was added). **Do not tidy it.** Two of its
shapes are levers, named in the header comment: `loc[i] = (u = 0);` (W38-E's
creation-order lever, moving `u`'s first reference earlier) and the deliberately
ASYMMETRIC arms of the `t` loop, where only the `else` arm binds its base to `k`.

The three levers listed in the original "Untried levers" section above are
superseded — lever 1 (store order) was answered by the permuter, which put the
stack twin FIRST, the opposite of what that note predicted.

## Wave 63: zero-creation/store-order spelling measured

A variant that creates `u = 0` separately inside the first loop and stores the
volatile table before the stack twin was size-exact at 24/348 bytes different
(93.1%), worse than the retained permuter draft's 22/348 (93.7%). Preserve the
current `loc[i] = (u = 0)` spelling and asymmetric later arms.

## Wave 72 recheck

Configured verdict remains size-exact, 22/348 bytes different (93.7%), first
difference +0x11. The residual is the same register naming/order ceiling after
two chained permuter gains and two exhausted runs. No lower-score mechanism
transferred, so the permuter output was preserved without cosmetic edits.
