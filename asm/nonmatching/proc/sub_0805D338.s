	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805D338
sub_0805D338: @ 0x0805D338
	ldr r1, _0805D340 @ =gUnknown_03004780
	movs r0, #5
	strh r0, [r1]
	bx lr
	.align 2, 0
_0805D340: .4byte gUnknown_03004780

