
## Wave 91 (W91-B)

Member form: NEGATIVE, byte-identical. The draft already reads every map
field through a local `struct Map5A9AC` cast. Respelled as `struct Map`
(`->danger/->rowOffset/->unit/->terrain/->width/->height`, and `->move` for
the sub_0801F92C argument), and as `gMap->`: identical, 37.57% / +28 with the
volatile unit view and 35.66% without it.

Mechanism of the +28, from a -da dump (rtl-w91/, source w91-v3.c):
- The surplus `.LC1` (the force-addr word for gUnknown_08499590) is GCSE
  PRE. gcse inserts `(set (reg 482) (symbol_ref .LC1))` after the n-loop
  init (insn 987) and turns every in-loop map access into a copy of 482. With
  482 multi-use, combine cannot fold the `.LC`/(mem) pair into a plain
  `ldr =gUnknown_08499590`.
- The in-loop map-ADDRESS pseudo 148 (16 refs / 160 insns, priority
  4*16/160) then narrowly beats `i` (reg 30, 25 refs / 256 insns,
  4*25/256) for sl. `i` spills (+4 frame) and the cascade follows. In the ROM
  the address pseudo LOSES. It is rematerialised per use from REG_EQUIV as a
  plain `ldr rX,=gUnknown_08499590` in whatever reload register comes next
  (r7, r2, r3, r0 at the four sites; that is the tell), and `i` keeps sl.
  A priority tie decided by about 2%: a permuter case.
- The ROM DOES use gcse here: its prologue has three `.rodata` words
  (0x0816D9B4/B8/BC). Under -fno-gcse none appear, and the draft is +8.

900 s permuter from --current (perm-w91-1.log; 27,828 iterations, 773
improving candidates). SIZE-EXACT candidates exist for the first time:
output-10764-1 at 50.68% and output-9844-1 at 40.98%, plus several at -8 and
-12. 10764 binds `new_var = (struct Map5A9AC *)gUnknown_08499590;` at the TOP
of the j body and reads some of the rowOffset / danger indexes through it.
9844 hoists the width into a `u16` read before the gUnknown_030013EC call.
w91-perm10764-clean.c is a readable transcription of 10764. It compiles to
the same instruction stream as the permuter's source.c (checked by rtldump).
Next: chain a permuter run from it.

Permuter outcome (after the run finished): permute.py kept output-8096-1
(67.76% but +4). It wraps most of the n-loop body in `do { ... } while (0)`,
so the body's `continue`s now leave the do and run the tail. That is
SEMANTICALLY WRONG C and was discarded. Its valid half (`vp =
&gUnknown_08499590` per i iteration, used for the volatile unit view) is +32
on the old draft and +8 on 10764: worse. THE DRAFT IS NOW
w91-perm10764-clean.c (verified with trymatch: 732/732, 50.68%, first
difference +0xa). The old +28 draft is w91-start.c.
