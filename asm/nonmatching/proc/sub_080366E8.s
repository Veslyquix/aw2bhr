	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080366E8
sub_080366E8: @ 0x080366E8
	ldr r0, _080366F0 @ =gUnknown_030040D0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080366F0: .4byte gUnknown_030040D0

