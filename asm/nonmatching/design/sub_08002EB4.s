	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002EB4
sub_08002EB4: @ 0x08002EB4
	push {lr}
	bl sub_08002DEC
	bl sub_08002D7C
	bl sub_08002E5C
	pop {r0}
	bx r0
	.align 2, 0

