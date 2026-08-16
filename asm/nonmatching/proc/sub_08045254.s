	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045254
sub_08045254: @ 0x08045254
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x32]
	adds r1, r0, #1
	strh r1, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _08045290 @ =gUnknown_08091398
	cmp r0, #1
	ble _0804527C
	ldr r1, [r3]
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldr r1, _08045294 @ =gUnknown_03002B28
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x32]
_0804527C:
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r0, #0
	bne _0804528A
	adds r0, r2, #0
	bl Proc_Break
_0804528A:
	pop {r0}
	bx r0
	.align 2, 0
_08045290: .4byte gUnknown_08091398
_08045294: .4byte gUnknown_03002B28

