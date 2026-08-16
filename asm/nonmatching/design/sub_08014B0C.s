	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014B0C
sub_08014B0C: @ 0x08014B0C
	push {r4, r5, r6, r7, lr}
	adds r6, r3, #0
	ldr r3, [sp, #0x14]
	ldr r4, [sp, #0x18]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0xa
	adds r5, r2, r1
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #2
_08014B2E:
	adds r0, r6, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #1
	adds r0, r4, r0
	adds r1, r0, #1
	orrs r1, r7
	strh r1, [r5]
	adds r1, r5, #0
	adds r1, #0x40
	adds r0, #2
	orrs r0, r7
	strh r0, [r1]
	subs r5, #2
	adds r0, r6, #0
	movs r1, #0xa
	bl __udivsi3
	adds r6, r0, #0
	cmp r6, #0
	bne _08014B2E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

