	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080198B8
sub_080198B8: @ 0x080198B8
	ldr r1, _080198C0 @ =gUnknown_03001FF0
	str r0, [r1]
	bx lr
	.align 2, 0
_080198C0: .4byte gUnknown_03001FF0

