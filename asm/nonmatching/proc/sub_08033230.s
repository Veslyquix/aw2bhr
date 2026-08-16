	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033230
sub_08033230: @ 0x08033230
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08033248
	b _08033386
_08033248:
	movs r4, #1
	ldr r0, _08033284 @ =gUnknown_08090D6C
	mov sl, r0
	ldr r1, _08033288 @ =gUnknown_08090D70
	mov ip, r1
	ldr r0, _0803328C @ =gUnknown_08090D74
	mov sb, r0
	mov r1, sl
	ldr r7, [r1]
	movs r6, #1
	mov r0, ip
	ldr r5, [r0]
_08033260:
	ldrb r3, [r7, #0x1d]
	asrs r3, r4
	ands r3, r6
	cmp r3, #0
	bne _08033290
	ldr r2, [r5]
	adds r0, r6, #0
	lsls r0, r4
	ldrb r1, [r2, #9]
	bics r1, r0
	ldrb r0, [r2, #9]
	strb r1, [r2, #9]
	ldr r0, [r5]
	adds r0, #0xa
	adds r0, r0, r4
	ldrb r1, [r0]
	strb r3, [r0]
	b _080332C0
	.align 2, 0
_08033284: .4byte gUnknown_08090D6C
_08033288: .4byte gUnknown_08090D70
_0803328C: .4byte gUnknown_08090D74
_08033290:
	ldrb r0, [r7, #0x1e]
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	bne _080332A6
	ldr r0, [r5]
	adds r0, #0xa
	adds r0, r0, r4
	ldrb r1, [r0]
	strb r6, [r0]
	b _080332C0
_080332A6:
	ldr r2, [r5]
	adds r1, r6, #0
	lsls r1, r4
	ldrb r0, [r2, #9]
	orrs r1, r0
	ldrb r0, [r2, #9]
	strb r1, [r2, #9]
	ldr r0, [r5]
	adds r0, #0xa
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r1, #3
	strb r1, [r0]
_080332C0:
	adds r4, #1
	cmp r4, #3
	ble _08033260
	mov r1, sl
	ldr r0, [r1]
	ldrb r1, [r0, #0x1e]
	movs r3, #0xe
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080332E6
	mov r1, ip
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r2, [r1, #9]
	movs r0, #1
	ldrb r3, [r1, #9]
	orrs r0, r2
	b _080332F4
_080332E6:
	mov r1, ip
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r2, [r1, #9]
	adds r0, r3, #0
	ands r0, r2
	ldrb r2, [r1, #9]
_080332F4:
	strb r0, [r1, #9]
	mov r0, sl
	ldr r2, [r0]
	ldrb r1, [r2, #0x1e]
	movs r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08033350
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	beq _0803331A
	cmp r0, #0xd1
	beq _08033326
	mov r1, sb
	ldr r4, [r1]
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0
	b _08033330
_0803331A:
	mov r0, sb
	ldr r4, [r0]
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #2
	b _08033330
_08033326:
	mov r1, sb
	ldr r4, [r1]
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0xe
_08033330:
	movs r2, #0
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0, #0x18]
	cmp r0, #0xdf
	bls _08033364
	mov r0, sb
	ldr r4, [r0]
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0xe
	b _0803335A
_08033350:
	mov r1, sb
	ldr r4, [r1]
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0
_0803335A:
	movs r2, #0
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
_08033364:
	mov r0, r8
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08033386
	ldr r0, _080333EC @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033386
	ldr r1, _080333F0 @ =gUnknown_0849BA68
	mov r0, r8
	bl Proc_GotoScript
_08033386:
	ldr r0, _080333EC @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	mov r4, r8
	adds r4, #0x64
	cmp r0, #0
	beq _080333CE
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080333CE
	ldr r1, _080333F4 @ =gUnknown_03003F70
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _080333CE
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	beq _080333CE
	movs r0, #1
	strh r0, [r4]
	ldr r0, _080333F8 @ =gUnknown_0861429C
	movs r1, #3
	bl Proc_Start
	ldr r2, _080333FC @ =gUnknown_030030E0
	ldrh r1, [r2]
	ldr r0, _08033400 @ =0x0000FFE0
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	mov r0, r8
	bl Proc_Break
_080333CE:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080333DC
	ldr r0, _080333F4 @ =gUnknown_03003F70
	bl sub_08062FF4
_080333DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080333EC: .4byte gUnknown_03002EE0
_080333F0: .4byte gUnknown_0849BA68
_080333F4: .4byte gUnknown_03003F70
_080333F8: .4byte gUnknown_0861429C
_080333FC: .4byte gUnknown_030030E0
_08033400: .4byte 0x0000FFE0

