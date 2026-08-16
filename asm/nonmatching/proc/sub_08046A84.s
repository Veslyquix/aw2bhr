	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046A84
sub_08046A84: @ 0x08046A84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r0, #0
	str r0, [sp, #0xc]
	mov r0, r8
	adds r0, #6
	ldr r2, _08046AC8 @ =gUnknown_084C20A0
	movs r3, #0xe0
	lsls r3, r3, #8
	movs r1, #8
	bl sub_0801BD00
	cmp r7, #6
	beq _08046AD4
	cmp r7, #8
	bne _08046AF0
	ldr r2, _08046ACC @ =gUnknown_0849982C
	ldr r0, _08046AD0 @ =gUnknown_02028DD7
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	b _08046AFC
	.align 2, 0
_08046AC8: .4byte gUnknown_084C20A0
_08046ACC: .4byte gUnknown_0849982C
_08046AD0: .4byte gUnknown_02028DD7
_08046AD4:
	ldr r2, _08046AE8 @ =gUnknown_084998A4
	ldr r0, _08046AEC @ =gUnknown_02028DD7
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	b _08046AFC
	.align 2, 0
_08046AE8: .4byte gUnknown_084998A4
_08046AEC: .4byte gUnknown_02028DD7
_08046AF0:
	ldr r1, _08046B84 @ =gUnknown_085D583C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
_08046AFC:
	ldr r1, [r0]
	mov r3, r8
	adds r3, #6
	movs r0, #8
	str r0, [sp]
	ldr r0, _08046B88 @ =0x00003247
	str r0, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_0801C7DC
	mov r1, r8
	adds r1, #0x37
	str r4, [sp]
	movs r0, #0xa8
	movs r2, #0x28
	movs r3, #0
	bl sub_0801F34C
	movs r5, #0
	ldr r1, _08046B8C @ =gUnknown_085D5B10
	mov sb, r1
	ldr r6, _08046B90 @ =gUnknown_084C20C0
_08046B30:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	add r0, sb
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08046B60
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #0
	str r1, [sp]
	mov r1, r8
	adds r1, #0x52
	movs r2, #0x38
	movs r3, #0
	bl sub_0801F34C
_08046B60:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _08046B30
	ldr r0, _08046B94 @ =gUnknown_02028DD4
	ldrb r0, [r0]
	cmp r0, #1
	beq _08046B98
	cmp r0, #1
	bgt _08046B7A
	b _08046D0C
_08046B7A:
	cmp r0, #2
	bne _08046B80
	b _08046CB4
_08046B80:
	b _08046D0C
	.align 2, 0
_08046B84: .4byte gUnknown_085D583C
_08046B88: .4byte 0x00003247
_08046B8C: .4byte gUnknown_085D5B10
_08046B90: .4byte gUnknown_084C20C0
_08046B94: .4byte gUnknown_02028DD4
_08046B98:
	movs r5, #0
	ldr r0, _08046C34 @ =gUnknown_085D583C
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r0, #0x10
	adds r1, r1, r0
	ldr r0, [r1]
	movs r2, #0x38
	add r2, r8
	mov sb, r2
	cmp r5, r0
	bge _08046BE8
	ldr r6, _08046C38 @ =gUnknown_084C2112
	mov sl, r1
_08046BB6:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r2, r4, #1
	adds r0, r2, r6
	ldrb r1, [r0]
	adds r1, #0x50
	add r1, r8
	adds r2, #1
	adds r2, r2, r6
	ldrb r2, [r2]
	adds r2, #0x19
	movs r0, #0
	str r0, [sp]
	movs r0, #0x39
	movs r3, #0
	bl sub_0801F34C
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	ldr r0, [r1]
	cmp r4, r0
	blt _08046BB6
_08046BE8:
	mov r0, sb
	movs r1, #0x98
	movs r2, #0xf
	bl sub_08043418
	movs r5, #0
	ldr r0, _08046C3C @ =gUnknown_085D3DD0
	ldr r6, _08046C40 @ =gUnknown_03003FC0
	adds r0, #0x50
	mov sl, r0
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
_08046C02:
	adds r3, r6, #0
	adds r3, #0x2c
	ldr r0, _08046C44 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08046C48 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r4, r0, r2
	ldrb r1, [r4, #0x1e]
	lsls r0, r1, #4
	adds r0, r0, r1
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r2, r0, #2
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _08046C4C
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	b _08046C52
	.align 2, 0
_08046C34: .4byte gUnknown_085D583C
_08046C38: .4byte gUnknown_084C2112
_08046C3C: .4byte gUnknown_085D3DD0
_08046C40: .4byte gUnknown_03003FC0
_08046C44: .4byte gUnknown_030033EC
_08046C48: .4byte gUnknown_08499598
_08046C4C:
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r2, r1
_08046C52:
	add r0, sl
	ldr r2, [r0]
	ldr r1, _08046CA8 @ =gUnknown_084C212A
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	adds r1, r4, r1
	ldrb r0, [r1]
	lsls r0, r0, #5
	adds r0, r7, r0
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, sb
	beq _08046C9A
	ldr r0, _08046CAC @ =gUnknown_084C20C3
	adds r0, r4, r0
	ldrb r0, [r0]
	ldr r3, _08046CB0 @ =gUnknown_084C2131
	ldr r1, [sp, #0xc]
	lsls r2, r1, #1
	adds r1, r2, r3
	ldrb r1, [r1]
	add r1, r8
	adds r1, #2
	adds r2, #1
	adds r2, r2, r3
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_08046C9A:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08046C02
	b _08046D0C
	.align 2, 0
_08046CA8: .4byte gUnknown_084C212A
_08046CAC: .4byte gUnknown_084C20C3
_08046CB0: .4byte gUnknown_084C2131
_08046CB4:
	movs r5, #0
	ldr r0, _08046D1C @ =gUnknown_085D583C
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r0, #0x10
	adds r1, r1, r0
	ldr r0, [r1]
	movs r2, #0x38
	add r2, r8
	mov sb, r2
	cmp r5, r0
	bge _08046D02
	ldr r6, _08046D20 @ =gUnknown_084C2112
	adds r7, r1, #0
_08046CD2:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r2, r4, #1
	adds r0, r2, r6
	ldrb r1, [r0]
	adds r1, #0x50
	add r1, r8
	adds r2, #1
	adds r2, r2, r6
	ldrb r2, [r2]
	adds r2, #0x19
	movs r0, #0
	str r0, [sp]
	movs r0, #0x39
	movs r3, #0
	bl sub_0801F34C
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [r7]
	cmp r4, r0
	blt _08046CD2
_08046D02:
	mov r0, sb
	movs r1, #0x55
	movs r2, #0xe
	bl sub_08043418
_08046D0C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046D1C: .4byte gUnknown_085D583C
_08046D20: .4byte gUnknown_084C2112

