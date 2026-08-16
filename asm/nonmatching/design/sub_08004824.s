	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004824
sub_08004824: @ 0x08004824
	push {lr}
	movs r0, #0x66
	bl sub_0803B4DC
	movs r0, #1
	bl sub_0800056C
	pop {r0}
	bx r0
	.align 2, 0

