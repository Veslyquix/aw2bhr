	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080199B4
sub_080199B4: @ 0x080199B4
	push {lr}
	movs r0, #2
	movs r1, #8
	bl sub_08019940
	pop {r0}
	bx r0
	.align 2, 0

