	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078E04
sub_08078E04: @ 0x08078E04
	push {lr}
	ldr r0, _08078E10 @ =gUnknown_08615CA0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08078E10: .4byte gUnknown_08615CA0

