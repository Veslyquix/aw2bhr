	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034FD8
sub_08034FD8: @ 0x08034FD8
	push {lr}
	bl sub_08023348
	bl sub_0803662C
	bl sub_08024268
	pop {r0}
	bx r0
	.align 2, 0

