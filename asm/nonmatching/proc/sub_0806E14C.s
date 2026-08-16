	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E14C
sub_0806E14C: @ 0x0806E14C
	push {lr}
	bl sub_080733B8
	ldr r0, _0806E15C @ =gUnknown_08580CC4
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_0806E15C: .4byte gUnknown_08580CC4

