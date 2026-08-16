	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802706C
sub_0802706C: @ 0x0802706C
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080270A8 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080270B4
	ldr r0, _080270AC @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080270B4
	ldr r1, _080270B0 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	muls r0, r3, r0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080270B4
	movs r0, #1
	b _080270B6
	.align 2, 0
_080270A8: .4byte gUnknown_03003FC0
_080270AC: .4byte gUnknown_08499598
_080270B0: .4byte gUnknown_085D5ABC
_080270B4:
	movs r0, #0
_080270B6:
	bx lr

