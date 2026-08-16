	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002C38
sub_08002C38: @ 0x08002C38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r2, _08002CA4 @ =gUnknown_0808D720
	ldr r4, [r2]
	ldr r0, [r4]
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	adds r5, r2, #0
	ldr r1, _08002CA8 @ =gUnknown_0808D724
	mov sl, r1
	cmp r0, #0
	beq _08002CB8
	ldr r1, _08002CAC @ =0x0000048C
	ldr r2, _08002CB0 @ =gUnknown_08485B52
	movs r0, #0x78
	movs r3, #0
	bl sub_0801BD00
	ldr r2, [r4]
	ldrh r0, [r2, #2]
	cmp r0, #0x33
	bne _08002CB8
	movs r1, #0x3a
	ldrsh r0, [r2, r1]
	adds r7, r0, #3
	cmp r7, #7
	ble _08002C7A
	subs r7, r0, #5
_08002C7A:
	mov r1, sl
	ldr r0, [r1]
	lsls r1, r7, #3
	subs r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	cmp r0, #0x19
	beq _08002CB4
	adds r0, r2, #0
	adds r0, #0x6b
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08002CB8
	bl sub_08007B54
	b _08002CB8
	.align 2, 0
_08002CA4: .4byte gUnknown_0808D720
_08002CA8: .4byte gUnknown_0808D724
_08002CAC: .4byte 0x0000048C
_08002CB0: .4byte gUnknown_08485B52
_08002CB4:
	bl sub_08007B74
_08002CB8:
	ldr r0, [r5]
	ldr r0, [r0]
	movs r1, #0x3a
	ldrsh r7, [r0, r1]
	movs r0, #7
	mov sb, r0
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	mov r8, r0
_08002CCC:
	mov r1, sl
	ldr r0, [r1]
	mov r1, r8
	adds r6, r1, r0
	movs r0, #0x1c
	add r8, r0
	adds r7, #1
	cmp r7, #7
	ble _08002CE6
	movs r1, #0xe0
	rsbs r1, r1, #0
	add r8, r1
	subs r7, #8
_08002CE6:
	ldr r5, [r6]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08002D5E
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _08002D1E
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
	bl sub_080029F4
_08002D1E:
	ldr r5, [r6]
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	bne _08002D54
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
	bl sub_08002844
_08002D54:
	ldr r0, [r6]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6]
_08002D5E:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	bge _08002CCC
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

