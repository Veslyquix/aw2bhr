	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047078
sub_08047078: @ 0x08047078
	push {lr}
	ldr r0, _0804708C @ =gUnknown_02028DD5
	ldrb r0, [r0]
	ldr r1, _08047090 @ =gUnknown_02028DD6
	ldrb r1, [r1]
	bl sub_08046A84
	pop {r0}
	bx r0
	.align 2, 0
_0804708C: .4byte gUnknown_02028DD5
_08047090: .4byte gUnknown_02028DD6

