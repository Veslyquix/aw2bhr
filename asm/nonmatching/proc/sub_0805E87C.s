	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E87C
sub_0805E87C: @ 0x0805E87C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r5, _0805E8F0 @ =gUnknown_0816DA80
	ldr r0, [r5]
	ldr r0, [r0]
	mov r8, r0
	ldr r4, _0805E8F4 @ =gUnknown_0816DA84
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_080202A4
	movs r0, #0x79
	bl sub_0801FD9C
	mov r0, r8
	bl sub_0805A268
	ldr r0, _0805E8F8 @ =0x0000270F
	mov sl, r0
	add r7, sp, #4
	movs r1, #1
	mov sb, r1
_0805E8B0:
	ldr r0, _0805E8FC @ =0xFFFF0000
	ldr r1, [sp, #4]
	ands r1, r0
	mov r2, sl
	orrs r1, r2
	str r1, [sp, #4]
	mov r0, r8
	add r1, sp, #4
	bl sub_08059C00
	ldrh r0, [r7]
	cmp r0, sl
	bne _0805E90C
	ldr r4, _0805E900 @ =gUnknown_030013EC
	ldr r0, _0805E904 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	movs r3, #1
	str r3, [sp]
	ldr r4, [r4]
	movs r3, #0x78
	bl _call_via_r4
	ldr r0, _0805E908 @ =gUnknown_03003F20
	ldr r0, [r0]
	mov r8, r0
	bl sub_0805A388
	b _0805E9AA
	.align 2, 0
_0805E8F0: .4byte gUnknown_0816DA80
_0805E8F4: .4byte gUnknown_0816DA84
_0805E8F8: .4byte 0x0000270F
_0805E8FC: .4byte 0xFFFF0000
_0805E900: .4byte gUnknown_030013EC
_0805E904: .4byte gUnknown_030040D8
_0805E908: .4byte gUnknown_03003F20
_0805E90C:
	ldr r0, _0805E9C8 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r4, [r7, #2]
	lsls r1, r4, #1
	ldr r3, _0805E9CC @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r3, [r7]
	adds r0, r0, r3
	adds r2, #0x12
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805E9A4
	ldr r2, _0805E9D0 @ =gUnknown_08499594
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r5, r1, r0
	ldr r1, _0805E9D4 @ =gUnknown_03003340
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r6, _0805E9D8 @ =gUnknown_030040D8
	ldr r0, [r6]
	bl sub_08058224
	cmp r4, r0
	bgt _0805E9A4
	ldrb r0, [r5]
	cmp r0, #0x16
	bne _0805E9A4
	ldr r0, [r6]
	ldrb r0, [r0]
	subs r0, #0x13
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0805E9A4
	ldrb r2, [r5, #9]
	lsrs r1, r2, #6
	adds r1, #1
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #9]
	ldr r2, [r6]
	ldrb r0, [r2, #9]
	movs r3, #0x39
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strb r0, [r2, #9]
	ldr r2, [r6]
	ldrb r0, [r2, #9]
	adds r3, #0x31
	adds r1, r3, #0
	ands r0, r1
	strb r0, [r2, #9]
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #7
	movs r3, #0
	bl sub_0805D648
_0805E9A4:
	add r0, sp, #4
	bl sub_080591E4
_0805E9AA:
	movs r3, #1
	rsbs r3, r3, #0
	add sb, r3
	mov r0, sb
	cmp r0, #0
	blt _0805E9B8
	b _0805E8B0
_0805E9B8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E9C8: .4byte gUnknown_08499590
_0805E9CC: .4byte 0x0000417A
_0805E9D0: .4byte gUnknown_08499594
_0805E9D4: .4byte gUnknown_03003340
_0805E9D8: .4byte gUnknown_030040D8

