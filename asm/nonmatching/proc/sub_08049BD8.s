	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049BD8
sub_08049BD8: @ 0x08049BD8
	push {lr}
	ldr r0, _08049BE8 @ =gUnknown_084C3138
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08049BE8: .4byte gUnknown_084C3138

