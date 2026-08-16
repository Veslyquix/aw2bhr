	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803710C
sub_0803710C: @ 0x0803710C
	push {lr}
	ldr r0, _08037120 @ =gUnknown_0849D3BC
	bl Proc_Find
	cmp r0, #0
	beq _0803711A
	movs r0, #1
_0803711A:
	pop {r1}
	bx r1
	.align 2, 0
_08037120: .4byte gUnknown_0849D3BC

