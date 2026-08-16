	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038C08
sub_08038C08: @ 0x08038C08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _08038C68 @ =gUnknown_0849D5F8
	ldr r0, [r1]
	adds r0, #0x45
	ldrb r3, [r0]
	lsls r0, r3, #0x18
	cmp r0, #0
	ble _08038C8A
	mov r8, r1
_08038C1E:
	asrs r5, r0, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r4, r0, #0x18
	lsls r2, r4, #0x18
	lsls r3, r3, #0x18
	mov ip, r3
	cmp r2, #0
	blt _08038C7C
	mov r0, r8
	ldr r1, [r0]
	adds r6, r1, #0
	adds r6, #0x20
	adds r0, r6, r5
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r3, r1, #0
	adds r3, #0x2c
	adds r5, r3, r5
_08038C46:
	asrs r1, r2, #0x18
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r7, r0
	bne _08038C6C
	adds r0, r3, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08038C6C
	movs r0, #0
	b _08038C8C
	.align 2, 0
_08038C68: .4byte gUnknown_0849D5F8
_08038C6C:
	lsls r0, r4, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r4, r0, #0x18
	lsls r2, r4, #0x18
	cmp r2, #0
	bge _08038C46
_08038C7C:
	movs r0, #0xff
	lsls r0, r0, #0x18
	add r0, ip
	lsrs r3, r0, #0x18
	lsls r0, r3, #0x18
	cmp r0, #0
	bgt _08038C1E
_08038C8A:
	movs r0, #1
_08038C8C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

