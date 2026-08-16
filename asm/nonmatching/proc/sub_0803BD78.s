	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BD78
sub_0803BD78: @ 0x0803BD78
	ldr r2, _0803BDB8 @ =gUnknown_03003FC0
	movs r1, #0
	movs r0, #3
	strb r0, [r2, #1]
	movs r3, #1
	strb r3, [r2, #0xd]
	strb r3, [r2, #7]
	strb r3, [r2, #8]
	adds r0, r2, #0
	adds r0, #0x2d
	strb r3, [r0]
	subs r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0xfa
	lsls r0, r0, #2
	str r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x31
	strb r1, [r0]
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BDB4
	strb r3, [r2, #9]
_0803BDB4:
	bx lr
	.align 2, 0
_0803BDB8: .4byte gUnknown_03003FC0

