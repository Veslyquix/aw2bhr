	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080433C8
sub_080433C8: @ 0x080433C8
	ldr r2, _080433D4 @ =gUnknown_085D5ABC
	movs r1, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xf]
	bx lr
	.align 2, 0
_080433D4: .4byte gUnknown_085D5ABC

