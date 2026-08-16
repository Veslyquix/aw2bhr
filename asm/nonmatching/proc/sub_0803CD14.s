	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CD14
sub_0803CD14: @ 0x0803CD14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0803CD28 @ =gUnknown_020280C0
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x13]
	bx lr
	.align 2, 0
_0803CD28: .4byte gUnknown_020280C0

