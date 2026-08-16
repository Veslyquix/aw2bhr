	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063A30
sub_08063A30: @ 0x08063A30
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	strh r1, [r0, #0x10]
	bx lr
	.align 2, 0

