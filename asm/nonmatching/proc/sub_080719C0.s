	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080719C0
sub_080719C0: @ 0x080719C0
	push {lr}
	ldr r0, _080719D0 @ =gUnknown_08613E08
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080719D0: .4byte gUnknown_08613E08

