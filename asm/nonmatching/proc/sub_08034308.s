	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034308
sub_08034308: @ 0x08034308
	push {lr}
	adds r1, r0, #0
	ldr r0, _08034318 @ =gUnknown_0849B8B8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08034318: .4byte gUnknown_0849B8B8

