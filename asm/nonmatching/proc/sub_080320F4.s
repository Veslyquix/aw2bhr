	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080320F4
sub_080320F4: @ 0x080320F4
	push {lr}
	ldr r0, _08032100 @ =gUnknown_0849B304
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08032100: .4byte gUnknown_0849B304

