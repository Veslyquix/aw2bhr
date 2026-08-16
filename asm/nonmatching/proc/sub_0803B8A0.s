	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B8A0
sub_0803B8A0: @ 0x0803B8A0
	push {lr}
	bl sub_08016ED8
	ldr r0, _0803B8B4 @ =gUnknown_0849E818
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B8B4: .4byte gUnknown_0849E818

