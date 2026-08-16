	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038AD8
sub_08038AD8: @ 0x08038AD8
	push {r4, r5, r6, r7, lr}
	movs r6, #1
	ldr r1, _08038B1C @ =gUnknown_0849D5F8
	ldr r0, [r1]
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, _08038B20 @ =gUnknown_08090F10
	mov ip, r2
	cmp r6, r0
	bgt _08038B6C
	adds r7, r1, #0
	ldr r5, [r2]
_08038AF4:
	ldr r4, [r7]
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r0, r3
	subs r2, r3, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08038B24
	adds r1, r2, r5
	movs r0, #0
	b _08038B50
	.align 2, 0
_08038B1C: .4byte gUnknown_0849D5F8
_08038B20: .4byte gUnknown_08090F10
_08038B24:
	cmp r1, r0
	ble _08038B2E
	adds r1, r2, r5
	movs r0, #1
	b _08038B50
_08038B2E:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r0, r3
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08038B4C
	adds r1, r2, r5
	movs r0, #3
	b _08038B50
_08038B4C:
	adds r1, r2, r5
	movs r0, #2
_08038B50:
	strb r0, [r1]
	lsls r0, r6, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	ldr r1, [r7]
	adds r1, #0x45
	lsrs r6, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	ble _08038AF4
_08038B6C:
	mov r2, ip
	ldr r0, [r2]
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	subs r1, #1
	adds r1, r1, r0
	movs r0, #4
	strb r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

