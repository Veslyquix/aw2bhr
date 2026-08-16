	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057BCC
sub_08057BCC: @ 0x08057BCC
	ldr r1, _08057BD8 @ =gUnknown_030005E8
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
	bx lr
	.align 2, 0
_08057BD8: .4byte gUnknown_030005E8

