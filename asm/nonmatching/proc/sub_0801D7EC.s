	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801D7EC
sub_0801D7EC: @ 0x0801D7EC
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r3, [sp]
	str r4, [sp, #4]
	movs r3, #0
	bl sub_0801D78C
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

