	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805CE50
sub_0805CE50: @ 0x0805CE50
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0805CEE8 @ =gUnknown_0816DA08
	ldr r5, [r2]
	ldr r1, _0805CEEC @ =gUnknown_0816DA0C
	ldr r0, [r1]
	str r0, [r5]
	ldr r3, _0805CEF0 @ =gUnknown_03003F2C
	ldrh r0, [r3]
	adds r4, r0, #1
	adds r0, #0x40
	mov r8, r2
	mov sb, r1
	cmp r4, r0
	bge _0805CEB8
	ldr r0, _0805CEF4 @ =gUnknown_08499594
	mov ip, r0
	ldr r7, _0805CEF8 @ =gUnknown_085D5ABC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #2
	adds r6, r3, #0
_0805CE80:
	mov r1, ip
	ldr r0, [r1]
	adds r3, r2, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _0805CEAC
	ldrb r1, [r3, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805CEAC
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _0805CEAC
	ldr r0, [r5]
	strb r4, [r0]
	adds r0, #1
	str r0, [r5]
_0805CEAC:
	adds r2, #0xc
	adds r4, #1
	ldrh r0, [r6]
	adds r0, #0x40
	cmp r4, r0
	blt _0805CE80
_0805CEB8:
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0805CEFC @ =gUnknown_0300477C
	ldr r0, [r0]
	bl sub_0805D344
	ldr r1, _0805CF00 @ =gUnknown_03004778
	ldr r0, _0805CF04 @ =sub_0805DCA4
	str r0, [r1]
	ldr r1, _0805CF08 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CEE8: .4byte gUnknown_0816DA08
_0805CEEC: .4byte gUnknown_0816DA0C
_0805CEF0: .4byte gUnknown_03003F2C
_0805CEF4: .4byte gUnknown_08499594
_0805CEF8: .4byte gUnknown_085D5ABC
_0805CEFC: .4byte gUnknown_0300477C
_0805CF00: .4byte gUnknown_03004778
_0805CF04: .4byte sub_0805DCA4
_0805CF08: .4byte gUnknown_03004780

