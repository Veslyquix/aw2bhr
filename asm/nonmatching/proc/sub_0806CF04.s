	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CF04
sub_0806CF04: @ 0x0806CF04
	push {lr}
	movs r1, #0x20
	str r1, [r0, #0x30]
	movs r1, #0xad
	str r1, [r0, #0x2c]
	bl sub_080136C4
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080139C4
	bl sub_080718F0
	bl sub_080135A4
	pop {r0}
	bx r0
	.align 2, 0

