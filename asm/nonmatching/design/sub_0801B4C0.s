	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B4C0
sub_0801B4C0: @ 0x0801B4C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0801B530 @ =gUnknown_0200CD0C
	ldrb r0, [r0]
	cmp r0, #1
	bne _0801B588
	ldr r0, _0801B534 @ =gUnknown_0200CC30
	ldrb r0, [r0]
	ldr r1, _0801B538 @ =gUnknown_0200CC34
	ldr r1, [r1]
	bl sub_0801B598
	movs r7, #0
	ldr r6, _0801B53C @ =gUnknown_0200CC38
	movs r0, #0
	mov sl, r0
	movs r1, #0x30
	adds r1, r1, r6
	mov sb, r1
	ldr r3, _0801B540 @ =gUnknown_0200CC88
	mov r8, r3
_0801B4F0:
	adds r2, r7, r6
	adds r1, r6, #0
	adds r1, #0x10
	adds r1, r7, r1
	ldrb r0, [r1]
	movs r3, #0xff
	orrs r0, r3
	strb r0, [r1]
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r7, r0
	mov r1, sl
	strb r1, [r0]
	mov r3, sb
	strb r1, [r3]
	mov r0, sl
	mov r1, r8
	str r0, [r1, #0x40]
	str r0, [r1]
	ldr r0, _0801B544 @ =gUnknown_02002000
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_0801B6A8
	movs r5, #0
	lsls r0, r7, #0x10
	lsrs r4, r0, #0x10
	b _0801B54A
	.align 2, 0
_0801B530: .4byte gUnknown_0200CD0C
_0801B534: .4byte gUnknown_0200CC30
_0801B538: .4byte gUnknown_0200CC34
_0801B53C: .4byte gUnknown_0200CC38
_0801B540: .4byte gUnknown_0200CC88
_0801B544: .4byte gUnknown_02002000
_0801B548:
	adds r5, #1
_0801B54A:
	cmp r5, #3
	bgt _0801B562
	adds r0, r4, #0
	ldr r1, _0801B580 @ =gUnknown_02002000
	bl sub_0801B618
	adds r0, r4, #0
	ldr r1, _0801B580 @ =gUnknown_02002000
	bl sub_0801B648
	cmp r0, #0
	bne _0801B548
_0801B562:
	cmp r5, #4
	beq _0801B588
	ldr r3, _0801B584 @ =gUnknown_02002FFF
	ldrb r0, [r3]
	mov r1, sb
	strb r0, [r1, #0x10]
	movs r3, #1
	add sb, r3
	movs r0, #4
	add r8, r0
	adds r7, #1
	cmp r7, #0xf
	ble _0801B4F0
	movs r0, #0
	b _0801B58A
	.align 2, 0
_0801B580: .4byte gUnknown_02002000
_0801B584: .4byte gUnknown_02002FFF
_0801B588:
	movs r0, #1
_0801B58A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

