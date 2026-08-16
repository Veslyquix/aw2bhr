	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080433E8
sub_080433E8: @ 0x080433E8
	ldr r2, _080433F4 @ =gUnknown_085D5ABC
	movs r1, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xc]
	bx lr
	.align 2, 0
_080433F4: .4byte gUnknown_085D5ABC

