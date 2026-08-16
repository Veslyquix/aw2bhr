	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045210
sub_08045210: @ 0x08045210
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x32]
	adds r1, r0, #1
	strh r1, [r2, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _0804524C @ =gUnknown_08091394
	cmp r0, #1
	ble _08045238
	ldr r1, [r3]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08045250 @ =gUnknown_03002B28
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x32]
_08045238:
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r0, #0xa
	bne _08045246
	adds r0, r2, #0
	bl Proc_Break
_08045246:
	pop {r0}
	bx r0
	.align 2, 0
_0804524C: .4byte gUnknown_08091394
_08045250: .4byte gUnknown_03002B28

