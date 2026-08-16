	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08068A00
sub_08068A00: @ 0x08068A00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0x4e
	beq _08068AB0
	cmp r0, #0x4e
	bgt _08068A1C
	cmp r0, #0x26
	beq _08068AB0
	cmp r0, #0x26
	bgt _08068AB0
	cmp r0, #0
	beq _08068A9E
	b _08068AB0
_08068A1C:
	cmp r0, #0x62
	beq _08068AB0
	cmp r0, #0x62
	bgt _08068A2E
	cmp r0, #0x58
	beq _08068AB0
	cmp r0, #0x60
	beq _08068A92
	b _08068AB0
_08068A2E:
	cmp r0, #0xb4
	beq _08068A74
	cmp r0, #0xb4
	bgt _08068A3C
	cmp r0, #0x80
	beq _08068A88
	b _08068AB0
_08068A3C:
	cmp r0, #0xc7
	bne _08068AB0
	ldr r2, _08068A68 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _08068A6C @ =gUnknown_0817DE24
	ldr r1, _08068A70 @ =0x06009400
	bl Decompress
	b _08068AB0
	.align 2, 0
_08068A68: .4byte gDispIo
_08068A6C: .4byte gUnknown_0817DE24
_08068A70: .4byte 0x06009400
_08068A74:
	ldr r0, _08068A80 @ =gUnknown_0818E364
	ldr r1, _08068A84 @ =0x06010000
	bl Decompress
	b _08068AB0
	.align 2, 0
_08068A80: .4byte gUnknown_0818E364
_08068A84: .4byte 0x06010000
_08068A88:
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080678D4
	b _08068AB0
_08068A92:
	movs r0, #0x40
	movs r1, #1
	adds r2, r4, #0
	bl sub_080673D0
	b _08068AB0
_08068A9E:
	ldr r0, _08068ABC @ =gUnknown_08580FF4
	bl Proc_EndEach
	ldr r0, _08068AC0 @ =gUnknown_08580FCC
	bl Proc_EndEach
	adds r0, r4, #0
	bl Proc_Break
_08068AB0:
	ldr r0, [r4, #0x2c]
	subs r0, #1
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068ABC: .4byte gUnknown_08580FF4
_08068AC0: .4byte gUnknown_08580FCC

