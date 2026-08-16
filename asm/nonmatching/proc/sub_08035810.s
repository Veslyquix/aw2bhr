	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035810
sub_08035810: @ 0x08035810
	push {lr}
	ldr r0, _08035824 @ =gUnknown_0849BE38
	bl Proc_Find
	cmp r0, #0
	beq _08035820
	bl sub_08035828
_08035820:
	pop {r0}
	bx r0
	.align 2, 0
_08035824: .4byte gUnknown_0849BE38

