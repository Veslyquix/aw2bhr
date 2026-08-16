	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080366D0
sub_080366D0: @ 0x080366D0
	ldr r1, _080366D8 @ =gUnknown_030040D0
	str r0, [r1]
	bx lr
	.align 2, 0
_080366D8: .4byte gUnknown_030040D0

