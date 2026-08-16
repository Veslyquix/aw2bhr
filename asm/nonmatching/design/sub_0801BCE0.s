	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BCE0
sub_0801BCE0: @ 0x0801BCE0
	push {lr}
	bl sub_0801DF94
	bl sub_0801BE78
	movs r0, #0x10
	bl sub_0801BB88
	pop {r0}
	bx r0

