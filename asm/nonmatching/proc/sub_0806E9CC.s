	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E9CC
sub_0806E9CC: @ 0x0806E9CC
	push {r4, lr}
	ldr r4, _0806EA10 @ =gUnknown_030030E0
	ldrb r2, [r4]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r4]
	ldr r1, _0806EA14 @ =gUnknown_03002020
	movs r3, #0
	strh r3, [r1]
	ldr r2, _0806EA18 @ =gUnknown_03002B28
	movs r1, #0x10
	strh r1, [r2]
	ldr r1, _0806EA1C @ =gUnknown_03001FFC
	strh r3, [r1]
	ldrh r2, [r4]
	ldr r1, _0806EA20 @ =0x0000FFE0
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	ldr r2, _0806EA24 @ =0x0000E0FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r4]
	movs r1, #0
	str r1, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EA10: .4byte gUnknown_030030E0
_0806EA14: .4byte gUnknown_03002020
_0806EA18: .4byte gUnknown_03002B28
_0806EA1C: .4byte gUnknown_03001FFC
_0806EA20: .4byte 0x0000FFE0
_0806EA24: .4byte 0x0000E0FF

