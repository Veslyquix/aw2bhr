	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013B0C
sub_08013B0C: @ 0x08013B0C
	ldr r0, _08013B18 @ =gUnknown_03002F00
	ldrh r1, [r0]
	movs r2, #4
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013B18: .4byte gUnknown_03002F00

