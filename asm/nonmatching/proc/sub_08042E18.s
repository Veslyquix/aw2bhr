	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042E18
sub_08042E18: @ 0x08042E18
	ldr r2, _08042E28 @ =gUnknown_085D3DD0
	lsls r1, r0, #6
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x16]
	bx lr
	.align 2, 0
_08042E28: .4byte gUnknown_085D3DD0

