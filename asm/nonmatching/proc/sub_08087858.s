	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087858
sub_08087858: @ 0x08087858
	push {lr}
	ldr r0, _08087868 @ =gUnknown_08616C54
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08087868: .4byte gUnknown_08616C54

