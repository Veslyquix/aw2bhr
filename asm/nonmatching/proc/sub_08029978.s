	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029978
sub_08029978: @ 0x08029978
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r6, #0
	ldrb r1, [r5, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _080299BC
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	ldr r4, _080299B8 @ =gUnknown_08090B6C
	ldr r3, [r4]
	ldrb r2, [r5]
	movs r1, #0x5c
	muls r1, r2, r1
	adds r1, r1, r3
	ldrh r1, [r1, #8]
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _080299BE
	.align 2, 0
_080299B8: .4byte gUnknown_08090B6C
_080299BC:
	movs r1, #0
_080299BE:
	ldr r0, _08029A38 @ =gUnknown_08090B6C
	adds r4, r1, #0
	ldrh r1, [r5, #4]
	lsls r1, r1, #0x15
	ldr r3, [r0]
	ldrb r2, [r5]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r3
	lsrs r1, r1, #0x1c
	ldrb r0, [r0, #0xb]
	cmp r1, r0
	beq _08029A2A
	adds r7, r3, #0
_080299DA:
	mov r0, r8
	cmp r0, #0
	beq _080299FE
	ldr r0, _08029A3C @ =gUnknown_030033EC
	ldrh r2, [r0]
	ldr r0, _08029A40 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r4
	blo _08029A2A
	adds r0, r2, #0
	adds r1, r4, #0
	bl sub_08025B28
_080299FE:
	adds r6, r6, r4
	ldrh r2, [r5, #4]
	lsls r0, r2, #0x15
	lsrs r0, r0, #0x1c
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #7
	ldr r3, _08029A44 @ =0xFFFFF87F
	adds r1, r3, #0
	ands r2, r1
	orrs r2, r0
	strh r2, [r5, #4]
	lsls r2, r2, #0x15
	ldrb r1, [r5]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r7
	lsrs r2, r2, #0x1c
	ldrb r0, [r0, #0xb]
	cmp r2, r0
	bne _080299DA
_08029A2A:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08029A38: .4byte gUnknown_08090B6C
_08029A3C: .4byte gUnknown_030033EC
_08029A40: .4byte gUnknown_08499598
_08029A44: .4byte 0xFFFFF87F

