	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070CD0
sub_08070CD0: @ 0x08070CD0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x24]
	cmp r1, #0
	beq _08070D92
	ldrh r0, [r6, #0x26]
	subs r0, #1
	strh r0, [r6, #0x26]
	ldr r3, _08070D10 @ =0x0000FFFF
	adds r2, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _08070D92
	strh r1, [r6, #0x26]
	ldrh r1, [r6, #0x28]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08070D14
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	cmp r0, #0xff
	bls _08070D66
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x28]
	strh r3, [r6, #0x24]
	b _08070D66
	.align 2, 0
_08070D10: .4byte 0x0000FFFF
_08070D14:
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08070D66
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _08070D46
_08070D2A:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0807004C
	movs r0, #1
	ldrh r7, [r6, #0x28]
	ands r0, r7
	cmp r0, #0
	bne _08070D3E
	strb r0, [r4]
_08070D3E:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _08070D2A
_08070D46:
	movs r0, #1
	ldrh r1, [r6, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _08070D5A
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	b _08070D5E
_08070D5A:
	movs r0, #0x80
	lsls r0, r0, #0x18
_08070D5E:
	str r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #0x24]
	b _08070D92
_08070D66:
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _08070D92
	movs r3, #0x80
	movs r7, #0
	movs r2, #3
_08070D74:
	ldrb r1, [r4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08070D8A
	ldrh r7, [r6, #0x28]
	lsrs r0, r7, #2
	strb r0, [r4, #0x13]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r4]
_08070D8A:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _08070D74
_08070D92:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

