	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CB74
sub_0803CB74: @ 0x0803CB74
	adds r2, r0, #0
	ldr r0, _0803CB88 @ =gUnknown_030033F4
	asrs r1, r2, #3
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r2
	ldrb r1, [r1]
	ands r0, r1
	bx lr
	.align 2, 0
_0803CB88: .4byte gUnknown_030033F4

