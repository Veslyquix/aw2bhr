	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F00C
sub_0801F00C: @ 0x0801F00C
	ldr r1, _0801F014 @ =gUnknown_03001FE0
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0801F014: .4byte gUnknown_03001FE0

