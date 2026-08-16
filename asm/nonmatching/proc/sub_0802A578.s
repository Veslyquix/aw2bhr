	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A578
sub_0802A578: @ 0x0802A578
	push {lr}
	ldr r1, [r0, #0x4c]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08029088
	pop {r0}
	bx r0

