	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080879A0
sub_080879A0: @ 0x080879A0
	push {lr}
	ldr r0, _080879AC @ =gUnknown_08616DB4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080879AC: .4byte gUnknown_08616DB4

