	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805CA24
sub_0805CA24: @ 0x0805CA24
	ldr r2, _0805CA54 @ =gUnknown_085D5ABC
	ldr r0, _0805CA58 @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r2, r0, r2
	ldrb r1, [r2, #0x11]
	ldrb r0, [r2, #0xe]
	orrs r0, r1
	cmp r0, #0
	beq _0805CA4E
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	beq _0805CA5C
	ldrh r1, [r3, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805CA5C
_0805CA4E:
	movs r0, #0
	b _0805CA5E
	.align 2, 0
_0805CA54: .4byte gUnknown_085D5ABC
_0805CA58: .4byte gUnknown_030040D8
_0805CA5C:
	movs r0, #1
_0805CA5E:
	bx lr

