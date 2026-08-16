	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029AF8
sub_08029AF8: @ 0x08029AF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r0, #0
	mov r8, r0
	ldr r4, _08029BC0 @ =gUnknown_08090B70
	ldr r0, [r4]
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl sub_08042C9C
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov sl, r4
	cmp r7, #0
	beq _08029B9E
	movs r4, #0x7f
_08029B2A:
	ldrb r1, [r5, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08029B44
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	cmp r0, #9
	beq _08029B9E
_08029B44:
	mov r1, sb
	cmp r1, #0
	beq _08029B6A
	mov r1, sl
	ldr r0, [r1]
	ldrh r2, [r0]
	ldr r0, _08029BC4 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	blo _08029B9E
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_08025B28
_08029B6A:
	add r8, r6
	ldrb r1, [r5, #4]
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	adds r0, #0xa
	ands r0, r4
	movs r3, #0x80
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, #4]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #0x64
	bls _08029B92
	ands r2, r3
	movs r0, #0x64
	orrs r2, r0
	strb r2, [r5, #4]
_08029B92:
	lsls r0, r7, #0x10
	ldr r1, _08029BC8 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	cmp r0, #0
	bne _08029B2A
_08029B9E:
	ldrb r1, [r5, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08029BCC
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	b _08029BCE
	.align 2, 0
_08029BC0: .4byte gUnknown_08090B70
_08029BC4: .4byte gUnknown_08499598
_08029BC8: .4byte 0xFFFF0000
_08029BCC:
	movs r1, #0
_08029BCE:
	movs r0, #0x7f
	ands r0, r1
	ldrb r2, [r5, #4]
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #4]
	mov r0, r8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

