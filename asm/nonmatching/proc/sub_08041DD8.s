	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041DD8
sub_08041DD8: @ 0x08041DD8
	push {lr}
	bl sub_08023348
	bl sub_0803662C
	pop {r0}
	bx r0
	.align 2, 0

