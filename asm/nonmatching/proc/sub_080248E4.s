	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080248E4
sub_080248E4: @ 0x080248E4
	ldr r0, _080248F0 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r1, _080248F4 @ =0x0000421A
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080248F0: .4byte gUnknown_08499590
_080248F4: .4byte 0x0000421A

