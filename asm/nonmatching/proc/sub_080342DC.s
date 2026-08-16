	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080342DC
sub_080342DC: @ 0x080342DC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080342EC @ =gUnknown_0849B3CC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080342EC: .4byte gUnknown_0849B3CC

