	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023348
sub_08023348: @ 0x08023348
	push {lr}
	movs r0, #1
	bl sub_08023360
	pop {r0}
	bx r0

