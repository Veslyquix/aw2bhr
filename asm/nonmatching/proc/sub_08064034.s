	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064034
sub_08064034: @ 0x08064034
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r5, r1, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	bl sub_0801BAA8
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x12
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	bl sub_0801BA4C
	lsls r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r6]
	movs r2, #0
	str r2, [r6, #4]
	asrs r0, r0, #0x12
	rsbs r1, r0, #0
	str r1, [r6, #8]
	str r2, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r6, #0x10]
	str r2, [r6, #0x14]
	str r0, [r6, #0x18]
	str r2, [r6, #0x1c]
	str r4, [r6, #0x20]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

