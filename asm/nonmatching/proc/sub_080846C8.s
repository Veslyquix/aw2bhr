	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080846C8
sub_080846C8: @ 0x080846C8
	push {lr}
	ldr r0, _080846D8 @ =gUnknown_08616990
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080846D8: .4byte gUnknown_08616990

