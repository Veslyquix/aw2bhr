	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067A24
sub_08067A24: @ 0x08067A24
	push {lr}
	ldr r0, _08067A38 @ =gUnknown_08581014
	bl Proc_Find
	adds r0, #0x50
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08067A38: .4byte gUnknown_08581014

