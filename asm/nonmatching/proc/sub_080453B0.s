	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080453B0
sub_080453B0: @ 0x080453B0
	ldr r1, _080453C4 @ =gUnknown_03001418
	ldrh r0, [r1]
	subs r0, #0xc
	strh r0, [r1]
	ldr r1, _080453C8 @ =gUnknown_03001FF8
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	bx lr
	.align 2, 0
_080453C4: .4byte gUnknown_03001418
_080453C8: .4byte gUnknown_03001FF8

