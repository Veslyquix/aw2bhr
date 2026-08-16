	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08001DAC
sub_08001DAC: @ 0x08001DAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r2, _08001DE8 @ =gUnknown_0808D70C
	ldr r4, [r2]
	ldr r3, [r4]
	movs r0, #8
	ldrsh r1, [r3, r0]
	ldr r0, _08001DEC @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r6, r1, r0
	movs r1, #1
	str r1, [sp, #0xc]
	adds r0, r3, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	cmp r0, #1
	bne _08001DDE
	b _08002278
_08001DDE:
	cmp r0, #1
	bgt _08001DF0
	cmp r0, #0
	beq _08001DF6
	b _08001E76
	.align 2, 0
_08001DE8: .4byte gUnknown_0808D70C
_08001DEC: .4byte gUnknown_08499590
_08001DF0:
	cmp r0, #0xa
	beq _08001E3A
	b _08001E76
_08001DF6:
	adds r1, r3, #0
	adds r1, #0x54
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _08001E0C
	movs r0, #8
	strh r0, [r1]
_08001E0C:
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x50
	adds r0, r2, #0
	adds r0, #0x54
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb7
	ble _08001E34
	movs r0, #0xb8
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x4c
	mov r4, sp
	ldrh r4, [r4, #0xc]
	strh r4, [r0]
_08001E34:
	movs r7, #0
	str r7, [sp, #0xc]
	b _08001E76
_08001E3A:
	adds r1, r3, #0
	adds r1, #0x54
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _08001E50
	movs r0, #8
	strh r0, [r1]
_08001E50:
	ldr r3, [r4]
	adds r2, r3, #0
	adds r2, #0x50
	adds r0, r3, #0
	adds r0, #0x54
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x6a
	bgt _08001E76
	movs r0, #0x6a
	strh r0, [r2]
	adds r1, r3, #0
	adds r1, #0x4c
	movs r0, #0xb
	strh r0, [r1]
_08001E76:
	ldr r0, _08001E98 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	adds r3, r1, #0
	adds r3, #0x4a
	ldrh r0, [r3]
	cmp r0, #0x1e
	beq _08001F06
	cmp r0, #0x1e
	bgt _08001EA2
	cmp r0, #0xa
	beq _08001EB6
	cmp r0, #0xa
	bgt _08001E9C
	cmp r0, #0
	beq _08001F06
	b _08001F84
	.align 2, 0
_08001E98: .4byte gUnknown_0200B0B0
_08001E9C:
	cmp r0, #0x14
	beq _08001EE4
	b _08001F84
_08001EA2:
	cmp r0, #0x6e
	beq _08001F50
	cmp r0, #0x6e
	bgt _08001EB0
	cmp r0, #0x64
	beq _08001F20
	b _08001F84
_08001EB0:
	cmp r0, #0x78
	beq _08001F78
	b _08001F84
_08001EB6:
	adds r2, r1, #0
	adds r2, #0x4e
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x8c
	lsls r1, r1, #5
	subs r1, r1, r0
	asrs r1, r1, #3
	ldrh r4, [r2]
	adds r1, r1, r4
	strh r1, [r2]
	lsls r1, r1, #0x10
	ldr r0, _08001EDC @ =0x0EFF0000
	cmp r1, r0
	ble _08001F84
	ldr r0, _08001EE0 @ =0x0000FD80
	strh r0, [r2]
	movs r0, #0x14
	b _08001F82
	.align 2, 0
_08001EDC: .4byte 0x0EFF0000
_08001EE0: .4byte 0x0000FD80
_08001EE4:
	adds r2, r1, #0
	adds r2, #0x4e
	movs r7, #0
	ldrsh r1, [r2, r7]
	movs r0, #0xa0
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08001F84
	movs r0, #0
	strh r0, [r2]
	movs r0, #0x1e
	b _08001F82
_08001F06:
	cmp r6, #6
	bgt _08001F84
	ldr r0, _08001F1C @ =gUnknown_0200B0B0
	ldr r0, [r0]
	movs r1, #1
	strh r1, [r0, #0x3e]
	adds r0, #0x4a
	movs r1, #0x64
	strh r1, [r0]
	b _08001F84
	.align 2, 0
_08001F1C: .4byte gUnknown_0200B0B0
_08001F20:
	adds r2, r1, #0
	adds r2, #0x4e
	movs r4, #0
	ldrsh r0, [r2, r4]
	ldr r1, _08001F48 @ =0xFFFFFC40
	subs r1, r1, r0
	asrs r1, r1, #3
	ldrh r7, [r2]
	adds r1, r1, r7
	strh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _08001F4C @ =0xFFFFFD80
	cmp r1, r0
	bge _08001F84
	movs r0, #0x8d
	lsls r0, r0, #5
	strh r0, [r2]
	movs r0, #0x6e
	b _08001F82
	.align 2, 0
_08001F48: .4byte 0xFFFFFC40
_08001F4C: .4byte 0xFFFFFD80
_08001F50:
	adds r2, r1, #0
	adds r2, #0x4e
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0xb4
	lsls r0, r0, #4
	subs r0, r0, r1
	asrs r0, r0, #3
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xca
	lsls r1, r1, #4
	cmp r0, r1
	bgt _08001F84
	strh r1, [r2]
	movs r0, #0x78
	b _08001F82
_08001F78:
	cmp r6, #7
	ble _08001F84
	movs r0, #0
	strh r0, [r1, #0x3e]
	movs r0, #0xa
_08001F82:
	strh r0, [r3]
_08001F84:
	ldr r5, _08001FE0 @ =gUnknown_0200B0B0
	ldr r3, [r5]
	adds r0, r3, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x14
	movs r1, #7
	ldrsb r1, [r3, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _08001FE4
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08001FC8
	adds r1, r6, #7
	adds r0, r3, #0
	adds r0, #0x50
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r2, #0x26
	ldrh r3, [r3, #0x2a]
	ldr r7, [sp, #0x10]
	str r7, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	bl sub_08002964
_08001FC8:
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r5, [r0, r2]
	ldrh r1, [r1, #0x2a]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #8
	bne _08002014
	adds r5, #6
	b _08002014
	.align 2, 0
_08001FE0: .4byte gUnknown_0200B0B0
_08001FE4:
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0800200C
	adds r1, r6, #7
	adds r0, r3, #0
	adds r0, #0x50
	movs r7, #0
	ldrsh r2, [r0, r7]
	adds r2, #0x26
	ldrh r3, [r3, #0x24]
	str r4, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	bl sub_080029F4
_0800200C:
	ldr r0, [r5]
	adds r0, #0x50
	movs r1, #0
	ldrsh r5, [r0, r1]
_08002014:
	ldr r4, _0800203C @ =gUnknown_0200B0B0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	bne _08002024
	b _0800219A
_08002024:
	adds r0, r2, #0
	adds r0, #0x66
	ldrb r3, [r0]
	cmp r3, #9
	beq _0800205E
	cmp r3, #9
	bgt _08002040
	cmp r3, #0
	beq _08002046
	cmp r3, #8
	beq _08002062
	b _0800214C
	.align 2, 0
_0800203C: .4byte gUnknown_0200B0B0
_08002040:
	cmp r3, #0xa
	beq _0800206E
	b _0800214C
_08002046:
	adds r1, r2, #0
	adds r1, #0x67
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x66
	movs r1, #8
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x68
	strh r3, [r0]
	b _0800214C
_0800205E:
	bl sub_08000C68
_08002062:
	ldr r0, _08002178 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	adds r1, #0x66
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0800206E:
	ldr r2, _08002178 @ =gUnknown_0200B0B0
	mov sb, r2
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x68
	ldrh r0, [r1]
	adds r0, #0x20
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0800208C
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_0800208C:
	mov r3, sb
	ldr r1, [r3]
	adds r1, #0x68
	movs r4, #0
	ldrsh r2, [r1, r4]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r0, r7, r2
	asrs r4, r0, #4
	ldr r0, _0800217C @ =gUnknown_0808F100
	mov r8, r0
	movs r0, #0xff
	ands r4, r0
	adds r0, r4, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #4
	mov sl, r0
	adds r0, r2, #0
	movs r1, #2
	cmp r0, #0
	beq _080020C0
	adds r1, r2, #0
_080020C0:
	mov r0, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x14]
	lsls r0, r4, #1
	add r0, r8
	movs r1, #0
	ldrsh r4, [r0, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #4
	mov r2, sb
	ldr r0, [r2]
	adds r2, r0, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r1, #2
	cmp r0, #0
	beq _080020FA
	adds r1, r0, #0
_080020FA:
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x14]
	mov r2, r8
	adds r3, r4, #0
	bl sub_0801E108
	mov r2, sb
	ldr r1, [r2]
	adds r1, #0x67
	ldrb r0, [r1]
	subs r0, #1
	movs r2, #0
	strb r0, [r1]
	mov r3, sb
	ldr r1, [r3]
	adds r0, r1, #0
	adds r0, #0x67
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0800214C
	adds r0, r1, #0
	adds r0, #0x66
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, #0x65
	strb r2, [r0]
_0800214C:
	ldr r0, _08002178 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080021F0
	ldr r7, [sp, #0x10]
	cmp r7, #0
	bne _08002180
	adds r1, r6, #0
	adds r1, #0xb
	ldrh r3, [r2, #0x2a]
	movs r0, #1
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	b _080021C6
	.align 2, 0
_08002178: .4byte gUnknown_0200B0B0
_0800217C: .4byte gUnknown_0808F100
_08002180:
	adds r1, r6, #0
	adds r1, #0xb
	ldrh r3, [r2, #0x24]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	ldr r2, [sp, #0xc]
	str r2, [sp, #8]
	movs r0, #0
	adds r2, r5, #0
	bl sub_08002844
	b _080021F0
_0800219A:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080021F0
	ldr r3, [sp, #0x10]
	cmp r3, #0
	bne _080021D0
	adds r1, r6, #0
	adds r1, #0xb
	ldrh r3, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	ldr r4, [sp, #0xc]
	str r4, [sp, #8]
_080021C6:
	movs r0, #0
	adds r2, r5, #0
	bl sub_0800272C
	b _080021F0
_080021D0:
	adds r1, r6, #0
	adds r1, #0xb
	ldrh r3, [r2, #0x24]
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	ldr r7, [sp, #0xc]
	str r7, [sp, #8]
	movs r0, #0
	adds r2, r5, #0
	bl sub_08002844
_080021F0:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08003088
	ldr r5, _08002288 @ =gUnknown_0200B0B0
	ldr r0, [r5]
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x9f
	bgt _08002278
	adds r0, r6, #0
	movs r1, #0x26
	bl sub_08002510
	ldr r2, [r5]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08002264
	adds r0, r2, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r1, #0xa
	adds r0, r6, #0
	bl sub_08002298
	adds r1, r6, #2
	ldr r0, _0800228C @ =0x000001FF
	ands r1, r0
	ldr r0, [r5]
	adds r0, #0x50
	movs r3, #0
	ldrsh r2, [r0, r3]
	subs r2, #1
	movs r0, #0xff
	ands r2, r0
	str r4, [sp]
	movs r0, #0xaa
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r5]
	adds r0, #0x50
	movs r4, #0
	ldrsh r2, [r0, r4]
	ldr r3, _08002290 @ =gUnknown_08485B2C
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #5
	adds r1, r6, #0
	bl sub_0801BEBC
_08002264:
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	cmp r0, #4
	beq _08002278
	ldr r0, _08002294 @ =gUnknown_084891C0
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
_08002278:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002288: .4byte gUnknown_0200B0B0
_0800228C: .4byte 0x000001FF
_08002290: .4byte gUnknown_08485B2C
_08002294: .4byte gUnknown_084891C0

