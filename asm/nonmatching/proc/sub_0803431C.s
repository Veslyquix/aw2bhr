	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803431C
sub_0803431C: @ 0x0803431C
	push {lr}
	ldr r0, _08034330 @ =gUnknown_0849B8B8
	bl Proc_Find
	cmp r0, #0
	beq _0803432A
	movs r0, #1
_0803432A:
	pop {r1}
	bx r1
	.align 2, 0
_08034330: .4byte gUnknown_0849B8B8

