	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034A58
sub_08034A58: @ 0x08034A58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl sub_08034A44
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080119A0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

