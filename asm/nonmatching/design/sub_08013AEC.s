	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013AEC
sub_08013AEC: @ 0x08013AEC
	ldr r0, _08013AF8 @ =gUnknown_03002F00
	ldrh r1, [r0]
	movs r2, #1
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013AF8: .4byte gUnknown_03002F00

