	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C57C
sub_0802C57C: @ 0x0802C57C
	ldr r2, _0802C58C @ =gUnknown_030044A4
	ldr r1, _0802C590 @ =gUnknown_03003F24
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_0802C58C: .4byte gUnknown_030044A4
_0802C590: .4byte gUnknown_03003F24

