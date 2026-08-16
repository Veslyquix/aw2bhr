	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B608
sub_0803B608: @ 0x0803B608
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803B622
	adds r0, r2, #0
	bl Proc_Break
_0803B622:
	pop {r0}
	bx r0
	.align 2, 0

