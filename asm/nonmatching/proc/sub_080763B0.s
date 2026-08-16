	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080763B0
sub_080763B0: @ 0x080763B0
	push {lr}
	ldr r0, _080763BC @ =gUnknown_08614460
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080763BC: .4byte gUnknown_08614460

