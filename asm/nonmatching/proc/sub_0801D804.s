	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D804
sub_0801D804: @ 0x0801D804
	push {lr}
	sub sp, #8
	movs r3, #0
	str r3, [sp]
	movs r3, #0x1d
	str r3, [sp, #4]
	movs r3, #0
	bl sub_0801D78C
	add sp, #8
	pop {r1}
	bx r1

