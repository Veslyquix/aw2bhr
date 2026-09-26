# sub_0807E980 notes

## W84-A (wave 84, agent A)

Draft state at wave start: champion old-shape draft restored before this agent
(`sub_0807E980.c` == w83-snapshot.c == w83-best-before.c == best.c,
MD5 ED91F14A..., 99.04% / 10 bytes / first diff +0x370). The "DRAFT GONE"
preflight flag was stale.

**The staged lead WAS measured now (twice), both under configured profile.**

1. `w84-comma-depth.c` -- wave 83's exact spelling: comma binding
   `base = (int)&gUnknown_0200FC50` inside the FIRST `sub_08043BA4` third
   argument, loop base `&((u8 *)base)[(i*0x100)+(j*0x400)]`. try_match: MISS.
   The base pseudo materializes ~4 instructions too early
   (`ldr r3,=gU; mov sl,r3` lands BEFORE the first sub_08043BA4 where ROM has
   `ldr r4,=gU` only after the second call), shifts everything +4 bytes, flips
   the .rodata pool order (candidate 0200FC50@400/08234B10@404 vs ROM
   08234B10@400/0200FC50@404) and swaps r4<->r5 through the whole trailing
   sprite loop.

2. `w84-decomp-comma.c` -- correction probe: same comma moved INTO
   Decompress's second argument
   (`Decompress(gUnknown_08234B10, (base = (int)&gUnknown_0200FC50,
   (void *)base))`). Isolated compile_probe shows correct unification and
   pool order for the loop itself; full-function try_match: MISS. Same
   defect class: because an explicit int local crosses `bl Decompress`,
   reload assigns its callee-saved home AT THE ASSIGNMENT (`mov sl,r3`
   immediately after `ldr r3,=gU`, before the call), while the ROM keeps the
   value in scratch r4 through the call and only homes it to sl via the late
   copy sequence `movs r5,#0; mov sl,r4`. Plus the same global allocno
   reshuffle (r4<->r5 in both sprite loops).

Conclusions:
- The comma MECHANISM is confirmed: with any explicit binding, one pseudo
  carries &gUnknown_0200FC50 into the loop with no per-iteration pool reload --
  the thing three waves asked for does happen.
- But every explicit-binding anchor that was authored creates the pseudo as a
  USER LOCAL whose home is chosen at the assignment; the ROM shape has NO user
  variable there at all -- CSE unifies the two references invisibly and only
  adopts sl at the loop preheader. No placement of an explicit binding can
  reproduce that home-timing; this axis is CLOSED for spellings of the form
  measured (anchor = first sub_08043BA4 third arg, anchor = Decompress second
  arg).
- Draft restored to the champion (verified by hash). best.json untouched
  (99.04). Park entry stands; nothing new beyond the two measured numbers
  above to add to it.
