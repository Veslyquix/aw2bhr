# sub_080364F4 — Wave 65 final park

Configured profile after repairing the stale member cast: target 296 bytes,
candidate 280 (-16), 9.5% positional identity.  The shared header now models
`unk44` as a four-byte struct, so the old `(const u8 *)unk44` no longer compiled;
the local draft now correctly casts `&unk44` and does not reshape shared data.

The remaining residual is force-address/base association and allocation.  The
ROM uses private words at 0x08090EBC and 0x08090EC0 (contents 0x03003FC0 and
0x085C77A0), retains the second word's address in sl, reloads its table base,
and adds runtime 0x44/0x40/0x3c offsets.  The honest array spelling instead
folds 0x44 into its address constant, orders the bases differently, and loses
16 bytes.  All three branches, both four-item loops, the 0xff fallback, and the
final script selection are present; no further fixpoint was attempted.
