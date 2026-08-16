	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080425FC
sub_080425FC: @ 0x080425FC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_080425B8
	adds r0, r4, #0
	movs r1, #0
	bl sub_08041978
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

