	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080759A0
sub_080759A0: @ 0x080759A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r2, _080759C8 @ =gUnknown_08615194
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r2, #0xc
	adds r1, r1, r2
	ldr r3, [r1]
	cmp r3, #0
	bne _080759CC
	movs r0, #0
	b _08075A42
	.align 2, 0
_080759C8: .4byte gUnknown_08615194
_080759CC:
	ldr r5, [r3, #4]
	movs r7, #0
	ldrb r0, [r3, #3]
	cmp r7, r0
	bge _08075A40
_080759D6:
	movs r4, #0
	adds r1, r7, #1
	mov ip, r1
	ldrb r2, [r3, #2]
	cmp r4, r2
	bge _08075A38
	ldr r6, _08075A04 @ =0x00000FFF
	mov r8, r6
_080759E6:
	ldrb r0, [r5]
	cmp r0, #0
	beq _08075A2E
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, r0, r4
	cmp r0, #0x1f
	ble _08075A0C
	ldr r2, _08075A08 @ =gUnknown_08614280
	ldr r0, [r2]
	movs r6, #0xf8
	lsls r6, r6, #3
	adds r1, r0, r6
	b _08075A10
	.align 2, 0
_08075A04: .4byte 0x00000FFF
_08075A08: .4byte gUnknown_08614280
_08075A0C:
	ldr r0, _08075A50 @ =gUnknown_08614280
	ldr r1, [r0]
_08075A10:
	ldrb r0, [r3, #1]
	adds r0, r0, r7
	lsls r0, r0, #5
	ldrb r2, [r3]
	adds r0, r0, r2
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	mov r1, r8
	ands r1, r2
	mov r6, sb
	lsls r2, r6, #0xc
	orrs r1, r2
	strh r1, [r0]
_08075A2E:
	adds r5, #1
	adds r4, #1
	ldrb r0, [r3, #2]
	cmp r4, r0
	blt _080759E6
_08075A38:
	mov r7, ip
	ldrb r1, [r3, #3]
	cmp r7, r1
	blt _080759D6
_08075A40:
	movs r0, #1
_08075A42:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08075A50: .4byte gUnknown_08614280

