	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080375CC
sub_080375CC: @ 0x080375CC
	movs r1, #0
	strh r1, [r0, #0x1e]
	bx lr
	.align 2, 0

