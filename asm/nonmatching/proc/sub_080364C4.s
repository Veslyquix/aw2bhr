	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080364C4
sub_080364C4: @ 0x080364C4
	push {lr}
	movs r0, #0xa2
	lsls r0, r0, #4
	bl sub_08014E44
	pop {r1}
	bx r1
	.align 2, 0

