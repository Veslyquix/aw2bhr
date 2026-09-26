# sub_08022618 -- wave 91 (W91-A)

Start: 396/400 (-4), 11.75%. Draft left: size-exact 400/400, 29.0%
(`sub_08022618.c`, snapshot also in the scratchpad as w91base). A
permuter-derived size-exact 51.25% variant is in `perm-w91-q1.c` (see the end).

## Member form: POSITIVE (-4 -> size-exact)

`p = gUnknown_08499590; rows = p + 0x417A; q = p + 0x51A; ...` respelled as
`((struct Map *)gUnknown_08499590)->height / camX / camY / rowOffset[y] /
unitUnk[off] / unk234A[off]`: -4 -> size-exact, 13.8%. Binding
`struct Map *m` (first reference bare, or bound in the guard) is
byte-identical to the inline cast.

## What each later change did (all measured with trymatch)

1. `ax = (x - camX) & 0xF; by = (y - camY) & 0xF; ax *= 2; by *= 2;` (vs one
   expression each): removes the `sub sp,#4` spill. Mechanism: with
   `ax = ((..) & 0xF) * 2`, CSE's associative fold rewrites the first tile's
   `(u16)ax` = `ax << 16` as `t2 << 17` (fold_rtx, ASHIFT of a register known
   to be an ASHIFT), which keeps the masked intermediates live into the else
   block. The ROM computes `ax << 16` from ax itself (`mov r0,sl; lsls
   r4,r0,#16`), so ax's equivalence was not usable there. Other orders
   (ax fully then by; three-step `ax = x - camX; ax &= 0xF; ax *= 2`) are
   different allocations, none better.
2. `if ((id = m->unitUnk[off]) == 0 || ...)` in place of `id = ...; if (id ==
   0 ...)`: gives the ROM's exact id shape (`ldrb; lsls r0,#16; lsrs rV,r0,#16;
   cmp r0,#0` then `lsls r6,rV,#16` for the call and index). `u16 id` is -24,
   `u16 id` + separate flags -12.
3. `flags` as its own s16 rather than reusing `id`: with (2) it is -4 like the
   merged form but in a better shape.
4. The two force-addr words named as what they hold: `gUnknown_08499580`
   (u16 *) for `**pp` and `gUnknown_085D5ABC[...]` for `(*pp2)[...]`:
   size-exact, 29.0%. Needs "rodata" entries for 0x080909A8 / 0x080909AC.

## Residual (29.0% draft)

Pure allocation. ROM: x=r5, y=r4, ax=sl, by=sb, id/flags=r7, id<<16=r6,
rec=r8, pp=r6->sl. Draft: x=r8, y=r7, ax=r5, by=r4 -- the parameters lose the
low registers to ax/by.

## Permuter (900 s, --current from the 29.0% draft)

Kept a +20 candidate as "51.25%": it declared two NON-static `inline`
helpers (a `rowOffset[y]` reader and a `(u16)` narrowing through an int
parameter) that agbcc emits out of line. Made `static inline` it is
size-exact 51.25% (`perm-w91-q1.c`), with `flags = (id = ...); if (flags ==
0 || ...)`. That candidate LOSES the id shape of (2) and x/y are still in
r9/r8, so its gain is in the else block only. Transplanting just the helpers
onto the 29.0% draft gives +4 (20.8-21.8%). A chained run from q1 was started
at the end of the wave; see perm-w91-2.log.

## Chained permuter from q1 (900 s)

No kept improvement. Its best raw candidate (63.25%, size-exact, first diff
+0x28) is SEMANTICALLY WRONG -- `by = (ax *= 2);` overwrites by with ax -- so
it is discarded. The draft is back on the readable 29.0% version.
