	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F550
sub_0807F550: @ 0x0807F550
	push {lr}
	ldr r0, _0807F560 @ =gUnknown_086166C8
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807F560: .4byte gUnknown_086166C8

