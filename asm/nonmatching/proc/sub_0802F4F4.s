	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F4F4
sub_0802F4F4: @ 0x0802F4F4
	ldr r0, _0802F500 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0802F500: .4byte gUnknown_0849B018

