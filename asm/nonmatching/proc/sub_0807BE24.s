	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BE24
sub_0807BE24: @ 0x0807BE24
	adds r3, r0, #0
	ldr r0, _0807BE40 @ =gUnknown_0300592C
	ldr r2, [r0]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r1, #0
	strh r2, [r0]
	adds r0, #0x1a
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	str r1, [r3, #0x60]
	bx lr
	.align 2, 0
_0807BE40: .4byte gUnknown_0300592C

