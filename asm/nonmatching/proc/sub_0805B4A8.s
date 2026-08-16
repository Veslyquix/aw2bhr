	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B4A8
sub_0805B4A8: @ 0x0805B4A8
	ldr r2, _0805B4C8 @ =gUnknown_085D5ABC
	ldr r0, _0805B4CC @ =gUnknown_030046D4
	ldr r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	cmp r0, #2
	beq _0805B4D0
	cmp r0, #2
	ble _0805B4D4
	cmp r0, #4
	bne _0805B4D4
	movs r0, #2
	b _0805B4D6
	.align 2, 0
_0805B4C8: .4byte gUnknown_085D5ABC
_0805B4CC: .4byte gUnknown_030046D4
_0805B4D0:
	movs r0, #1
	b _0805B4D6
_0805B4D4:
	movs r0, #0
_0805B4D6:
	bx lr

