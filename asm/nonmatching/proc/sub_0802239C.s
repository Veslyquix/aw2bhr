	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802239C
sub_0802239C: @ 0x0802239C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r3, [sp, #0x24]
	ldr r4, [sp, #0x28]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsrs r1, r1, #0xf
	adds r0, r0, r1
	lsrs r2, r2, #0xa
	adds r0, r0, r2
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0802216C
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

