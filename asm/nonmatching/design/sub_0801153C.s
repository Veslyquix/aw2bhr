	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801153C
sub_0801153C: @ 0x0801153C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08011218
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

