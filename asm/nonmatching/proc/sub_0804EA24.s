	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804EA24
sub_0804EA24: @ 0x0804EA24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0804EA54
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0804EAEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

