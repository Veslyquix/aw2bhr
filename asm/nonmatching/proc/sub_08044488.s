	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044488
sub_08044488: @ 0x08044488
	adds r3, r0, #0
	ldrb r1, [r3, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080444A8
	ldr r2, _080444AC @ =gUnknown_085D5ABC
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x18]
	cmp r0, #2
	beq _080444B0
	cmp r0, #3
	beq _080444B0
_080444A8:
	movs r0, #0
	b _080444B2
	.align 2, 0
_080444AC: .4byte gUnknown_085D5ABC
_080444B0:
	movs r0, #1
_080444B2:
	bx lr

