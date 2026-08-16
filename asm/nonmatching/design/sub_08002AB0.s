	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002AB0
sub_08002AB0: @ 0x08002AB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r2, _08002B20 @ =gUnknown_0808D718
	ldr r4, [r2]
	ldr r0, [r4]
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	adds r5, r2, #0
	ldr r1, _08002B24 @ =gUnknown_0808D71C
	mov sl, r1
	cmp r0, #0
	beq _08002B74
	ldr r1, _08002B28 @ =0x0000048C
	ldr r2, _08002B2C @ =gUnknown_08485B52
	movs r0, #0x78
	movs r3, #0
	bl sub_0801BD00
	ldr r2, [r4]
	ldrh r0, [r2, #2]
	cmp r0, #0x33
	bne _08002B70
	movs r0, #7
	ldrsb r0, [r2, r0]
	movs r1, #0x3a
	ldrsh r2, [r2, r1]
	adds r7, r2, #3
	cmp r0, #0
	bne _08002AF6
	adds r7, r2, #4
_08002AF6:
	cmp r7, #9
	ble _08002AFC
	subs r7, #0xa
_08002AFC:
	mov r0, sl
	ldr r1, [r0]
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #6
	cmp r0, #8
	bhi _08002B74
	lsls r0, r0, #2
	ldr r1, _08002B30 @ =_08002B34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08002B20: .4byte gUnknown_0808D718
_08002B24: .4byte gUnknown_0808D71C
_08002B28: .4byte 0x0000048C
_08002B2C: .4byte gUnknown_08485B52
_08002B30: .4byte _08002B34
_08002B34: @ jump table
	.4byte _08002B58 @ case 0
	.4byte _08002B74 @ case 1
	.4byte _08002B58 @ case 2
	.4byte _08002B74 @ case 3
	.4byte _08002B58 @ case 4
	.4byte _08002B58 @ case 5
	.4byte _08002B74 @ case 6
	.4byte _08002B74 @ case 7
	.4byte _08002B58 @ case 8
_08002B58:
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, #0x6b
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08002B74
	bl sub_08007B54
	b _08002B74
_08002B70:
	bl sub_08007B74
_08002B74:
	ldr r0, [r5]
	ldr r0, [r0]
	movs r1, #0x3a
	ldrsh r7, [r0, r1]
	movs r0, #9
	mov sb, r0
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	mov r8, r0
_08002B88:
	mov r1, sl
	ldr r0, [r1]
	mov r1, r8
	adds r6, r1, r0
	movs r0, #0x1c
	add r8, r0
	adds r7, #1
	cmp r7, #9
	ble _08002BA0
	ldr r1, _08002C34 @ =0xFFFFFEE8
	add r8, r1
	subs r7, #0xa
_08002BA0:
	ldr r5, [r6]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08002C18
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _08002BD8
	movs r1, #6
	ldrsh r0, [r6, r1]
	adds r0, #1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	subs r1, #4
	ldr r2, [r6, #0x10]
	asrs r2, r2, #8
	adds r2, #0x21
	ldrh r3, [r6, #4]
	movs r4, #0x20
	ands r5, r4
	str r5, [sp]
	ldr r4, [r6]
	movs r5, #8
	ands r4, r5
	str r4, [sp, #4]
	bl sub_08002964
_08002BD8:
	ldr r5, [r6]
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	bne _08002C0E
	movs r1, #6
	ldrsh r0, [r6, r1]
	adds r0, #1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	ldr r2, [r6, #0x10]
	asrs r2, r2, #8
	ldrh r3, [r6, #4]
	movs r4, #0x10
	ands r5, r4
	str r5, [sp]
	ldr r4, [r6]
	movs r5, #0x80
	lsls r5, r5, #1
	ands r4, r5
	str r4, [sp, #4]
	ldr r4, [r6]
	movs r5, #8
	ands r4, r5
	str r4, [sp, #8]
	bl sub_0800272C
_08002C0E:
	ldr r0, [r6]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6]
_08002C18:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	bge _08002B88
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C34: .4byte 0xFFFFFEE8

