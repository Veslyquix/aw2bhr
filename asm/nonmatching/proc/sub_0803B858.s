	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B858
sub_0803B858: @ 0x0803B858
	push {lr}
	bl sub_0803BCA0
	bl sub_08085AF4
	ldr r0, _0803B870 @ =gUnknown_0849EC8C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B870: .4byte gUnknown_0849EC8C

