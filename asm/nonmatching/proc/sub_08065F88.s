	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065F88
sub_08065F88: @ 0x08065F88
	push {r4, r5, lr}
	ldr r5, _08065FDC @ =gUnknown_08580934
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	lsls r0, r0, #1
	bl sub_08065C9C
	bl sub_08065EB4
	bl sub_08065EF4
	ldr r0, _08065FE0 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08065FF8
	bl sub_08063A3C
	ldr r1, _08065FE4 @ =gUnknown_08580D90
	bl sub_08063A30
	ldr r0, _08065FE8 @ =gUnknown_08580AF0
	ldr r4, _08065FEC @ =sub_08065F68
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08065FF0 @ =gUnknown_08580B90
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08065FF4 @ =gUnknown_08580BC8
	adds r1, r4, #0
	bl sub_08063A00
	movs r0, #0x66
	bl sub_0803B4DC
	b _08066066
	.align 2, 0
_08065FDC: .4byte gUnknown_08580934
_08065FE0: .4byte gpKeySt
_08065FE4: .4byte gUnknown_08580D90
_08065FE8: .4byte gUnknown_08580AF0
_08065FEC: .4byte sub_08065F68
_08065FF0: .4byte gUnknown_08580B90
_08065FF4: .4byte gUnknown_08580BC8
_08065FF8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08066066
	movs r0, #0x71
	bl sub_0803B4DC
	ldr r1, [r5]
	ldrb r0, [r1, #8]
	cmp r0, #2
	bne _08066038
	adds r0, r1, #0
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, #0x26
	movs r1, #2
	strb r1, [r0]
	ldr r0, _08066030 @ =gUnknown_08580AF0
	ldr r1, _08066034 @ =sub_08065F78
	bl sub_08063A00
	bl sub_080654E8
	bl sub_08064A44
	b _08066066
	.align 2, 0
_08066030: .4byte gUnknown_08580AF0
_08066034: .4byte sub_08065F78
_08066038:
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x31
	strb r4, [r0]
	ldr r2, [r5]
	adds r2, #0x32
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
	ldr r0, _0806606C @ =gUnknown_08580AF0
	bl sub_0806377C
	ldr r0, _08066070 @ =gUnknown_08580B90
	bl sub_0806377C
	ldr r0, _08066074 @ =gUnknown_08580BC8
	bl sub_0806377C
_08066066:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806606C: .4byte gUnknown_08580AF0
_08066070: .4byte gUnknown_08580B90
_08066074: .4byte gUnknown_08580BC8

