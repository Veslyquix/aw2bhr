	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005554
sub_08005554: @ 0x08005554
	push {lr}
	movs r0, #2
	bl sub_08005474
	pop {r1}
	bx r1

