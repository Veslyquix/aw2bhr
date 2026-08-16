	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026924
sub_08026924: @ 0x08026924
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl sub_080248F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #4
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldr r0, _08026A34 @ =gUnknown_08090A7C
	mov r8, r0
	cmp r1, #0
	ble _08026956
	movs r4, #5
	ldr r3, _08026A38 @ =gUnknown_03003FF8
	movs r2, #0
_08026946:
	asrs r1, r1, #0x10
	subs r0, r4, r1
	adds r0, r0, r3
	strb r2, [r0]
	subs r1, #1
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _08026946
_08026956:
	ldr r2, _08026A3C @ =gUnknown_08499598
	ldr r0, [r2]
	ldr r3, _08026A40 @ =gUnknown_03003FC0
	adds r1, r3, #0
	adds r1, #0x39
	ldrb r1, [r1]
	adds r0, #0x57
	strb r1, [r0]
	ldr r0, [r2]
	adds r1, r3, #0
	adds r1, #0x3a
	ldrb r1, [r1]
	adds r0, #0x93
	strb r1, [r0]
	ldr r0, [r2]
	adds r1, r3, #0
	adds r1, #0x3b
	ldrb r1, [r1]
	adds r0, #0xcf
	strb r1, [r0]
	ldr r1, [r2]
	adds r0, r3, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	ldr r4, _08026A44 @ =0x0000010B
	adds r1, r1, r4
	strb r0, [r1]
	movs r1, #1
	adds r5, r2, #0
	adds r4, r3, #0
	movs r7, #0
	adds r6, r4, #0
	adds r6, #0x42
_08026998:
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	ldr r1, [r5]
	lsls r2, r3, #4
	subs r2, r2, r3
	lsls r2, r2, #2
	adds r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x33
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r1, #0x1a]
	ldr r1, [r5]
	adds r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x3d
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r1, #0x1d]
	ldr r1, [r5]
	adds r1, r2, r1
	adds r0, r3, r6
	ldrb r0, [r0]
	adds r1, #0x2a
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r2, r0
	adds r0, #0x2c
	strb r7, [r0]
	ldr r0, [r5]
	adds r2, r2, r0
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	bne _080269E0
	movs r0, #1
	strb r0, [r2, #0x1d]
_080269E0:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08026998
	bl sub_08026A48
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _080269F8
	strb r0, [r4, #7]
_080269F8:
	bl sub_08026B28
	movs r1, #1
_080269FE:
	lsls r2, r1, #0x10
	asrs r4, r2, #0x10
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08026A1E
	asrs r0, r2, #0x16
	adds r0, #1
	bl sub_08025D20
_08026A1E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080269FE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026A34: .4byte gUnknown_08090A7C
_08026A38: .4byte gUnknown_03003FF8
_08026A3C: .4byte gUnknown_08499598
_08026A40: .4byte gUnknown_03003FC0
_08026A44: .4byte 0x0000010B

