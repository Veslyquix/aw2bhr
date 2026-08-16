	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805FE0C
sub_0805FE0C: @ 0x0805FE0C
	push {r4, r5, r6, lr}
	ldr r4, _0805FEA0 @ =gUnknown_0816DAC4
	ldr r5, [r4]
	ldr r0, [r5, #8]
	bl sub_080129D4
	ldrb r0, [r5]
	adds r6, r4, #0
	cmp r0, #1
	beq _0805FE3C
	cmp r0, #0xe
	beq _0805FE3C
	cmp r0, #0xd
	beq _0805FE3C
	cmp r0, #0xf
	beq _0805FE3C
	cmp r0, #0x10
	beq _0805FE3C
	cmp r0, #0x11
	beq _0805FE44
	cmp r0, #0x12
	beq _0805FE3C
	cmp r0, #0x13
	bne _0805FEB4
_0805FE3C:
	ldr r0, [r6]
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0805FE70
_0805FE44:
	ldr r1, _0805FEA4 @ =gUnknown_03003F38
	ldr r3, [r6]
	ldrb r0, [r3, #1]
	strb r0, [r1]
	ldr r4, _0805FEA8 @ =gUnknown_030040D8
	ldr r2, _0805FEAC @ =gUnknown_08499594
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r2, r2, r0
	str r2, [r4]
	ldrb r0, [r3, #0x12]
	movs r1, #0x7f
	ands r1, r0
	ldrb r3, [r2, #6]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #6]
_0805FE70:
	ldr r3, [r6]
	ldrb r0, [r3]
	cmp r0, #0x12
	bne _0805FE98
	ldr r1, _0805FEA4 @ =gUnknown_03003F38
	ldrb r0, [r3, #1]
	strb r0, [r1]
	ldr r3, _0805FEA8 @ =gUnknown_030040D8
	ldr r2, _0805FEAC @ =gUnknown_08499594
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r3]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08029088
_0805FE98:
	ldr r1, _0805FEB0 @ =gUnknown_030045D4
	movs r0, #2
	b _0805FF32
	.align 2, 0
_0805FEA0: .4byte gUnknown_0816DAC4
_0805FEA4: .4byte gUnknown_03003F38
_0805FEA8: .4byte gUnknown_030040D8
_0805FEAC: .4byte gUnknown_08499594
_0805FEB0: .4byte gUnknown_030045D4
_0805FEB4:
	ldr r1, _0805FF3C @ =gUnknown_03003F38
	ldrb r0, [r5, #1]
	strb r0, [r1]
	ldr r4, _0805FF40 @ =gUnknown_030040D8
	ldr r2, _0805FF44 @ =gUnknown_08499594
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r2, r2, r0
	str r2, [r4]
	ldr r1, _0805FF48 @ =gUnknown_03003F24
	ldrb r0, [r5, #4]
	strh r0, [r1]
	ldrb r0, [r5, #5]
	strh r0, [r1, #2]
	ldr r1, _0805FF4C @ =gUnknown_03003100
	ldrb r0, [r5, #2]
	strh r0, [r1]
	ldrb r0, [r5, #3]
	strh r0, [r1, #2]
	ldrb r1, [r2, #1]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _0805FF50 @ =gUnknown_030032D8
	ldrh r0, [r0]
	ldr r6, _0805FF54 @ =gUnknown_0816DAC8
	cmp r0, #0x13
	bne _0805FF12
	ldr r1, _0805FF58 @ =gUnknown_03004074
	movs r0, #0
	strb r0, [r1]
	ldr r3, [r4]
	ldrb r0, [r5, #0x12]
	movs r1, #0x7f
	ands r1, r0
	ldrb r2, [r3, #6]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #6]
	ldr r1, [r6]
	movs r0, #1
	strh r0, [r1]
_0805FF12:
	ldr r0, _0805FF5C @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805FF24
	ldr r0, _0805FF60 @ =gUnknown_03003F60
	ldrh r0, [r0]
	cmp r0, #4
	beq _0805FF2E
_0805FF24:
	ldr r1, [r4]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08029088
_0805FF2E:
	ldr r1, [r6]
	movs r0, #1
_0805FF32:
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF3C: .4byte gUnknown_03003F38
_0805FF40: .4byte gUnknown_030040D8
_0805FF44: .4byte gUnknown_08499594
_0805FF48: .4byte gUnknown_03003F24
_0805FF4C: .4byte gUnknown_03003100
_0805FF50: .4byte gUnknown_030032D8
_0805FF54: .4byte gUnknown_0816DAC8
_0805FF58: .4byte gUnknown_03004074
_0805FF5C: .4byte gUnknown_03003FC0
_0805FF60: .4byte gUnknown_03003F60

