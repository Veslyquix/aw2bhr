	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027554
sub_08027554: @ 0x08027554
	push {lr}
	ldr r0, [r0, #0x50]
	bl sub_0801C240
	pop {r0}
	bx r0

