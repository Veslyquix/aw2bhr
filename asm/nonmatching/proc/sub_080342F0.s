	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080342F0
sub_080342F0: @ 0x080342F0
	push {lr}
	ldr r0, _08034304 @ =gUnknown_0849B3CC
	bl Proc_Find
	cmp r0, #0
	beq _080342FE
	movs r0, #1
_080342FE:
	pop {r1}
	bx r1
	.align 2, 0
_08034304: .4byte gUnknown_0849B3CC

