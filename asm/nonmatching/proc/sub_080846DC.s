	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080846DC
sub_080846DC: @ 0x080846DC
	push {lr}
	ldr r0, _080846F0 @ =gUnknown_08616990
	bl Proc_Find
	cmp r0, #0
	beq _080846EA
	movs r0, #1
_080846EA:
	pop {r1}
	bx r1
	.align 2, 0
_080846F0: .4byte gUnknown_08616990

