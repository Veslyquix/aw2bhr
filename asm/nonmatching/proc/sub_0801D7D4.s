	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D7D4
sub_0801D7D4: @ 0x0801D7D4
	push {r4, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	movs r4, #0x1d
	str r4, [sp, #4]
	bl sub_0801D78C
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

