	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CA84
sub_0806CA84: @ 0x0806CA84
	push {lr}
	ldr r0, _0806CA94 @ =gUnknown_0849E818
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806CA94: .4byte gUnknown_0849E818

