	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024404
sub_08024404: @ 0x08024404
	push {lr}
	ldr r3, _08024444 @ =gUnknown_030030B4
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _08024448 @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0802444C @ =gUnknown_03002B6C
	ldrb r0, [r1]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _08024450 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	bl sub_0801237C
	pop {r0}
	bx r0
	.align 2, 0
_08024444: .4byte gUnknown_030030B4
_08024448: .4byte gUnknown_03001FE8
_0802444C: .4byte gUnknown_03002B6C
_08024450: .4byte gUnknown_0300251C

