	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080198C4
sub_080198C4: @ 0x080198C4
	ldr r1, _080198CC @ =gUnknown_03001FF0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080198CC: .4byte gUnknown_03001FF0

