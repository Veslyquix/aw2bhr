	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076798
sub_08076798: @ 0x08076798
	push {lr}
	ldr r0, _080767A4 @ =gUnknown_086144FC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080767A4: .4byte gUnknown_086144FC

