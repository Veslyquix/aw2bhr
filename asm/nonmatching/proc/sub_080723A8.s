	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080723A8
sub_080723A8: @ 0x080723A8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0
	bl sub_08013780
	bl sub_080723C0
	pop {r0}
	bx r0

