	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080248F8
sub_080248F8: @ 0x080248F8
	ldr r0, _08024904 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _08024908 @ =0x00004233
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08024904: .4byte gUnknown_08499590
_08024908: .4byte 0x00004233

