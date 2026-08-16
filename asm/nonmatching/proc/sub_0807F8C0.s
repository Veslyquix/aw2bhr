	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F8C0
sub_0807F8C0: @ 0x0807F8C0
	push {lr}
	ldr r0, _0807F8CC @ =gUnknown_08616638
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807F8CC: .4byte gUnknown_08616638

