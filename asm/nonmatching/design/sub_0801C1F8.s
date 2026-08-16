	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C1F8
sub_0801C1F8: @ 0x0801C1F8
	ldr r1, _0801C20C @ =gUnknown_03000288
	movs r2, #0
	movs r3, #0xa5
	lsls r3, r3, #2
	adds r0, r1, r3
_0801C202:
	str r2, [r0]
	subs r0, #0x2c
	cmp r0, r1
	bge _0801C202
	bx lr
	.align 2, 0
_0801C20C: .4byte gUnknown_03000288

