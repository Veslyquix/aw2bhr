	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803ABDC
sub_0803ABDC: @ 0x0803ABDC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	bl sub_0803CBD8
	adds r5, r0, #0
	cmp r5, #0
	ble _0803ABF0
	movs r5, #1
_0803ABF0:
	ldr r2, _0803AC40 @ =gUnknown_08090F94
	movs r0, #0
	movs r1, #0
	bl sub_080119A0
	ldr r2, _0803AC44 @ =gUnknown_08090FA4
	movs r0, #0
	movs r1, #8
	bl sub_080119A0
	movs r0, #0x1e
	ldrsh r2, [r4, r0]
	movs r0, #0x28
	movs r1, #8
	bl sub_0802BD54
	ldr r1, _0803AC48 @ =gUnknown_0849E5F8
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x38
	movs r1, #8
	bl sub_080119A0
	ldr r1, _0803AC4C @ =gUnknown_08090FAC
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r2, [r3, #4]
	movs r0, #3
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _0803AC54
	bl sub_08016E14
	ldr r0, _0803AC50 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	b _0803ACB0
	.align 2, 0
_0803AC40: .4byte gUnknown_08090F94
_0803AC44: .4byte gUnknown_08090FA4
_0803AC48: .4byte gUnknown_0849E5F8
_0803AC4C: .4byte gUnknown_08090FAC
_0803AC50: .4byte gUnknown_03001FBC
_0803AC54:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0803AC68
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl sub_0803CA00
	b _0803ACB0
_0803AC68:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0803AC7C
	movs r2, #0x1e
	ldrsh r0, [r4, r2]
	movs r1, #1
	bl sub_0803CA00
	b _0803ACB0
_0803AC7C:
	ldrh r1, [r3, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AC94
	ldrh r1, [r4, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r4, r2]
	cmp r0, #0x20
	ble _0803AC94
	subs r0, r1, #1
	strh r0, [r4, #0x1e]
_0803AC94:
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803ACB0
	ldrh r1, [r4, #0x1e]
	movs r2, #0x1e
	ldrsh r0, [r4, r2]
	cmp r0, #0x5e
	bgt _0803ACB0
	adds r0, r1, #1
	strh r0, [r4, #0x1e]
_0803ACB0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

