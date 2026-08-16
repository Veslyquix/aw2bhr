	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080390CC
sub_080390CC: @ 0x080390CC
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r1, _080390EC @ =gUnknown_0849D5F8
	ldr r1, [r1]
	mov ip, r1
	adds r1, #0x45
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r3, r1
	bne _080390F0
	movs r0, #0
	b _08039138
	.align 2, 0
_080390EC: .4byte gUnknown_0849D5F8
_080390F0:
	mov r1, ip
	adds r1, #0x20
	adds r2, r1, r3
	adds r4, r3, #1
	adds r1, r1, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _0803910E
	movs r0, #1
	b _08039138
_0803910E:
	cmp r2, r1
	ble _08039116
	movs r0, #3
	b _08039138
_08039116:
	mov r1, ip
	adds r1, #0x2c
	adds r2, r1, r3
	adds r1, r1, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _08039132
	movs r0, #2
	b _08039138
_08039132:
	cmp r2, r1
	ble _08039138
	movs r0, #4
_08039138:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

