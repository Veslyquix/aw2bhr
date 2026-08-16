	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045F40
sub_08045F40: @ 0x08045F40
	push {lr}
	ldr r0, _08045F54 @ =0x000001E1
	bl sub_0803B4DC
	ldr r0, _08045F58 @ =gUnknown_084B7628
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08045F54: .4byte 0x000001E1
_08045F58: .4byte gUnknown_084B7628

