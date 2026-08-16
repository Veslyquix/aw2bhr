	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030038
sub_08030038: @ 0x08030038
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r3, _08030164 @ =gUnknown_02025564
_0803004E:
	adds r2, r5, r3
	mov r1, r8
	adds r0, r1, r5
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	ldrb r0, [r2]
	strb r1, [r2]
	adds r5, #1
	cmp r5, #1
	ble _0803004E
	movs r5, #0
	mov r6, r8
	adds r6, #5
	lsls r7, r4, #0x10
	mov r0, r8
	adds r0, #0x22
	str r0, [sp, #4]
	movs r1, #0x34
	add r1, r8
	mov sl, r1
	ldr r4, _08030168 @ =gUnknown_02025566
	mov r3, r8
	adds r3, #2
_0803007E:
	adds r2, r5, r4
	adds r0, r3, r5
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	ldrb r0, [r2]
	strb r1, [r2]
	adds r5, #1
	cmp r5, #2
	ble _0803007E
	movs r5, #0
	ldr r4, _0803016C @ =gUnknown_02025569
	adds r3, r6, #0
_08030098:
	adds r2, r5, r4
	adds r0, r3, r5
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	ldrb r0, [r2]
	strb r1, [r2]
	adds r5, #1
	cmp r5, #0x17
	ble _08030098
	movs r6, #0
	asrs r0, r7, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	str r1, [sp]
	mov sb, r0
_080300B8:
	ldr r1, [sp]
	adds r0, r1, r6
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _08030164 @ =gUnknown_02025564
	adds r5, r2, r0
	lsls r4, r6, #3
	subs r3, r4, r6
	lsls r3, r3, #2
	mov r1, r8
	adds r1, r1, r3
	mov ip, r1
	mov r0, ip
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x21
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x33
	ldrb r0, [r0]
	adds r1, #0x12
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x39
	ldrb r0, [r0]
	adds r1, #6
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x3a
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	strb r1, [r0]
	movs r5, #0
	adds r7, r6, #1
	ldr r0, _08030170 @ =gUnknown_02025586
	adds r2, r2, r0
_08030112:
	adds r0, r5, r3
	ldr r1, [sp, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r5, #1
	cmp r5, #0x10
	ble _08030112
	movs r5, #0
	mov r1, sb
	lsls r0, r1, #1
	add r0, sb
	adds r0, r0, r6
	ldr r2, _08030174 @ =gUnknown_02025598
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r0, r4, r6
	lsls r4, r0, #2
	adds r1, r1, r2
_0803013C:
	adds r0, r5, r4
	add r0, sl
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r5, #1
	cmp r5, #4
	ble _0803013C
	adds r6, r7, #0
	cmp r6, #2
	ble _080300B8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030164: .4byte gUnknown_02025564
_08030168: .4byte gUnknown_02025566
_0803016C: .4byte gUnknown_02025569
_08030170: .4byte gUnknown_02025586
_08030174: .4byte gUnknown_02025598

