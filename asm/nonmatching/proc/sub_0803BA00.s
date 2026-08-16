	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BA00
sub_0803BA00: @ 0x0803BA00
	push {lr}
	ldr r0, _0803BA14 @ =gUnknown_03003FC0
	movs r1, #2
	strb r1, [r0, #1]
	ldr r0, _0803BA18 @ =gUnknown_0849EC1C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803BA14: .4byte gUnknown_03003FC0
_0803BA18: .4byte gUnknown_0849EC1C

