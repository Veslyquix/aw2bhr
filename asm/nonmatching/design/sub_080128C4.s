	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080128C4
sub_080128C4: @ 0x080128C4
	push {lr}
	bl sub_080123EC
	pop {r0}
	bx r0
	.align 2, 0

