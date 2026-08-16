	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CC34
sub_0806CC34: @ 0x0806CC34
	push {lr}
	ldr r0, _0806CC48 @ =gUnknown_08581CF8
	bl Proc_Find
	cmp r0, #0
	beq _0806CC42
	movs r0, #1
_0806CC42:
	pop {r1}
	bx r1
	.align 2, 0
_0806CC48: .4byte gUnknown_08581CF8

