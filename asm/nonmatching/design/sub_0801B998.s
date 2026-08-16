	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B998
sub_0801B998: @ 0x0801B998
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r3, r2, #0x10
	lsrs r3, r3, #0x10
	ldrh r2, [r4, #0x2e]
	ldrh r1, [r4, #0x2c]
	adds r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, [r4, #0x20]
	bl sub_0801B9C8
	adds r2, r4, #0
	adds r2, #0x32
	ldrb r1, [r2]
	adds r1, r1, r0
	strb r1, [r2]
	ldr r1, [r4, #0x20]
	adds r1, r1, r0
	str r1, [r4, #0x20]
	pop {r4}
	pop {r0}
	bx r0

