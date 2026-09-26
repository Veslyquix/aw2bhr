# sub_080620FC — parked at 29.3% (568 B vs 564). The 29% is POSITIONAL; the control flow below is fully read out and correct.

**`trymatch` reports "first difference at +0xa", and +0xa is the `sub sp, #N`
instruction** — the ten bytes before it are the prologue and they are exact.
The candidate emits `sub sp, #0x24` where the ROM has `sub sp, #0x20`: ONE extra
spill slot, which then renumbers every `[sp, #N]` immediate in the function and
drags the byte-identity score down to 29.3%. Total size is +4 (568 vs 564), so
there are two surplus instructions on top of that. **Do not read 29% as "the
shape is wrong"** — it is one surplus live value, reported positionally.

The surplus value costs the candidate the `sl` register that the ROM spends on
`a1 * 0x20` (the candidate spills it instead), and the tail block at `_080622B8`
comes out in a different statement order as a consequence.

## Control flow, read off the assembly by hand — reuse this, do not re-derive

    n = 0; k = 0;
    sub_080581A4(gUnknown_08499590 + 0x3262, 0);
    sub_0801F92C(gUnknown_08499590 + 0x2852);
    sub_08062330();
    while ((u8)sub_080623C4(&x, &y)) {
        gUnknown_030013EC(x, y, a2, 0x78, 0);          /* _call_via_r4, 5 args */
        n = gUnknown_02029ED8[k + a1*0x20 + gUnknown_030033EC*0xc00];
        for (j = 0; j < *(u16 *)(gUnknown_08499590 + 2); j++)
          for (i = 0; i < *(u16 *)gUnknown_08499590; i++)
            if ((s8)gUnknown_03003340[j][i] >= 0) {
                p = gUnknown_08499590; t = j*2; rows = p + 0x417a;
                off = *(u16 *)(rows + t) + i; cells = p + 0x1432;
                if (gUnknown_085767D5[cells[off] & 0x1f] != 0) {
                    cells = p + 0x3262;
                    if (cells[off] == 0) {
                        REC(n)->x = i;
                        REC(n)->y = j;
                        p = gUnknown_08499590; rows = p + 0x417a;
                        off = *(u16 *)(rows + t) + i;
                        *(u8 **)&gUnknown_02029F3C[IDX(n)] = &p[off + 0x193a];
                        cells = p + 0x3262;
                        cells[*(u16 *)(rows + t) + i] = 0xff;
                        n++;
                        if (n > 0x7a) goto done;        /* breaks BOTH loops */
                    }
                }
            }
      done:
        REC(n)->x = 0xfe;
        k++;
        if (k > 0x1e) break;
        gUnknown_02029ED8[k + a1*0x20 + gUnknown_030033EC*0xc00] = n + 1;
    }
    REC(n)->x = 0xff;
    gUnknown_02029ED8[k + a1*0x20 + gUnknown_030033EC*0xc00] = -1;

with

    IDX(n) = n * 8 + a1 * 0x3e0 + gUnknown_030033EC * 0xc00
    REC(n) = ((struct Unk620FCRec *)&gUnknown_02029ED8[IDX(n)])   /* {u8 x; u8 y;} */

Load-bearing details, each read off the ROM:

- **`gUnknown_0816DB30` IS NOT AN OBJECT.** The ROM word holds 0x08499590, so it
  is the -fforce-addr constant for `gUnknown_08499590`. Write the honest name;
  `trymatch` will ask for `"rodata": ["0x0816DB30"]`. Same for the rest of that
  run — see the new comment above `extern u8 *gUnknown_08499590;`.
- **`a1 * 0x20` and `a1 * 0x3e0` are ONE CSE.** The ROM synthesises
  `a1 * 0x3e0` as `(a1*0x20 - a1) << 5`, reusing the `a1*0x20` it already needs
  for the head index. Both expressions must appear in the source or this does
  not come out.
- The head byte is a FLAT index with the base added last; the record bytes need
  the base joined BEFORE the 0x60/0x61 displacement (the two spellings the
  `gUnknown_02029ED8` comment in `include/unknown-globals.h` already carries —
  both are used here, and both are needed).
- **`gUnknown_02029F3C` is now declared** (`extern u8 gUnknown_02029F3C[]`, with
  its evidence, beside `gUnknown_02029ED8`). It is `gUnknown_02029ED8 + 0x64`,
  i.e. offset 4 inside the same record, and `aw2bhr.lds` binds it. The ROM adds
  that symbol LAST with no 0x64 displacement, so the original named it rather
  than reaching through the record.
- `-1` at the last store is `movs r0,#1; rsbs r0,r0,#0`; the 0xfe/0xff stores are
  plain `movs`. Spell the last one `-1`, not `0xff`.
- `(u8)` on `sub_080623C4`'s `int` return: the ROM tests it with a bare
  `lsls r0,r0,#0x18`.

## Where the candidate goes wrong

`work/sub_080620FC/sub_080620FC.c` is the draft. It has ONE live value too many:
the ROM keeps `a1 * 0x20` in `sl` (recomputed at the loop latch each iteration)
while the candidate spills it, and the tail block at `_080622B8` comes out in a
different statement order as a result. Look for the surplus local first — the
three consecutive re-derivations of `off` inside the `if` body are the most
likely place, since the ROM keeps `rows + t` and `cells` but rematerialises
`off`, and the candidate binds `off` each time.

## Wave 60 (W60-F): 29.3% -> 68.3% by CHAINED permuter runs — and it was still climbing

This function had NEVER been permuted. Four `python tools/permute.py
sub_080620FC` runs, each started from the previous run's `best.c`:

