	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E6E0
sub_0806E6E0: @ 0x0806E6E0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0806E6F0 @ =gUnknown_08582B94
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0806E6F0: .4byte gUnknown_08582B94

