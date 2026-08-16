	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F5D4
sub_0803F5D4: @ 0x0803F5D4
	ldr r1, _0803F5E0 @ =gUnknown_02028360
	subs r0, r0, r1
	asrs r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0803F5E0: .4byte gUnknown_02028360

