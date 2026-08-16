	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003934
sub_08003934: @ 0x08003934
	ldr r0, _08003944 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, #8
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08003944: .4byte gUnknown_0200B0B0

