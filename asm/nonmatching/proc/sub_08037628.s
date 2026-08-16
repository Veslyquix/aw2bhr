	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037628
sub_08037628: @ 0x08037628
	push {lr}
	ldr r0, _08037634 @ =gUnknown_0849D41C
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_08037634: .4byte gUnknown_0849D41C

