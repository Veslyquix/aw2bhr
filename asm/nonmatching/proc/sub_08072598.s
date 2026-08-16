	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072598
sub_08072598: @ 0x08072598
	push {lr}
	ldr r0, _080725A4 @ =gUnknown_08613F2C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080725A4: .4byte gUnknown_08613F2C

