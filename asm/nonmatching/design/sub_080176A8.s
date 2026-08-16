	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080176A8
sub_080176A8: @ 0x080176A8
	ldr r2, _080176B8 @ =gUnknown_03004080
	ldrh r1, [r2]
	ldr r0, _080176BC @ =0x000003E6
	cmp r1, r0
	bhi _080176B6
	adds r0, r1, #1
	strh r0, [r2]
_080176B6:
	bx lr
	.align 2, 0
_080176B8: .4byte gUnknown_03004080
_080176BC: .4byte 0x000003E6

