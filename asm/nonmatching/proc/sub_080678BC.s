	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080678BC
sub_080678BC: @ 0x080678BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080678D0 @ =gUnknown_08580FF4
	bl Proc_Find
	str r4, [r0, #0x60]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080678D0: .4byte gUnknown_08580FF4

