	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037F70
sub_08037F70: @ 0x08037F70
	push {lr}
	ldr r0, _08037F7C @ =gUnknown_0849D55C
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_08037F7C: .4byte gUnknown_0849D55C

