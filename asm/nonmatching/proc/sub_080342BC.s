	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080342BC
sub_080342BC: @ 0x080342BC
	push {lr}
	ldr r0, _080342D4 @ =gUnknown_08616EFC
	bl Proc_EndEach
	ldr r0, _080342D8 @ =gUnknown_0849BB68
	bl Proc_EndEach
	movs r0, #0
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_080342D4: .4byte gUnknown_08616EFC
_080342D8: .4byte gUnknown_0849BB68

