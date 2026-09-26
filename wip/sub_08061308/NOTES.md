# sub_08061308 — Wave 63 follow-up

The configured draft remains 15.4% (836/864, -28; 703/836 bytes differ,
first difference +0x1c). A 300-second four-thread decomp-permuter run in Wave
63 did not match. It did leave a 44.9% `best.c`, but byte-level validation of
the reported outputs ranged from -28 to +24 bytes and none matched; the clean
draft was restored unchanged. Treat the permuter output only as hypotheses.

## Wave 72

The case-2 accept path is now written inside case 2 before `continue`. This
reproduces the ROM's duplicated 8-byte accept prefix exactly and advances the
configured draft to 844/864 (-20), 727/844 bytes different (13.5%), first
difference +0x1c. The low score is still positional.

Three distinct first-read spellings for `gUnknown_030046C0.unk06` (volatile
struct, byte-pointer cast, and a bound byte local) all retain its address in r8
across the call split. A fixed-r8 map-pool local increases the frame from 16 to
20 bytes. Compiler profiles are negative: old-agbcc is 828/864 (-36), while
old-agbcc-no-force is 804/864 (-60). Retain the duplicated case-2 draft.
