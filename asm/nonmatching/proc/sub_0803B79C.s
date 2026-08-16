	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B79C
sub_0803B79C: @ 0x0803B79C
	push {lr}
	ldr r0, _0803B7B0 @ =gUnknown_0849E7B8
	bl Proc_Find
	cmp r0, #0
	beq _0803B7AA
	movs r0, #1
_0803B7AA:
	pop {r1}
	bx r1
	.align 2, 0
_0803B7B0: .4byte gUnknown_0849E7B8

