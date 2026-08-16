	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B0E0
sub_0806B0E0: @ 0x0806B0E0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl sub_08013830
	movs r0, #0x40
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0

