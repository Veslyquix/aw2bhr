	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078124
sub_08078124: @ 0x08078124
	push {lr}
	bl sub_080745C0
	ldr r0, _08078138 @ =gUnknown_086147FC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08078138: .4byte gUnknown_086147FC

