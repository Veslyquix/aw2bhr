
## Wave 91 (W91-B) -- PROVISIONAL MATCH under `-O2 -fno-gcse`

Pre-registered member-form test (configured): respelling both map stores as
`((struct Map *)gUnknown_08499590)->unit[->rowOffset[unk03] + unk02]` (or
`gMap->`) moved it from 17.89% / +4 to 12.39% / +28. That is a NEGATIVE under
the configured flags.

The -da dump shows what the residual is. gcse PRE unified the `.LC` address
loads of gUnknown_030046B0 / 030040D8 / 030046C0 between the top of the
function and the post-call half (insns 741-746 in `.gcse`). That left three
`.rodata` words, and the ROM has none. With `-O2 -fno-gcse` the raw-offset
draft is instruction-for-instruction the ROM except:
 (a) map store association: the member form gives the ROM's
     `(map + 0x417A) + y*2` and `(map + 0x12) + off`;
 (b) the unit-class row: ROM `*gUnknown_085766E0 + (type*12 + 4)`. The
     header's struct Unk085766E0 is 0x24 bytes now (wave 60 extended it), so
     `gUnknown_085766E0[type].unk04` indexes by 36. The draft's old spelling was
     wrong after wave 60. `(u8 *)gUnknown_085766E0 + (type * 12 + 4)` is exact.
     A 12-byte row struct view gives `p + i*12` and then `+4`, which is the
     wrong order.
work/sub_0805D438/sub_0805D438.c (= w91-m3.c) is BYTE-IDENTICAL under
`-O2 -fno-gcse`, with or without -fforce-addr ("relocs: match"). Configured it
is 12.16% / +28. Reproduce with `python work/sub_0805D438/w91b_tm.py
sub_0805D438` (a copy of the scratchpad wrapper that adds a temporary
`no-gcse` profile to agbenv.COMPILER_PROFILES at runtime; set
W91B_PROFILE=no-gcse-no-force for the other one).

Why this is NOT yet an override: sub_0805D5EC and sub_0805D648, next in
address order, FAIL under -fno-gcse (-4 / -8). sub_0805D338 before it is
neutral. So a per-unit flag needs a unit boundary between D438 and D5EC. The
other possibility is a source construct that disables gcse in one function,
and nobody has found one. See the docs chapter "The .rodata force-addr word is
made by GCSE's PRE".
