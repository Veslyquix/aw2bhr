	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038960
sub_08038960: @ 0x08038960
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r1, #0
	ldr r0, _080389B8 @ =gUnknown_0849D5F8
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x45
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r1, r3
	bgt _080389CA
	mov ip, r2
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	mov r7, ip
	adds r7, #0x2c
	adds r6, r3, #0
	lsls r0, r5, #0x18
	asrs r4, r0, #0x18
_08038992:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	mov r1, ip
	adds r1, #0x20
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, #0
	cmp r1, r8
	bne _080389BC
	adds r0, r7, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	bne _080389BC
	adds r0, r2, #0
	b _080389CE
	.align 2, 0
_080389B8: .4byte gUnknown_0849D5F8
_080389BC:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r3, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r6
	ble _08038992
_080389CA:
	movs r0, #1
	rsbs r0, r0, #0
_080389CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

