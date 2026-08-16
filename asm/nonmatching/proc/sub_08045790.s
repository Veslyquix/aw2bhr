	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045790
sub_08045790: @ 0x08045790
	push {lr}
	ldr r0, _080457A0 @ =gUnknown_084A0A3C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080457A0: .4byte gUnknown_084A0A3C

