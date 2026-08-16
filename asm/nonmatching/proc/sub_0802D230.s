	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D230
sub_0802D230: @ 0x0802D230
	push {r4, lr}
	bl sub_08034F48
	bl sub_0801A168
	ldr r4, _0802D270 @ =gUnknown_030040D8
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0802D278
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	ldr r3, _0802D274 @ =gUnknown_085D5ABC
	ldr r1, [r4]
	ldrb r2, [r1]
	movs r1, #0x5c
	muls r1, r2, r1
	adds r1, r1, r3
	ldrh r1, [r1, #6]
	muls r0, r1, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	b _0802D27A
	.align 2, 0
_0802D270: .4byte gUnknown_030040D8
_0802D274: .4byte gUnknown_085D5ABC
_0802D278:
	movs r1, #0
_0802D27A:
	ldr r0, _0802D298 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_08025B58
	bl sub_0804256C
	ldr r0, _0802D29C @ =gUnknown_03003F38
	ldrb r0, [r0]
	bl sub_08025D60
	bl sub_080258CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D298: .4byte gUnknown_030033EC
_0802D29C: .4byte gUnknown_03003F38

