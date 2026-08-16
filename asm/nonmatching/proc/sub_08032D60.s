	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032D60
sub_08032D60: @ 0x08032D60
	push {lr}
	ldr r0, _08032D6C @ =gUnknown_0849B6B0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08032D6C: .4byte gUnknown_0849B6B0

