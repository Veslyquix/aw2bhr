	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080366C4
sub_080366C4: @ 0x080366C4
	ldr r1, _080366CC @ =gUnknown_030040EC
	str r0, [r1]
	bx lr
	.align 2, 0
_080366CC: .4byte gUnknown_030040EC

