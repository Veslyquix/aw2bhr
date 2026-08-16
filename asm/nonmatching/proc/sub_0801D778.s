	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D778
sub_0801D778: @ 0x0801D778
	push {r4, lr}
	sub sp, #4
	movs r4, #0
	str r4, [sp]
	bl sub_0801D6E8
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1

