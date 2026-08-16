	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015410
sub_08015410: @ 0x08015410
	push {r4, lr}
	sub sp, #4
	adds r4, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	adds r3, r4, #0
	bl sub_08015438
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

