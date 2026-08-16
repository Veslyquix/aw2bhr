	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066338
sub_08066338: @ 0x08066338
	movs r1, #3
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0

