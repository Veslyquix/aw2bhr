	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080198A0
sub_080198A0: @ 0x080198A0
	ldr r1, _080198A8 @ =gUnknown_03002F20
	str r0, [r1]
	bx lr
	.align 2, 0
_080198A8: .4byte gUnknown_03002F20

