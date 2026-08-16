	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CE84
sub_0803CE84: @ 0x0803CE84
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0
	bl sub_0803CDBC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1

