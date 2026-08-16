	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805040C
sub_0805040C: @ 0x0805040C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_08050424
	pop {r0}
	bx r0
	.align 2, 0

