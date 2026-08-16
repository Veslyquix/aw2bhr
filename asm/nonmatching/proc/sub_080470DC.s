	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080470DC
sub_080470DC: @ 0x080470DC
	push {lr}
	movs r0, #0
	bl sub_0801B780
	pop {r0}
	bx r0

