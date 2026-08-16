	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024ABC
sub_08024ABC: @ 0x08024ABC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _08024B94 @ =gUnknown_08499594
	ldr r3, [r6]
	ldr r1, [r0]
	subs r1, r3, r1
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
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov sl, r4
	movs r7, #0
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r1, _08024B98 @ =gUnknown_085D5ABC
	ldrb r3, [r3]
	movs r0, #0x5c
	muls r0, r3, r0
	adds r0, r0, r1
	mov sb, r0
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	cmp r5, #1
	bne _08024BAC
	mov r2, r8
	ldr r0, [r2]
	ldrb r1, [r0]
	adds r0, r3, #0
	movs r2, #1
	bl sub_080433F8
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	str r3, [sp, #0xc]
	cmp r0, #0
	beq _08024B58
	ldr r0, _08024B9C @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	ldr r2, [r6]
	ldrb r2, [r2]
	mov ip, r2
	mov r2, r8
	ldr r2, [r2]
	ldrb r3, [r2]
	mov sl, r3
	str r5, [sp]
	mov r2, ip
	bl sub_08043070
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
_08024B58:
	mov r1, sb
	ldrb r0, [r1, #0xe]
	cmp r0, #1
	bne _08024C20
	ldr r2, [r6]
	ldrh r1, [r2, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08024C20
	mov r0, r8
	ldr r3, [r0]
	ldrb r1, [r3, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024BA0
	ldr r0, _08024B9C @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	ldrb r2, [r2]
	str r7, [sp]
	movs r3, #0x19
	b _08024C18
	.align 2, 0
_08024B94: .4byte gUnknown_08499594
_08024B98: .4byte gUnknown_085D5ABC
_08024B9C: .4byte gUnknown_08499598
_08024BA0:
	ldr r0, _08024BA8 @ =gUnknown_08499598
	ldr r0, [r0]
	b _08024C06
	.align 2, 0
_08024BA8: .4byte gUnknown_08499598
_08024BAC:
	mov r1, sb
	ldrb r0, [r1, #0xe]
	cmp r0, r5
	bgt _08024C20
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_08042D50
	cmp r5, r0
	bgt _08024C20
	ldr r2, [r6]
	ldrh r1, [r2, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08024C20
	ldr r3, [sp, #4]
	cmp r3, #1
	bne _08024C20
	mov r0, r8
	ldr r3, [r0]
	ldrb r1, [r3, #1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024C00
	ldr r0, _08024BFC @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	ldrb r2, [r2]
	str r7, [sp]
	movs r3, #0x19
	b _08024C18
	.align 2, 0
_08024BFC: .4byte gUnknown_08499598
_08024C00:
	ldr r0, _08024C38 @ =gUnknown_08499598
	ldr r0, [r0]
	mov r4, sl
_08024C06:
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	ldrb r2, [r2]
	ldrb r3, [r3]
	str r7, [sp]
_08024C18:
	bl sub_08043070
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08024C20:
	ldr r0, [sp, #8]
	cmp r7, r0
	bhi _08024C3C
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _08024C48
	movs r0, #5
	strh r0, [r6, #0x18]
	mov r2, sp
	ldrh r2, [r2, #8]
	strh r2, [r6, #0x10]
	b _08024C48
	.align 2, 0
_08024C38: .4byte gUnknown_08499598
_08024C3C:
	movs r0, #1
	strh r0, [r6, #0x18]
	strh r7, [r6, #0x10]
	ldrh r0, [r6, #0xa]
	subs r0, #1
	strh r0, [r6, #0xa]
_08024C48:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

