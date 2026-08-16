	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042C10
sub_08042C10: @ 0x08042C10
	push {lr}
	ldr r0, _08042C20 @ =gUnknown_0849FC0C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08042C20: .4byte gUnknown_0849FC0C

