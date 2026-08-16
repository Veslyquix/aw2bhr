	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D558
sub_0803D558: @ 0x0803D558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r4, #0
	add r0, sp, #8
	mov sb, r0
	movs r1, #0
	mov r2, sb
_0803D56E:
	mov r3, sp
	adds r0, r3, r4
	strb r1, [r0]
	adds r0, r2, r4
	strb r1, [r0]
	adds r4, #1
	cmp r4, #4
	ble _0803D56E
	movs r5, #0
	mov ip, r5
	ldr r1, _0803D6A8 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r2, [r0, #2]
	cmp r5, r2
	bge _0803D5E4
	mov r8, r0
	mov sl, r1
_0803D590:
	movs r4, #0
	mov r3, r8
	ldrh r3, [r3]
	cmp r4, r3
	bge _0803D5DA
	mov r0, sl
	ldr r2, [r0]
	lsls r1, r5, #1
	ldr r3, _0803D6AC @ =0x0000417A
	adds r0, r2, r3
	adds r7, r0, r1
	ldr r0, _0803D6B0 @ =0x00001432
	adds r6, r2, r0
_0803D5AA:
	ldrh r0, [r7]
	adds r0, r0, r4
	adds r0, r6, r0
	ldrb r3, [r0]
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #8
	bne _0803D5D2
	lsrs r0, r3, #5
	mov r3, sp
	adds r1, r3, r0
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #4
	beq _0803D698
_0803D5D2:
	adds r4, #1
	ldrh r0, [r2]
	cmp r4, r0
	blt _0803D5AA
_0803D5DA:
	adds r5, #1
	mov r1, r8
	ldrh r1, [r1, #2]
	cmp r5, r1
	blt _0803D590
_0803D5E4:
	movs r1, #1
	movs r4, #0
	movs r3, #0
_0803D5EA:
	mov r5, sp
	adds r2, r5, r4
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803D602
	strb r3, [r2]
	adds r0, r1, #0
	adds r1, r0, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	add r0, sp
	strb r4, [r0]
_0803D602:
	adds r4, #1
	cmp r4, #4
	ble _0803D5EA
	movs r4, #0
	mov r2, sb
	movs r3, #0x20
_0803D60E:
	mov r0, sp
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803D61C
	adds r0, r2, r0
	strb r3, [r0]
_0803D61C:
	adds r4, #1
	cmp r4, #4
	ble _0803D60E
	movs r5, #0
	ldr r1, _0803D6A8 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r5, r0
	bge _0803D67E
	mov r8, r1
_0803D630:
	movs r4, #0
	mov r1, r8
	ldr r0, [r1]
	adds r2, r5, #1
	mov ip, r2
	ldrh r0, [r0]
	cmp r4, r0
	bge _0803D672
	ldr r6, _0803D6A8 @ =gUnknown_08499590
	lsls r7, r5, #1
	mov r5, sb
_0803D646:
	ldr r1, [r6]
	ldr r3, _0803D6AC @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0803D6B0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r3, [r1]
	movs r2, #0x1f
	lsrs r0, r3, #5
	adds r0, r5, r0
	ands r3, r2
	ldrb r0, [r0]
	adds r0, r3, r0
	strb r0, [r1]
	adds r4, #1
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0803D646
_0803D672:
	mov r5, ip
	mov r3, r8
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blt _0803D630
_0803D67E:
	movs r4, #0
	ldr r3, _0803D6B4 @ =gUnknown_08499598
	movs r2, #0
_0803D684:
	ldr r0, [r3]
	adds r0, r2, r0
	mov r5, sp
	adds r1, r5, r4
	ldrb r1, [r1]
	strb r1, [r0, #0x1a]
	adds r2, #0x3c
	adds r4, #1
	cmp r4, #4
	ble _0803D684
_0803D698:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D6A8: .4byte gUnknown_08499590
_0803D6AC: .4byte 0x0000417A
_0803D6B0: .4byte 0x00001432
_0803D6B4: .4byte gUnknown_08499598

