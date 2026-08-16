	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BADC
sub_0803BADC: @ 0x0803BADC
	push {lr}
	ldr r0, _0803BAF0 @ =gUnknown_03003FC0
	movs r1, #1
	strb r1, [r0, #1]
	ldr r0, _0803BAF4 @ =gUnknown_0849EBBC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803BAF0: .4byte gUnknown_03003FC0
_0803BAF4: .4byte gUnknown_0849EBBC

