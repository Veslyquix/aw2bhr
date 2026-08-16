	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080198AC
sub_080198AC: @ 0x080198AC
	ldr r1, _080198B4 @ =gUnknown_03002F20
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080198B4: .4byte gUnknown_03002F20

