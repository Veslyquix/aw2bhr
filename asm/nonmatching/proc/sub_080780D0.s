	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080780D0
sub_080780D0: @ 0x080780D0
	push {lr}
	ldr r0, _080780E0 @ =gUnknown_08614894
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080780E0: .4byte gUnknown_08614894

