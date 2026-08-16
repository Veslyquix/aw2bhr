	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074600
sub_08074600: @ 0x08074600
	push {lr}
	adds r3, r0, #0
	ldr r2, _08074624 @ =gUnknown_03001FFC
	adds r1, r3, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	strh r0, [r2]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0807461E
	adds r0, r3, #0
	bl Proc_Break
_0807461E:
	pop {r0}
	bx r0
	.align 2, 0
_08074624: .4byte gUnknown_03001FFC

