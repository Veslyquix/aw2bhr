	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029A48
sub_08029A48: @ 0x08029A48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r6, #0
	ldrb r1, [r4, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08029A74
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08029A76
_08029A74:
	movs r1, #0
_08029A76:
	adds r5, r1, #0
	ldrb r1, [r4, #6]
	lsls r1, r1, #0x19
	ldr r3, _08029AEC @ =gUnknown_085D5ABC
	ldrb r2, [r4]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r3
	lsrs r1, r1, #0x19
	ldrb r0, [r0, #0x10]
	cmp r1, r0
	beq _08029ADE
	mov r8, r3
_08029A90:
	cmp r7, #0
	beq _08029AB2
	ldr r0, _08029AF0 @ =gUnknown_030033EC
	ldrh r2, [r0]
	ldr r0, _08029AF4 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r5
	blo _08029ADE
	adds r0, r2, #0
	adds r1, r5, #0
	bl sub_08025B28
_08029AB2:
	adds r6, r6, r5
	ldrb r2, [r4, #6]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x19
	adds r0, #1
	movs r1, #0x7f
	ands r0, r1
	movs r3, #0x80
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, #6]
	lsls r2, r2, #0x19
	ldrb r1, [r4]
	movs r0, #0x5c
	muls r0, r1, r0
	add r0, r8
	lsrs r2, r2, #0x19
	ldrb r0, [r0, #0x10]
	cmp r2, r0
	bne _08029A90
_08029ADE:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08029AEC: .4byte gUnknown_085D5ABC
_08029AF0: .4byte gUnknown_030033EC
_08029AF4: .4byte gUnknown_08499598

