	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084858
sub_08084858: @ 0x08084858
	ldr r1, _08084860 @ =gUnknown_03000650
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08084860: .4byte gUnknown_03000650

