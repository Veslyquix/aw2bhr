	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072314
sub_08072314: @ 0x08072314
	movs r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	str r1, [r0, #0x4c]
	bx lr
	.align 2, 0

