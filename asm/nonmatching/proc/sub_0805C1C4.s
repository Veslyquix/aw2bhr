	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C1C4
sub_0805C1C4: @ 0x0805C1C4
	ldr r0, _0805C1D0 @ =gUnknown_03004770
	ldr r0, [r0]
	cmp r0, #1
	bls _0805C1D4
	movs r0, #0
	b _0805C1D6
	.align 2, 0
_0805C1D0: .4byte gUnknown_03004770
_0805C1D4:
	movs r0, #1
_0805C1D6:
	bx lr

