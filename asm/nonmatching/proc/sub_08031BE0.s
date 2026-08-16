	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031BE0
sub_08031BE0: @ 0x08031BE0
	ldr r1, _08031BEC @ =gUnknown_0849B060
	ldr r1, [r1]
	adds r0, #0x2f
	ldrb r0, [r0]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08031BEC: .4byte gUnknown_0849B060

