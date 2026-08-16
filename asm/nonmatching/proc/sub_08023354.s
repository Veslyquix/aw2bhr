	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023354
sub_08023354: @ 0x08023354
	push {lr}
	movs r0, #0
	bl sub_08023360
	pop {r0}
	bx r0

