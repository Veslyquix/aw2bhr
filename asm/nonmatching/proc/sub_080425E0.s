	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080425E0
sub_080425E0: @ 0x080425E0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_080425B8
	adds r0, r4, #0
	movs r1, #1
	bl sub_08041978
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

