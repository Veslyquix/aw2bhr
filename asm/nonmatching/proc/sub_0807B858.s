	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B858
sub_0807B858: @ 0x0807B858
	ldr r0, _0807B878 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0807B874
	ldr r1, _0807B87C @ =gUnknown_03002B34
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0807B880 @ =gUnknown_03002F18
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807B874:
	bx lr
	.align 2, 0
_0807B878: .4byte gUnknown_03004008
_0807B87C: .4byte gUnknown_03002B34
_0807B880: .4byte gUnknown_03002F18

