	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045F08
sub_08045F08: @ 0x08045F08
	push {lr}
	ldr r0, _08045F14 @ =0x0000019D
	bl sub_0803B524
	pop {r0}
	bx r0
	.align 2, 0
_08045F14: .4byte 0x0000019D

