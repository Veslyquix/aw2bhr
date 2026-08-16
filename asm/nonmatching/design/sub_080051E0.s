	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080051E0
sub_080051E0: @ 0x080051E0
	push {lr}
	movs r0, #0x86
	bl sub_0803B4DC
	pop {r0}
	bx r0

