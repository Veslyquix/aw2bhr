	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C874
sub_0806C874: @ 0x0806C874
	push {lr}
	ldr r0, _0806C884 @ =gUnknown_08581AC8
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806C884: .4byte gUnknown_08581AC8

