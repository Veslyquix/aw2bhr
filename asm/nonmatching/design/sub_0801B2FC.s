	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B2FC
sub_0801B2FC: @ 0x0801B2FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	ldr r0, _0801B3F0 @ =gUnknown_0200CC88
	movs r1, #0
	movs r2, #0xf
	adds r0, #0x7c
_0801B318:
	str r1, [r0]
	subs r0, #4
	subs r2, #1
	cmp r2, #0
	bge _0801B318
	ldr r1, _0801B3F4 @ =gUnknown_0200CD08
	movs r0, #0
	str r0, [r1]
	movs r4, #0
	ldr r7, _0801B3F8 @ =gUnknown_0200CC38
	ldr r1, _0801B3FC @ =gUnknown_02002000
	mov sl, r1
_0801B330:
	adds r6, r4, r7
	adds r0, r7, #0
	adds r0, #0x10
	adds r5, r4, r0
	movs r0, #0xff
	strb r0, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	adds r0, #0x20
	adds r0, r4, r0
	movs r1, #0
	strb r1, [r0]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl sub_0801B018
	adds r2, r4, #1
	mov sb, r2
	cmp r0, #0
	bne _0801B3CC
	ldr r0, _0801B3F0 @ =gUnknown_0200CC88
	mov ip, r0
	lsls r1, r4, #2
	add r1, ip
	ldr r2, _0801B3FC @ =gUnknown_02002000
	ldr r0, [r2, #8]
	str r0, [r1]
	ldrb r0, [r2, #0xd]
	strb r0, [r5]
	ldrb r0, [r2, #0xd]
	strb r0, [r6]
	adds r3, r7, #0
	adds r3, #0x30
	adds r1, r4, r3
	ldrb r0, [r2, #0xc]
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _0801B3A6
	cmp r8, r0
	ble _0801B3CC
	mov r1, r8
	lsls r0, r1, #2
	add r0, ip
	ldr r0, [r0]
	ldr r1, [r2, #8]
	cmp r0, r1
	blo _0801B3A6
	cmp r0, r1
	bne _0801B3CC
	mov r1, r8
	adds r0, r1, r3
	ldrb r0, [r0]
	ldrb r2, [r2, #0xc]
	cmp r0, r2
	bls _0801B3CC
_0801B3A6:
	mov r8, r4
	adds r2, r4, #1
	mov sb, r2
	ldr r1, _0801B3F0 @ =gUnknown_0200CC88
	ldr r0, _0801B3FC @ =gUnknown_02002000
	adds r3, r0, #0
	adds r3, #0x10
	adds r1, #0x40
	movs r2, #0xf
_0801B3B8:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #1
	cmp r2, #0
	bge _0801B3B8
	ldr r1, _0801B3F4 @ =gUnknown_0200CD08
	mov r2, sl
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r1]
_0801B3CC:
	ldr r0, _0801B400 @ =gUnknown_0200CC78
	adds r1, r4, r0
	ldr r2, _0801B404 @ =gUnknown_02002FFF
	ldrb r0, [r2]
	strb r0, [r1]
	mov r4, sb
	cmp r4, #0xf
	ble _0801B330
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _0801B408
	ldr r0, [sp]
	cmp r0, #0
	bne _0801B49A
	bl sub_0801ADC8
	b _0801B49A
	.align 2, 0
_0801B3F0: .4byte gUnknown_0200CC88
_0801B3F4: .4byte gUnknown_0200CD08
_0801B3F8: .4byte gUnknown_0200CC38
_0801B3FC: .4byte gUnknown_02002000
_0801B400: .4byte gUnknown_0200CC78
_0801B404: .4byte gUnknown_02002FFF
_0801B408:
	movs r0, #0
	bl sub_0801B120
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0801B440 @ =0x0000FFFF
	cmp r8, r0
	bne _0801B448
	movs r2, #0xff
	ldr r1, _0801B444 @ =gUnknown_0200CC38
	movs r4, #0xf
_0801B420:
	ldrb r0, [r1, #0x10]
	orrs r0, r2
	strb r0, [r1, #0x10]
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	subs r4, #1
	cmp r4, #0
	bge _0801B420
	ldr r1, [sp]
	cmp r1, #0
	bne _0801B49A
	bl sub_0801ADC8
	b _0801B49A
	.align 2, 0
_0801B440: .4byte 0x0000FFFF
_0801B444: .4byte gUnknown_0200CC38
_0801B448:
	mov r2, r8
	movs r4, #0
	ldr r3, _0801B4AC @ =gUnknown_0200CC68
	adds r5, r3, #0
	subs r5, #0x10
	movs r6, #0x10
_0801B454:
	adds r0, r4, r5
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801B46E
	adds r0, r4, r3
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0801B46E
	adds r2, r4, #0
_0801B46E:
	adds r4, #1
	cmp r4, #0xf
	ble _0801B454
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	bl sub_0801B018
	movs r4, #0
	ldr r5, _0801B4B0 @ =gUnknown_02002FEF
	ldr r2, _0801B4B4 @ =gUnknown_0200CC38
	movs r3, #0xff
_0801B484:
	adds r1, r4, r5
	ldrb r0, [r1]
	strb r0, [r2, #0x10]
	ldrb r1, [r1]
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r2]
	adds r2, #1
	adds r4, #1
	cmp r4, #0xf
	ble _0801B484
_0801B49A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B4AC: .4byte gUnknown_0200CC68
_0801B4B0: .4byte gUnknown_02002FEF
_0801B4B4: .4byte gUnknown_0200CC38

