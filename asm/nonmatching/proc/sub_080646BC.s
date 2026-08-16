	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080646BC
sub_080646BC: @ 0x080646BC
	ldr r1, _080646D0 @ =gUnknown_08580934
	ldr r2, [r1]
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r1, #1
	strb r1, [r2]
	movs r1, #0x10
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
_080646D0: .4byte gUnknown_08580934

