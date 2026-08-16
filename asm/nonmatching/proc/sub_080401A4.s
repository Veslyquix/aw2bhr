	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080401A4
sub_080401A4: @ 0x080401A4
	push {lr}
	ldr r1, [r0, #0x4c]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08029088
	pop {r0}
	bx r0

