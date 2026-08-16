	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E90C
sub_0806E90C: @ 0x0806E90C
	push {r4, lr}
	ldr r3, _0806E950 @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _0806E954 @ =gUnknown_03002020
	movs r2, #8
	strh r2, [r1]
	ldr r1, _0806E958 @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r2, _0806E95C @ =gUnknown_03001FFC
	movs r1, #0
	strh r1, [r2]
	ldrh r2, [r3]
	ldr r1, _0806E960 @ =0x0000FFE0
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	ldr r2, _0806E964 @ =0x0000E0FF
	ands r1, r2
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	movs r1, #0
	str r1, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E950: .4byte gUnknown_030030E0
_0806E954: .4byte gUnknown_03002020
_0806E958: .4byte gUnknown_03002B28
_0806E95C: .4byte gUnknown_03001FFC
_0806E960: .4byte 0x0000FFE0
_0806E964: .4byte 0x0000E0FF

