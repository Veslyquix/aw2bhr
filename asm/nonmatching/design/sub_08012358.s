	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012358
sub_08012358: @ 0x08012358
	ldr r0, _0801236C @ =gUnknown_030030E0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08012370 @ =gUnknown_03002020
	strh r1, [r0]
	ldr r0, _08012374 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r0, _08012378 @ =gUnknown_03001FFC
	strh r1, [r0]
	bx lr
	.align 2, 0
_0801236C: .4byte gUnknown_030030E0
_08012370: .4byte gUnknown_03002020
_08012374: .4byte gUnknown_03002B28
_08012378: .4byte gUnknown_03001FFC

