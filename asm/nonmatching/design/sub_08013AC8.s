	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013AC8
sub_08013AC8: @ 0x08013AC8
	ldr r1, _08013AD0 @ =gUnknown_03002F00
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08013AD0: .4byte gUnknown_03002F00

