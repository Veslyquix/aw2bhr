	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041978
sub_08041978: @ 0x08041978
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08041A04 @ =gUnknown_08499594
	ldr r2, [r1]
	adds r7, r2, r0
	ldr r3, _08041A08 @ =gUnknown_08091340
	ldr r0, [r3]
	mov r8, r0
	ldr r4, [r0]
	subs r1, r4, r2
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	subs r2, r7, r2
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	cmp r5, #0
	bne _08041A10
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x15
	lsrs r1, r1, #0x1c
	subs r1, #1
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #7
	ldr r0, _08041A0C @ =0xFFFFF87F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	bl sub_08034F48
	bl sub_080424FC
	b _08041D2C
	.align 2, 0
_08041A04: .4byte gUnknown_08499594
_08041A08: .4byte gUnknown_08091340
_08041A0C: .4byte 0xFFFFF87F
_08041A10:
	ldr r1, _08041BE0 @ =gUnknown_030044B0
	ldr r0, _08041BE4 @ =gUnknown_03001FD4
	ldr r0, [r0]
	str r0, [r1, #8]
	ldr r0, _08041BE8 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldr r2, _08041BEC @ =gUnknown_03003100
	adds r1, r5, #0
	bl sub_080251BC
	ldr r5, _08041BF0 @ =gUnknown_03003F50
	mov r1, r8
	ldr r0, [r1]
	adds r1, r7, #0
	bl sub_08041D40
	strb r0, [r5]
	ldr r6, _08041BF4 @ =gUnknown_03004484
	movs r1, #1
	subs r1, r1, r0
	strb r1, [r6]
	ldr r1, _08041BF8 @ =gUnknown_0300450C
	ldrb r0, [r5]
	strh r0, [r1]
	ldr r4, _08041BFC @ =gUnknown_03004580
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, r1, r4
	ldr r0, _08041C00 @ =gUnknown_08499598
	ldr r0, [r0]
	mov ip, r0
	ldr r2, [sp, #4]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	strh r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r4
	ldr r3, [sp, #8]
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r2, r4, #2
	adds r1, r1, r2
	ldr r3, _08041C04 @ =gUnknown_0809131E
	mov r0, r8
	ldr r0, [r0]
	mov sl, r0
	ldrb r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrb r0, [r7]
	adds r0, r0, r3
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r2, r4, #4
	adds r1, r1, r2
	mov r8, r1
	ldr r3, _08041C08 @ =gUnknown_08091318
	ldr r1, _08041C0C @ =gUnknown_030013D0
	movs r0, #0x18
	ldrsh r1, [r1, r0]
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r1, r8
	strh r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r2
	mov r8, r1
	ldr r2, _08041C10 @ =gUnknown_030013B0
	mov sb, r2
	movs r1, #0x18
	ldrsh r0, [r2, r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	mov r2, r8
	strh r0, [r2]
	ldrb r0, [r5]
	lsls r0, r0, #4
	adds r2, r4, #6
	adds r0, r0, r2
	ldr r3, _08041C0C @ =gUnknown_030013D0
	ldrh r1, [r3, #4]
	strh r1, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #4
	adds r0, r0, r2
	mov r2, sb
	ldrh r1, [r2, #4]
	strh r1, [r0]
	ldrb r2, [r5]
	lsls r2, r2, #4
	movs r3, #8
	adds r3, r3, r4
	mov r8, r3
	add r2, r8
	ldr r0, _08041C14 @ =gUnknown_08499594
	ldr r3, [r0]
	mov r0, sl
	subs r1, r0, r3
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	adds r1, #0x59
	ldrb r0, [r1]
	strh r0, [r2]
	ldrb r2, [r6]
	lsls r2, r2, #4
	add r2, r8
	subs r3, r7, r3
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	adds r1, #0x59
	ldrb r0, [r1]
	strh r0, [r2]
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r2, r4, #0
	adds r2, #0xa
	adds r1, r1, r2
	mov r3, sl
	ldrb r0, [r3, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	strh r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrb r0, [r7, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	strh r0, [r1]
	ldrb r0, [r5]
	lsls r0, r0, #4
	adds r2, #2
	adds r0, r0, r2
	ldr r3, _08041C0C @ =gUnknown_030013D0
	ldrh r1, [r3, #8]
	strh r1, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #4
	adds r0, r0, r2
	mov r2, sb
	ldrh r1, [r2, #8]
	strh r1, [r0]
	ldrb r0, [r5]
	lsls r0, r0, #4
	adds r4, #0xe
	adds r0, r0, r4
	ldrh r1, [r3, #6]
	strh r1, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrh r1, [r2, #6]
	strh r1, [r0]
	ldr r1, _08041C18 @ =gUnknown_03004528
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r3, sl
	str r3, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r7, [r0]
	ldr r1, _08041C1C @ =gUnknown_03004520
	ldr r2, _08041C20 @ =gUnknown_08091350
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r3, #4]
	movs r0, #0x7f
	ands r0, r1
	ldr r3, _08041C24 @ =gUnknown_08091344
	mov sl, r3
	ldr r6, _08041C28 @ =gUnknown_08091348
	ldr r3, _08041C2C @ =gUnknown_0809134C
	mov r8, r3
	mov sb, r2
	cmp r0, #0
	beq _08041C30
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r4, r0, #1
	b _08041C32
	.align 2, 0
_08041BE0: .4byte gUnknown_030044B0
_08041BE4: .4byte gUnknown_03001FD4
_08041BE8: .4byte gUnknown_03003F38
_08041BEC: .4byte gUnknown_03003100
_08041BF0: .4byte gUnknown_03003F50
_08041BF4: .4byte gUnknown_03004484
_08041BF8: .4byte gUnknown_0300450C
_08041BFC: .4byte gUnknown_03004580
_08041C00: .4byte gUnknown_08499598
_08041C04: .4byte gUnknown_0809131E
_08041C08: .4byte gUnknown_08091318
_08041C0C: .4byte gUnknown_030013D0
_08041C10: .4byte gUnknown_030013B0
_08041C14: .4byte gUnknown_08499594
_08041C18: .4byte gUnknown_03004528
_08041C1C: .4byte gUnknown_03004520
_08041C20: .4byte gUnknown_08091350
_08041C24: .4byte gUnknown_08091344
_08041C28: .4byte gUnknown_08091348
_08041C2C: .4byte gUnknown_0809134C
_08041C30:
	movs r4, #0
_08041C32:
	ldr r0, _08041C5C @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	bl sub_08042C9C
	adds r5, r0, #0
	ldr r1, [r6]
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08041C60
	subs r0, #1
	movs r1, #0xa
	bl Div
	subs r1, r4, #1
	subs r1, r1, r0
	adds r6, r1, #0
	muls r6, r5, r6
	b _08041C64
	.align 2, 0
_08041C5C: .4byte gUnknown_030040D8
_08041C60:
	adds r6, r4, #0
	muls r6, r5, r6
_08041C64:
	ldrb r1, [r7, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08041C7E
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r4, r0, #1
	b _08041C80
_08041C7E:
	movs r4, #0
_08041C80:
	ldrb r1, [r7]
	ldr r0, [sp, #8]
	bl sub_08042C9C
	adds r5, r0, #0
	mov r0, r8
	ldr r1, [r0]
	movs r2, #8
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08041CA8
	subs r0, #1
	movs r1, #0xa
	bl Div
	subs r1, r4, #1
	subs r1, r1, r0
	adds r4, r1, #0
	muls r4, r5, r4
	b _08041CAA
_08041CA8:
	muls r4, r5, r4
_08041CAA:
	adds r0, r4, #0
	movs r1, #2
	bl Div
	adds r1, r0, #0
	adds r1, r6, r1
	ldr r0, [sp, #4]
	bl sub_080440E0
	adds r0, r6, #0
	movs r1, #2
	bl Div
	adds r1, r0, #0
	adds r1, r4, r1
	ldr r0, [sp, #8]
	bl sub_080440E0
	mov r1, sb
	ldr r0, [r1]
	ldrb r2, [r0, #9]
	cmp r2, #3
	bne _08041CF4
	ldr r0, _08041D10 @ =gUnknown_030033EC
	ldrh r1, [r0]
	mov r2, sl
	ldr r0, [r2]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	movs r2, #0
	cmp r0, #1
	bne _08041CF4
	movs r2, #2
_08041CF4:
	cmp r2, #0
	beq _08041D18
	bl sub_0802DCA4
	ldr r0, _08041D14 @ =gUnknown_0849FEF8
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r0]
	b _08041D2C
	.align 2, 0
_08041D10: .4byte gUnknown_030033EC
_08041D14: .4byte gUnknown_0849FEF8
_08041D18:
	bl sub_0802DCA4
	ldr r0, _08041D3C @ =gUnknown_0849FFB0
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0]
_08041D2C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041D3C: .4byte gUnknown_0849FFB0

