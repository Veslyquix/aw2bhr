	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080311D0
sub_080311D0: @ 0x080311D0
	movs r1, #0
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0

