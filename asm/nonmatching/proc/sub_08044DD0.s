	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044DD0
sub_08044DD0: @ 0x08044DD0
	push {lr}
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_08044AB8
	pop {r0}
	bx r0
	.align 2, 0

