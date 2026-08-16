	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034C90
sub_08034C90: @ 0x08034C90
	push {lr}
	bl sub_0802A7B0
	ldr r1, _08034CA0 @ =gUnknown_030032D8
	movs r0, #9
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08034CA0: .4byte gUnknown_030032D8

