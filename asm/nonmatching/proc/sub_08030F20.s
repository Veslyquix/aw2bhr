	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030F20
sub_08030F20: @ 0x08030F20
	push {lr}
	bl sub_08012358
	ldr r2, _08030F54 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #0x10
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, _08030F58 @ =gUnknown_03002020
	movs r0, #0xf
	strh r0, [r1]
	ldr r1, _08030F5C @ =gUnknown_03002B28
	movs r0, #6
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08030F54: .4byte gUnknown_030030E0
_08030F58: .4byte gUnknown_03002020
_08030F5C: .4byte gUnknown_03002B28

