	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067D5C
sub_08067D5C: @ 0x08067D5C
	movs r1, #0xa0
	lsls r1, r1, #1
	str r1, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0

