	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B120
sub_0806B120: @ 0x0806B120
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r1, _0806B1A0 @ =gUnknown_0200C420
	ldr r0, [r1, #0x38]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	ldr r2, _0806B1A4 @ =gUnknown_0816E16C
	mov r8, r2
	cmp r0, #0
	beq _0806B188
	movs r6, #0
	adds r5, r1, #0
	adds r5, #0x38
_0806B13E:
	mov r3, r8
	ldr r4, [r3]
	adds r4, r6, r4
	ldrb r0, [r5]
	adds r0, #0x8a
	strh r0, [r4]
	ldrh r0, [r5, #2]
	lsrs r0, r0, #4
	bl sub_08037D80
	movs r2, #5
	subs r2, r2, r0
	movs r0, #3
	ands r2, r0
	ldrb r0, [r4, #2]
	movs r3, #4
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #2]
	ldm r5!, {r1}
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x14
	lsls r1, r1, #2
	ldrh r2, [r4, #2]
	movs r0, #3
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	adds r6, #4
	adds r7, #1
	ldr r0, [r5]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	bne _0806B13E
_0806B188:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r7, #2
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B1A0: .4byte gUnknown_0200C420
_0806B1A4: .4byte gUnknown_0816E16C

