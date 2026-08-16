	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042DCC
sub_08042DCC: @ 0x08042DCC
	ldr r2, _08042DDC @ =gUnknown_085D3DD0
	lsls r1, r0, #6
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x15]
	adds r0, #1
	bx lr
	.align 2, 0
_08042DDC: .4byte gUnknown_085D3DD0

