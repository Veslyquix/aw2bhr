	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040AFC
sub_08040AFC: @ 0x08040AFC
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_0801C240
	pop {r0}
	bx r0

