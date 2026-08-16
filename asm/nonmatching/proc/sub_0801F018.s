	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F018
sub_0801F018: @ 0x0801F018
	ldr r1, _0801F020 @ =gUnknown_03001FE0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0801F020: .4byte gUnknown_03001FE0

