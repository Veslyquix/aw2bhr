	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029088
sub_08029088: @ 0x08029088
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	bl sub_080290B0
	pop {r0}
	bx r0

