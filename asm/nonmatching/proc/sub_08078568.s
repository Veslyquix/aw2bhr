	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078568
sub_08078568: @ 0x08078568
	push {lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x58]
	movs r0, #0x48
	movs r1, #0x38
	bl sub_08076770
	pop {r0}
	bx r0
	.align 2, 0

