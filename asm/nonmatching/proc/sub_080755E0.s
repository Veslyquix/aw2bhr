	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080755E0
sub_080755E0: @ 0x080755E0
	push {lr}
	ldr r0, _080755EC @ =gUnknown_086143B8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080755EC: .4byte gUnknown_086143B8

