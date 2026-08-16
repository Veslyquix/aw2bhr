	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E968
sub_0806E968: @ 0x0806E968
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x58]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	bl Interpolate
	ldr r3, _0806E9B0 @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r2, _0806E9B4 @ =gUnknown_03002020
	movs r1, #8
	subs r1, r1, r0
	strh r1, [r2]
	ldr r1, _0806E9B8 @ =gUnknown_03002B28
	adds r0, #8
	strh r0, [r1]
	ldr r1, _0806E9BC @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x58]
	cmp r0, #0x1f
	ble _0806E9C0
	adds r0, r4, #0
	bl Proc_Break
	b _0806E9C4
	.align 2, 0
_0806E9B0: .4byte gUnknown_030030E0
_0806E9B4: .4byte gUnknown_03002020
_0806E9B8: .4byte gUnknown_03002B28
_0806E9BC: .4byte gUnknown_03001FFC
_0806E9C0:
	adds r0, #1
	str r0, [r4, #0x58]
_0806E9C4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

