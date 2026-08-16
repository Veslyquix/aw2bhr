	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019DA8
sub_08019DA8: @ 0x08019DA8
	push {lr}
	bl sub_08019D48
	movs r0, #0
	movs r1, #1
	movs r2, #6
	movs r3, #0xc
	bl sub_0801A538
	bl sub_08022580
	bl sub_080227A8
	bl sub_08034F8C
	pop {r0}
	bx r0
	.align 2, 0

