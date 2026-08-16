	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085AC8
sub_08085AC8: @ 0x08085AC8
	push {lr}
	ldr r0, _08085AD8 @ =gUnknown_08616B74
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08085AD8: .4byte gUnknown_08616B74

