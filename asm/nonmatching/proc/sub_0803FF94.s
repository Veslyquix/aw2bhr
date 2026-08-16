	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FF94
sub_0803FF94: @ 0x0803FF94
	push {lr}
	ldr r0, [r0, #0x50]
	bl sub_0801C240
	pop {r0}
	bx r0

