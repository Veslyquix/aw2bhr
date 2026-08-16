	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080303C8
sub_080303C8: @ 0x080303C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _080304B0 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	ldr r1, _080304B4 @ =gUnknown_08090CBC
	mov sb, r1
	cmp r0, #0
	bne _080303E6
	b _08030550
_080303E6:
	ldr r4, [r1]
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	cmp r0, #2
	beq _080303F2
	b _08030550
_080303F2:
	ldrb r0, [r1, #6]
	ldr r1, _080304B8 @ =gUnknown_08090CC0
	ldr r7, _080304BC @ =gUnknown_08090CC4
	cmp r0, #0
	beq _08030416
	ldr r2, [r1]
	ldr r0, [r2]
	cmp r0, #0
	bne _08030416
	adds r3, r2, #0
	adds r2, r4, #0
_08030408:
	ldr r0, [r3]
	cmp r0, #0
	bne _08030416
	ldr r0, [r2]
	ldrh r0, [r0, #4]
	cmp r0, #2
	bne _08030408
_08030416:
	ldr r2, _080304C0 @ =0x04000208
	movs r0, #0
	strh r0, [r2]
	ldr r1, [r1]
	movs r0, #0
	str r0, [r1]
	movs r0, #1
	strh r0, [r2]
	bl sub_080301E8
	ldr r0, [r7]
	ldr r3, [r0]
	ldr r0, _080304C4 @ =0x04000130
	ldrh r0, [r0]
	ldr r2, _080304C8 @ =0x000003FF
	adds r1, r2, #0
	bics r1, r0
	ldrh r0, [r3]
	lsls r0, r0, #0xa
	movs r4, #0x80
	lsls r4, r4, #8
	adds r2, r4, #0
	orrs r0, r2
	orrs r1, r0
	ldrh r0, [r3, #2]
	lsls r0, r0, #0xd
	orrs r1, r0
	ldrh r0, [r3, #6]
	strh r1, [r3, #6]
	movs r4, #0
	ldr r6, _080304CC @ =0x00005FFF
	mov sl, r6
_08030456:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080304FC
	ldr r0, [r7]
	mov ip, r0
	ldr r3, [r0]
	lsls r0, r4, #1
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r3, r2
	adds r2, r1, r0
	ldrh r0, [r2]
	ldr r6, _080304D0 @ =0xFFFF0000
	lsrs r5, r6, #0x10
	cmp r0, r5
	beq _0803049A
	ldrh r0, [r2]
	cmp r0, sl
	beq _0803049A
	ldrh r1, [r2]
	ldr r0, _080304D4 @ =0x00007FFF
	cmp r1, r0
	beq _0803049A
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #8
	adds r1, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080304DC
_0803049A:
	ldr r0, [r7]
	ldr r1, [r0]
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r2, _080304D8 @ =0x0000FFFF
	orrs r0, r2
	strh r0, [r1]
	b _0803055C
	.align 2, 0
_080304B0: .4byte gUnknown_03003FC0
_080304B4: .4byte gUnknown_08090CBC
_080304B8: .4byte gUnknown_08090CC0
_080304BC: .4byte gUnknown_08090CC4
_080304C0: .4byte 0x04000208
_080304C4: .4byte 0x04000130
_080304C8: .4byte 0x000003FF
_080304CC: .4byte 0x00005FFF
_080304D0: .4byte 0xFFFF0000
_080304D4: .4byte 0x00007FFF
_080304D8: .4byte 0x0000FFFF
_080304DC:
	ldrh r0, [r2]
	movs r6, #0xe0
	lsls r6, r6, #5
	adds r1, r6, #0
	ands r0, r1
	ldrh r1, [r3]
	lsrs r0, r0, #0xa
	cmp r0, r1
	bne _0803052C
	ldrh r0, [r2]
	ldr r2, _08030528 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	mov r6, r8
	orrs r6, r0
	mov r8, r6
_080304FC:
	adds r4, #1
	cmp r4, #3
	ble _08030456
	ldr r3, [r7]
	ldr r0, [r3]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r1, #0
	mov r4, r8
	strh r4, [r0]
	mov r6, sb
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r4, [r0, #0x1b]
	strb r1, [r0, #0x1b]
	ldr r0, [r3]
	adds r0, r0, r2
	ldrh r0, [r0]
	b _08030562
	.align 2, 0
_08030528: .4byte 0x000003FF
_0803052C:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r0, [r1, #0x1b]
	adds r0, #1
	ldrb r2, [r1, #0x1b]
	strb r0, [r1, #0x1b]
	mov r2, ip
	ldr r1, [r2]
	movs r4, #0x84
	lsls r4, r4, #2
	adds r1, r1, r4
	ldrh r2, [r1]
	adds r0, r5, #0
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0
	b _08030562
_08030550:
	mov r6, sb
	ldr r0, [r6]
	ldr r1, [r0]
	ldrb r0, [r1, #0x1b]
	movs r0, #0
	strb r0, [r1, #0x1b]
_0803055C:
	ldr r0, _08030570 @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #6]
_08030562:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08030570: .4byte gpKeySt

