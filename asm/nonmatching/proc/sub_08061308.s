	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061308
sub_08061308: @ 0x08061308
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r2, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r1, #0
	str r1, [sp, #8]
	ldr r2, _08061334 @ =gUnknown_0816DAEC
	ldr r1, [r2]
	ldr r5, [r1]
	ldr r1, _08061338 @ =gUnknown_030045C8
	ldr r1, [r1]
	cmp r1, r0
	bne _08061340
	b _08061630
	.align 2, 0
_08061334: .4byte gUnknown_0816DAEC
_08061338: .4byte gUnknown_030045C8
_0806133C:
	movs r0, #0
	b _08061632
_08061340:
	ldr r2, _08061348 @ =gUnknown_0816DAF0
	ldr r0, [r2]
	ldr r0, [r0]
	b _08061628
	.align 2, 0
_08061348: .4byte gUnknown_0816DAF0
_0806134C:
	ldr r1, _080613B8 @ =gUnknown_0857680F
	ldr r3, _080613BC @ =gUnknown_030046C0
	ldrb r0, [r3, #6]
	adds r0, r0, r1
	ldr r6, [r2]
	ldr r1, [r6]
	ldr r7, [sp, #8]
	lsls r2, r7, #2
	adds r4, r2, r1
	ldrb r0, [r0]
	mov sl, r2
	ldrb r1, [r4, #2]
	cmp r0, r1
	beq _0806136A
	b _08061618
_0806136A:
	ldr r2, _080613C0 @ =gUnknown_0816DAF4
	ldr r0, [r2]
	ldr r3, [r0]
	ldrb r1, [r4, #1]
	lsls r1, r1, #1
	ldr r7, _080613C4 @ =0x0000417A
	adds r0, r3, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r4]
	adds r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r4, [r0]
	mov r8, r2
	cmp r4, #0
	beq _08061390
	b _08061618
_08061390:
	ldr r1, _080613C8 @ =0x00002852
	adds r0, r3, r1
	bl sub_0801F92C
	mov r2, sb
	cmp r2, #4
	bne _080613D0
	ldr r2, _080613CC @ =gUnknown_030013EC
	ldr r1, [r6]
	add r1, sl
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	str r4, [sp]
	ldr r4, [r2]
	movs r2, #0x14
	movs r3, #0x78
	bl _call_via_r4
	b _080613E8
	.align 2, 0
_080613B8: .4byte gUnknown_0857680F
_080613BC: .4byte gUnknown_030046C0
_080613C0: .4byte gUnknown_0816DAF4
_080613C4: .4byte 0x0000417A
_080613C8: .4byte 0x00002852
_080613CC: .4byte gUnknown_030013EC
_080613D0:
	ldr r3, _080613EC @ =gUnknown_030013EC
	ldr r1, [r6]
	add r1, sl
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	ldr r6, _080613F0 @ =gUnknown_030046C0
	ldrb r2, [r6, #6]
	str r4, [sp]
	ldr r4, [r3]
	movs r3, #0x78
	bl _call_via_r4
_080613E8:
	movs r6, #0
	b _080615E6
	.align 2, 0
_080613EC: .4byte gUnknown_030013EC
_080613F0: .4byte gUnknown_030046C0
_080613F4:
	movs r4, #0
	ldr r0, [r1]
	ldr r0, [r0]
	adds r7, r6, #1
	str r7, [sp, #0xc]
	b _080615DC
_08061400:
	ldr r2, _08061430 @ =gUnknown_0816DAF8
	ldr r0, [r2]
	lsls r1, r6, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r2
	adds r7, r1, #0
	cmp r0, #0
	bge _0806141C
	b _080615D4
_0806141C:
	mov r0, sb
	cmp r0, #4
	bls _08061424
	b _080615D4
_08061424:
	lsls r0, r0, #2
	ldr r1, _08061434 @ =_08061438
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08061430: .4byte gUnknown_0816DAF8
_08061434: .4byte _08061438
_08061438: @ jump table
	.4byte _0806144C @ case 0
	.4byte _08061498 @ case 1
	.4byte _080614EC @ case 2
	.4byte _08061524 @ case 3
	.4byte _08061570 @ case 4
_0806144C:
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _08061488 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0806148C @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	ldr r3, _08061490 @ =gUnknown_085767D5
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #1
	beq _08061476
	b _080615D4
_08061476:
	movs r0, #0xe0
	ldr r1, _08061494 @ =gUnknown_03004084
	ands r0, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _08061484
	b _080615D4
_08061484:
	b _080615BC
	.align 2, 0
_08061488: .4byte 0x0000417A
_0806148C: .4byte 0x00001432
_08061490: .4byte gUnknown_085767D5
_08061494: .4byte gUnknown_03004084
_08061498:
	mov r2, r8
	ldr r0, [r2]
	ldr r2, [r0]
	lsls r1, r6, #1
	ldr r3, _080614E0 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r2, #0x12
	adds r3, r2, r0
	ldrb r2, [r3]
	cmp r2, #0
	bne _080614B6
	b _080615D4
_080614B6:
	movs r0, #0xc0
	ldr r1, _080614E4 @ =gUnknown_03003F2C
	ands r0, r2
	ldrh r1, [r1]
	cmp r0, r1
	beq _080614C4
	b _080615D4
_080614C4:
	ldr r2, _080614E8 @ =gUnknown_08499594
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #0x14
	beq _080614DA
	b _080615D4
_080614DA:
	ldrb r0, [r2, #7]
	b _080615B8
	.align 2, 0
_080614E0: .4byte 0x0000417A
_080614E4: .4byte gUnknown_03003F2C
_080614E8: .4byte gUnknown_08499594
_080614EC:
	mov r2, r8
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0806151C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08061520 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0xd
	beq _08061512
	cmp r1, #0xb
	bne _080615D4
_08061512:
	strb r4, [r5]
	strb r6, [r5, #1]
	mov r3, ip
	ldr r0, [r3]
	b _080615C4
	.align 2, 0
_0806151C: .4byte 0x0000417A
_08061520: .4byte 0x00001432
_08061524:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [r0]
	lsls r1, r6, #1
	ldr r3, _08061564 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r2, #0x12
	adds r3, r2, r0
	ldrb r2, [r3]
	cmp r2, #0
	beq _080615D4
	movs r0, #0xc0
	ldr r1, _08061568 @ =gUnknown_03003F2C
	ands r0, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _080615D4
	ldr r2, _0806156C @ =gUnknown_08499594
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #2
	bhi _080615D4
	b _080615B2
	.align 2, 0
_08061564: .4byte 0x0000417A
_08061568: .4byte gUnknown_03003F2C
_0806156C: .4byte gUnknown_08499594
_08061570:
	mov r2, r8
	ldr r0, [r2]
	ldr r2, [r0]
	lsls r1, r6, #1
	ldr r3, _08061644 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r2, #0x12
	adds r3, r2, r0
	ldrb r2, [r3]
	cmp r2, #0
	beq _080615D4
	movs r0, #0xc0
	ldr r1, _08061648 @ =gUnknown_03003F2C
	ands r0, r2
	ldrh r1, [r1]
	cmp r0, r1
	bne _080615D4
	ldr r2, _0806164C @ =gUnknown_08499594
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r2, r1, r0
	ldr r1, _08061650 @ =gUnknown_085767A0
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080615D4
_080615B2:
	ldrb r1, [r2, #1]
	movs r0, #8
	ands r0, r1
_080615B8:
	cmp r0, #0
	bne _080615D4
_080615BC:
	strb r4, [r5]
	strb r6, [r5, #1]
	mov r1, ip
	ldr r0, [r1]
_080615C4:
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #2]
	adds r5, #4
_080615D4:
	adds r4, #1
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
_080615DC:
	ldrh r0, [r0]
	cmp r4, r0
	bge _080615E4
	b _08061400
_080615E4:
	ldr r6, [sp, #0xc]
_080615E6:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r6, r0
	bge _080615F4
	b _080613F4
_080615F4:
	ldr r0, _08061654 @ =0x0000FFFF
	strh r0, [r5, #2]
	ldr r0, _08061658 @ =gUnknown_03003F20
	ldr r5, [r0]
	adds r0, r5, #0
	ldr r1, [sp, #4]
	bl sub_08059C00
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _0806165C @ =0x7FFF0000
	cmp r0, r1
	bne _08061610
	b _0806133C
_08061610:
	ldr r0, _08061660 @ =gUnknown_085766E4
	ldr r0, [r0]
	add r0, sl
	strb r2, [r0, #3]
_08061618:
	ldr r3, [sp, #8]
	adds r3, #1
	str r3, [sp, #8]
	ldr r2, _08061664 @ =gUnknown_0816DAF0
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
_08061628:
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08061630
	b _0806134C
_08061630:
	movs r0, #1
_08061632:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08061644: .4byte 0x0000417A
_08061648: .4byte gUnknown_03003F2C
_0806164C: .4byte gUnknown_08499594
_08061650: .4byte gUnknown_085767A0
_08061654: .4byte 0x0000FFFF
_08061658: .4byte gUnknown_03003F20
_0806165C: .4byte 0x7FFF0000
_08061660: .4byte gUnknown_085766E4
_08061664: .4byte gUnknown_0816DAF0

