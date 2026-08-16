	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080051D4
sub_080051D4: @ 0x080051D4
	push {lr}
	movs r0, #0x85
	bl sub_0803B4DC
	pop {r0}
	bx r0

