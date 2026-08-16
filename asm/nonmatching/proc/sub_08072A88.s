	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072A88
sub_08072A88: @ 0x08072A88
	push {r4, lr}
	ldr r2, _08072B1C @ =gUnknown_03002B6C
	ldrb r1, [r2]
	movs r4, #0x80
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08072AAE
	ldr r0, [r2]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08001148
_08072AAE:
	ldr r2, _08072B20 @ =gUnknown_03001FE8
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08072AD0
	ldr r0, [r2]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08001148
_08072AD0:
	ldr r2, _08072B24 @ =gUnknown_030030B4
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08072AF2
	ldr r0, [r2]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08001148
_08072AF2:
	ldr r2, _08072B28 @ =gUnknown_0300251C
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08072B14
	ldr r0, [r2]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08001148
_08072B14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072B1C: .4byte gUnknown_03002B6C
_08072B20: .4byte gUnknown_03001FE8
_08072B24: .4byte gUnknown_030030B4
_08072B28: .4byte gUnknown_0300251C

