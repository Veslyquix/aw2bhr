	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034DF8
sub_08034DF8: @ 0x08034DF8
	push {r4, r5, lr}
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034E8A
	ldr r4, _08034E90 @ =gUnknown_08090E28
	ldr r0, [r4]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	adds r5, r4, #0
	cmp r0, r1
	bne _08034E8A
	movs r0, #0
	bl sub_0801B780
	ldr r0, _08034E94 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	ldr r4, _08034E98 @ =gUnknown_08090E2C
	ldr r3, _08034E9C @ =gUnknown_08090E30
	cmp r0, #0
	beq _08034E44
	ldr r0, [r4]
	ldrh r1, [r0]
	ldr r0, [r3]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _08034E62
_08034E44:
	ldr r0, [r4]
	ldrh r2, [r0]
	ldr r0, [r3]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r1, #0x30
	ldrb r1, [r1]
	bl sub_08029088
_08034E62:
	ldr r0, [r5]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08034E8A
	ldr r0, [r4]
	ldrb r0, [r0]
	bl sub_08043DAC
	bl sub_0802BB98
	bl sub_080351F0
	ldr r1, _08034EA0 @ =gUnknown_030032D8
	movs r0, #7
	strh r0, [r1]
_08034E8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034E90: .4byte gUnknown_08090E28
_08034E94: .4byte gUnknown_03003FC0
_08034E98: .4byte gUnknown_08090E2C
_08034E9C: .4byte gUnknown_08090E30
_08034EA0: .4byte gUnknown_030032D8

