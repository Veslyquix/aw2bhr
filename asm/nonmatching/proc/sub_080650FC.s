	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080650FC
sub_080650FC: @ 0x080650FC
	ldr r1, _08065114 @ =gUnknown_08580934
	ldr r2, [r1]
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r1, #1
	movs r3, #0
	strb r1, [r2]
	movs r1, #0xb
	strh r1, [r0, #0x26]
	strh r3, [r0, #0x38]
	bx lr
	.align 2, 0
_08065114: .4byte gUnknown_08580934

