	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E310
sub_0803E310: @ 0x0803E310
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r7, [sp, #0x30]
	add r6, sp, #0x18
	movs r0, #7
	adds r1, r6, #0
	bl sub_0803DF98
	add r0, sp, #0x18
	ldrh r0, [r0]
	subs r4, r4, r0
	ldrh r0, [r6, #2]
	subs r5, r5, r0
	movs r0, #7
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r1, [sp, #0x34]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #4
	bl sub_0803E088
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

