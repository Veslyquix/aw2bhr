	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F8D0
sub_0807F8D0: @ 0x0807F8D0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807F8E0 @ =gUnknown_08616740
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807F8E0: .4byte gUnknown_08616740

