	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802909C
sub_0802909C: @ 0x0802909C
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	bl sub_080290B0
	pop {r0}
	bx r0

