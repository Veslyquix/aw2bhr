# sub_08054C5C -- wave 90, W90-A

Start: 92.5%, 560/560, 42 differing bytes, first difference +0x13
(`w90-start.c`). End: **93.4%, 37 differing bytes**, same first difference
(`sub_08054C5C.c` == `w90-perm1-934.c`).

| run | search | iterations | result |
|---|---|---|---|
| perm-w90-1 | undirected, 900 s, from 92.5% | 11,558 | kept 93.4%: `t = sub_08055058(a[side], b[side], c[side], i = d[side ^ 1]);` |
| perm-w90-2 | undirected, 900 s, chained from 93.4% | 16,819 | best permuter score 2300 (base 2420) is 69.3% by bytes, so it was rejected |
| perm-w90-3 | directed (`w90-directed.perm.txt`: PERM_LINESWAP over the declarations + PERM_RANDOMIZE over the setup loop), 900 s | 13,564 | nothing better than 2420 |

The kept change reuses the loop counter `i` (dead at that point) as a temp for
the fourth argument. It preserves the semantics: `i` is reassigned before its
next use. It moves 5 bytes; the W80 residual is otherwise unchanged:

- The setup loop's counter is born in r3 and copied to r7 (`adds r7, r3, #0`)
  where the ROM has it in r6 from the start (`movs r6, #0`). This is the
  wave-78 `t = i` size costume that W80 recorded. Without the copy the
  function is 568/560.
- The third stack address (sp+10, spilled to [sp+40]) is derived as
  `adds r0, #2` off the sp+8 value already in r0. The ROM computes all three
  (sp+12, sp+6, sp+10) from sp, and builds the first one in r3 because its
  counter isn't there.
- The table base goes in r6 and gUnknown_085D6A52 in sb. The ROM has the base
  in r7 and gUnknown_085D6A48 in sb, which is the W80 allocno order.

W83-D's zero-trip do/while promotion and the seven-profile sweep stay ruled
out (see the parked entry).
