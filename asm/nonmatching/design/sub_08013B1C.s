	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013B1C
sub_08013B1C: @ 0x08013B1C
	ldr r0, _08013B28 @ =gUnknown_03002F00
	ldrh r1, [r0]
	movs r2, #8
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013B28: .4byte gUnknown_03002F00

