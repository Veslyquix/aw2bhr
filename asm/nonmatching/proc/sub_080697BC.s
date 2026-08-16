	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080697BC
sub_080697BC: @ 0x080697BC
	push {lr}
	ldr r0, _080697C8 @ =gUnknown_08581420
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080697C8: .4byte gUnknown_08581420

