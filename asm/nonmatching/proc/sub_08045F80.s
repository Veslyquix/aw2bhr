	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045F80
sub_08045F80: @ 0x08045F80
	push {lr}
	ldr r0, _08045F90 @ =gUnknown_0848A150
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08045F90: .4byte gUnknown_0848A150

