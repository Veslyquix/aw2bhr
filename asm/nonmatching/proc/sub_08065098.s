	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065098
sub_08065098: @ 0x08065098
	movs r2, #0
	movs r1, #2
	strh r1, [r0, #0x3c]
	strh r2, [r0, #0x3a]
	ldr r0, _080650B0 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080650B0: .4byte gUnknown_08580934

