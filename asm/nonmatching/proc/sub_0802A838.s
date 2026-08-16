	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A838
sub_0802A838: @ 0x0802A838
	ldr r2, _0802A850 @ =gUnknown_08108264
	ldr r1, _0802A854 @ =gUnknown_0849A354
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #3
	ldr r1, _0802A858 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	bx lr
	.align 2, 0
_0802A850: .4byte gUnknown_08108264
_0802A854: .4byte gUnknown_0849A354
_0802A858: .4byte 0x000003FF

