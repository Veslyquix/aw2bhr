	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028E18
sub_08028E18: @ 0x08028E18
	push {lr}
	ldr r0, [r0, #0x4c]
	bl sub_08014ED4
	pop {r0}
	bx r0

