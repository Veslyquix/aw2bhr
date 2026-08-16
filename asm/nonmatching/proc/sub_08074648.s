	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074648
sub_08074648: @ 0x08074648
	push {lr}
	adds r3, r0, #0
	ldr r2, _0807466C @ =gUnknown_03001FFC
	adds r1, r3, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08074668
	adds r0, r3, #0
	bl Proc_Break
_08074668:
	pop {r0}
	bx r0
	.align 2, 0
_0807466C: .4byte gUnknown_03001FFC

