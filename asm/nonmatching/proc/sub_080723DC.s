	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080723DC
sub_080723DC: @ 0x080723DC
	push {lr}
	ldr r2, _08072438 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807243C @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08072440 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _08072444 @ =gUnknown_03001FFC
	movs r0, #0x10
	strh r0, [r1]
	ldrh r1, [r2]
	ldr r0, _08072448 @ =0x0000FFE0
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0807244C @ =gPal
	movs r0, #0
	strh r0, [r1]
	bl sub_080135A4
	ldr r2, _08072450 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_08072438: .4byte gUnknown_030030E0
_0807243C: .4byte gUnknown_03002020
_08072440: .4byte gUnknown_03002B28
_08072444: .4byte gUnknown_03001FFC
_08072448: .4byte 0x0000FFE0
_0807244C: .4byte gPal
_08072450: .4byte gDispIo

