	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080607E8
sub_080607E8: @ 0x080607E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08060884 @ =gUnknown_03004080
	ldrh r0, [r0]
	movs r1, #0x1f
	mov sb, r1
	mov r2, sb
	ands r2, r0
	mov sb, r2
	movs r0, #7
	bl sub_0803E354
	cmp r0, #0
	beq _08060874
	ldrb r3, [r0]
	mov sl, r3
	ldrb r0, [r0, #1]
	adds r0, #4
	mov r8, r0
	movs r7, #0
_08060816:
	ldr r0, _08060888 @ =gUnknown_08499590
	ldr r1, [r0]
	mov r0, r8
	lsls r2, r0, #1
	ldr r3, _0806088C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r3, sl
	adds r2, r3, r7
	adds r0, r0, r2
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r6, [r1]
	cmp r6, #0
	bne _0806086E
	ldr r0, _08060890 @ =gUnknown_030046B4
	ldr r1, [r0]
	mov r3, sb
	lsls r0, r3, #1
	add r0, sb
	adds r0, r0, r7
	adds r1, r1, r0
	ldrb r5, [r1]
	cmp r5, #0
	beq _0806086E
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	bl sub_08025CC8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #9]
	strb r6, [r4, #0xa]
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08061178
	strb r0, [r4, #0xb]
_0806086E:
	adds r7, #1
	cmp r7, #2
	ble _08060816
_08060874:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060884: .4byte gUnknown_03004080
_08060888: .4byte gUnknown_08499590
_0806088C: .4byte 0x0000417A
_08060890: .4byte gUnknown_030046B4

