	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080199A4
sub_080199A4: @ 0x080199A4
	push {lr}
	movs r0, #1
	movs r1, #8
	bl sub_08019940
	pop {r0}
	bx r0
	.align 2, 0

