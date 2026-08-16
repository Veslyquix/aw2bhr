	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B828
sub_0806B828: @ 0x0806B828
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r2, r2, r0
	str r2, [r4, #0x58]
	ldr r3, _0806B86C @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0806B870 @ =gUnknown_03002020
	asrs r2, r2, #3
	strh r2, [r0]
	ldr r1, _0806B874 @ =gUnknown_03002B28
	movs r0, #0xe
	subs r0, r0, r2
	strh r0, [r1]
	ldr r1, _0806B878 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x60]
	adds r0, #1
	str r0, [r4, #0x60]
	cmp r0, #0x6f
	ble _0806B866
	adds r0, r4, #0
	bl Proc_Break
_0806B866:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B86C: .4byte gUnknown_030030E0
_0806B870: .4byte gUnknown_03002020
_0806B874: .4byte gUnknown_03002B28
_0806B878: .4byte gUnknown_03001FFC

