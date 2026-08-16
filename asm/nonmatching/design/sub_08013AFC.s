	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013AFC
sub_08013AFC: @ 0x08013AFC
	ldr r0, _08013B08 @ =gUnknown_03002F00
	ldrh r1, [r0]
	movs r2, #2
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013B08: .4byte gUnknown_03002F00

