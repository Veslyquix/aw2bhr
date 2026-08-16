	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061A40
sub_08061A40: @ 0x08061A40
	ldrb r2, [r1]
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	strb r2, [r0, #2]
	ldrb r2, [r1, #3]
	strb r2, [r0, #3]
	ldrb r2, [r1, #4]
	strb r2, [r0, #4]
	ldrb r2, [r1, #5]
	strb r2, [r0, #5]
	ldrb r2, [r1, #6]
	strb r2, [r0, #6]
	ldrb r2, [r1, #7]
	strb r2, [r0, #7]
	ldrb r2, [r1, #8]
	strb r2, [r0, #8]
	ldrb r2, [r1, #9]
	strb r2, [r0, #9]
	ldrb r2, [r1, #0xa]
	strb r2, [r0, #0xa]
	ldrb r2, [r1, #0xb]
	strb r2, [r0, #0xb]
	ldrb r2, [r1, #0xc]
	strb r2, [r0, #0xc]
	ldrb r2, [r1, #0xd]
	strb r2, [r0, #0xd]
	ldrb r2, [r1, #0xe]
	strb r2, [r0, #0xe]
	ldrb r2, [r1, #0xf]
	strb r2, [r0, #0xf]
	adds r2, r0, #0
	adds r2, #0x10
	adds r1, #0x10
	movs r3, #0x17
_08061A88:
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1, #1]
	strb r0, [r2, #1]
	ldrb r0, [r1, #2]
	strb r0, [r2, #2]
	ldrb r0, [r1, #3]
	strb r0, [r2, #3]
	ldrb r0, [r1, #4]
	strb r0, [r2, #4]
	ldrb r0, [r1, #5]
	strb r0, [r2, #5]
	ldrb r0, [r1, #6]
	strb r0, [r2, #6]
	ldrb r0, [r1, #7]
	strb r0, [r2, #7]
	ldrb r0, [r1, #8]
	strb r0, [r2, #8]
	ldrb r0, [r1, #9]
	strb r0, [r2, #9]
	ldrb r0, [r1, #0xa]
	strb r0, [r2, #0xa]
	ldrb r0, [r1, #0xb]
	strb r0, [r2, #0xb]
	adds r2, #0xc
	adds r1, #0xc
	subs r3, #1
	cmp r3, #0
	bge _08061A88
	bx lr

