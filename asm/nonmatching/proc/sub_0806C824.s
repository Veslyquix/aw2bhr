	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C824
sub_0806C824: @ 0x0806C824
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0806C858 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _0806C85C @ =gUnknown_03002020
	ldr r3, [r4, #0x58]
	asrs r1, r3, #1
	movs r0, #0x10
	subs r0, r0, r1
	strh r0, [r2]
	ldr r0, _0806C860 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _0806C864 @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	cmp r3, #0x1f
	ble _0806C868
	adds r0, r4, #0
	bl Proc_Break
	b _0806C86C
	.align 2, 0
_0806C858: .4byte gUnknown_030030E0
_0806C85C: .4byte gUnknown_03002020
_0806C860: .4byte gUnknown_03002B28
_0806C864: .4byte gUnknown_03001FFC
_0806C868:
	adds r0, r3, #1
	str r0, [r4, #0x58]
_0806C86C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

