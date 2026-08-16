	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077A14
sub_08077A14: @ 0x08077A14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08077B50 @ =gUnknown_0300064C
	ldr r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	bl sub_08012358
	bl sub_080755E0
	bl sub_08013C54
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	bl sub_08025E74
	ldr r0, _08077B54 @ =gUnknown_080A0F38
	ldr r4, _08077B58 @ =gUnknown_081CC5EC
	ldr r1, [r4]
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08077B5C @ =0x06001000
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08011C68
	ldr r0, _08077B60 @ =gUnknown_080A1138
	movs r1, #0x80
	movs r2, #0x40
	bl sub_08013618
	movs r0, #4
	bl sub_08037750
	movs r2, #0
	mov r8, r4
	ldr r7, _08077B64 @ =gUnknown_08499598
	ldr r5, _08077B68 @ =gUnknown_085C77E0
	movs r3, #0
	movs r4, #0x5c
_08077A7A:
	ldr r1, [r7]
	adds r1, r3, r1
	ldr r0, [r6, #0x34]
	muls r0, r4, r0
	adds r0, r2, r0
	adds r0, r0, r5
	ldrb r0, [r0]
	adds r1, #0x56
	strb r0, [r1]
	adds r3, #0x3c
	adds r2, #1
	cmp r2, #3
	ble _08077A7A
	bl sub_0803D6D0
	mov r0, r8
	ldr r5, [r0]
	ldr r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r4, _08077B5C @ =0x06001000
	adds r0, r0, r4
	bl sub_0801B6EC
	ldr r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	adds r0, r0, r4
	bl sub_0801B6FC
	ldr r0, _08077B6C @ =gUnknown_08551A04
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0x81
	lsls r1, r1, #7
	bl sub_08037A20
	ldr r0, _08077B70 @ =gUnknown_03003F68
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r2, r6, #0
	adds r2, #0x4c
	movs r5, #0
	strh r0, [r2]
	ldrb r0, [r1, #1]
	adds r3, r6, #0
	adds r3, #0x4e
	strh r0, [r3]
	ldrh r1, [r2]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08077AF2
	adds r0, r1, #1
	strh r0, [r2]
_08077AF2:
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08077B00
	adds r0, r1, #1
	strh r0, [r3]
_08077B00:
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r2]
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r3]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0x1f
	subs r0, r0, r1
	asrs r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x48
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #0x12
	subs r0, r0, r1
	asrs r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x4a
	strh r0, [r1]
	cmp r0, #0
	bge _08077B36
	strh r5, [r1]
_08077B36:
	str r5, [r6, #0x44]
	movs r0, #3
	bl sub_080752D8
	movs r0, #3
	bl sub_08074EEC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077B50: .4byte gUnknown_0300064C
_08077B54: .4byte gUnknown_080A0F38
_08077B58: .4byte gUnknown_081CC5EC
_08077B5C: .4byte 0x06001000
_08077B60: .4byte gUnknown_080A1138
_08077B64: .4byte gUnknown_08499598
_08077B68: .4byte gUnknown_085C77E0
_08077B6C: .4byte gUnknown_08551A04
_08077B70: .4byte gUnknown_03003F68

