	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A85C
sub_0802A85C: @ 0x0802A85C
	ldr r2, _0802A874 @ =gUnknown_08106A64
	ldr r1, _0802A878 @ =gUnknown_0849A2C8
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #3
	ldr r1, _0802A87C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	bx lr
	.align 2, 0
_0802A874: .4byte gUnknown_08106A64
_0802A878: .4byte gUnknown_0849A2C8
_0802A87C: .4byte 0x000003FF

