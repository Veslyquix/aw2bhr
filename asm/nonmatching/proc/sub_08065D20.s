	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065D20
sub_08065D20: @ 0x08065D20
	push {r4, r5, lr}
	ldr r2, _08065D58 @ =gUnknown_0816E11C
	ldr r0, [r2]
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	ldr r0, _08065D5C @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0xc0
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08065DA4
	adds r0, r3, #0
	adds r0, #9
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #1
	bne _08065D60
	movs r0, #2
	b _08065D62
	.align 2, 0
_08065D58: .4byte gUnknown_0816E11C
_08065D5C: .4byte gUnknown_03002EE0
_08065D60:
	movs r0, #1
_08065D62:
	strb r0, [r1]
	movs r3, #0
	ldr r0, [r5]
	ldr r1, [r0]
	ldrb r2, [r1, #8]
	cmp r3, r2
	bge _08065D86
	ldrb r0, [r1, #9]
	cmp r0, #1
	beq _08065D86
	adds r1, #9
_08065D78:
	adds r3, #1
	cmp r3, r2
	bge _08065D86
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #1
	bne _08065D78
_08065D86:
	ldr r0, [r5]
	ldr r2, [r0]
	ldrb r0, [r2, #8]
	cmp r3, r0
	bne _08065D9E
	cmp r4, #0
	bne _08065D9A
	movs r0, #1
	strb r0, [r2, #0xa]
	b _08065D9E
_08065D9A:
	movs r0, #1
	strb r0, [r2, #9]
_08065D9E:
	movs r0, #0x64
	bl sub_0803B4DC
_08065DA4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

