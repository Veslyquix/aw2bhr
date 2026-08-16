	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C154
sub_0806C154: @ 0x0806C154
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _0806C1A8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0806C1AC @ =gUnknown_03002020
	ldr r1, [r4, #0x58]
	asrs r1, r1, #1
	strh r1, [r0]
	ldr r2, _0806C1B0 @ =gUnknown_03002B28
	movs r0, #0x10
	subs r0, r0, r1
	strh r0, [r2]
	ldr r1, _0806C1B4 @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r0, _0806C1B8 @ =0x000001FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	ldr r3, [r4, #0x54]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	bl sub_0801BEFC
	ldr r0, [r4, #0x58]
	cmp r0, #0x1f
	ble _0806C1BC
	bl sub_08012358
	adds r0, r4, #0
	bl Proc_Break
	b _0806C1C0
	.align 2, 0
_0806C1A8: .4byte gUnknown_030030E0
_0806C1AC: .4byte gUnknown_03002020
_0806C1B0: .4byte gUnknown_03002B28
_0806C1B4: .4byte gUnknown_03001FFC
_0806C1B8: .4byte 0x000001FF
_0806C1BC:
	adds r0, #1
	str r0, [r4, #0x58]
_0806C1C0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

