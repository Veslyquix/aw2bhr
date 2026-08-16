	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017988
sub_08017988: @ 0x08017988
	ldr r0, _08017990 @ =gUnknown_03002B38
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08017990: .4byte gUnknown_03002B38

