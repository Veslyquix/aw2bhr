	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080433D8
sub_080433D8: @ 0x080433D8
	ldr r2, _080433E4 @ =gUnknown_085D5ABC
	movs r1, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	bx lr
	.align 2, 0
_080433E4: .4byte gUnknown_085D5ABC

