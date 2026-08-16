	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080443D8
sub_080443D8: @ 0x080443D8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080443E8 @ =gUnknown_084A0818
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080443E8: .4byte gUnknown_084A0818

