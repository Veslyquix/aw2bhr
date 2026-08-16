	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070990
sub_08070990: @ 0x08070990
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08070A1C @ =gUnknown_03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _08070A20 @ =0x68736D53
	cmp r1, r0
	bne _08070A16
	adds r0, r1, #1
	str r0, [r5]
	movs r4, #0xff
	ands r4, r3
	cmp r4, #0
	beq _080709B2
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r5, #5]
_080709B2:
	movs r4, #0xf0
	lsls r4, r4, #4
	ands r4, r3
	cmp r4, #0
	beq _080709D2
	lsrs r0, r4, #8
	strb r0, [r5, #6]
	movs r4, #0xc
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
_080709C8:
	strb r1, [r0]
	subs r4, #1
	adds r0, #0x40
	cmp r4, #0
	bne _080709C8
_080709D2:
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r4, r3
	cmp r4, #0
	beq _080709E0
	lsrs r0, r4, #0xc
	strb r0, [r5, #7]
_080709E0:
	movs r4, #0xb0
	lsls r4, r4, #0x10
	ands r4, r3
	cmp r4, #0
	beq _080709FE
	movs r0, #0xc0
	lsls r0, r0, #0xe
	ands r0, r4
	lsrs r4, r0, #0xe
	ldr r2, _08070A24 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_080709FE:
	movs r4, #0xf0
	lsls r4, r4, #0xc
	ands r4, r3
	cmp r4, #0
	beq _08070A12
	bl sub_08070A7C
	adds r0, r4, #0
	bl sub_080708EC
_08070A12:
	ldr r0, _08070A20 @ =0x68736D53
	str r0, [r5]
_08070A16:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070A1C: .4byte gUnknown_03007FF0
_08070A20: .4byte 0x68736D53
_08070A24: .4byte 0x04000089

