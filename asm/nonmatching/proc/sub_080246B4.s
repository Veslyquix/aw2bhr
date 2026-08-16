	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080246B4
sub_080246B4: @ 0x080246B4
	push {r4, lr}
	ldr r3, _080246D8 @ =gUnknown_08499CBC
	ldr r2, _080246DC @ =gUnknown_08090A2C
	ldr r0, [r2]
	ldr r0, [r0]
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #1
	beq _080246E0
	cmp r0, #1
	ble _080246F2
	cmp r0, #2
	beq _080246EA
	b _080246F2
	.align 2, 0
_080246D8: .4byte gUnknown_08499CBC
_080246DC: .4byte gUnknown_08090A2C
_080246E0:
	movs r0, #1
	movs r1, #8
	bl sub_0803F880
	b _080246F2
_080246EA:
	movs r0, #0
	movs r1, #8
	bl sub_0803F880
_080246F2:
	ldr r4, [r4]
	ldr r0, [r4]
	movs r1, #0x14
	bl Div
	adds r1, r0, #0
	cmp r0, #0
	bge _08024704
	adds r1, r0, #3
_08024704:
	asrs r1, r1, #2
	lsls r1, r1, #2
	subs r1, r0, r1
	movs r0, #0x48
	bl sub_0803F8E0
	ldr r1, [r4]
	movs r0, #0x48
	bl sub_0803FE50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

