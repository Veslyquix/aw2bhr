	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080674BC
sub_080674BC: @ 0x080674BC
	push {lr}
	movs r1, #0x20
	str r1, [r0, #0x58]
	movs r0, #1
	bl sub_08013928
	bl sub_080135A4
	pop {r0}
	bx r0

