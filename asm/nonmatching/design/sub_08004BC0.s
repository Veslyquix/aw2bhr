	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004BC0
sub_08004BC0: @ 0x08004BC0
	ldr r0, _08004BD4 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08004BD4: .4byte gUnknown_0200B0B0

