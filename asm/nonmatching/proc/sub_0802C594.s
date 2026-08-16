	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C594
sub_0802C594: @ 0x0802C594
	ldr r2, _0802C5A4 @ =gUnknown_03003F24
	ldr r1, _0802C5A8 @ =gUnknown_030044A4
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_0802C5A4: .4byte gUnknown_03003F24
_0802C5A8: .4byte gUnknown_030044A4

