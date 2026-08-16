	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E930
sub_0801E930: @ 0x0801E930
	push {r4, r5, lr}
	sub sp, #0xc
	movs r4, #0
	movs r5, #0
	str r4, [sp]
	str r5, [sp, #4]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #8]
	bl sub_0801E338
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

