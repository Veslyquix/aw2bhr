	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080733B8
sub_080733B8: @ 0x080733B8
	push {lr}
	ldr r0, _080733C4 @ =gUnknown_086140D4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080733C4: .4byte gUnknown_086140D4

