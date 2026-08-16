	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032D4C
sub_08032D4C: @ 0x08032D4C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08032D5C @ =gUnknown_0849B6B0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08032D5C: .4byte gUnknown_0849B6B0

