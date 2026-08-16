	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A490
sub_0806A490: @ 0x0806A490
	push {lr}
	ldr r0, _0806A49C @ =gUnknown_08580FF4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0806A49C: .4byte gUnknown_08580FF4

