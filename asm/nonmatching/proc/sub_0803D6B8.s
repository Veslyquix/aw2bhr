	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D6B8
sub_0803D6B8: @ 0x0803D6B8
	ldr r0, _0803D6CC @ =gUnknown_030040F8
	movs r1, #4
	adds r0, #4
_0803D6BE:
	strb r1, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _0803D6BE
	bx lr
	.align 2, 0
_0803D6CC: .4byte gUnknown_030040F8

