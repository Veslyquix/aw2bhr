	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003948
sub_08003948: @ 0x08003948
	ldr r0, _08003958 @ =gUnknown_0200B0B0
	ldr r2, [r0]
	ldrh r1, [r2]
	ldr r0, _0800395C @ =0x0000FFF7
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08003958: .4byte gUnknown_0200B0B0
_0800395C: .4byte 0x0000FFF7

