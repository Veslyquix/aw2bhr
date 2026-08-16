	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076BE0
sub_08076BE0: @ 0x08076BE0
	push {lr}
	movs r1, #0
	movs r2, #0xaf
	movs r3, #1
	bl sub_08074C84
	pop {r0}
	bx r0

