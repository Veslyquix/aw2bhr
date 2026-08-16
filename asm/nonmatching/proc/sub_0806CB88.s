	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CB88
sub_0806CB88: @ 0x0806CB88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080139C4
	bl sub_080718F0
	bl sub_080135A4
	movs r0, #0x7f
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

