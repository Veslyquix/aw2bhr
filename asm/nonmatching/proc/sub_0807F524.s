	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F524
sub_0807F524: @ 0x0807F524
	push {lr}
	ldr r0, _0807F534 @ =gUnknown_086165C0
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807F534: .4byte gUnknown_086165C0

