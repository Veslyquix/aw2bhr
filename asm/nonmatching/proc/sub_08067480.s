	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067480
sub_08067480: @ 0x08067480
	push {lr}
	movs r1, #0x20
	str r1, [r0, #0x58]
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080139C4
	bl sub_080135A4
	pop {r0}
	bx r0
	.align 2, 0

