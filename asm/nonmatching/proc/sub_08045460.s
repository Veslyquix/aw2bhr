	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045460
sub_08045460: @ 0x08045460
	push {lr}
	adds r1, r0, #0
	ldr r0, _08045474 @ =gUnknown_084A09CC
	bl Proc_StartBlocking
	movs r1, #2
	str r1, [r0, #0x54]
	pop {r0}
	bx r0
	.align 2, 0
_08045474: .4byte gUnknown_084A09CC