| run | start | result |
|---|---|---|
| 1 | 29.3% (hand draft) | **56.0%** |
| 2 | 56.0% | **59.0%** |
| 3 | 59.0% | **65.6%** |
| 4 | 65.6% | **68.3%** |

**Every run gained.** Per the chaining chapter now in `docs/agbcc-codegen.md`,
that means the chain was NOT exhausted — keep going from `best.c` until a run
returns "no candidate scored better than the starting point". Whoever picks this
up should simply run it again rather than re-deriving anything.

Note this refutes the instinct that 29.3% was too low to be worth the permuter:
the score is POSITIONAL, and a divergence at +0xa (the `sub sp, #N`) reads low
while being one surplus live value. The permuter walked it more than twice.

## The surplus live value, confirmed by probe (unchanged diagnosis)

A `compile_probe` of the hand draft this wave still emits `sub sp, #0x24` against
the ROM's `#0x20`, and the extra slot holds **`a1 * 0x20`**, which the ROM keeps
in `sl`. The register census at the innermost block is the reason: the ROM has
`j` in a LOW register (r6) and `p` in a scratch (r2), which leaves `ip` free for
the `gUnknown_08499590` pool address and `sl` free for `a1 * 0x20`; the candidate
spends `ip` on `j` and r4 on `p` and therefore has to spill. Dropping the
redundant `off` binding in the innermost block (the axis the old note named as
most promising) was probed and does **not** move the frame size — ruled out.

### Run 5 gained too — the chain is NOT exhausted

29.3 -> 56.0 -> 59.0 -> 65.6 -> 68.3 -> **72.0%** across five runs, gaining on
every single one. **Just run `python tools/permute.py sub_080620FC` again** (it
defaults to `best.c`, so the chain continues by itself) before spending any hand
attempt here.

### CAVEAT ON best.c — read this before believing the 72%

`work/sub_080620FC/sub_080620FC.c` is deliberately left as the CLEAN hand
derivation (29.3%), not overwritten with the permuter output, because
**`best.c` contains at least one semantically DIVERGENT edit**:

    off = (*((u16 *) (rows + y))) + off;      /* best.c, inner if */
    off = *(u16 *)(rows + t) + i;             /* what the draft/ROM reading says */

`off` already holds `*(u16 *)(rows + y) + i` at that point, so best.c computes
`2 * *(u16 *)(rows + y) + i` and then uses it for the `+ 0x193a` store. That is
not a re-derivation of the same value, which is what the ROM reading calls for.

This does not invalidate the chain — byte identity against the ROM is the
oracle, and if it ever reaches 100% the C is correct by construction. But it
does mean **the 72% is not "72% of a correct decompilation"**, and no fragment
of `best.c` should be lifted back into the draft on the strength of its score.
Both files are kept for exactly this reason.

### Wave 63 run 6: 72.0% -> 72.2%, no match

A further 300-second four-thread MCP permuter run found a new byte-level best
of 72.2% but no match. The clean draft was restored unchanged. The chain made
a small gain, so this is not evidence that the search space is exhausted; the
semantic caveat on `best.c` above still applies.

### Wave 72 run 7: 72.2% -> 72.7%, no match

A further 300-second four-thread chained run found a new size-exact byte-level
best: 154/564 bytes differ (72.7%), first difference +0x15. The tool restored
the clean active draft unchanged, verified against `wave72-pre-permute.c`.
Do not transplant the expanded best.c: the semantic caveat above still applies.
The mechanism-backed old-agbcc check is also negative: size-exact, 323/564
bytes differ (42.7%), first difference +0xa.

### Wave 77 (W77-D): the W77-A address-expression lever does NOT apply here — ruled out by pool readout

The wave-77 chapter "Array indexing vs `(u8 *)base + n * sizeof(T)`" says to
convert an array subscript to the `+` form only where the ROM's literal pool
carries a `-fforce-addr` word for that base. This function's pool was read out
in full:

- The ONLY force-addr word is `gUnknown_0816DB30` (= `&gUnknown_08499590`), and
  it is in the HEAD block, feeding the two setup calls before the loop. The
  draft already spells that region the way the ROM does.
- Every base in the BODY is a plain symbol literal that the ROM
  RE-MATERIALISES at each use: `_08062310` (`gUnknown_08499590`) is loaded five
  separate times, `_08062308` (`gUnknown_02029ED8`) four times.
  `gUnknown_03003340` and `gUnknown_02029F3C` likewise.

That is precisely the "plain literal + full recomputation" case the chapter says
must KEEP the array spelling. Do not convert `gUnknown_02029ED8[...]` to
`(u8 *)gUnknown_02029ED8 + ...` here; the measured cost of doing that in the
wrong region was 14.2% -> 6.5% on `sub_0804CA98`.

Residual is unchanged and is kind 3 (allocation): one surplus spill slot,
`sub sp, #0x24` against `#0x20`.

### Wave 80 (W80-D): the binding locals are not the surplus value

Removing the `p` and `off` locals in the innermost block (keeping `t`, `rows`,
`cells` -- the statement boundary is what gives the ROM's `(p + 0x417A) + t`
grouping; a raw sum reassociates the constant to the end, see the wave-80
sub_0803D558 chapter in docs/agbcc-codegen.md) still emits `sub sp, #0x24`
with `a1 * 0x20` in `[sp, #0x18]`, and rotates the rest: n -> sl, j -> r9,
0x417A -> r8, p -> r5, rows -> r4, cells -> r3. Census of the ROM's inner block
for the next agent: i r4, j*2 r5, j r6, 0x417A r7, n r8, &gUnknown_030033EC sb,
a1*0x20 sl, &gUnknown_08499590 ip, p r2, off r3. The draft's defect is j in ip
and p/off in r4/r5; the ROM keeps p/off in scratch (no call inside the block)
and j low. Draft left unchanged (29.3%).
