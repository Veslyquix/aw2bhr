	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080444B4
sub_080444B4: @ 0x080444B4
	adds r1, r0, #0
	ldrb r3, [r1, #1]
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	bne _080444E8
	ldr r2, _080444E4 @ =gUnknown_085D5ABC
	ldrb r1, [r1]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x18]
	cmp r0, #2
	beq _080444E0
	cmp r0, #3
	beq _080444E0
	cmp r0, #0
	beq _080444E8
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080444E8
_080444E0:
	movs r0, #1
	b _080444EA
	.align 2, 0
_080444E4: .4byte gUnknown_085D5ABC
_080444E8:
	movs r0, #0
_080444EA:
	bx lr

