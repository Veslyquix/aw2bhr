	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072454
sub_08072454: @ 0x08072454
	ldr r2, _08072488 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807248C @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08072490 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _08072494 @ =gUnknown_03001FFC
	movs r0, #0x10
	strh r0, [r1]
	ldrh r1, [r2]
	ldr r0, _08072498 @ =0x0000FFE0
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08072488: .4byte gUnknown_030030E0
_0807248C: .4byte gUnknown_03002020
_08072490: .4byte gUnknown_03002B28
_08072494: .4byte gUnknown_03001FFC
_08072498: .4byte 0x0000FFE0

