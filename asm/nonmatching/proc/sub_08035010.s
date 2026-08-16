	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035010
sub_08035010: @ 0x08035010
	push {lr}
	ldr r0, _0803501C @ =gUnknown_0849BB50
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0803501C: .4byte gUnknown_0849BB50

