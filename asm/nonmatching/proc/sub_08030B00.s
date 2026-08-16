	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030B00
sub_08030B00: @ 0x08030B00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	ldr r0, _08030B44 @ =gUnknown_08090CE4
	mov sb, r0
_08030B12:
	mov r1, sb
	ldr r7, [r1]
	ldr r2, [r7]
	ldr r5, _08030B48 @ =0x00001AAE
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _08030B4C @ =0x0000122C
	adds r0, r0, r1
	adds r6, r2, r0
	ldrb r0, [r6]
	cmp r0, #0xaf
	bne _08030B3C
	ldrb r1, [r6, #1]
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08030B50
_08030B3C:
	movs r0, #1
	rsbs r0, r0, #0
	b _08030C42
	.align 2, 0
_08030B44: .4byte gUnknown_08090CE4
_08030B48: .4byte 0x00001AAE
_08030B4C: .4byte 0x0000122C
_08030B50:
	lsls r0, r1, #1
	adds r3, r2, #0
	adds r3, #0x24
	adds r0, r3, r0
	ldrh r1, [r0]
	ldrh r0, [r6, #2]
	cmp r0, r1
	beq _08030B94
	ldr r0, _08030B90 @ =gUnknown_0202575C
	movs r1, #0xae
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_0802F588
	strb r4, [r6]
	ldr r1, [r7]
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	ldrb r2, [r1]
	strb r0, [r1]
	ldr r1, [r7]
	adds r1, r1, r5
	b _08030BF6
	.align 2, 0
_08030B90: .4byte gUnknown_0202575C
_08030B94:
	movs r2, #0
	adds r3, r6, #6
_08030B98:
	mov r0, r8
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r0, #0
	bge _08030B98
	mov r1, sl
	cmp r1, #0
	beq _08030C0C
	mov r0, r8
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030C0C
	ldr r0, _08030C04 @ =gUnknown_0202575C
	movs r1, #0xae
	strb r1, [r0]
	mov r1, sb
	ldr r5, [r1]
	ldr r2, [r5]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r2, #0x24
	adds r2, r2, r1
	ldrh r1, [r2]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_0802F588
	strb r4, [r6]
	ldr r1, [r5]
	ldr r2, _08030C08 @ =0x00001AAE
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	ldrb r3, [r1]
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r2
_08030BF6:
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	b _08030B12
	.align 2, 0
_08030C04: .4byte gUnknown_0202575C
_08030C08: .4byte 0x00001AAE
_08030C0C:
	movs r0, #0
	strb r0, [r6]
	ldrb r0, [r6, #1]
	mov r1, sb
	ldr r5, [r1]
	ldr r3, [r5]
	lsls r1, r0, #1
	adds r2, r3, #0
	adds r2, #0x24
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, #1
	ldrh r4, [r2]
	strh r1, [r2]
	ldr r4, _08030C50 @ =0x00001AAE
	adds r3, r3, r4
	ldrb r1, [r3]
	adds r1, #1
	ldrb r2, [r3]
	strb r1, [r3]
	ldr r2, [r5]
	adds r2, r2, r4
	ldrb r3, [r2]
	movs r1, #0xf
	ands r1, r3
	ldrb r3, [r2]
	strb r1, [r2]
_08030C42:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08030C50: .4byte 0x00001AAE

