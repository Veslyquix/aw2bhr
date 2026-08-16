	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031430
sub_08031430: @ 0x08031430
	push {lr}
	ldr r0, _0803143C @ =gUnknown_0849B284
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0803143C: .4byte gUnknown_0849B284

