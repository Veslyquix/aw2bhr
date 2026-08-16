	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045F94
sub_08045F94: @ 0x08045F94
	push {lr}
	ldr r0, _08045FA0 @ =gUnknown_0848A150
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08045FA0: .4byte gUnknown_0848A150

