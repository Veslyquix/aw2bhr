	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061E54
sub_08061E54: @ 0x08061E54
	adds r3, r0, #0
	ldr r2, _08061E7C @ =gUnknown_085D5ABC
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r1, [r0, #0x10]
	subs r1, #5
	ldrb r0, [r3, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r1, r0
	bge _08061E78
	ldrb r1, [r3, #9]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #9]
_08061E78:
	bx lr
	.align 2, 0
_08061E7C: .4byte gUnknown_085D5ABC

