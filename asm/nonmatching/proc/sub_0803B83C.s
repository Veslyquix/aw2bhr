	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B83C
sub_0803B83C: @ 0x0803B83C
	push {lr}
	ldr r0, _0803B850 @ =gUnknown_0849B048
	bl sub_0801537C
	ldr r0, _0803B854 @ =gUnknown_0849E7F8
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B850: .4byte gUnknown_0849B048
_0803B854: .4byte gUnknown_0849E7F8

