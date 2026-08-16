	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073CA0
sub_08073CA0: @ 0x08073CA0
	push {lr}
	ldr r0, _08073CB4 @ =gUnknown_086141DC
	bl Proc_Find
	cmp r0, #0
	beq _08073CAE
	movs r0, #1
_08073CAE:
	pop {r1}
	bx r1
	.align 2, 0
_08073CB4: .4byte gUnknown_086141DC

