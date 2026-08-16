	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031E6C
sub_08031E6C: @ 0x08031E6C
	push {lr}
	ldr r0, _08031E78 @ =gUnknown_0849B2A4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08031E78: .4byte gUnknown_0849B2A4

