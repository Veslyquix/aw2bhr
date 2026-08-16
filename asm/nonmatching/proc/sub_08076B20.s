	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076B20
sub_08076B20: @ 0x08076B20
	push {r4, r5, r6, r7, lr}
	ldr r2, _08076B70 @ =gUnknown_0861515C
	ldrb r1, [r2]
	ldr r0, _08076B74 @ =gUnknown_0202FDFC
	ldr r0, [r0, #0xc]
	cmp r1, r0
	beq _08076B3E
	adds r1, r0, #0
_08076B30:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08076B68
	adds r2, #8
	ldrb r0, [r2]
	cmp r0, r1
	bne _08076B30
_08076B3E:
	movs r3, #0
	adds r4, r2, #1
	ldr r6, _08076B78 @ =gUnknown_0202FE0E
	movs r7, #1
	movs r5, #0xfe
_08076B48:
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r0, r6
	ldrb r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08076B62
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
_08076B62:
	adds r3, #1
	cmp r3, #6
	ble _08076B48
_08076B68:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B70: .4byte gUnknown_0861515C
_08076B74: .4byte gUnknown_0202FDFC
_08076B78: .4byte gUnknown_0202FE0E

