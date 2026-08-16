	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034290
sub_08034290: @ 0x08034290
	push {lr}
	ldr r0, _080342B0 @ =gUnknown_0849BB80
	bl Proc_EndEach
	ldr r0, _080342B4 @ =gUnknown_08616EFC
	bl Proc_EndEach
	ldr r0, _080342B8 @ =gUnknown_0849BB68
	bl Proc_EndEach
	movs r0, #0
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_080342B0: .4byte gUnknown_0849BB80
_080342B4: .4byte gUnknown_08616EFC
_080342B8: .4byte gUnknown_0849BB68

