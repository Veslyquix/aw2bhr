	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031E7C
sub_08031E7C: @ 0x08031E7C
	push {lr}
	movs r1, #0x20
	str r1, [r0, #0x58]
	bl sub_080136C4
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x11
	bl sub_0801394C
	bl sub_080718F0
	bl sub_080135A4
	pop {r0}
	bx r0

