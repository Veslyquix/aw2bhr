	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C55C
sub_0807C55C: @ 0x0807C55C
	push {lr}
	ldr r0, _0807C56C @ =gUnknown_086164A0
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807C56C: .4byte gUnknown_086164A0

